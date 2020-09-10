***Settings***
Documentation   Cadastro de clientes
Resource    ../resources/base.robot
Suite Setup          Login Session
Suite Teardown       Finish Session

***Test Cases***
Novo cliente
    Dado que acesso o formulário de cadastro de clientes
    E que eu tenho o seguinte cliente:
    ...     João de Teste       00000000565     Rua dos Bugs, 1000      21999999999
    Quando faço a inclusão desse cliente    
    Então devo ver a notificação:   Cliente cadastrado com sucesso!
    E esse cliente deve ser exibido na lista

Campos Obrigatórios
    Dado que acesso o formulário de cadastro de clientes
    E que eu tenho o seguinte cliente:
    ...     ${EMPTY}       ${EMPTY}     ${EMPTY}      ${EMPTY}
    Quando faço a inclusão desse cliente    
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

Telefone incorreto
    [Template]      Validação de Campos
    Beltrano de Teste    00000000565    Rua dos Bugs, 1000  2199999999      Telefone inválido

Cliente Duplicado
    Dado que acesso o formulário de cadastro de clientes
    E que eu tenho o seguinte cliente:
    ...     Siclano de Teste    00000000567     Rua dos Bugs, 2000      21999999998
    Mas esse cpf já existe no sistema
    Quando faço a inclusão desse cliente    
    Então devo ver a notificação de erro:   Este CPF já existe no sistema!

***Keywords***

Validação de Campos
    [Arguments]     ${nome}     ${cpf}      ${endereco}     ${telefone}     ${saida}

    Dado que acesso o formulário de cadastro de clientes
    E que eu tenho o seguinte cliente:
    ...         ${nome}     ${cpf}      ${endereco}     ${telefone}
    Quando faço a inclusão desse cliente    
    Então devo ver o texto:     ${saida}
