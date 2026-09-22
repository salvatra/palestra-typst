#import "tema.typ": *
#show: tema
#for (n, titulo, explicacao) in (
  ("01", "O documento inicial", [Um objetivo genérico e uma figura. A referência aponta para a Figura 1.]),
  ("02", "Um objetivo mais concreto", [Explicitar os empréstimos duplicados e a preservação dos registos. A estrutura visual mantém-se.]),
  ("03", "Mais uma figura, a mesma etiqueta", [A nova figura entra antes da arquitetura. A referência à arquitetura passa automaticamente a Figura 2.]),
  ("04", "Uma regra muda os títulos", [Alterar a cor num único sítio. Exportar o documento final para PDF.]),
) {
  s("D" + n, [#titulo], [
    #text(size: 20pt, explicacao)
    #v(18pt)
    #align(center)[#image("../output/previews/demo-" + n + "-focus.png", width: 800pt)]
  ])
}
