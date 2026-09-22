#import "../cetz/arquitetura.typ": arquitetura
#set page(width: 297mm, height: 420mm, margin: 24mm, fill: rgb("F7F5F1"))
#set text(font: "Noto Sans", size: 16pt, lang: "pt", region: "PT", fill: rgb("24272B"))
#text(size: 12pt, fill: rgb("8D2226"), weight: "bold")[PROJETO ACADÉMICO · EXEMPLO FICTÍCIO]
#v(12mm)
#text(size: 53pt, weight: "bold")[Uma biblioteca.\
Três responsabilidades.]
#v(12mm)
Uma estrutura simples para explicar um sistema de gestão de livros e empréstimos.
#v(18mm)
#line(length: 100%, stroke: 2pt + rgb("8D2226"))
#v(16mm)
#align(center)[#scale(135%, arquitetura())]
#v(20mm)
#grid(columns: 2, gutter: 14mm,
 [#text(size: 24pt, weight: "bold")[O problema] #v(5mm) Um exemplar não pode ter dois empréstimos ativos. A regra deve permanecer clara mesmo quando a interface ou o armazenamento mudam.],
 [#text(size: 24pt, weight: "bold")[A proposta] #v(5mm) A interface recebe o pedido. O domínio valida a operação. A persistência guarda o resultado.],
)
#v(15mm)
#text(size: 24pt, weight: "bold")[Como verificar]
#v(5mm)
Aceitar o primeiro empréstimo. Rejeitar o segundo. Reabrir a aplicação e confirmar os registos.
#v(1fr)
#text(size: 10pt, fill: gray)[Póster criado em Typst · Diagrama em CeTZ · Sem resultados experimentais reais]
