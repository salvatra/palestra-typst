#import "tema.typ": *
#show: tema
#s("A1", [Trabalhar localmente], [
  #text(size: 26pt)[Instalar Typst. Abrir os ficheiros no editor.]
  #v(22pt)
  #code("typst compile main.typ relatorio.pdf\ntypst watch main.typ relatorio.pdf", tamanho: 22pt)
  #v(25pt) #nota[Com as fontes do modelo: acrescentar `--font-path recursos/fonts`.]
  #v(20pt) #text(size: 23pt)[No VS Code, Tinymist acrescenta apoio à edição e pré-visualização.]
])
#s("A2", [Colaboração sem quatro versões finais], [
  #grid(columns: (1fr, 1fr), gutter: 40pt,
    [*No navegador* #v(17pt) Partilhar o projeto.\ Dividir responsabilidades.\ Rever o texto em conjunto.],
    [*Com Git* #v(17pt) Ficheiros de texto.\ Alterações pequenas.\ Rever diferenças e resolver conflitos.],
  )
  #v(32pt) #nota[Sincronização integrada com Git e algumas funcionalidades web dependem do plano. O compilador local não exige subscrição.]
])
#s("A3", [Uma bibliografia mínima], [
  #code("@typst-docs\n\n#bibliography(\"referencias.bib\",\n  style: \"ieee\", title: [Referências])", tamanho: 23pt)
  #v(25pt) #text(size: 25pt)[Guardar autor, título, URL e data de consulta.]
  #v(18pt) #nota[IEEE é apenas o padrão dos exemplos. Seguir o estilo pedido pela UC.]
])
#s("A4", [Quando não compila], [
  #grid(columns: (1fr, 1.5fr), row-gutter: 24pt,
    destaque[Ficheiro em falta], [Confirmar caminho, maiúsculas e extensão.],
    destaque[Argumento inesperado], [Consultar a assinatura na documentação.],
    destaque[Referência em falta], [Confirmar etiqueta ou chave bibliográfica.],
    destaque[Pacote indisponível], [Verificar versão e acesso à rede na primeira utilização.],
  )
])
#s("A5", [Recursos para continuar], [
  #grid(columns: (200pt, 1fr), row-gutter: 22pt,
    destaque[Tutorial], link("https://typst.app/docs/tutorial/")[typst.app/docs/tutorial],
    destaque[Documentação], link("https://typst.app/docs/")[typst.app/docs],
    destaque[Pacotes], link("https://typst.app/universe/")[typst.app/universe],
    destaque[CeTZ], link("https://typst.app/universe/package/cetz/")[typst.app/universe/package/cetz],
    destaque[Este kit], link("https://github.com/salvatra/palestra-typst")[github.com/salvatra/palestra-typst],
  )
])
