#import "tema.typ": *
#import "config.typ": *
#import "../exemplos/cetz/arquitetura.typ": arquitetura
#import "@preview/codetastic:0.2.2": qrcode
#show: tema
#set document(title: "Typst e «Como escrever um relatório»", author: orador)

#hero(1, [ENGENHARIA INFORMÁTICA · UNIVERSIDADE DO MINHO], [Typst e\ «Como escrever\ um relatório»], fim: [#if orador != "" { [#orador #h(15pt)] } #if data != "" { data }])

#s(2, [São 23:47. A entrega é à meia-noite.], [
  #v(15pt)
  #text(size: 38pt)[O código funciona.]
  #v(20pt)
  #text(size: 38pt)[A figura mudou de página.]
  #v(20pt)
  #text(size: 38pt, fill: vermelho)[A “Figura 3” já é a Figura 4.]
  #v(30pt)
  #nota[`relatorio_final_final_agora_sim.pdf`]
])

#s(3, [Escolher a ferramenta para este trabalho], [
  #set text(size: 21pt)
  #table(columns: (1.05fr, 1.6fr, 1.65fr), stroke: none, inset: (x: 0pt, y: 13pt), column-gutter: 25pt,
    table.header([*Ferramenta*], [*Ponto forte*], [*O que pesa aqui*]),
    [Word / Writer], [Edição visual familiar], [Disciplina de estilos; rever alterações ao formato],
    [LaTeX], [Ecossistema maduro], [Mais sintaxe e configuração para começar],
    destaque[Typst], [Estrutura + pré-visualização], [Aprender uma sintaxe nova; ecossistema mais recente],
  )
  #v(17pt) #regra() #v(12pt)
  #text(size: 23pt)[Para estes relatórios, a minha escolha é #destaque[Typst].]
  #v(7pt) #nota[O enunciado da UC tem sempre a última palavra.]
])

#hero(4, [O QUE É TYPST], [Escrever a estrutura.\ Ver o documento.], fim: [Um ficheiro de texto pode dar origem a um PDF cuidado.])

#s(5, [Conteúdo e apresentação], [
  #duo([
    #nota[O QUE ESCREVES] #v(15pt)
    #code("= Testes\n\nForam verificados três casos.\n\n- Empréstimo válido\n- Exemplar indisponível")
  ], [
    #nota[COMO APARECE] #v(15pt)
    #block(fill: white, inset: 24pt, width: 100%)[
      #text(font: "Libertinus Serif", size: 29pt, weight: "bold")[1 Testes]
      #v(15pt) #text(font: "Libertinus Serif", size: 23pt)[Foram verificados três casos.]
      #v(13pt) #text(font: "Libertinus Serif", size: 21pt)[• Empréstimo válido\ • Exemplar indisponível]
    ]
  ])
  #v(25pt) #nota[O template decide o aspeto. O texto conserva a sua estrutura.]
])

#s(6, [Três peças, o mesmo nome], [
  #grid(columns: (170pt, 1fr), row-gutter: 25pt,
    destaque[Linguagem], [O que escreves nos ficheiros `.typ`.],
    destaque[Compilador], [Transforma esses ficheiros no documento final.],
    destaque[Editor web], [Escreves e colaboras no navegador.],
  )
  #v(38pt) #regra() #v(18pt)
  #nota[Também podes trabalhar localmente com o teu editor e o compilador aberto.]
])

#s(7, [A sintaxe que vais usar todos os dias], [
  #duo([#code("= Introdução\n== Objetivos\n\nUma ideia *importante*.\n\n- Primeiro objetivo\n- Segundo objetivo")], [
    #text(size: 29pt, weight: "bold")[Introdução] #v(12pt)
    #text(size: 24pt, weight: "bold", fill: vermelho)[Objetivos] #v(14pt)
    Uma ideia *importante*.
    #v(13pt)
    - Primeiro objetivo
    - Segundo objetivo
  ])
])

#s(8, [Figuras que têm nome e contexto], [
  #duo([
    #code("#figure(\n  image(\"arquitetura.png\"),\n  caption: [Visão do sistema.],\n) <arquitetura>\n\nVer a @arquitetura.", tamanho: 20pt)
  ], [
    #v(28pt)
    #text(size: 29pt)[Interface → Domínio]
    #v(28pt)
    #text(font: "Libertinus Serif", size: 21pt)[Figura 1: Visão do sistema.]
    #v(28pt)
    #text(size: 24pt)[Ver a #destaque[Figura 1].]
  ])
  #v(25pt) #nota[A referência usa uma etiqueta. O número é calculado.]
])

#s(9, [Tabelas e código, sem capturas de ecrã], [
  #duo([
    #code("#table(\n  columns: 2,\n  [Caso], [Resultado],\n  [Duplicado], [Rejeitado],\n)", tamanho: 21pt)
    #v(15pt) #nota[Células editáveis, texto selecionável.]
  ], [
    #table(columns: 2, inset: 14pt, stroke: 0.7pt + rgb("BFC2C4"), [*Caso*], [*Resultado*], [Duplicado], [Rejeitado])
    #v(27pt)
    #block(inset: 15pt, fill: white)[#text(font: "DejaVu Sans Mono", size: 20pt)[if not disponivel:\ #h(15pt)rejeitar()]]
    #v(10pt) #nota[Um excerto que explica uma decisão.]
  ])
])

#s(10, [Matemática, quando faz falta], [
  #v(22pt)
  #duo([#code("$ T(n) = a n + b $")], [#align(center)[#text(size: 41pt)[$ T(n) = a n + b $]]])
  #v(45pt)
  #text(size: 29pt)[A equação também precisa de uma explicação.]
  #v(15pt) #nota[Definir variáveis, unidades e pressupostos. Não enfeitar o relatório.]
])

#s(11, [Referências que acompanham as alterações], [
  #duo([
    #text(size: 28pt, weight: "bold")[Dentro do relatório]
    #v(20pt) #code("Ver a @arquitetura.")
    #v(20pt) #nota[Secções, figuras e tabelas.]
  ], [
    #text(size: 28pt, weight: "bold")[Para outras fontes]
    #v(20pt) #code("Consultar @typst-docs.")
    #v(20pt) #nota[Entradas reais num ficheiro `.bib` ou `.yml`.]
  ])
  #v(28pt) #text(size: 23pt)[A formatação pode ser automática. A escolha da fonte é tua.]
])

#s(12, [Um estilo. Um trabalho de grupo.], [
  #code("#show heading: set text(fill: rgb(\"8D2226\"))")
  #v(30pt)
  #grid(columns: (1fr, 1fr, 1fr), gutter: 30pt,
    [*Consistência* #v(10pt) Uma regra para todos os títulos.],
    [*Organização* #v(10pt) Conteúdo dividido por secções.],
    [*Revisão* #v(10pt) Um grupo, uma voz final.],
  )
  #v(25pt) #nota[Editor web para colaborar; ficheiros de texto para quem usa Git.]
])

#s(13, [Vamos mexer num documento], [
  #v(10pt)
  #grid(columns: (50pt, 1fr), row-gutter: 23pt,
    destaque[01], [Tornar o objetivo mais concreto.],
    destaque[02], [Inserir uma figura antes da arquitetura.],
    destaque[03], [Mudar o estilo dos títulos.],
    destaque[04], [Exportar o PDF.],
  )
  #v(30pt) #nota[Cinco minutos. O resultado fica nos materiais.]
])

#s(14, [CeTZ: diagramas dentro do documento], [
  #v(35pt)
  #align(center)[#scale(155%, arquitetura())]
  #v(60pt)
  #text(size: 27pt)[Rótulos, ligações e cores continuam editáveis.]
  #v(12pt) #nota[Biblioteca de desenho para Typst. Este é um exemplo criado com CeTZ.]
])

#s(15, [Um desenho descrito em texto], [
  #duo([
    #code("#import \"@preview/cetz:0.5.2\": canvas, draw\n#canvas({\n  import draw: *\n  rect((0, 0), (3, 1))\n  content((1.5, 0.5), [Domínio])\n})", tamanho: 18pt)
  ], [
    #v(35pt)
    #align(center)[#block(width: 240pt, inset: 30pt, stroke: 1pt + vermelho)[#align(center)[Domínio]]]
    #v(30pt) #nota[Não é preciso decorar a biblioteca: começar por um exemplo pequeno.]
  ], frac: (1.3fr, 1fr))
])

#s(16, [O mesmo diagrama, outra decisão], [
  #code("#arquitetura(armazenamento: \"SQLite\")")
  #v(32pt)
  #align(center)[#scale(150%, arquitetura(armazenamento: "SQLite"))]
  #v(47pt) #nota[Mudar o desenho é fácil. Justificar a escolha continua a ser trabalho nosso.]
])

#s(17, [Também cabe fora de um relatório], [
  #grid(columns: 3, gutter: 32pt,
    [#image("../output/previews/cv.png", height: 285pt) #v(10pt) #text(size: 20pt)[Curriculum vitae]],
    [#image("../output/previews/poster.png", height: 285pt) #v(10pt) #text(size: 20pt)[Póster]],
    [#image("../output/previews/ficha.png", height: 285pt) #v(10pt) #text(size: 20pt)[Ficha de exercícios]],
  )
])

#s(18, [Um template é uma boa partida], [
  #duo([
    #text(size: 29pt)[Preencher os dados.]
    #v(20pt) #text(size: 29pt)[Escrever o conteúdo.]
    #v(20pt) #text(size: 29pt)[Ajustar só o necessário.]
    #v(28pt) #nota[O aspeto muda. A estrutura mantém-se.]
  ], [#align(center)[#image("../output/previews/engenharia.png", height: 330pt)]])
])

#s(19, [LLMs: ajuda concreta, pedidos concretos], [
  #text(size: 27pt)[“Adapta esta tabela a Typst 0.15.1.\ Mantém os dados e usa o estilo do template.\ Devolve um exemplo mínimo que compile.”]
  #v(30pt) #regra() #v(23pt)
  #grid(columns: 3, gutter: 25pt,
    [*Dar contexto* #v(9pt) Ficheiro, versão e objetivo.],
    [*Pedir pouco* #v(9pt) Uma alteração de cada vez.],
    [*Verificar* #v(9pt) Compilar e ler o PDF.],
  )
])

#s(20, [O compilador ajuda a corrigir o pedido], [
  #duo([
    #nota[ERRO] #v(12pt)
    #code("#set text(font-size: 12pt)", tamanho: 20pt)
    #v(15pt) #text(size: 20pt, fill: vermelho)[unexpected argument: font-size]
  ], [
    #nota[CORREÇÃO] #v(12pt)
    #code("#set text(size: 12pt)", tamanho: 20pt)
    #v(15pt) #text(size: 21pt)[Voltar a compilar. Inspecionar o resultado.]
  ])
  #v(30pt) #text(size: 25pt)[O LLM ajuda com o documento.\ Os resultados e as referências têm de ser reais.]
])

#hero(21, [COMO ESCREVER UM RELATÓRIO], [O leitor não esteve\ ao vosso lado.], fim: [Deem-lhe contexto, razões e evidência.])

#s(22, [Uma estrutura que responde a perguntas], [
  #set text(size: 22pt)
  #grid(columns: (270pt, 1fr), column-gutter: 20pt, row-gutter: 17pt,
    destaque[Introdução e objetivos], [Que problema tentámos resolver?],
    destaque[Conceção e decisões], [Que solução escolhemos e porquê?],
    destaque[Implementação], [Como funciona o que é essencial?],
    destaque[Testes e resultados], [Que evidência temos?],
    destaque[Conclusão], [O que alcançámos e o que falta?],
  )
  #v(25pt) #nota[Referências e apêndices completam o texto. O enunciado pode exigir outra estrutura.]
])

#s(23, [Objetivos que se conseguem verificar], [
  #nota[VAGO] #v(12pt)
  #text(size: 31pt)[“Criar uma aplicação boa e eficiente.”]
  #v(30pt) #regra() #v(23pt)
  #nota[VERIFICÁVEL] #v(12pt)
  #text(size: 31pt, fill: vermelho)[“Impedir dois empréstimos ativos\ do mesmo exemplar.”]
  #v(25pt) #nota[O objetivo já sugere um teste.]
])

#s(24, [Decisões: escolha, razão, compromisso], [
  #grid(columns: (170pt, 1fr), gutter: 22pt,
    destaque[Escolha], [Mapa indexado pelo identificador do livro.],
    destaque[Razão], [Essa é a chave das pesquisas principais.],
    destaque[Alternativa], [Uma lista seria mais simples de começar.],
    destaque[Compromisso], [O mapa não resolve pesquisas por partes do título.],
  )
  #v(30pt) #nota[Explicar “porquê” vale mais do que enumerar classes.]
])

#s(25, [A implementação precisa de seleção], [
  #duo([
    #text(size: 27pt, weight: "bold")[Incluir]
    #v(17pt)
    - Arquitetura
    - Algoritmo relevante
    - Regra difícil de perceber
    - Excerto que ajuda a explicar
  ], [
    #text(size: 27pt, weight: "bold")[Remeter para o repositório]
    #v(17pt)
    - Código completo
    - Getters e setters
    - Detalhes repetidos
    - Listas de todos os ficheiros
  ])
  #v(28pt) #nota[Uma figura útil pode poupar vários parágrafos.]
])

#s(26, [Que parágrafo convence mais?], [
  #text(size: 17pt, fill: discreto)[A] #v(9pt)
  #text(size: 28pt)[“Fizemos muitos testes e o programa\ funciona corretamente.”]
  #v(25pt) #regra() #v(20pt)
  #text(size: 17pt, fill: discreto)[B] #v(9pt)
  #text(size: 27pt)[“No teste de empréstimo duplicado, o segundo\ pedido foi rejeitado e manteve-se um único\ empréstimo ativo.”]
  #v(20pt) #nota[Exemplo fictício. O que acrescentariam para o tornar reproduzível?]
])

#s(27, [Resultados com contexto], [
  #set text(size: 22pt)
  #table(columns: (1.1fr, 1.2fr, 1.3fr), inset: 13pt, stroke: 0.5pt + rgb("CFCBC4"),
    table.header([*Cenário*], [*Esperado*], [*Observado*]),
    [Primeiro empréstimo], [Aceitar], [Aceite],
    [Segundo empréstimo], [Rejeitar], [Rejeitado],
    [Reabrir aplicação], [Preservar registos], [Preservados],
  )
  #v(17pt) #nota[Dados fictícios, apenas para ilustrar a escrita.]
  #v(23pt) #text(size: 24pt)[Identificar versão, ambiente e dados de entrada.\ Discutir também os casos que falharam ou faltam testar.]
])

#s(28, [Antes de entregar], [
  #grid(columns: (1fr, 1fr), gutter: 30pt,
    [*Conclusão* #v(12pt) Retoma os objetivos.\ Assume as limitações.\ Propõe próximos passos concretos.],
    [*Revisão* #v(12pt) Figuras explicadas no texto.\ Fontes citadas.\ Uma terminologia e uma voz.],
  )
  #v(37pt) #regra() #v(22pt)
  #text(size: 27pt, fill: vermelho)[Abrir e ler o PDF que vai ser entregue.]
])

#s(29, [Três modelos para começar], [
  #grid(columns: 3, gutter: 32pt,
    [#image("../output/previews/classico.png", height: 276pt) #v(9pt) #text(size: 21pt, weight: "bold")[Clássico]],
    [#image("../output/previews/engenharia.png", height: 276pt) #v(9pt) #text(size: 21pt, weight: "bold")[Engenharia]],
    [#image("../output/previews/essencial.png", height: 276pt) #v(9pt) #text(size: 21pt, weight: "bold")[Essencial]],
  )
  #v(12pt) #nota[PT-PT · UMinho · 2026/2027 · Grupos de 2–6 estudantes · Modelos da palestra]
])

#s(30, [Abrir. Preencher. Escrever.], [
  #grid(columns: (235pt, 1fr), row-gutter: 25pt,
    destaque[`metadados.typ`], [Título, UC, docente e autores.],
    destaque[`conteudo.typ`], [O texto do vosso relatório.],
    destaque[`main.typ`], [O ficheiro que compila para PDF.],
  )
  #v(34pt) #regra() #v(20pt)
  #nota[Cada modelo inclui um ponto de partida limpo e um exemplo preenchido.]
])

// REVELACAO: este excerto é lido do próprio ficheiro no momento de compilar.
#s(31, [Sim. Estes slides também.], [
  #text(size: 41pt, weight: "bold", fill: vermelho)[Tudo feito em Typst.]
  #v(20pt)
  #code(read("main.typ").split("\n").slice(0, 6).join("\n"), tamanho: 20pt)
  #v(17pt) #nota[Este excerto vem do ficheiro que estás a ver projetado.]
])

// TRECHO-REAL-INICIO
#s(32, [Agora é convosco.], [
  #duo([
    #text(size: 32pt)[Templates, exemplos,\ slides e código.]
    #v(22pt) #text(size: 23pt)[Tudo no mesmo repositório.]
    #v(35pt) #text(size: 21pt)[#link(recursos-url)[#recursos-url.replace("https://", "")]]
    #v(28pt) #destaque[Perguntas?]
  ], [#align(center)[#qrcode(recursos-url, width: 290pt)]], frac: (1.5fr, 1fr))
])
// TRECHO-REAL-FIM
