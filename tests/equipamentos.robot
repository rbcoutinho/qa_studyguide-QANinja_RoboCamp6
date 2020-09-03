***Settings***
Documentation   Cadastro de equipamentos
Resource    ../resources/base.robot
Suite Setup          Login Session
Suite Teardown       Finish Session

***Test Cases***
# Nome obrigatório
# Valor obrigatório
# Equipamento duplicado
Novo Equipamento
    Dado que acesso o formulário de cadastro de equipamentos
    E que tenho o seguinte equipamento:
    ...     Guitarra       75,00     
    Quando faço a inclusão desse equipamento    
    Então devo ver a mensagem:   Equipo cadastrado com sucesso!

***Keywords***
Validação de Campos
    [Arguments]     ${equipo-name}     ${daily_price}       ${saida}

    Dado que acesso o formulário de cadastro de equipamentos
    E que tenho o seguinte equipamento:
    ...     ${equipo-name}       ${daily_price}     
    Quando faço a inclusão desse equipamento    
    Então devo ver o texto:     ${saida}