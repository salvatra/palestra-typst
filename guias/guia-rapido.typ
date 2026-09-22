#set page(paper: "a4", margin: 20mm, numbering: "1 / 1")
#set text(font: "Noto Sans", size: 10pt, lang: "pt", region: "PT", fill: rgb("24272B"))
#set par(leading: 0.65em, spacing: 0.65em)
#show heading: set text(fill: rgb("8D2226"))
#show raw: set text(font: "DejaVu Sans Mono", size: 8.5pt)
#show raw.where(block: true): it => block(width: 100%, inset: 10pt, fill: rgb("F3F1ED"), it)
#text(size: 9pt, fill: rgb("8D2226"))[TYPST · GUIA DE BOLSO · 2026/2027]
#v(4mm)
#text(size: 27pt, weight: "bold")[O teu primeiro relatório]
#v(3mm)
Materiais: #link("https://github.com/salvatra/palestra-typst")[github.com/salvatra/palestra-typst]

= Começar em cinco passos
1. Escolher um dos três modelos e extrair o ZIP.
2. Criar um projeto em #link("https://typst.app/")[typst.app] e carregar os ficheiros, preservando as pastas. Selecionar `main.typ` como principal.
3. Preencher `metadados.typ`: título, UC, docente, 2–6 autores e data. O subtítulo é opcional.
4. Escrever em `conteudo.typ`. Consultar `exemplo.typ` para ver figuras, tabelas e bibliografia.
5. Exportar e ler o PDF completo antes de entregar.

Para experimentar sem conta: #link("https://typst.app/play/")[typst.app/play]. O playground serve para experimentar; guardar uma cópia dos ficheiros para conservar o trabalho.

= A sintaxe essencial
#grid(columns: 2, gutter: 7mm,
 [```typst
 = Introdução
 == Objetivos

 Uma ideia *importante*.
 Uma palavra _enfatizada_.

 - Primeiro item
 - Segundo item
 ```],
 [```typst
 #figure(
   image("imagem.png"),
   caption: [O que se observa.],
 ) <figura>

 Ver a @figura.

 $ T(n) = a n + b $
 ```],
)

= Tabelas e bibliografia
```typst
#table(columns: 2,
  [Caso], [Resultado],
  [Duplicado], [Rejeitado],
)

Consultar @typst-docs.
#bibliography("referencias.bib", style: "ieee")
```
A chave `typst-docs` tem de existir no ficheiro bibliográfico. IEEE é o estilo dos exemplos; a UC pode pedir outro.

= Compilar localmente
```sh
typst compile --font-path recursos/fonts main.typ relatorio.pdf
```
Os templates de relatório não dependem de pacotes externos. O kit foi verificado com Typst 0.15.1.

#pagebreak()
#text(size: 9pt, fill: rgb("8D2226"))[ESCRITA · REVISÃO · RECURSOS]
#v(4mm)
#text(size: 27pt, weight: "bold")[O que torna o relatório útil]

= Uma pergunta por secção
#table(columns: (1fr, 2fr), stroke: 0.4pt + luma(80%), inset: 7pt,
  [*Introdução*], [Qual é o problema e o que conta como sucesso?],
  [*Conceção*], [O que escolhemos, porquê e com que compromissos?],
  [*Implementação*], [Como funciona o mecanismo essencial?],
  [*Testes e resultados*], [O que foi executado e observado?],
  [*Conclusão*], [O que foi alcançado e o que ficou por resolver?],
)

= Uma frase que melhora com evidência
*Antes:* “O programa funciona bem.”

*Depois:* “No teste de empréstimo duplicado, o segundo pedido foi rejeitado e manteve-se um único empréstimo ativo.”

Exemplo fictício. Num relatório real, acrescentar versão, dados, ambiente e protocolo. Não generalizar para casos que não foram testados.

= Pedir ajuda a um LLM
“Uso Typst 0.15.1 e este template. Adapta esta tabela mantendo todos os dados. Usa apenas funções documentadas. Devolve um exemplo mínimo e explica as alterações.”

Para um erro: enviar o excerto, a mensagem completa e a versão do pacote. Compilar a proposta e ler o PDF. Não pedir que o modelo invente resultados ou referências. Respeitar as regras de utilização de IA da UC.

= Revisão final
- O texto responde ao enunciado e aos objetivos?
- Cada decisão relevante tem uma razão e um compromisso?
- Os resultados observados estão separados das interpretações?
- As figuras têm legenda, são legíveis e são referidas no texto?
- As referências existem e sustentam o que está escrito?
- Os nomes, números, título, UC e docente estão preenchidos?
- O PDF final foi aberto e revisto por alguém do grupo?

= Continuar a aprender
#link("https://typst.app/docs/tutorial/")[Tutorial oficial] · #link("https://typst.app/docs/")[Referência da linguagem] · #link("https://typst.app/universe/")[Typst Universe] · #link("https://typst.app/universe/package/cetz/")[CeTZ]

#v(1fr)
#text(size: 8pt, fill: gray)[Modelos criados para a palestra. Não constituem normas oficiais da Universidade do Minho. O enunciado e as instruções da UC têm prioridade.]
