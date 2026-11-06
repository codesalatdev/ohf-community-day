#let ink = rgb("#09202E") // dark navy from the original artwork
#let accent = rgb("#41D09B")
#let accent-deep = rgb("#2FA96F")
#let full-bg = image("assets/CD26-background-16x9.png", width: 100%, height: 100%)
#let faded-bg = image("assets/CD26-background-16x9-faded.png", width: 100%, height: 100%)

// 16:9 slide canvas, no page numbers, artwork as the page background
#set page(width: 254mm, height: 143mm, margin: 0pt)
#set text(font: "Inter", fill: ink, size: 24pt, hyphenate: false)

#let slide(bg, body) = {
  set page(background: bg, margin: 0pt)
  body
}

// HELPERS
#let tracker(body) = text(size: 13pt, weight: 700, tracking: 0.18em, fill: ink.lighten(22%), body)
#let sub(body) = text(size: 24pt, weight: 500, fill: ink.lighten(12%), body)
#let meta(body) = text(size: 16pt, weight: 400, fill: ink.lighten(28%), body)
#let tick = rect(width: 44pt, height: 5pt, radius: 2.5pt, fill: accent-deep)

// ANCHOR LOWER LEFT
#let lower-left(body) = box(
  width: 100%,
  height: 100%,
  inset: (x: 64pt, bottom: 78pt),
  align(left + bottom, body),
)

// CONTENT SLIDE DEFINITION
#let content-slide(title, body) = slide(faded-bg, pad(
  left: 64pt, right: 110pt, top: 56pt,
  text(size: 21pt)[
    #text(size: 30pt, weight: 800, tracking: -0.01em)[#title]
    #v(12pt)
    #tick
    #v(20pt)
    #body
  ],
))

// SLIDE EXAMPLES
// 1 · title — full opacity
#slide(full-bg, lower-left[
  #tracker[COMMUNITY EVENT]
  #v(10pt)
  #text(size: 52pt, weight: 800, tracking: -0.015em)[Community Day 2026]
  #v(16pt)
  #sub[A sample deck built with Typst]
  #v(12pt)
  #meta[Saturday, November 7 \u{2003}–\u{2003} Location Town]
])

// 2 · agenda / section break — full opacity
#slide(full-bg, lower-left[
  #tracker[PROGRAM]
  #v(10pt)
  #text(size: 44pt, weight: 800, tracking: -0.01em)[Agenda]
  #v(18pt)
  #enum(
    numbering: (n) => text(fill: accent-deep, weight: 800, size: 22pt, features: ("tnum",))[#n],
    body-indent: 14pt,
    spacing: 0.7em,
    [Welcome & state of the home],
    [Project deep dive],
    [Workshops & community time],
    [Closing remarks],
  )
])

// 3 · content — faded
#content-slide[Project deep dives][
  #sub[One theme per room]
  #v(16pt)
  #set list(marker: text(fill: accent-deep)[•], indent: 8pt, body-indent: 12pt, spacing: 0.9em)
  - *Home Assistant* — the year in review
  - *ESPHome* — the new device dashboard
  - *Open Home Foundation* — data & privacy work
  - *Community* — lightning talks from you
]

// 4 · content — faded
#content-slide[Numbers from 2025][
  #grid(
    columns: (auto, auto, auto),
    column-gutter: 64pt,
    row-gutter: 6pt,
    text(size: 46pt, weight: 800, fill: accent-deep, tracking: -0.01em)[412],
    text(size: 46pt, weight: 800, fill: accent-deep, tracking: -0.01em)[38k],
    text(size: 46pt, weight: 800, fill: accent-deep, tracking: -0.01em)[92],
    text(size: 15pt, fill: ink.lighten(22%))[contributions merged],
    text(size: 15pt, fill: ink.lighten(22%))[downloads per month],
    text(size: 15pt, fill: ink.lighten(22%))[lightning-talk minutes],
  )
  #v(22pt)
  #meta[Numbers are placeholders]
]

// 5 · content — faded
#content-slide[About these slides][
  #par(spacing: 0.65em)[
    Content slides use the #text(weight: 800)[faded] backdrop so body copy stays readable; titles and text sit on the gentle left gradient, clear of the leaf cluster in the upper right.
    Full-opacity slides anchor their text in the lower-left corner, matching the original layout.
    Both backdrops are the same 16:9 crop, rendered in two strengths.
  ]
]

// 6 · closing — full opacity
#slide(full-bg, lower-left[
  #tracker[SEE YOU THERE]
  #v(10pt)
  #text(size: 52pt, weight: 800, tracking: -0.015em)[Thank you!]
  #v(16pt)
  #sub[Thanks to everyone who made this possible.]
  #v(12pt)
  #meta[community.example.org \u{2003}–\u{2003} demo\@example.org]
])
