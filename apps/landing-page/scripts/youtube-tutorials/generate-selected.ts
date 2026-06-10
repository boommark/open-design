/*
 * generate-selected — turns a maintainer-approved set of YouTube videos into
 * tutorial entries. Run after a human picks numbers from the Feishu digest
 * produced by `notify-candidates.ts`.
 *
 * Usage:
 *   tsx scripts/youtube-tutorials/generate-selected.ts <id|url> [<id|url> ...]
 *
 * Accepts raw 11-char video ids or any YouTube URL. Already-present videos are
 * skipped. The relevance gate is intentionally skipped here — selection is the
 * human review step. Requires YOUTUBE_API_KEY + ANTHROPIC_* (copy generation).
 */
import {
  readExistingSlugs,
  readExistingVideoIds,
  writeTutorial,
} from './lib.ts';
import { fetchByIds, loadYoutubeKey } from './youtube.ts';

function extractId(arg: string): string | null {
  const trimmed = arg.trim();
  if (/^[\w-]{11}$/.test(trimmed)) return trimmed;
  const m = trimmed.match(/(?:v=|youtu\.be\/|embed\/|shorts\/)([\w-]{11})/);
  return m ? m[1] : null;
}

async function main(): Promise<void> {
  const args = process.argv.slice(2).filter((a) => !a.startsWith('--'));
  const ids = [...new Set(args.map(extractId).filter((v): v is string => Boolean(v)))];
  if (ids.length === 0) {
    console.error('Usage: tsx generate-selected.ts <id|url> [<id|url> ...]');
    process.exit(1);
  }

  const key = await loadYoutubeKey();
  const existingIds = await readExistingVideoIds();
  const takenSlugs = await readExistingSlugs();

  const fresh = ids.filter((id) => !existingIds.has(id));
  const skipped = ids.filter((id) => existingIds.has(id));
  if (skipped.length) console.log(`Skipping ${skipped.length} already in catalogue: ${skipped.join(', ')}`);

  const videos = await fetchByIds(key, fresh);
  console.log(`Generating ${videos.length} entr(y/ies)`);

  let ok = 0;
  let failed = 0;
  for (const v of videos) {
    try {
      const slug = await writeTutorial(v, takenSlugs);
      ok++;
      console.log(`  + ${slug} <- ${v.videoId} (${v.author})`);
    } catch (e) {
      failed++;
      console.error(`  ! failed ${v.videoId}: ${(e as Error).message}`);
    }
  }
  console.log(`Done: ${ok} written, ${failed} failed`);
  if (failed > 0) process.exitCode = 2;
}

void main();
