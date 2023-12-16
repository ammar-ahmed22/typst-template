#let conf(
  title: none,
  class: [],
  studentID: [],
  author: [],
  titleInfo: (),
  titleLogo: [],
  pageNumbering: none,
  sectionNumbering: none,
  doc
) = {
  set page(
    paper: "us-letter"
  )

  let topRow = 1fr
  if titleLogo != "" { topRow = auto }

  align(center)[
    #grid(
      rows: (topRow, 1fr, 1fr),
      {
        if titleLogo != "" [ #titleLogo ]
        else {[]}
      },
      [#text(22pt, [#title:]) \ #text(18pt, class)],
      [
        #table(
          columns: 2,
          align: (x, y) => (left, right).at(x),
          stroke: none,
          [Author:], author,
          [Student ID:], studentID,
          ..titleInfo.keys().map(key => ([#key:], titleInfo.at(key)).map(n => n)).flatten()
        )
      ]
    )
  ]

  pagebreak()
  show outline.entry.where(
    level: 1
  ): it => {
    v(12pt, weak: true)
    [#text(14pt, strong(it))]
  }

  show outline.entry.where(
    level: 2
  ): it => {
    text(12pt, strong(it))
  }

  outline(title: [Table of Contents], indent: auto )

  set page(
    paper: "us-letter",
    numbering: pageNumbering,
    header: [#author (#studentID) #h(1fr) #title: #class \ #line(length: 100%)]
  )

  counter(page).update(1)

  set heading(numbering: sectionNumbering)

  doc
}