# Modelo Engenharia · Universidade do Minho

Modelo da palestra «Typst e Como escrever um relatório». Não é um modelo oficial da Universidade. O enunciado da UC tem prioridade.

1. Edite `metadados.typ`: título, UC, docente, autores e data. O subtítulo é opcional (`none`).
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

As funções do modelo são locais: não é preciso descarregar pacotes para compilar estes relatórios. `Libertinus Serif` e `DejaVu Sans Mono` fazem parte do compilador; Noto Sans acompanha o ZIP.

O código do modelo é reutilizável ao abrigo da licença MIT incluída. A identidade gráfica da Universidade do Minho e as fontes têm os seus próprios direitos e licenças.
