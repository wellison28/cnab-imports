# CNAB Imports

Esta aplicação permite a importação de arquivos de texto [CNAB](https://github.com/Pagnet/desafio-back-end/blob/master/CNAB.txt), normalização das informações e listagem das transações por loja.

# Documentação do CNAB

| Descrição do campo  | Inicio | Fim | Tamanho | Comentário
| ------------- | ------------- | -----| ---- | ------
| Tipo  | 1  | 1 | 1 | Tipo da transação
| Data  | 2  | 9 | 8 | Data da ocorrência
| Valor | 10 | 19 | 10 | Valor da movimentação. *Obs.* O valor encontrado no arquivo precisa ser divido por cem(valor / 100.00) para normalizá-lo.
| CPF | 20 | 30 | 11 | CPF do beneficiário
| Cartão | 31 | 42 | 12 | Cartão utilizado na transação
| Hora  | 43 | 48 | 6 | Hora da ocorrência atendendo ao fuso de UTC-3
| Dono da loja | 49 | 62 | 14 | Nome do representante da loja
| Nome loja | 63 | 81 | 19 | Nome da loja

# Documentação sobre os tipos das transações

| Tipo | Descrição | Natureza | Sinal |
| ---- | -------- | --------- | ----- |
| 1 | Débito | Entrada | + |
| 2 | Boleto | Saída | - |
| 3 | Financiamento | Saída | - |
| 4 | Crédito | Entrada | + |
| 5 | Recebimento Empréstimo | Entrada | + |
| 6 | Vendas | Entrada | + |
| 7 | Recebimento TED | Entrada | + |
| 8 | Recebimento DOC | Entrada | + |
| 9 | Aluguel | Saída | - |


# Como rodar

## Pré-requisitos

- Linguagem Ruby 2.7.0
- Banco PostgreSQL 12


## Instalação

Clone do repositório:

`git clone git@github.com:wellison28/cnab-imports.git`

Entre na pasta do projeto:

`cd cnab-imports`

Instale o bundler

`gem install bundler`

Instale as dependencias:

`bundle install`


Configure as credenciais do banco de dados, no arquivo .env, use o arquivo de exemplo:

`cp .env.sample .env`

Prepare o banco de dados:

`bundle exec rails db:create db:migrate db:seed`

Para rodar a aplicação:

`bundle exec rails s`


## Acessando a aplicação

Em qualquer browser acesse o endereço: http://localhost:3000/

# Testes

Para rodar: `bundle exec rspec` 
