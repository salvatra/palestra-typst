// Template B: composição lateral e números de secção na margem.
#import "../relatorio.typ": *
#let acento = rgb("175363")
#let suave = rgb("ECF3F4")

#let capa(d) = page(paper: "a4", header: none, footer: none,
  margin: (left: 37mm, right: 25mm, top: 24mm, bottom: 24mm),
  background: place(top + left, dx: 13mm, dy: 16mm,
    rect(width: 8mm, height: 265mm, fill: acento, stroke: none)),
)[
  #set text(size: 10pt)
  #set par(justify: false, leading: 0.55em, spacing: 0pt)
  #grid(columns: (1fr, auto), gutter: 10mm, align: horizon,
    [#etiqueta([Universidade do Minho], cor: acento)
      #v(3mm) #text(weight: "bold")[Escola de Engenharia]
      #v(2mm) Departamento de Informática
      #v(2mm) Licenciatura em Engenharia Informática], d.logo)
  #v(1fr)
  #etiqueta([Relatório de projeto], cor: acento)
  #v(8mm)
  #titulo-capa(d, cor: acento, tamanho: 30pt)
  #v(10mm)
  #line(length: 19mm, stroke: 3pt + acento)
  #v(1fr)
  #grid(columns: 2, gutter: 10mm,
    campo([Unidade Curricular], d.unidade-curricular),
    campo([Professor Regente], d.professor-regente))
  #v(11mm)
  #autores-linhas(d.autores, cor: acento)
  #v(1fr)
  #grid(columns: (1fr, auto), gutter: 8mm,
    text(size: 9pt, fill: acento)[Ano letivo #d.ano-letivo],
    if not vazio(d.data) { text(size: 10pt, d.data) })
]

#let interior(d, body) = {
  set page(paper: "a4", margin: (left: 34mm, right: 25mm, top: 27mm, bottom: 26mm),
    header: [#text(size: 8pt, fill: acento)[UNIVERSIDADE DO MINHO]
      #h(1fr) #text(size: 8pt, fill: discreto)[Licenciatura em Engenharia Informática]
      #v(3mm) #line(length: 100%, stroke: 0.5pt + acento)],
    footer: context [#text(size: 8pt, fill: discreto)[Ano letivo #d.ano-letivo]
      #h(1fr) #box(inset: (x: 7pt, y: 4pt), fill: suave)[#text(size: 9pt, fill: acento, counter(page).display("1"))]])
  show heading: set text(fill: acento)
  show heading.where(level: 1): set text(size: 18pt)
  show heading.where(level: 1): it => context block(sticky: true)[
    #if it.numbering != none {
      place(top + left, dx: -21mm, block(width: 16mm, align(right,
        text(size: 23pt, weight: "regular", fill: acento, counter(heading).display(it.numbering)))))
    }
    #it.body
  ]
  show link: set text(fill: acento)
  set table(fill: (x, y) => if y == 0 { suave } else { none })
  show raw.where(block: true): it => block(width: 100%, breakable: false,
    inset: 14pt, fill: suave, stroke: (left: 2pt + acento), above: 1.3em, below: 1.3em, it)
  body
}

#let relatorio = documento.with(capa: capa, interior: interior)
