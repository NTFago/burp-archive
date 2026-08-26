#let spacing = (
  first-line-indent: 2em,
  line-leading: 1em,
  par-spacing: 1em,
  list-spacing: 1em,
  list-indent: 1em,
  terms-hanging-indent: 2em,
  problem-spacing: 1.25em,
  problem-line-leading: 1.25em,
  problem-par-spacing: 1.25em,
  table-inset: (x: 1em, y: .5em),
  margin: (left: 20mm, right: 20mm, top: 20mm, bottom: 20mm),
)

#let font = (
  en: "Libertinus Serif",
  serif: ((name: "Libertinus Serif", covers: "latin-in-cjk"), "Source Han Serif SC"),
  sans: ("Source Han Sans SC",),
  mono: ((name: "CaskaydiaMono NF", covers: "latin-in-cjk"),),
  math: ("STIX Two Math",),
  icon: ("CaskaydiaMono NF",),
)

#let color = (
  tint: (
    light: rgb("#F8FBFF"),
    _50: rgb("#f0f6fe"),
    _100: rgb("#dde9fc"),
    _200: rgb("#c3d9fa"),
    _300: rgb("#9ec4f6"),
    _400: rgb("#6ba1ef"),
    _500: rgb("#487fe9"),
    _600: rgb("#3361dd"),
    _700: rgb("#2a4ecb"),
    _800: rgb("#2840a5"),
    _900: rgb("#253a83"),
    _950: rgb("#1b2550"),
    dark: rgb("#0F1C3F"),
),
  error: red,
  warning: yellow,
  comment: gray,
  time: green,
  tag: blue,
  todo: yellow,
)

#let footer-content = align(horizon, text(size: .75em)[大邮逆向集])

#let config = (
  spacing: spacing,
  font: font,
  color: color,
  footer-content: footer-content,
)
