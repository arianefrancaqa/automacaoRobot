*** Settings ***
Library         SeleniumLibrary
Resource        ./cp.resource


*** Test Cases ***
Processo de compra de uma peça feminina no site Spree Demo com Erro
    Acessar a Loja
    Fazer Login
    Ir para seção
    Selecionar produto
    Adicionar ao carrinho 
    Preencher dados de billing address e clicar em Save and Continue
    Preencher dados do cartão de crédito, clicar em Save and Continue
    Checar informações e clicar em place order
    Uma mensagem Bogus Gateway: Forced failure deve aparecer, encerrando o processo.

Processo de compra de uma peça feminina no site Spree Demo com Sucesso
    Acessar a Loja
    Fazer Login
    Ir para seção
    Selecionar produto
    Adicionar ao carrinho 
    Preencher dados de billing address e clicar em Save and Continue
    Selecionar a opção Check
    Checar informações e clicar em place order
    Uma mensagem Sucesso deve ser exibida
