***Settings***
Documentation   Cadastro de clientes
Resource    ../resources/base.robot
Test Setup          Login Session
Test Teardown       Finish Session

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

Campo Nome obrigatório
    [tags]      tempnome
    Dado que acesso o formulário de cadastro de clientes
    Quando faço a inclusão desse cliente:
    ...     ${EMPTY}       00000000565     Rua dos Bugs, 1000      21999999999
    Então devo ver a mensagem de que o campo Nome é obrigatório

Campo CPF obrigatório
    [tags]      tempcpf
    Dado que acesso o formulário de cadastro de clientes
    Quando faço a inclusão desse cliente:
    ...     João de Teste       ${EMPTY}     Rua dos Bugs, 1000      21999999999
    Então devo ver a mensagem de que o campo CPF é obrigatório

Campo Endereço obrigatório
    [tags]      tempendereco
    Dado que acesso o formulário de cadastro de clientes
    Quando faço a inclusão desse cliente:
    ...     João de Teste       00000000565     ${EMPTY}      21999999999
    Então devo ver a mensagem de que o campo Endereço é obrigatório

Campo Telefone obrigatório
    [tags]      temptelefone
    Dado que acesso o formulário de cadastro de clientes
    Quando faço a inclusão desse cliente:
    ...     João de Teste       00000000565     Rua dos Bugs, 1000      ${EMPTY}
    Então devo ver a mensagem de que o campo Telefone é obrigatório


