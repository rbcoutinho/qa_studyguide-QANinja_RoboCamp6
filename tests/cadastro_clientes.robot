***Settings***
Documentation   Cadastro de clientes
Resource    ../resources/base.robot
Suite Setup          Login Session
Suite Teardown       Finish Session

***Test Cases***
Novo cliente
    Dado que acesso o formulário de cadastro de clientes
    Quando faço a inclusão desse cliente:
    ...     João de Teste       00000000565     Rua dos Bugs, 1000      21999999999
    Então devo ver a notificação:   Cliente cadastrado com sucesso!

Campos Obrigatórios
    Dado que acesso o formulário de cadastro de clientes
    Quando faço a inclusão desse cliente:
    ...     ${EMPTY}       ${EMPTY}     ${EMPTY}      ${EMPTY}
    Então devo ver mensagens informando que os campos do cadastro de clientes são obrigatórios

Nome é obrigatório
    [Template]      Validação de Campos
    ${EMPTY}        00000000565     Rua dos Bugs, 1000      21999999999     Nome é obrigatório

CPF é obrigatório
    [Template]      Validação de Campos
    João de Teste    ${EMPTY}       Rua dos Bugs, 1000      21999999999     CPF é obrigatório

Endereço obrigatório
    [Template]      Validação de Campos
    João de Teste    00000000565        ${EMPTY}            21999999999     Endereço é obrigatório

Telefone é obrigatório
    [Template]      Validação de Campos
    João de Teste    00000000565    Rua dos Bugs, 1000        ${EMPTY}      Telefone é obrigatório

***Keywords***

Validação de Campos
    [Arguments]     ${nome}     ${cpf}      ${endereco}     ${telefone}     ${saida}

    Dado que acesso o formulário de cadastro de clientes
    Quando faço a inclusão desse cliente:
    ...         ${nome}     ${cpf}      ${endereco}     ${telefone}
    Então devo ver o texto:     ${saida}
