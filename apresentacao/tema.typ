#import "@preview/touying:0.7.4": config-page, config-info
#import "@preview/touying:0.7.4": themes
#let vermelho = rgb("8D2226")
#let tinta = rgb("24272B")
#let discreto = rgb("626B72")
#let papel = rgb("F7F5F1")
#let tema(body) = {
  set text(font: "Noto Sans", size: 25pt, lang: "pt", region: "PT", fill: tinta)
  set par(leading: 0.65em, spacing: 0.7em)
  show: themes.simple.simple-theme.with(
    primary: vermelho, header: none, header-right: none, footer: none, footer-right: none,
    subslide-preamble: none,
    config-page(width: 960pt, height: 540pt, margin: (x: 55pt, y: 40pt), fill: papel),
    config-info(title: [Typst e «Como escrever um relatório»]),
  )
  body
}
#let s(n, titulo, body) = themes.simple.slide[
  #place(bottom + right, text(size: 11pt, fill: discreto, str(n)))
  #text(size: 35pt, weight: "bold", titulo)
  #v(24pt)
  #body
]
#let hero(n, pequeno, grande, fim: []) = themes.simple.slide(config: config-page(fill: vermelho))[
  #set text(fill: white)
  #place(bottom + right, text(size: 11pt, str(n)))
  #text(size: 16pt, pequeno)
  #v(1fr)
  #text(size: 57pt, weight: "bold", grande)
  #v(26pt)
  #text(size: 22pt, fim)
  #v(1fr)
]
#let nota(body) = text(size: 16pt, fill: discreto, body)
#let destaque(body) = text(fill: vermelho, weight: "bold", body)
#let code(s, tamanho: 22pt) = block(width: 100%, inset: 20pt, fill: rgb("EEEBE5"), radius: 2pt)[
  #set text(font: "DejaVu Sans Mono", size: tamanho)
  #raw(s, lang: "typst", block: true)
]
#let duo(a, b, frac: (1fr, 1fr)) = grid(columns: frac, column-gutter: 35pt, a, b)
#let regra() = line(length: 100%, stroke: 1pt + rgb("CFCBC4"))
