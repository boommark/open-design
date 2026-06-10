# Design System: PMM Sherpa — Public Artifacts

> Category: AI & LLM · Brand: PMM Sherpa
> Scope: public-facing static artifacts — LinkedIn posts, social squares, share cards, announcement banners, podcast/quote graphics.
> Source of truth for product UI lives at `pmmsherpa/sherpa design/DESIGN.md`. This file extends that brand into a social/print register.

## 1. Visual Theme & Atmosphere

**The Digital Curator goes outside.** Inside the product, PMM Sherpa is a calm, premium intelligence briefing — restrained whitespace, system type, a single confident blue. Public artifacts inherit that posture but tighten the frame: every square is *one idea*, set in serif-weight type at a size you can read while scrolling on a phone with one thumb.

Reference register: an editorial cover from The Economist, a quote card from Stripe Press, a stat block from a Bloomberg Visual Data feature. Never a meme template, never a stock-photo overlay, never a 9-bullet "carousel slide."

Two voices, one palette:

- **Default — Digital Curator (Variant A).** Alabaster surface (`#f8f9fd → #f0f3fa`), gradient-text accents, restrained type, generous margins. Use for **quotes, testimonials, essays, frameworks, feature reveals, founder POV, launch announcements** — anything that wants to *read* serious. ~90% of artifacts. **Launches included** (validated 2026-05-08 on the MCP launch card: A reads more credible than B for shipping news).
- **Accent — Punchy Social (Variant B).** Dark navy gradient hero (`#0a1628 → #0f1d35`), oversized stat type, glowing dot, faint grid texture. Borrows directly from the product's testimonials section. Use **only** for raw numerical stats and "by the numbers" posts where the number itself is the entire artifact. ~10% of artifacts. Do not reach for B just because the news is exciting.

Never mix the two treatments inside a single carousel. Pick one register per piece.

## 2. Color Palette & Roles

### Primary brand
- **Brand Blue** (`#0058be`): primary accent, gradient start, byline rule, eyebrow text on light. Reserved — one accent moment per square, not a paint bucket.
- **Brand Blue Bright** (`#2170e4`): gradient end, hover-equivalent on social.
- **Brand Blue Light** (`#5a9cf5`): only on dark surfaces — eyebrow text, glow dots, gradient stat fade-out, step badges.

### Light surface (Variant A)
- **Surface Top** (`#f8f9fd`): card background top.
- **Surface Bottom** (`#f0f3fa`): card background bottom (180° gradient).
- **Ink** (`#191c1e`): headlines and primary type. Never `#000`.
- **Body** (`#3a3f47`): paragraph copy.
- **Secondary** (`#4a4f57`): subtitles, stat labels.
- **Muted** (`#5f6368`): bylines secondary line, source attribution.
- **Hairline** (`rgba(0, 88, 190, 0.12)`): byline rules, internal dividers.

### Dark surface (Variant B)
- **Dark 1** (`#0a1628`): gradient start (top-left).
- **Dark 2** (`#0f1d35`): gradient end (bottom-right).
- **Dark Text** (`#ffffff`): headlines and stats on dark.
- **Dark Body** (`#c8d0e0`): paragraph copy on dark.
- **Dark Muted** (`#8e9199`): byline secondary line on dark.
- **Dark Hairline** (`rgba(255, 255, 255, 0.10)`): rules and card edges on dark.
- **Glow Tint** (`rgba(33, 112, 228, 0.35)`): radial light from top-right of dark hero.
- **Grid Lines** (`rgba(255, 255, 255, 0.025)`): faint 80px grid texture on dark backgrounds.

### Hard rules
- Never use pure black (`#000`) or pure white (`#fff`) for backgrounds. Use the palette above.
- Brand Blue is a laser. One accent per artifact — usually the eyebrow, the gradient stat, or the rule under the byline. Not all three.
- Amber `#f59e0b` is reserved exclusively for star ratings if a testimonial includes them. Never decorative.
- No third color outside this palette. If you find yourself needing one, the artifact is wrong.

## 3. Typography Rules

### Font stack
```
font-family: -apple-system, BlinkMacSystemFont, "Inter", "Segoe UI",
             Helvetica, Arial, sans-serif;
```
System default. No web-font loading — these are static export artifacts and the post-render PNG bakes the type. Inter is the visual reference if a designer wants to mock in Figma.

### Scale (1080×1080 native)

| Role | Size | Weight | Tracking | Line-height | Notes |
|------|------|--------|----------|-------------|-------|
| Stat numeral (A) | 220px | 800 | -0.05em | 0.95 | Gradient text fill, brand blue |
| Stat numeral (B) | 320px | 900 | -0.06em | 0.85 | White → light-blue vertical gradient |
| Quote / hero copy | 56–64px | 700–800 | -0.02em to -0.025em | 1.10–1.18 | Max 8–10 words per line |
| Stat label | 32–40px | 600–700 | -0.01 to -0.02em | 1.15–1.25 | Sentence case |
| Wordmark | 22px | 700 | -0.01em | 1 | Always paired with logo mark |
| Eyebrow / category | 18px | 700 | 0.16–0.18em UPPER | 1 | Single line, ≤22 chars |
| Attribution name | 24px | 700 | 0 | 1 | "Name · Role, Company" pattern |
| Byline name | 22px | 600–700 | 0 | 1.3 | |
| Byline role | 18px | 500 | 0 | 1.3 | Muted token |

### Scale (1200×627 share)

| Role | Size | Notes |
|------|------|-------|
| Hero copy | 72–88px / 800 / -0.025em | Two lines max. The whole card is a single sentence. |
| Sub | 28px / 500 / -0.01em | Optional, single line. |
| Wordmark | 22px / 700 | Top-left, always present. |
| CTA | 22px / 700 | "pmmsherpa.com →" bottom-right. |

### Rules
- Max **three** weights per artifact: 800 (display), 600/700 (label), 500 (body/muted).
- Headlines always tight: `letter-spacing: -0.02em` minimum on anything ≥48px.
- Eyebrows are always uppercase with `0.16–0.18em` tracking. Never sentence case.
- Quote marks: open-quote `"` set in **brand blue**, sized 2× the quote body, baseline-shifted up. Closing quote omitted (the punctuation does the work).
- Numbers in stats may abbreviate: `38,213` (Curator, full precision feel) or `38K` (Punchy, scroll-native).

## 4. Component Stylings

### Card frame (the canvas)
- 1080×1080 for LinkedIn square / Instagram feed / Twitter image.
- 1200×627 for LinkedIn share / OG image / blog cover.
- 1080×1350 for LinkedIn portrait / Instagram portrait (use sparingly, secondary format).
- Padding: **88px top/bottom, 96px left/right** at 1080×1080. Scale proportionally for other sizes.
- No outer rounded corners (the PNG is the canvas, the platform crops as it likes).

### Wordmark cluster
- Logo mark + "PMM Sherpa" wordmark, 16px gap.
- Logo: 56px circle on 1080-class artifacts, 48px on 1200×627.
- On light surfaces use `pmmsherpa-logo-round.svg` (gradient fill, white mountain).
- On dark surfaces use `pmmsherpa-logo-round-inverse.svg` (white fill, gradient mountain).
- Always top-left of the artifact.

### Eyebrow

**Variant A (light):** plain text, brand blue, 18px / 700 / 0.18em tracking / uppercase.

**Variant B (dark):** pill-shaped chip, 999px radius, 10px·18px padding, `rgba(90,156,245,0.12)` fill, `rgba(90,156,245,0.24)` 1px border, light-blue text, with a leading 8px glowing dot (background `#5a9cf5`, `box-shadow: 0 0 16px #5a9cf5`).

**Status variant — "Live" (either surface):** when the artifact announces something *currently active* (a launch, a beta opening, a server going live), swap the standard eyebrow for a green status chip. Pill shape, `rgba(16, 185, 129, 0.05)` fill, `rgba(16, 185, 129, 0.35)` 1px border, text in `#059669`, with a leading 8px glowing dot (background `#10b981`, `box-shadow: 0 0 12px rgba(16, 185, 129, 0.7)`). Same dimensions as the Variant B chip. Reserved for live/active status — never decorative. Never use green anywhere else in the artifact (no green text in body, no green accents on the headline). The chip is a contained signal.

### Stat block (the centerpiece, both variants)

**Variant A:** numeral 220px / 800 / -0.05em with gradient text fill `linear-gradient(135deg, #0058be 0%, #2170e4 100%)`. Label below in 32px / 600 secondary color, max-width 720px, `margin-top: 24px`.

**Variant B:** numeral 320px / 900 / -0.06em / line-height 0.85, text fill `linear-gradient(180deg, #ffffff 0%, #5a9cf5 100%)`. Label below in 40px / 700 white. Optional `<em>` highlight in light-blue (no italic — we override font-style).

### Quote block

Open-quote glyph in brand blue, 120px, baseline-shifted +28px. Quote body in 56–64px / 700 / -0.02em / line-height 1.18. Attribution one line below, 24px / 700, with " · Role, Company" portion in muted token.

**Punchy variant only:** allow a single highlighter swipe under the punchline using a half-height background gradient (see `voice-variants.html` source for the technique). Do not highlight more than one phrase.

### Byline (the footer)

Two patterns. Both sit at the bottom of the card, separated from content by a top hairline rule (`rgba(0,88,190,0.12)` light / `rgba(255,255,255,0.10)` dark) and 28px padding.

**Personal byline** — for posts authored by a human:
```
[ avatar 64×64 ]   [Name]
                   [Role · Company]
```
Avatar: circular, 64px. If a real headshot is available (e.g. `pmmsherpa/public/{name}.jpeg`) use it. Fallback: gradient circle with two-letter monogram in 24px / 700 white.

**Product byline** — for posts that *are* the product:
```
[ logo 48×48 ]   pmmsherpa.com
                 An AI advisor for product marketers
```
Use the logo (light or inverse depending on surface). The URL is the primary line; the descriptor is muted.

Never include both bylines. Never include a CTA button on a 1080×1080 — bylines do that work.

### CTA (1200×627 only)

Bottom-right: "pmmsherpa.com →" in 22px / 700, brand blue on light or white on dark. The arrow is a literal `→` glyph, not an icon.

## 5. Layout Principles

### One idea per artifact
Every square is a single sentence, statistic, or quote. If you need two ideas, make two squares — never split-frame a 1080×1080. The five-bar carousel is a separate format and out of scope for v1.

### The Z-pattern
1. Top-left: wordmark cluster (always).
2. Top-right: eyebrow (always).
3. Center: hero element (stat, quote, headline).
4. Bottom: byline (always — personal or product).

This pattern is invariant. Don't move the wordmark, don't omit the eyebrow, don't float the byline.

### Vertical rhythm
At 1080×1080 with 88px vertical padding, you have 904px of content height. Approximate budget:
- 56px wordmark + 24px below = 80px header band.
- 80–100px byline band.
- ~720px hero zone in the middle. The hero takes all of it.

### Negative space is not a bug
Variant A often leaves 30–40% of the canvas empty around the centerpiece. That is the design. Don't fill space with logos, taglines, decorative dots, or "follow me" prompts.

### Variant-B grid texture
Only on dark surfaces. 80px × 80px grid drawn with `rgba(255,255,255,0.025)` 1px lines. Plus one radial highlight from the top-right (`1200px × 800px` blue glow at 35% alpha) and one from the bottom-left (`900px × 700px` light-blue at 18%). Both are absolute-positioned underlays — content sits on top with `z-index: 1`.

## 6. Depth & Elevation

This is print-style design. Two depth tools, used sparingly:

- **Variant A: gradient text fill** for the hero numeral or for a single emphasized word. Implemented via `background-clip: text`. Never on body copy, never on bylines.
- **Variant B: radial glow underlays** (described above) and the white→light-blue vertical gradient on the stat numeral.

No drop shadows on the artifact itself (the canvas is the canvas). The 12px box-shadow on the comparison page is preview chrome — do not bake it into exports. No glassmorphism, no neumorphism, no inner-shadow inputs (there are no inputs).

## 7. Do's and Don'ts

### Do
- Default to Variant A. Reach for Variant B only when the content is a number, a milestone, or a launch.
- Keep one accent per artifact — eyebrow, stat gradient, or byline rule. Pick one.
- Use real headshots from `pmmsherpa/public/` when the artifact features a real person (Shreyas, Asli, Dan, Brain).
- Set everything in system sans, three weights max.
- Run every artifact through the byline-then-Z-pattern check before exporting.
- Export at 2× (2160×2160) for retina sharpness on LinkedIn.

### Don't
- Don't use stock photography. Ever.
- Don't overlay text on the `hero-background.png` orb image — that is a website-only asset and turns to mud at small social sizes.
- Don't put more than one quote, stat, or headline on a single canvas.
- Don't use emoji as decoration in the artifact body. (Eyebrow text is plain words.)
- Don't include a "Follow me" or "Save this post" overlay — the byline does that.
- Don't use the old PNG icons (`/public/icons/frame.png`, etc.) in social artifacts. They have baked backgrounds and read as 2018-era SaaS.
- Don't mix variants inside a series. A 4-post launch should pick A or B and stay there.
- Don't use Lucide icons in social artifacts. Lucide is a product-UI tool. Public artifacts speak through type and one accent — not icons.

## 8. Responsive Behavior

These are static export artifacts, so "responsive" means *across formats*, not across breakpoints.

| Format | Use |
|--------|-----|
| **1080×1080** | LinkedIn feed image, Instagram feed, Twitter/X single image. **Primary format.** |
| **1200×627** | LinkedIn share / link card, OG image, blog cover. **Secondary format.** |
| 1080×1350 | LinkedIn portrait, Instagram portrait. Reserved — only when the headline genuinely needs vertical breathing room. |
| 1080×1920 | Instagram/LinkedIn story. Out of scope for v1. |

When porting a 1080×1080 design to 1200×627:
- Move wordmark and eyebrow to a single line at the top.
- Drop the byline band; replace with bottom-right CTA `pmmsherpa.com →`.
- Hero copy becomes a one-sentence headline at 72–88px, max two lines.
- Padding: 64px top/bottom, 80px left/right.

## 9. Agent Prompt Guide

When an agent (Claude Code, Codex, etc.) is asked to produce a PMM Sherpa social artifact, follow this checklist before writing any code:

1. **Pick the variant.** Default to A (Curator). Reach for B (Punchy) **only** when the artifact is a raw number or "by the numbers" post where the stat dominates the frame. Launches, milestones, feature reveals, quotes, essays all default to A.
2. **Pick the byline.** Authored by Abhishek (or another named human) → personal byline with avatar. Speaking *as* the product → product byline with logo + URL.
3. **Pick the format.** Default 1080×1080. Switch to 1200×627 only if the user explicitly wants a share/OG card.
4. **Write the copy first, in one sentence.** If you need two sentences, you need two artifacts.
5. **Set everything in system sans.** Don't load Inter via `<link>`, don't fetch web fonts.
6. **Use the existing logo SVG inline.** Don't redraw the mountain mark, don't pull from CDN.
7. **One accent moment.** Audit before exporting — if you have a blue eyebrow *and* a gradient stat *and* a blue rule, kill two of them.
8. **Bake the canvas at 2160×2160 for export** when possible (e.g. via `html-to-image` or Puppeteer). LinkedIn is harsh on 1× crops.

### Reference files in this folder
- `_comparison/voice-variants.html` — the original A vs B side-by-side that established the system.
- `examples/linkedin-square-stat.html` — Variant B / stat / personal byline.
- `examples/linkedin-square-quote.html` — Variant A / quote / personal byline.
- `examples/linkedin-square-feature.html` — Variant A / feature reveal / product byline.
- `examples/linkedin-share-1200x627.html` — Variant A / hero / product byline / 1200×627.

When in doubt, copy the closest example, swap copy, and ship.
