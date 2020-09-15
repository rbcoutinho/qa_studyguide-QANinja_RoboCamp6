**Settings***
Resource        ../../../resources/services.robot

***Test Cases***
Update a Customer
    #Cliente origem
    ${payload}=     Get Json  customers/romerito.json

    #Deleta o cliente caso exista para garantir acertividade do teste
    Delete Customer  ${payload['cpf']}

    #Cadastra o cliente
    ${resp}=         Post Customer          ${payload}

    #Pega o ID do cliente
    ${user_id}=      Convert to String      ${resp.json()['id']}

    #Muda a massa para um novo nome
    Set To Dictionary       ${payload}      name        Castilho

    #Solicita a alteração na API
    ${resp}          Put Customer    ${payload}      ${user_id}

    Status Should Be        204         ${resp}

    #Obtém os dados do cliente para validar se o nome foi alterado
    ${resp}         Get Unique Customer     ${user_id}

    Should Be Equal     ${resp.json()['name']}      Castilho