"""Prepara os modelos autónomos e os exemplos da demonstração. Só para manutenção."""
from pathlib import Path
import shutil

ROOT = Path(__file__).resolve().parents[1]
METADATA = '''// Preencha apenas estes dados. Acrescente autores até ao máximo de seis.
#let dados = (
  titulo: [],
  subtitulo: none, // Exemplo: [Conceção, implementação e validação]
  unidade-curricular: [],
  professor-regente: [],
  autores: (
    (nome: "", numero: ""),
    (nome: "", numero: ""),
  ),
  data: [], // Exemplo: [Abril 2027]; deixe vazio para omitir.
  ano-letivo: "2026/2027",
  indice: true,
)
'''
STARTER = '''// O enunciado da UC tem prioridade sobre esta estrutura.
// Escreva o texto entre os títulos. Apague secções que não se apliquem.
= Introdução e objetivos
// Qual é o problema? O que foi pedido? Como se verifica o sucesso?

= Conceção e decisões
// Explique as escolhas importantes, as alternativas e os compromissos.

= Implementação
// Descreva os mecanismos essenciais; evite narrar todas as classes e funções.

= Testes e resultados
// Relacione requisitos, casos de teste, resultados observados e limitações.

= Conclusão
// Retome os objetivos e diga o que foi alcançado e o que ficou por resolver.

// Referências: acrescente entradas reais a referencias.bib e cite-as com @chave.
// #bibliography("referencias.bib", title: [Referências], style: "ieee")

// Apêndices opcionais (coloque no fim; referencie-os no texto):
// #pagebreak()
// #counter(heading).update(0)
// #set heading(numbering: "A.1")
// = Casos de teste adicionais <ap-testes>
'''
EXAMPLE = r'''// EXEMPLO DIDÁTICO: projeto, autores e resultados fictícios.
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
'''
BIB = '''@online{typst-docs,
  author = {{Typst}},
  title = {Typst Documentation},
  url = {https://typst.app/docs/},
  urldate = {2026-09-22}
}
'''

for name in ("a", "b", "c"):
    p = ROOT / "templates" / name
    (p / "recursos" / "fonts").mkdir(parents=True, exist_ok=True)
    shutil.copy(ROOT / "recursos" / "relatorio.typ", p / "recursos" / "relatorio.typ")
    shutil.copy(ROOT / "recursos" / "logos" / "simbolo-uminho.png", p / "recursos" / "simbolo-uminho.png")
    for font in (ROOT / "recursos" / "fonts").iterdir():
        shutil.copy(font, p / "recursos" / "fonts" / font.name)
    (p / "recursos" / "modelos").mkdir(exist_ok=True)
    shutil.copy(ROOT / "recursos" / "modelos" / f"{name}.typ", p / "recursos" / "modelos" / f"{name}.typ")
    (p / "estilo.typ").write_text(f'#import "recursos/modelos/{name}.typ": relatorio\n')
    (p / "metadados.typ").write_text(METADATA)
    (p / "main.typ").write_text('#import "estilo.typ": relatorio\n#import "metadados.typ": dados\n#show: relatorio.with(..dados)\n#include "conteudo.typ"\n')
    (p / "conteudo.typ").write_text(STARTER)
    (p / "exemplo.typ").write_text(EXAMPLE)
    (p / "referencias.bib").write_text(BIB)
    (p / "README.md").write_text(f'''# Template {name.upper()} · Universidade do Minho

Modelo da palestra «Typst e Como escrever um relatório». Não é um modelo oficial da Universidade. O enunciado da UC tem prioridade.

1. Edite `metadados.typ`: título, UC, docente, autores e data. O subtítulo é opcional (`none`). Em `data`, pode escrever `[Abril 2027]`: aparece apenas esse texto, sem rótulo. `[]` omite a data.
2. Edite `conteudo.typ`. O ficheiro principal é `main.typ`.
3. Mantenha 2–6 entradas na lista de autores. Cada entrada tem nome e número.
4. Consulte `exemplo.typ` para ver um relatório preenchido com dados fictícios.
5. Ative a bibliografia e os apêndices removendo os comentários indicados no conteúdo.

## No navegador

Crie um projeto vazio em [typst.app](https://typst.app/), carregue os ficheiros e pastas deste modelo preservando a estrutura e escolha `main.typ` como ficheiro principal. As fontes dentro de `recursos/fonts` acompanham o modelo. Se o carregamento de pastas não estiver disponível, crie as pastas no projeto e carregue os ficheiros nas respetivas localizações. Também pode carregar o ZIP, se a interface apresentar essa opção.

## Localmente

Com Typst 0.15.1, dentro desta pasta:

```sh
typst compile --font-path recursos/fonts main.typ relatorio.pdf
typst compile --font-path recursos/fonts exemplo.typ exemplo.pdf
```

As funções do modelo são locais: não é preciso descarregar pacotes para compilar estes relatórios. Noto Sans e Noto Sans Mono acompanham o ZIP, com a licença OFL. A capa e o interior estão em `recursos/modelos/{name}.typ`; as funcionalidades partilhadas estão em `recursos/relatorio.typ`.

O código do modelo é reutilizável ao abrigo da licença MIT incluída. A identidade gráfica da Universidade do Minho e as fontes têm os seus próprios direitos e licenças.
''')
print("Modelos preparados.")
