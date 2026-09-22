// Núcleo comum dos três modelos. O conteúdo do relatório fica fora deste ficheiro.
#let vermelho = rgb("8D2226")
#let tinta = rgb("24272B")
#let cinzento = rgb("657078")
#let vazio(x) = x == [] or x == "" or x == none
#let campo(rotulo, valor, largura: 100%) = block(width: largura, above: 0pt, below: 10pt)[
  #text(font: "Noto Sans", size: 8pt, fill: cinzento, rotulo)
  #v(4pt)
  #if vazio(valor) { line(length: 100%, stroke: 0.4pt + rgb("BCC1C4")) } else { valor }
]

#let relatorio(
  estilo: "classico", titulo: [], subtitulo: none,
  unidade-curricular: [], professor-regente: [],
  autores: ((nome: "", numero: ""), (nome: "", numero: "")),
  data-entrega: [], ano-letivo: "2026/2027", indice: true,
  logo: "simbolo-uminho.png", body,
) = {
  assert(autores.len() >= 2 and autores.len() <= 6, message: "Indique entre 2 e 6 autores.")
  let denso = autores.len() > 4
  let moderno = estilo == "engenharia"
  let essencial = estilo == "essencial"
  set document(title: if vazio(titulo) { "Relatório" } else { titulo }, author: autores.map(a => a.nome).filter(n => n != ""))
  set text(font: if moderno { "Noto Sans" } else { "Libertinus Serif" }, size: if moderno { 10.5pt } else { 11pt }, lang: "pt", region: "PT", fill: tinta)
  set par(justify: true, leading: 0.65em, spacing: if moderno { 0.65em } else { 0.8em })
  set page(paper: "a4", margin: (x: 24mm, top: 23mm, bottom: 24mm),
    header: text(font: "Noto Sans", size: 8pt, fill: cinzento)[Universidade do Minho #h(1fr) Escola de Engenharia],
    footer: context [#text(font: "Noto Sans", size: 8pt, fill: cinzento)[Engenharia Informática · #ano-letivo] #h(1fr) #text(size: 9pt, counter(page).display("1"))],
  )
  set heading(numbering: "1.1")
  show heading: set text(font: if essencial { "Libertinus Serif" } else { "Noto Sans" }, fill: if essencial { tinta } else { vermelho })
  show heading.where(level: 1): set block(above: if moderno { 1.2em } else { 1.5em }, below: 0.8em)
  show heading.where(level: 1): set text(size: 17pt)
  show heading.where(level: 2): set text(size: 12pt)
  set figure(gap: 7pt)
  show figure.caption: set text(size: 9pt)
  show raw: set text(font: "DejaVu Sans Mono", size: 8.5pt)
  show raw.where(block: true): it => block(width: 100%, breakable: false, inset: 11pt, fill: rgb("F3F4F4"), radius: 2pt, it)
  set table(inset: 7pt, stroke: 0.4pt + rgb("CFD3D5"))
  show link: set text(fill: vermelho)

  page(header: none, footer: none, margin: (x: 25mm, y: 23mm))[
    #set par(justify: false)
    #set text(font: "Noto Sans", size: 10pt)
    #if estilo == "classico" {
      align(center)[
        #image(logo, width: 35mm)
        #v(10mm)
        #text(size: 17pt, weight: "bold")[Universidade do Minho]
        #v(2mm)
        Escola de Engenharia
        #v(2mm)
        Engenharia Informática
      ]
    } else {
      grid(columns: (1fr, 32mm), gutter: 12mm,
        [#text(size: 17pt, weight: "bold")[Universidade do Minho]
          #v(2mm) Escola de Engenharia #v(2mm) Engenharia Informática],
        image(logo, width: 32mm))
      v(8mm)
      line(length: 100%, stroke: (if moderno { 2pt } else { 0.5pt }) + vermelho)
    }
    #v(if essencial { if denso { 9mm } else { 16mm } } else { 1fr })
    #text(size: 9pt, fill: cinzento)[RELATÓRIO DE PROJETO]
    #v(7mm)
    #if vazio(titulo) { line(length: 100%, stroke: 0.5pt + cinzento) } else {
      text(font: if not moderno { "Libertinus Serif" } else { "Noto Sans" }, size: if denso { 21pt } else if moderno { 27pt } else { 25pt }, weight: "bold", fill: if moderno { vermelho } else { tinta }, titulo)
    }
    #if not vazio(subtitulo) { v(4mm); text(size: if denso { 11pt } else { 12pt }, fill: cinzento, subtitulo) }
    #v(9mm)
    #campo("Unidade Curricular", unidade-curricular)
    #campo("Professor Regente", professor-regente)
    #v(if essencial { 8mm } else { 1fr })
    #text(size: 9pt, weight: "bold")[IDENTIFICAÇÃO DOS ESTUDANTES]
    #v(6mm)
    #grid(columns: (1fr, 30mm), column-gutter: 9mm, row-gutter: if denso { 4mm } else { 6mm },
      text(size: 8pt, fill: cinzento)[Nome], text(size: 8pt, fill: cinzento)[Número],
      ..autores.map(a => (
        if a.nome == "" { line(length: 100%, stroke: 0.4pt + rgb("BCC1C4")) } else { a.nome },
        if a.numero == "" { line(length: 100%, stroke: 0.4pt + rgb("BCC1C4")) } else { a.numero },
      )).flatten())
    #v(1fr)
    #line(length: 100%, stroke: 0.5pt + rgb("BCC1C4"))
    #v(5mm)
    #grid(columns: (1fr, 1fr), gutter: 12mm,
      campo("Ano letivo", ano-letivo), campo("Data de entrega", data-entrega))
  ]
  counter(page).update(1)
  if indice {
    outline(title: [Índice], indent: 1em, depth: 2)
    pagebreak()
  }
  body
}

