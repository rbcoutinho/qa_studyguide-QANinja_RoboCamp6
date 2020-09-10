***Settings***
Documentation   Cadastro de equipamentos
Resource    ../resources/base.robot
Suite Setup          Login Session
Suite Teardown       Finish Session

***Test Cases***
Novo Equipamento
    Dado que acesso o formulário de cadastro de equipamentos
    E que tenho o seguinte equipamento:
    ...     Guitarra       75,00     
    Quando faço a inclusão desse equipamento    
    Então devo ver a mensagem:   Equipo cadastrado com sucesso!

Campos obrigatórios
    Dado que acesso o formulário de cadastro de equipamentos
    E que tenho o seguinte equipamento:
    ...     ${EMPTY}       ${EMPTY}    
    Quando faço a inclusão desse equipamento    
    Então devo ver mensagens informando que os campos de equipamentos são obrigatórios

Nome é obrigatório
    [Template]      Validação de Campos
    ${EMPTY}            35          Nome do equipo é obrigatório

Diária é obrigatório
    [Template]      Validação de Campos
    João de Teste    ${EMPTY}       Diária do equipo é obrigatória

Equipamento duplicado
    Dado que acesso o formulário de cadastro de equipamentos
    E que tenho o seguinte equipamento:
    ...     Pandeiro       22,00
    Mas esse equipamento já existe no sistema   
    Quando faço a inclusão desse equipamento    
    Então devo ver a notificação de erro de duplicidade:   Ocorreu um error na criação de um equipo, tente novamente mais tarde!

***Keywords***
Validação de Campos
    [Arguments]     ${equipo-name}     ${daily_price}       ${saida}

    Dado que acesso o formulário de cadastro de equipamentos
    E que tenho o seguinte equipamento:
    ...     ${equipo-name}       ${daily_price}     
    Quando faço a inclusão desse equipamento    
    Então devo ver o texto:     ${saida}