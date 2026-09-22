#import "arquitetura.typ": arquitetura
#set page(paper: "a4", margin: 22mm)
#set text(font: "Noto Sans", size: 11pt, lang: "pt", region: "PT")
= Diagramas que acompanham o documento

O mesmo diagrama pode ser usado no relatório e na apresentação. Os nomes, as cores e as ligações continuam editáveis.

#v(10mm)
#figure(arquitetura(), caption: [Arquitetura ilustrativa de uma biblioteca.]) <original>
#v(10mm)
#figure(arquitetura(armazenamento: "SQLite"), caption: [Uma variante do armazenamento.])

== Experimentar
Altere o argumento `armazenamento` na chamada a `arquitetura`. Para mudar as ligações ou a disposição, edite `arquitetura.typ`.

```typst
#import "arquitetura.typ": arquitetura
#arquitetura(armazenamento: "SQLite")
```

O diagrama descreve responsabilidades. A substituição da palavra no desenho não implementa uma migração no programa.

Documentação: #link("https://typst.app/universe/package/cetz/")[CeTZ no Typst Universe].
