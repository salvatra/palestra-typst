// Funcionalidades comuns. Cada modelo desenha a sua capa e o seu interior.
#let tinta = rgb("252C32")
#let discreto = rgb("616B73")
#let regra = rgb("D6DADD")
#let vazio(x) = x == [] or x == "" or x == none
#let etiqueta(body, cor: discreto) = text(size: 8pt, tracking: 0.65pt, fill: cor, upper(body))

#let campo(rotulo, valor) = block(width: 100%, breakable: false)[
  #etiqueta(rotulo)
  #v(5pt)
  #if vazio(valor) { line(length: 100%, stroke: 0.5pt + regra) } else { valor }
]

// A identificação usa toda a largura: nomes compridos podem ocupar duas linhas.
#let autores-linhas(autores, cor: discreto) = {
  set par(leading: 0.55em, spacing: 0pt)
  grid(columns: (1fr, 23mm), column-gutter: 8mm, row-gutter: 5mm,
    etiqueta([Nome], cor: cor), etiqueta([Número], cor: cor),
    ..autores.map(a => (
      if vazio(a.nome) { line(length: 100%, stroke: 0.5pt + regra) } else { a.nome },
      if vazio(a.numero) { line(length: 100%, stroke: 0.5pt + regra) } else { a.numero },
    )).flatten())
}

#let titulo-capa(d, cor: tinta, tamanho: 29pt) = {
  set par(leading: 0.35em, spacing: 0pt)
  if vazio(d.titulo) {
    block(width: 100%, height: 17mm)[
      #v(1fr)
      #line(length: 100%, stroke: 0.6pt + regra)
    ]
  } else {
    text(size: tamanho, weight: "bold", fill: cor, d.titulo)
  }
  if not vazio(d.subtitulo) {
    v(5mm)
    text(size: 11.5pt, fill: discreto, d.subtitulo)
  }
}

#let documento(
  capa: none, interior: none, titulo: [], subtitulo: none,
  unidade-curricular: [], professor-regente: [],
  autores: ((nome: "", numero: ""), (nome: "", numero: "")),
  data: [], ano-letivo: "2026/2027", indice: true, body,
) = {
  assert(autores.len() >= 2 and autores.len() <= 6, message: "Indique entre 2 e 6 autores.")
  let d = (titulo: titulo, subtitulo: subtitulo,
    unidade-curricular: unidade-curricular, professor-regente: professor-regente,
    autores: autores, data: data, ano-letivo: ano-letivo,
    logo: image("simbolo-uminho.png", width: 27mm))
  set document(title: if vazio(titulo) { "Relatório" } else { titulo },
    author: autores.map(a => a.nome).filter(n => n != ""))
  set text(font: "Noto Sans", size: 11pt, lang: "pt", region: "PT", fill: tinta)
  set par(justify: true, leading: 0.8em, spacing: 1em)
  set heading(numbering: "1.1")
  show heading: set text(font: "Noto Sans", weight: "bold")
  show heading: set block(sticky: true)
  show heading.where(level: 1): set block(above: 2em, below: 1.15em)
  show heading.where(level: 2): set block(above: 1.5em, below: 0.8em)
  show heading.where(level: 2): set text(size: 12.5pt)
  set figure(gap: 10pt)
  show figure: set block(above: 1.3em, below: 1.3em)
  show figure.caption: set text(size: 9pt, fill: discreto)
  show figure.caption: set par(leading: 0.6em, justify: false)
  show raw: set text(font: "Noto Sans Mono", size: 8.5pt)
  set table(inset: (x: 9pt, y: 10pt), stroke: 0.4pt + regra)
  show table: set text(size: 9.5pt)
  show table: set par(justify: false, leading: 0.65em)
  set list(spacing: 0.65em)
  set enum(spacing: 0.65em)
  capa(d)
  counter(page).update(1)
  interior(d, [
    #if indice {
      outline(title: [Índice], indent: 1.2em, depth: 2)
      pagebreak()
    }
    #body
  ])
}
