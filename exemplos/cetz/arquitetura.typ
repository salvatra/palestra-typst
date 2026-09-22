#import "@preview/cetz:0.5.2": canvas, draw

// Um único parâmetro permite experimentar outro mecanismo de persistência.
#let arquitetura(armazenamento: "JSON", cor: rgb("8D2226")) = canvas({
  import draw: *
  set-style(stroke: (paint: cor, thickness: 1pt))
  rect((0, 0), (3.5, 1.7), radius: 0.12, fill: rgb("F5EFEF"), name: "ui")
  content((1.75, 0.85), text(size: 12pt, weight: "bold")[Interface])
  rect((5, 0), (8.5, 1.7), radius: 0.12, fill: rgb("F5EFEF"), name: "dominio")
  content((6.75, 0.85), text(size: 12pt, weight: "bold")[Domínio])
  rect((10, 0), (13.5, 1.7), radius: 0.12, fill: rgb("F5EFEF"), name: "dados")
  content((11.75, 0.85), text(size: 12pt, weight: "bold", armazenamento))
  line("ui.east", "dominio.west", mark: (end: ">"))
  line("dominio.east", "dados.west", mark: (end: ">"))
  content((1.75, -0.55), text(size: 9pt)[Recolher pedidos])
  content((6.75, -0.55), text(size: 9pt)[Verificar regras])
  content((11.75, -0.55), text(size: 9pt)[Guardar registos])
})
