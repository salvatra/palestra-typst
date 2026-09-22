#import "base.typ": documento, esquema
#show: documento.with()

= Gestão de uma biblioteca

Uma aplicação para gerir livros e empréstimos.

== Arquitetura

A @arquitetura mostra a separação de responsabilidades.

#figure(esquema([Interface], [Domínio]), caption: [Responsabilidades principais.]) <arquitetura>

== Critérios de aceitação

- Aceitar um empréstimo válido.
- Rejeitar o segundo empréstimo do mesmo exemplar.
- Recuperar os registos após reiniciar.

// Exemplo didático; não são resultados de testes reais.
