#import "base.typ": documento, esquema
#show: documento.with(cor: rgb("205C68"))

= Gestão de uma biblioteca

Uma aplicação local que impede empréstimos duplicados e preserva os registos.

== Arquitetura

A @arquitetura mostra a separação de responsabilidades.

#figure(esquema([Leitor], [Pedido]), caption: [Um pedido de empréstimo.]) <pedido>

#figure(esquema([Interface], [Domínio]), caption: [Responsabilidades principais.]) <arquitetura>

== Critérios de aceitação

- Aceitar um empréstimo válido.
- Rejeitar o segundo empréstimo do mesmo exemplar.
- Recuperar os registos após reiniciar.

// Exemplo didático; não são resultados de testes reais.
