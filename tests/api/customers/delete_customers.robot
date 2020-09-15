**Settings***
Resource        ../../../resources/services.robot

***Test Cases***
Delete Customer
    ${origin}=      Get Json    customers/samuel.json

    Delete Customer     ${origin['cpf']}
    ${resp}=        Post Customer           ${origin}

    ${resp}=        Delete Customer         ${origin['cpf']}

    Status Should Be    204                 ${resp}

Customer Not Found

    ${resp}             Delete Customer             000.000.000-00

    Status Should Be    404                         ${resp}
    Should Be Equal     ${resp.json()['message']}   Customer not found