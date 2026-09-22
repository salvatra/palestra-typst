// Template C: capa centrada, títulos amplos e pequenos apontamentos em ocre.
#import "../relatorio.typ": *
#let acento = rgb("976D26")

#let capa(d) = page(paper: "a4", header: none, footer: none, margin: (x: 28mm, y: 23mm))[
  #set text(size: 10pt)
  #set par(justify: false, leading: 0.55em, spacing: 0pt)
  #align(center)[
    #d.logo
    #v(5mm)
    #text(size: 12pt, weight: "bold")[Universidade do Minho]
    #v(2mm)
    #text(size: 9pt, fill: discreto)[Escola de Engenharia · Engenharia Informática]
  ]
  #v(1fr)
  #align(center)[
    #etiqueta([Relatório de projeto], cor: acento)
    #v(8mm)
    #titulo-capa(d, tamanho: 29pt)
    #v(8mm)
    #line(length: 17mm, stroke: 1.4pt + acento)
  ]
  #v(1fr)
  #grid(columns: 2, gutter: 13mm,
    campo([Unidade Curricular], d.unidade-curricular),
    campo([Professor Regente], d.professor-regente))
  #v(11mm)
  #autores-linhas(d.autores, cor: acento)
  #v(1fr)
  #align(center)[
    #text(size: 9pt, fill: discreto)[Ano letivo #d.ano-letivo]
    #if not vazio(d.data) { v(4mm); text(size: 10pt, d.data) }
  ]
]

#let interior(d, body) = {
  set page(paper: "a4", margin: (x: 28mm, top: 27mm, bottom: 26mm),
    header: align(center, text(size: 8pt, tracking: 0.5pt, fill: discreto)[UNIVERSIDADE DO MINHO · ENGENHARIA INFORMÁTICA]),
    footer: context align(center)[#text(size: 9pt, fill: acento, counter(page).display("1"))])
  show heading.where(level: 1): set text(size: 21pt)
  show heading.where(level: 1): it => context block(sticky: true)[
    #line(length: 12mm, stroke: 1.3pt + acento)
    #v(5mm)
    #if it.numbering != none {
      text(size: 10pt, fill: acento, counter(heading).display(it.numbering))
      h(3mm)
    }
    #it.body
  ]
  show link: set text(fill: acento)
  set table(stroke: (x: none, y: 0.4pt + regra))
  show raw.where(block: true): it => block(width: 100%, breakable: false,
    inset: (x: 0pt, y: 12pt), stroke: (top: 0.5pt + regra, bottom: 0.5pt + regra),
    above: 1.3em, below: 1.3em, it)
  body
}

#let relatorio = documento.with(capa: capa, interior: interior)
