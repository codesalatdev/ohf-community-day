// Community Day 2026 — sample DIN A4 handout
// Uses the faded A4 backdrop on every page.
//
// Compile:  typst compile cd26-document.typ

#let ink = rgb("#09202E")
#let accent = rgb("#2FA96F")
#let meta-ink = ink.lighten(30%)
#let rule = 0.6pt + ink.lighten(78%)

#let a4-bg = image("assets/CD26-background-a4-faded.png", width: 100%, height: 100%)

#let kicker(body) = text(size: 8pt, weight: 700, tracking: 0.18em, fill: meta-ink, body)
#let tick = rect(width: 26pt, height: 3pt, radius: 1.5pt, fill: accent)

// -------------------------------------------------------------- page setup

#set page(
  width: 210mm,
  height: 297mm,
  background: a4-bg,
  margin: (top: 52mm, x: 22mm, bottom: 24mm),
)

#set text(font: "Inter", fill: ink, size: 10.5pt, lang: "en")
#set par(justify: true, leading: 0.62em, spacing: 0.9em)

#let doc-heading(title, sub) = block(width: 100%)[
  #text(size: 22pt, weight: 800, tracking: -0.01em)[#title]
  #v(4pt)
  #tick
  #v(10pt)
  #text(size: 11pt, weight: 500, fill: ink.lighten(12%))[#sub]
  #v(14pt)
]

#let section-heading(title) = {
  v(4pt)
  text(size: 13.5pt, weight: 800, tracking: -0.005em)[#title]
  v(3pt)
  box(width: 100%, stroke: (bottom: rule))
  v(5pt)
}

// ---------------------------------------------------------------- content

#doc-heading(
  [Community Day 2026],
  [What to expect on Saturday, November 7 — a one-page guide for attendees],
)

One room, one community, a full morning of open-source. This handout sums up
what the day is about, when things happen and what to bring. Numbers and names
are placeholders — replace them with your own before printing.

#section-heading[Why this day matters]
The Community Day brings the people behind community-led open-source projects
together with the people who build on them. No parallel tracks, no vendor
booths: four talks in the morning, a shared lunch and open space in the
afternoon where anyone can pitch a topic on the fly.

#set list(marker: text(fill: accent)[•], indent: 8pt, body-indent: 12pt, spacing: 0.6em)
- *Morning talks* — four 25-minute sessions with one break between
- *Shared lunch* — vegetarian and vegan, included with every ticket
- *Afternoon open space* — 20 lightning talks voted on-site
- *Closing* — a short look ahead to next year

#section-heading[How the day runs]
#set par(justify: false)
#set grid(stroke: none, inset: (y: 5pt, x: 6pt), align: left + horizon, row-gutter: 0pt)
#grid(
  columns: (auto, 1fr),
  text(size: 9.5pt, weight: 700, fill: meta-ink)[Time],
  text(size: 9.5pt, weight: 700, fill: meta-ink)[What],
  [09:30], [Doors open, coffee & welcome],
  [10:00], [Keynote — state of the foundation],
  [10:40], [Project deep dives (two talks)],
  [11:45], [Lightning talk sign-up],
  [12:15], [Lunch],
  [13:30], [Open space & workshops],
  [16:00], [Closing remarks],
)

#section-heading[Good to know]
Bring a badge lanyard if you have one, a laptop for the workshops, and the
questions you have been putting off. The venue is stepless, there is a quiet
room next to the main hall, and recordings land in the community forum in
the week after.

Questions before the day? Write to #text(weight: 700)[hello\@community.example.org] or join the weekly community call.

#v(10pt)
#text(size: 9pt, fill: meta-ink)[Community Day 2026 · #text(fill: accent)[Saturday, Nov 7] · Location Town · community.example.org]
