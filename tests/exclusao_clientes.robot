***Settings***
Documentation   Exclusão de clientes
Resource    ../resources/base.robot
Suite Setup          Login Session
Suite Teardown       Finish Session

***Test Cases***
Remover Cliente
    Dado que eu tenho um cliente indesejado:
    ...     Beltrano de Teste       33333333333     Rua dos Bugs, 3000      21988888888
    E acesso a lista de clientes
    Quando eu removo esse cliente
    Então devo ver a notificação:   Cliente removido com sucesso!


