#let notas = json("guiao.json")
#let rubi = rgb("8D2226")
#set page(paper: "a4", margin: (x: 22mm, top: 20mm, bottom: 20mm),
  header: text(size: 8pt, fill: gray)[GUIÃO DO ORADOR · TYPST E «COMO ESCREVER UM RELATÓRIO»],
  footer: context [#text(size: 8pt, fill: gray)[Material de preparação · PT-PT] #h(1fr) #counter(page).display()],
)
#set text(font: "Noto Sans", size: 10.5pt, lang: "pt", region: "PT", fill: rgb("24272B"))
#set par(leading: 0.65em, spacing: 0.8em)
#show heading: set text(fill: rubi)
#show heading.where(level: 1): set text(size: 24pt)
#show heading.where(level: 2): set text(size: 13pt)
#let dois(n) = if n < 10 { "0" + str(n) } else { str(n) }
#let tempo(s) = str(calc.floor(s/60)) + ":" + dois(calc.rem(s,60))
#let campo(nome, corpo) = [#text(size: 9pt, weight: "bold", fill: rubi, nome) #linebreak() #corpo #parbreak()]

= Guião do orador
*Typst e «Como escrever um relatório»* #linebreak()
32 slides principais · Demonstração de 5 minutos · 5 minutos para perguntas

Este guião oferece fala sugerida, não um texto para ler mecanicamente. As durações são metas de ensaio. Ajustar as pausas ao ritmo da sala; o cronómetro não substitui um ensaio oral do próprio orador.

== Três percursos prontos
#table(columns: (1.7fr,1fr,1fr,1fr), inset: 8pt, stroke: 0.4pt + luma(80%),
  table.header([*Bloco*],[*35 min*],[*45 min*],[*55 min*]),
  [Abertura · 1–3],[3 min],[4 min],[5 min],
  [Conceito · 4–6],[2 min],[3 min],[3 min],
  [Essencial · 7–12],[4 min],[6 min],[7 min],
  [Demo · 13],[4 min],[5 min],[7 min],
  [CeTZ · 14–16],[2 min],[3 min],[4 min],
  [Outros usos / IA · 17–20],[3 min],[4 min],[5 min],
  [Relatórios · 21–28],[10 min],[12 min],[15 min],
  [Templates / fecho · 29–32],[2 min],[3 min],[4 min],
  [Perguntas],[5 min],[5 min],[5 min],
)

No percurso de 45 minutos, os conteúdos anteriores às perguntas somam 28 minutos dedicados a Typst e 12 à escrita. As notas «35 min» e «55 min» indicam exatamente o que cortar ou desenvolver. Não é necessário saltar a revelação final.

== Antes de entrar na sala
- Preencher nome e data em `apresentacao/config.typ`, se desejado, e reconstruir.
- Abrir `apresentacao.pdf`, `demo-reserva.pdf` e o playground com o estado 01.
- Confirmar resolução, legibilidade e alternância entre PDF e navegador.
- Testar a Internet, mas manter todos os PDFs no computador.
- Abrir o repositório público e testar o QR com um telemóvel à distância real da sala.
- Desativar notificações e esconder separadores sem relação com a palestra.

Cronómetro opcional: `python3 scripts/ensaio.py --duracao 45`. Premir Enter ao mudar de slide; o registo fica em `tmp/ensaio.json`.

#pagebreak()
= Demonstração e plano B
== Preparação no navegador
Abrir #link("https://typst.app/play/")[typst.app/play]. Copiar o conteúdo de `demonstracao/playground-01.typ` para o editor. Os ficheiros `playground-01` a `playground-04` são autónomos, sem imagens ou pacotes externos. Os ficheiros `01` a `04` usam a base local e produzem os mesmos resultados.

Ampliar a interface o suficiente para a sala ler. Deixar visível a parte a partir de `#show: documento.with()`, sem percorrer as funções auxiliares. A demonstração é sobre o efeito das alterações.

== Sequência de cinco minutos
#table(columns: (23mm,1fr), inset: 7pt, stroke: 0.4pt + luma(80%),
  [*0:00–0:45*],[Mostrar documento inicial, objetivo genérico e referência à Figura 1.],
  [*0:45–1:30*],[Substituir o objetivo pelo texto de 02. A estrutura visual permanece.],
  [*1:30–3:00*],[Inserir a figura «Pedido» de 03 antes da arquitetura. Mostrar a referência passar a Figura 2 sem a editar.],
  [*3:00–4:00*],[Na chamada de `documento.with`, usar a cor de 04. Todos os títulos mudam.],
  [*4:00–4:30*],[Usar «Quick export (PDF)» ou «Export…» e confirmar o documento.],
  [*4:30–5:00*],[Regressar ao slide 14 da apresentação.],
)

== Recuperar sem perder a sala
Se ocorrer uma falha que não se resolve em dez segundos, dizer: “Tenho aqui os mesmos passos já preparados; vamos observar a alteração no resultado.” Abrir `demo-reserva.pdf`, percorrer D1–D4 e regressar ao slide 14. Não gastar o tempo da palestra a diagnosticar a rede ou uma sessão expirada.

Se apenas uma edição correr mal, substituir o conteúdo pelo estado seguinte já verificado. Guardar alterações da demonstração separadamente dos originais.

== Perguntas previsíveis
*«Preciso de pagar?»* O compilador local é aberto e gratuito. A aplicação web tem planos próprios; verificar as funcionalidades atuais antes de prometer colaboração avançada ou sincronização com Git.

*«Posso usar noutra UC?»* Sim, tecnicamente; confirmar o formato exigido pelo enunciado. Os modelos não são uma norma oficial.

*«É melhor em tudo do que LaTeX?»* Não. A recomendação é para estes relatórios e esta audiência. Templates exigidos e ecossistemas especializados podem justificar LaTeX.

*«Posso pedir ao LLM para escrever tudo?»* Pedir ajuda concreta com estrutura, formatação e revisão. Resultados, escolhas e fontes têm de corresponder ao trabalho realizado e às regras da UC.

#pagebreak()
= Mapa de ensaio
#set text(size: 9pt)
#table(columns: (9mm, 1fr, 21mm, 21mm, 21mm), inset: 4pt, stroke: 0.3pt + luma(85%),
  table.header([*N.º*],[*Slide*],[*Fim · 35*],[*Fim · 45*],[*Fim · 55*]),
  ..notas.map(n => (str(n.n), n.titulo, tempo(n.fim35), tempo(n.fim45), tempo(n.fim55))).flatten(),
)
#set text(size: 10.5pt)

#for n in notas {
  pagebreak()
  heading(level: 1)[#dois(n.n) · #n.titulo]
  text(size: 9pt, fill: gray)[
    35 min: #tempo(n.inicio35)–#tempo(n.fim35) #h(8pt)
    45 min: #tempo(n.inicio45)–#tempo(n.fim45) #h(8pt)
    55 min: #tempo(n.inicio55)–#tempo(n.fim55)
  ]
  v(5mm)
  campo("OBJETIVO", n.objetivo)
  campo("FALA SUGERIDA", n.fala)
  campo("INTERAÇÃO", n.interacao)
  campo("AÇÃO", n.acao)
  campo("TRANSIÇÃO", n.transicao)
  v(2mm)
  campo("PERCURSO DE 35 MINUTOS", n.curto)
  campo("PERCURSO DE 55 MINUTOS", n.longo)
}
