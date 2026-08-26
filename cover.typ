#{
  import "/facade.typ": *
  show: page.with(
    paper: "a4",
    margin: 0pt,
    fill: color.tint.dark,
    numbering: none,
    header: none,
    footer: none,
  )

  set text(
    font: font.serif,
    fill: color.tint._100,
  )

  set place(bottom + center)

  place(
    dy: -23cm,
    text(
        size: 2cm,
        weight: "bold",
        tracking: .1em,
    )[大邮逆向集],
  )

  place(
    dy: -12cm,
    rotate(
      -36deg,
      text(
          size: 6cm,
          weight: "light",
          font: font.icon,
      )[]
    )
  )

  place(
    dy: -5cm,
    text(size: .8cm)[
      — 逆向工程系列习题 —
    ],
  )
}