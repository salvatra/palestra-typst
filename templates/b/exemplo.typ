// EXEMPLO DIDÁTICO: projeto, autores e resultados fictícios.
#import "estilo.typ": relatorio
#show: relatorio.with(
  titulo: [Gestão de uma biblioteca],
  subtitulo: [Conceção, implementação e validação],
  unidade-curricular: [Unidade Curricular de exemplo],
  professor-regente: [Docente de exemplo],
  autores: ((nome: "Estudante A (exemplo)", numero: "A000001"),
            (nome: "Estudante B (exemplo)", numero: "A000002")),
  data: [Abril 2027],
)

= Introdução e objetivos
Este exemplo mostra como descrever um projeto de programação. O sistema proposto gere livros, leitores e empréstimos de uma pequena biblioteca. O âmbito limita-se a uma aplicação local utilizada por um operador de cada vez. O documento foi composto em Typst, seguindo a documentação oficial @typst-docs.

Pretende-se registar livros, pesquisar o catálogo por identificador e controlar empréstimos. Um empréstimo só pode ser aceite quando o exemplar está disponível. A aplicação deve conservar os dados após ser encerrada e reaberta.

#text(size: 9.5pt, fill: rgb("616B73"))[*Exemplo didático.* O projeto e os resultados apresentados são fictícios; não constituem medições de software executado.]

== Critérios de aceitação
- Encontrar um livro através do seu identificador.
- Impedir dois empréstimos ativos do mesmo exemplar.
- Recuperar os registos depois de reiniciar a aplicação.
- Explicar ao utilizador por que razão uma operação foi rejeitada.

= Conceção e decisões
== Separação de responsabilidades
A interface recolhe pedidos e apresenta mensagens. A camada de domínio verifica as regras de empréstimo. A persistência lê e escreve os registos. Esta separação permite alterar a forma de armazenamento sem reescrever a interação com o utilizador.

// Seta vetorial: não depende de uma fonte de símbolos.
#let seta = box(width: 8mm, height: 4mm)[
  #place(left + horizon, line(length: 7mm, stroke: 0.7pt))
  #place(right + horizon, polygon((0pt, 0pt), (-3pt, -2pt), (-3pt, 2pt), fill: black, stroke: none))
]

#figure(
  grid(columns: (1fr, auto, 1fr, auto, 1fr), gutter: 5pt, align: horizon,
    block(inset: 10pt, stroke: 0.7pt)[Interface], seta,
    block(inset: 10pt, stroke: 0.7pt)[Domínio], seta,
    block(inset: 10pt, stroke: 0.7pt)[Persistência]),
  caption: [Responsabilidades principais e sentido dos pedidos.],
) <arquitetura>

A @arquitetura representa dependências funcionais, não uma sequência temporal completa. As regras de disponibilidade pertencem ao domínio, evitando duplicá-las na interface.

== Pesquisa no catálogo
Foi escolhido um mapa indexado pelo identificador do livro porque esta é a chave usada nas operações principais. Uma lista permitiria uma implementação inicial simples, mas exigiria percorrer os elementos para localizar um identificador. O mapa introduz uma estrutura adicional e não resolve, por si só, pesquisas por fragmentos do título.

== Persistência
O formato JSON torna os ficheiros legíveis durante o desenvolvimento. Em contrapartida, a proposta não suporta acesso concorrente nem transações. Uma base de dados seria adequada se esses requisitos passassem a existir.

= Implementação
== Registo de um empréstimo
A operação verifica primeiro a existência do exemplar e do leitor. Depois confirma a disponibilidade. Só após todas as verificações é criado o empréstimo. O excerto seguinte resume essa regra; omite detalhes de persistência e de tratamento de erros.

```python
def emprestar(exemplar, leitor):
    if not exemplar.disponivel:
        raise ValueError("Exemplar indisponível")
    emprestimo = Emprestimo(exemplar, leitor)
    exemplar.disponivel = False
    return emprestimo
```

O interesse do excerto é a ordem das verificações. A documentação do projeto deve incluir a localização da implementação completa no repositório, sem copiar todos os ficheiros para o relatório.

= Testes e resultados
Os cenários da @testes ilustram o tipo de evidência que um relatório deve apresentar. Num projeto real, a coluna de observações deve resultar da execução dos testes e indicar versão, ambiente e dados utilizados.

#figure(
  table(columns: (1.4fr, 1.8fr, 1fr),
    table.header([*Cenário*], [*Resultado esperado*], [*Observação*]),
    [Exemplar disponível], [Empréstimo aceite], [Aceite],
    [Segundo empréstimo], [Operação rejeitada], [Rejeitada],
    [Leitor inexistente], [Mensagem de erro], [Apresentada],
    [Reabrir a aplicação], [Registos preservados], [Preservados],
  ), caption: [Cenários e observações fictícias para fins didáticos.],
) <testes>

== Interpretação e limitações
As observações ilustradas são compatíveis com os critérios de aceitação definidos, mas quatro cenários não demonstram ausência de defeitos. Faltaria testar ficheiros corrompidos, falhas durante a escrita e entradas inesperadas. Não foram realizados ensaios de desempenho nem testes com vários operadores.

= Conclusão
A solução proposta cobre o registo de livros, a pesquisa por identificador e o controlo de empréstimos no âmbito de uma aplicação local. A separação entre interface, domínio e persistência torna explícitas as responsabilidades de cada componente.

Os cenários apresentados exemplificam como relacionar requisitos e evidência. Num relatório real, a conclusão deve apoiar-se em resultados obtidos. O acesso concorrente e a recuperação de falhas de escrita permanecem fora do âmbito desta proposta e constituem prioridades para uma evolução futura.

#bibliography("referencias.bib", title: [Referências], style: "ieee")

#pagebreak()
#counter(heading).update(0)
#set heading(numbering: "A.1")
= Protocolo de teste ilustrativo <protocolo>
1. Criar um catálogo de teste com um exemplar disponível.
2. Registar um leitor válido.
3. Solicitar um empréstimo e verificar o estado do exemplar.
4. Repetir o pedido e confirmar que não foi criado um segundo empréstimo.
5. Guardar, encerrar e reabrir; comparar os registos.

Num trabalho real, juntar os comandos, os dados de entrada e os resultados necessários para reproduzir o teste.
