***Settings***
Documentation       Login
Resource    ../../resources/base.robot
Test Template   Tentativa de login
#executa uma ou mais Keywords somente uma vez antes de todos os  caso de teste.
Suite Setup          Start Session
# executa uma ou mais Keywords uma única vez após finalizar todos os caso de teste.
Suite Teardown       Finish Session
Test Teardown        Finish TestCase

***Keywords***
Tentativa de login
    [Arguments]     ${input_email}      ${input_senha}      ${output_mensagem}

    Acesso a página Login
    Submeto minhas credenciais  ${input_email}  ${input_senha}
    Devo ver um toaster com a mensagem  ${output_mensagem}

***Test Cases***
Senha incorreta             admin@zepalheta.com.br      abc123      Ocorreu um erro ao fazer login, cheque as credenciais.
Senha em branco             admin@zepalheta.com.br      ${EMPTY}    O campo senha é obrigatório!
E-mail em branco            ${EMPTY}                    pwd123      O campo email é obrigatório!
E-mail e senha em branco    ${EMPTY}                    ${EMPTY}    Os campos email e senha não foram preenchidos!
Login incorreto             admin&gmail.com             abc123      Ocorreu um erro ao fazer login, cheque as credenciais.