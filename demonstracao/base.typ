// Biblioteca local da demo: não requer pacotes externos nem imagens.
#let documento(cor: rgb("8D2226"), body) = {
  set page(paper: "a4", margin: 24mm, numbering: "1")
  set text(font: "Libertinus Serif", size: 12pt, lang: "pt", region: "PT")
  set heading(numbering: "1.1")
  show heading: set text(fill: cor)
  set par(leading: 0.65em)
  set document(title: "Biblioteca · demonstração")
  body
}
#let esquema(a, b) = grid(columns: (1fr, auto, 1fr), gutter: 12pt, align: horizon,
  block(inset: 12pt, width: 100%, stroke: 0.7pt)[#a], [→],
  block(inset: 12pt, width: 100%, stroke: 0.7pt)[#b])
