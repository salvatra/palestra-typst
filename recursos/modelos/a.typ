// Template A: capa institucional e hierarquia em vermelho.
#import "../relatorio.typ": *
#let acento = rgb("8D2226")

#let capa(d) = page(paper: "a4", header: none, footer: none, margin: (x: 26mm, y: 24mm))[
  #set text(size: 10pt)
  #set par(justify: false, leading: 0.55em, spacing: 0pt)
  #grid(columns: (1fr, auto), gutter: 15mm, align: horizon,
    [#text(size: 16pt, weight: "bold")[Universidade do Minho]
      #v(3mm) Escola de Engenharia
      #v(2mm) Engenharia Informática], d.logo)
  #v(9mm)
  #line(length: 100%, stroke: 1.6pt + acento)
  #v(1fr)
  #etiqueta([Relatório de projeto], cor: acento)
  #v(7mm)
  #titulo-capa(d, cor: acento, tamanho: 28pt)
  #v(12mm)
  #grid(columns: 2, gutter: 12mm,
    campo([Unidade Curricular], d.unidade-curricular),
    campo([Professor Regente], d.professor-regente))
  #v(1fr)
  #etiqueta([Identificação dos estudantes])
  #v(7mm)
  #autores-linhas(d.autores)
  #v(1fr)
  #line(length: 100%, stroke: 0.5pt + regra)
  #v(6mm)
  #grid(columns: (1fr, auto), gutter: 10mm,
    text(size: 9pt, fill: discreto)[Ano letivo #d.ano-letivo],
    if not vazio(d.data) { text(size: 10pt, d.data) })
]

#let interior(d, body) = {
  set page(paper: "a4", margin: (x: 26mm, top: 26mm, bottom: 26mm),
    header: text(size: 8pt, fill: discreto)[Universidade do Minho #h(1fr) Escola de Engenharia],
    footer: context [#text(size: 8pt, fill: discreto)[Engenharia Informática · #d.ano-letivo]
      #h(1fr) #text(size: 9pt, fill: acento, counter(page).display("1"))])
  show heading: set text(fill: acento)
  show heading.where(level: 1): set text(size: 18pt)
  show link: set text(fill: acento)
  show raw.where(block: true): it => block(width: 100%, breakable: false,
    inset: 14pt, fill: rgb("F5F5F4"), radius: 2pt, above: 1.3em, below: 1.3em, it)
  body
}

#let relatorio = documento.with(capa: capa, interior: interior)
