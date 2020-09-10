***Keywords***

# Login
Acesso a página Login
    Go to           ${base_url}

Submeto minhas credenciais
    [Arguments]     ${email}    ${password}

    Login With  ${email}  ${password}

Devo ver a área logada
    Wait Until Page Contains      Aluguéis      5
    
Devo ver um toaster com a mensagem
    [Arguments]     ${expect_message}

    Wait Until Element Contains     ${TOASTER_ERROR_P}   ${expect_message}

# Customers
Dado que acesso o formulário de cadastro de clientes
    Go To Customers
    Wait Until Element Is Visible   ${CUSTOMERS_FORM}       5
    Click Element                   ${CUSTOMERS_FORM}

E que eu tenho o seguinte cliente:
    [Arguments]     ${name}     ${cpf}      ${address}      ${phone_number}

    Remove Customer By CPF          ${cpf}

    Set Test Variable   ${name}
    Set Test Variable   ${cpf}
    Set Test Variable   ${address}
    Set Test Variable   ${phone_number}

Mas esse cpf já existe no sistema
    Insert Customer     ${name}     ${cpf}      ${address}      ${phone_number}

Quando faço a inclusão desse cliente
    Register New Customer  ${name}  ${cpf}  ${address}  ${phone_number}

Então devo ver a notificação:
    [Arguments]     ${expect_notice}

    Wait Until Element Contains     ${TOASTER_SUCCESS}      ${expect_notice}    5

Então devo ver a notificação de erro:
    [Arguments]     ${expect_notice}

    Wait Until Element Contains     ${TOASTER_ERROR}        ${expect_notice}    5

Então devo ver mensagens informando que os campos do cadastro de clientes são obrigatórios
    Wait Until Element Contains     ${LABEL_NAME}         Nome é obrigatório          5
    Wait Until Element Contains     ${LABEL_CPF}          CPF é obrigatório           5
    Wait Until Element Contains     ${LABEL_ADDRESS}      Endereço é obrigatório      5
    Wait Until Element Contains     ${LABEL_PHONE}        Telefone é obrigatório      5

Então devo ver o texto:
    [Arguments]     ${expect_text}
    Wait Until Page Contains    ${expect_text}              5

E esse cliente deve ser exibido na lista
    ${cpf_formatado}=           Format cpf      ${cpf}

    Go Back
    Wait Until Element Is Visible   ${CUSTOMER_LIST}       5
    Table Should Contain            ${CUSTOMER_LIST}       ${cpf_formatado}

# Equipos
Dado que acesso o formulário de cadastro de equipamentos
    Wait Until Element Is Visible   ${NAV_EQUIPOS}      5
    Click Element                   ${NAV_EQUIPOS}
    Wait Until Element Is Visible   ${EQUIPOS_FORM}     5
    Click Element                   ${EQUIPOS_FORM}

E que tenho o seguinte equipamento:   
    [Arguments]     ${equipo-name}     ${daily_price}

    Remove Equipo By Name       ${equipo-name}

    Set Test Variable           ${equipo-name}
    Set Test Variable           ${daily_price}

Mas esse equipamento já existe no sistema 
    Insert Equipos     ${equipo-name}     ${daily_price}

Quando faço a inclusão desse equipamento
    Register New Equipo  ${equipo-name}  ${daily_price}

Então devo ver a mensagem:
    [Arguments]     ${expect_notice}

    Wait Until Element Contains     ${TOASTER_SUCCESS}      ${expect_notice}    5

Então devo ver a notificação de erro de duplicidade:
    [Arguments]     ${expect_notice}

    Wait Until Element Contains     ${TOASTER_ERROR_P}        ${expect_notice}    5

Então devo ver mensagens informando que os campos de equipamentos são obrigatórios
    Wait Until Element Contains     ${LABEL_EQUIPO}         Nome do equipo é obrigatório          10
    Wait Until Element Contains     ${LABEL_PRICE}          Diária do equipo é obrigatória        10

E esse equipamento deve ser exibido na lista
    Go Back
    Wait Until Element Is Visible   css:table       5
    Table Should Contain            css:table       ${equipo-name}

# Remove Customer
Dado que eu tenho um cliente indesejado:
    [Arguments]                 ${name}     ${cpf}      ${address}      ${phone_number}

    Remove Customer By CPF                  ${cpf}
    Insert Customer             ${name}     ${cpf}      ${address}      ${phone_number}

    Set Test Variable                       ${cpf}

E acesso a lista de clientes
    Go To Customers

Quando eu removo esse cliente
    #Format CPF é a Keyword que representa o método no arquivo db.py
    ${cpf_formatado}=           Format cpf      ${cpf}
    Set Test Variable           ${cpf_formatado}

    Go To Customer Details      ${cpf_formatado}
    Click Remove Customer

E esse cliente não deve aparecer na lista
    Wait Until Page Does Not Contain   ${cpf_formatado}