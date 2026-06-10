# Design System: Field Notes — Abhishek Ratna

> Category: Social Infographics · Brand: Abhishek Ratna × PMM Sherpa
> Scope: LinkedIn infographics, data visuals, comparisons, frameworks, carousels — every archetype in `Visual-Creation/research/creator-styles/ARCHETYPES.md`.
> Built from the cross-creator best practices of Pierre Herubel, Kyle Poyar, Ruben Hassid, Maja Voje, and Sachin Jain (analysis: `Visual-Creation/research/creator-styles/RECOMMENDATION.md`). Deliberately NOT a clone of any of them, and intentionally distinct from the Coronet luxury register.

## 1. Visual Theme & Atmosphere

**An analyst's field notebook.** Warm paper, precise grids, plain data ink — then one pass of a blue felt-tip pen circling what matters, drawing the arrow, writing the verdict. The printed layer is calm and rigorous (credibility); the pen layer is human and opinionated (personality). Every visual should look like a sharp operator marked up the evidence for you.

Register references: a Stripe Press figure annotated by hand, a Monocle data page, a well-kept lab notebook. Never a Canva template, never a gradient-soup "AI infographic," never clip-art.

Two layers, always in this order:

- **Print layer** — paper canvas, dot grid, near-black type, neutral gray data ink, hairline rules. Carries 90% of the pixels.
- **Pen layer** — ONE blue accent: a circled word, a highlighted bar, a hand-drawn arrow, a verdict pill. Carries 100% of the opinion. If two things are circled, nothing is.

## 2. Color Palette & Roles

| Role | Hex | Use |
|---|---|---|
| Paper | `#F7F5EF` | Canvas base, always. Never pure white. |
| Dot grid | `#E4E0D4` | Texture layer (see §4). |
| Ink | `#15171A` | Headlines, body, primary data ink, dark cards. |
| Graphite | `#6A6D72` | Secondary text, de-emphasized data series, axis labels. |
| Ghost | `#B9BBB6` | Dismissed/"before" numbers, disabled rows, loser side of comparisons. |
| **Pen Blue (accent)** | `#2170E4` | THE accent: circled word, hero bar/segment/dot, callout fills, hand-drawn devices. One hue family per canvas. |
| Pen Blue deep | `#0B4DB8` | Accent text on light tints, hover-dark of the pen. |
| Pen Blue tint | `#E4EDFB` | Accent zone fills, highlighted table rows, tinted panels. |
| Pass green | `#1F9D55` | ✓ marks, "worked" verdict labels — mono/small contexts only, never large fills. |
| Fail red | `#C8401F` | ✗ marks, "failed" verdict labels — same restriction. |
| Signal amber | `#E89B2D` | Optional second threshold in heatmaps/legends only (Kyle pattern). Never decorative. |

Semantic rules (non-negotiable):
1. Pen Blue marks the conclusion — the bar that proves the headline, the winning column, the "after" state, the circled payoff word.
2. The thing being dismissed is **ghosted, never reddened** — gray `#B9BBB6`, or strikethrough. Red exists only as small ✗/label ink.
3. Dark cards (`#15171A`) are a device, not a mode: max one per canvas (big-stat card, verdict band). Never a full dark canvas.

## 3. Typography

**Legibility floor (overrides everything):** LinkedIn renders a 4:5 image at ~500px on desktop feed and ~380px on phones — a 3.4× downscale from the 1280px canvas. Design for the phone render: **nothing below 16px @1280w, body never below 26px, and any label carrying meaning ≥17px.** If text must shrink below the floor to fit, cut words or split into a carousel — never shrink.

| Tier | Font | Spec @1280w |
|---|---|---|
| Headline | **Space Grotesk** 700 | 80–92px, ink, sentence case, line-height 1.04, letter-spacing −0.02em. Max 3 lines. States the conclusion, not the topic. |
| Hero numerals | Space Grotesk 700 | 200–320px for big-stat archetypes; tabular-nums. |
| Section/card/row titles | Space Grotesk 600 | 28–34px. |
| Sub-headline | Inter 400 | 28–32px, graphite, key phrases bolded in ink. |
| Body | **Inter** 400/600 | 26–28px, line-height 1.4; bold ONLY the key verb/number in each string. |
| Chart value labels | Space Grotesk 600 | 30–34px. |
| Micro-labels | **Space Mono** 400/700 | 16–18px, UPPERCASE, letter-spacing 0.08–0.1em: badges, axis labels, page counters, dates, source lines, footer URLs. Never below 16px. |
| Pen annotations | **Caveat** 600 | 36–44px, Pen Blue: 1–2 handwritten margin notes max ("start here", "this is the gap"). |

Google Fonts: `Space+Grotesk:wght@500;600;700`, `Inter:wght@400;600`, `Space+Mono:wght@400;700`, `Caveat:wght@600`.

**Signature headline move:** the payoff word gets a hand-drawn Pen Blue ellipse around it — an SVG stroke (2.5–3px, slightly irregular, rotated −2°, open gap at the start as if drawn in one motion). Exactly one circle per canvas. This is the system's fingerprint, the way Pierre owns the underline and Ruben owns the coral word.

```html
<span class="circled">11%</span>
<!-- .circled::after = absolutely-positioned SVG ellipse, stroke #2170E4,
     stroke-width 3, fill none, stroke-linecap round, transform rotate(-2deg),
     path drawn with a slight wobble and a 12% gap in the stroke -->
```

## 4. Canvas, Grid & Texture

- **Sizes:** 1280×1600 (4:5) default · 1200×900 (4:3) chart-hero · 1080×1080 quote/stat cards · carousel slides 1280×1600.
- **Padding:** 56px sides/top, 40px bottom @1280w. Footer zone reserves the bottom ~120px.
- **Whitespace discipline:** breathing room lives in consistent gutters (24–40px between elements), NOT in dead zones. The content column must fill the vertical span — use `flex; justify-content:space-between` on the main content block so rows distribute, and scale font/bar/card sizes UP to fill rather than leaving gaps. A glaring empty region >120px tall (outside deliberate big-stat negative space) is a layout bug. Conversely never closer than 20px between unrelated elements.
- **Dot grid texture:** `background-image: radial-gradient(#E4E0D4 1.1px, transparent 1.1px); background-size: 26px 26px;` over `#F7F5EF`. Subtle — it should read as paper, not as a pattern.
- **Containers:** white `#FFFFFF` cards on paper, `border: 1.5px solid #15171A` at 12px radius, OR borderless with `box-shadow: 0 1px 0 #E4E0D4` hairline shelf. Dashed 1.5px borders = conceptual/evidence zones (screenshots, quotes from others).
- Flat throughout: no drop shadows beyond the hairline shelf, no gradients on data ink, no 3D.
- Word budget: 40–140 single image, ≤40 per carousel slide. Whitespace is gutters, not zones (see Whitespace discipline above) — when in doubt, scale elements up rather than leaving the canvas airy. "Tiny and elegant" loses to "big and readable" in a feed.

## 5. Devices (the pen kit)

- **Circled word** — see §3. One per canvas.
- **Hand-drawn arrow** — Pen Blue SVG path, slight curve, small open arrowhead; connects evidence → conclusion or margin note → element. Max 2.
- **Verdict pill** — `#15171A` rounded-full, white Space Grotesk 600 text, for the 1–3 word judgment ("worth it", "dead end").
- **Callout box** — white card with 1.5px ink border and a triangle tail pointing at a data point; first sentence bold; 15–25 words. The hero callout may use Pen Blue fill + white text. Max 3.
- **Badge** — Space Mono pill, paper bg, 1.5px ink border: `● TOPIC · ANGLE`, top-left.
- **Evidence frame** — dashed 1.5px ink border around screenshots; pairs with a hand-drawn arrow to the verdict.
- **Stat ghosting** — comparisons set the old number in Ghost gray at the same size next to the Pen Blue new number, with a Space Mono `VS` or `→` between (gleaned from Sachin, re-colored).
- **Checks/crosses** — Space Mono `✓` green / `✗` red, 16–20px, in matrix cells and verdict lists.
- **Source line** — mandatory whenever data appears, directly above the footer: Space Mono 14px graphite: `SOURCE: <name> · N=<count> · <month year>`. Oddly specific N is the credibility token.

## 6. Footer — mandatory on EVERY asset

Hairline rule (`1px #E4E0D4`) full-width, then a 72px flex row, space-between, vertically centered:

**Left lockup (the person):**
- Circular profile photo inset, 52px, `border: 2px solid #15171A` — file: `assets/profile-photo.jpg` (LinkedIn 400×400, pre-cropped circle via `border-radius: 50%`).
- Stacked text, 10px gap: **"Abhishek Ratna"** — Space Grotesk 600, 21px, ink; below it `linkedin.com/in/abhishekratna` — Space Mono 13px, graphite (LinkedIn glyph 14px inline-left, ink, optional).

**Right lockup (the property):**
- PMM Sherpa round logo, 40px — file: `assets/pmmsherpa-logo-round.svg` (blue gradient circle; its `#0058BE→#2170E4` is what Pen Blue harmonizes with).
- `www.pmmsherpa.com` — Space Mono 13px, graphite, left of or below the logo mark.

Carousels: footer on every slide; add Space Mono page counter `03 / 07` right-aligned above the rule. Quote/stat 1:1 cards may compress to a single line (photo + name + URL left, logo + URL right) but never drop either lockup.

## 7. Chart Styling (Family A archetypes)

- Inline SVG only, styled from these tokens — never chart-library defaults.
- Data ink: Ink for the primary series, Graphite for context series, Ghost for dismissed series. **Exactly one element in Pen Blue** — the bar/segment/point/cell that proves the headline.
- Bars: 12–18px radius on the value end only; value labels Space Grotesk 600 at bar ends.
- Gridlines: hairline `#E4E0D4`, horizontal only, or none. Axis labels Space Mono 13px graphite; no axis lines heavier than 1px.
- Heatmaps: 3 steps max — paper → Pen Blue tint → Pen Blue (amber permitted as a labeled middle threshold).
- Funnels/ramps: Ghost → Graphite → Pen Blue (darkening toward the conclusion stage).
- Donut: track in `#E4E0D4`, value arc Pen Blue, hero % numeral centered in Space Grotesk 700.
- Every chart gets ≥1 callout or hand-drawn arrow — a chart without an annotation is unfinished in this system.

## 8. Archetype Adaptations (quick keys)

- **B1 split contrast:** top half paper as-is ("the myth", ghosted devices), bottom half Pen Blue tint zone ("the reality", pen devices). Dashed divider with a Caveat margin note at the seam.
- **D3 big-stat:** ink-black card, hero numeral in Pen Blue tint-on-dark (`#9CC3F5` reads better on ink than raw #2170E4 — permitted dark-card variant), ghost comparison beside, two-tone takeaway below (line 1–2 ink, line 3 graphite).
- **D1 mono list:** title with circled count ("<circle>25</circle> ways…"), rows = Space Grotesk 600 verb + Space Mono explanation, alternating-row Pen Blue tint on the 2–3 rows you'd actually start with, ✓ pre-checked.
- **C4 radial map:** logo chips as white circles with 1.5px ink ring on dot-grid paper; hub = ink circle with white Space Grotesk label; one spoke path in Pen Blue (the recommended path).
- **B2 versus table:** winner column header in Pen Blue pill, per-row wins as `✓` green; loser cells ghosted, never struck through wholesale.

## 9. Never

- Two circled words, two Pen Blue heroes, or Pen Blue used decoratively.
- Pure white or full-dark canvases; stock photos; emoji as design elements (mono ✓/✗/●/→ glyphs only).
- Drop shadows, gradients on text or data ink, 3D, glassmorphism.
- A data claim without a SOURCE line; an asset without the §6 footer.
- More than one font move per headline (circle OR ghost-vs-new, not both in the title).
- Coronet tokens (emerald/gold/Cormorant) — that register lives elsewhere.
