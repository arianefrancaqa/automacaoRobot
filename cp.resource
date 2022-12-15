*** Variables ***
${SITE}             https://demo.spreecommerce.org/
${NAVEGADOR}        Chrome

# Elementos da Página
${EMAIL}                    test_checkpoint@mail.com
${SENHA}                    teste123
${BOTAO_USUARIO}            id=account-button
${OPCAO_LOGIN}              css=#link-to-account > .dropdown-item:nth-child(1)
${CAMPO_EMAIL}              id=spree_user_email
${CAMPO_SENHA}              id=spree_user_password
${BOTAO_LOGIN}              css=input[class="btn btn-primary btn-block spree-btn mt-2"]
${BOTAO_WOMAN}              xpath=//a[contains(text(),'Women')]
${VESTIDO_FLORIDO}          xpath=//img[@alt='Floral Wrap Dress']
${ALTURA_MINI}
${TAMANHO_XS}
${BOTAO_ADD_TO_CART}        id=add-to-cart-button
${BOTAO_CHECKOUT}           xpath=//a[contains(text(),'Checkout')]
${OPCAO_OTHER_ADDRESS}      xpath=//h4[contains(.,'Other address')]
${CAMPO_NOME}               id=order_bill_address_attributes_firstname
${NOME}                     Teste
${CAMPO_SOBRENOME}          id=order_bill_address_attributes_lastname
${SOBRENOME}                Checkpoint
${CAMPO_ENDERECO}           id=order_bill_address_attributes_address1
${ENDERECO}                 251 Park Avenue Sf
${CAMPO_CIDADE}             id=order_bill_address_attributes_city
${CIDADE}                   New York
${CAMPO_ESTADO}             id=order_bill_address_attributes_state_id
${OPCAO_ESTADO}             id=order_bill_address_attributes_state_id > option:nth-child(36)
${CAMPO_CEP}                id=order_bill_address_attributes_zipcode
${CEP}                      10022
${CAMPO_TELEFONE}           id=order_bill_address_attributes_phone
${TELEFONE}                 730-369-9466
${BOTAO_SAVE_CONTINUE}      name=commit
${CAMPO_NUM_CARTAO}         id=card_number
${NUM_CARTAO}               4109036068301957
${CAMPO_DATA_EXPIRACAO}     id=card_expiry
${DATA_EXPIRACAO}           092028
${CAMPO_CVV}                id=card_code
${CVV}                      237
${BOTAO_PLACE_ORDER}        xpath=//input[@name='commit']


*** Keywords ***
Acessar a Loja
    Open Browser    ${SITE}     ${NAVEGADOR}
    Maximize Browser Window

Fazer Login
    Click Element                       ${BOTAO_USUARIO}
    Click Element                       ${OPCAO_LOGIN}
    Wait Until Element Is Enabled       ${CAMPO_EMAIL}
    Input Text                          ${CAMPO_EMAIL}      ${EMAIL}
    Wait Until Element Is Enabled       ${CAMPO_SENHA}
    Input Text                          ${CAMPO_SENHA}      ${SENHA}
    Click Element                       ${BOTAO_LOGIN}

Ir para seção
    Click Element                   ${BOTAO_WOMAN}


Selecionar produto
    Wait Until Element Is Visible       ${VESTIDO_FLORIDO}
    Click Element                       ${VESTIDO_FLORIDO}

Adicionar ao carrinho
    Wait Until Element Is Visible       ${BOTAO_ADD_TO_CART}
    Click Element                       ${BOTAO_ADD_TO_CART}
    Wait Until Element Is Visible       ${BOTAO_CHECKOUT}
    Click Element                       ${BOTAO_CHECKOUT}

Preencher dados de billing address e clicar em Save and Continue
    Input Text                          ${CAMPO_NOME}           ${NOME}
    Input Text                          ${CAMPO_SOBRENOME}      ${SOBRENOME}
    Input Text                          ${CAMPO_ENDERECO}       ${ENDERECO}
    Input Text                          ${CAMPO_CIDADE}         ${CIDADE}
    Input Text                          ${CAMPO_CEP}            ${CEP}
    Input Text                          ${CAMPO_TELEFONE}       ${TELEFONE}
    Wait Until Element Is Visible       ${BOTAO_SAVE_CONTINUE} 
    Click Element                       ${BOTAO_SAVE_CONTINUE}
    Wait Until Element Is Visible       ${BOTAO_SAVE_CONTINUE} 
    Click Element                       ${BOTAO_SAVE_CONTINUE}

Preencher dados do cartão de crédito, clicar em Save and Continue
    Input Text          ${CAMPO_NUM_CARTAO}         ${NUM_CARTAO}
    Input Text          ${CAMPO_DATA_EXPIRACAO}     ${DATA_EXPIRACAO}
    Input Text          ${CAMPO_CVV}                ${CVV}
    Click Element       ${BOTAO_SAVE_CONTINUE}

Checar informações e clicar em place order
    Click Element       ${BOTAO_PLACE_ORDER}

Uma mensagem Bogus Gateway: Forced failure deve aparecer, encerrando o processo.
    Page Should Contain      Bogus Gateway: Forced failure
