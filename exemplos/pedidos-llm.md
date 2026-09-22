# Pedidos úteis para trabalhar com Typst

Fornecer o excerto relevante, as versões e o resultado pretendido. As propostas precisam de ser compiladas e inspecionadas. Estes pedidos são exemplos preparados; não são transcrições de respostas de um serviço externo.

## Adaptar uma tabela

> Uso Typst 0.15.1 e o template em anexo. Converte os dados abaixo numa tabela Typst, sem alterar valores, unidades ou rótulos. Mantém a tipografia e as cores do template. Devolve um exemplo mínimo que compile e explica a alteração. Se faltar informação, assinala-a em vez de a inventares.

## Corrigir uma mensagem de erro

> Este excerto falha em Typst 0.15.1. O erro completo é `unexpected argument: font-size`. Consulta a assinatura de `text` na documentação oficial e propõe a menor correção possível. Explica o que estava errado. Não alteres o resto do estilo.
>
> `#set text(font-size: 12pt)`

Correção preparada e verificada: `#set text(size: 12pt)`. Este é um exemplo de diagnóstico, não uma promessa de que qualquer resposta de um LLM esteja correta.

## Adaptar um diagrama CeTZ

> Uso CeTZ 0.5.2 com Typst 0.15.1. Partindo de `exemplos/cetz/arquitetura.typ`, acrescenta uma ligação de retorno de Persistência para Domínio. Mantém os três componentes e evita sobrepor a seta aos rótulos. Usa a API desta versão. Explica as coordenadas que alteraste e entrega um exemplo compilável.

## Rever texto sem inventar trabalho

> Revê este parágrafo em PT-PT para o tornar claro e preciso. Preserva os factos e distingue observação de interpretação. Assinala afirmações sem evidência. Não acrescentes testes, medições, funcionalidades ou referências que não estejam no texto. Mostra a versão revista e justifica as mudanças principais.

## Ajustar um template

> Uso o modelo Engenharia. Quero que o subtítulo seja opcional e não deixe um espaço vazio quando não é fornecido. Preserva o resto da capa e verifica os casos com 2 e 6 autores. Propõe a alteração mínima à função `relatorio` e explica como testar os dois casos.

Depois de cada alteração: compilar, abrir o PDF e comparar conteúdo e apresentação. Cumprir as regras da UC relativas ao uso e declaração de IA.
