**Settings***
Resource        ../../../resources/services.robot

***Test Cases***
Get Customer List

    ${list}=        Get Json        customers/list.json   

    FOR     ${item}     IN      @{list['data']}
        #O ${item} é o payload
        Post Customer      ${item}
    END

    ${resp}         Get customers

    Status Should Be        200     ${resp}

    ${total}=           Get Length              ${resp.json()}

    Should Be True          ${total} > 0

Get Unique Customer
    ${origin}=      Get Json    customers/unique.json

    Delete Customer     ${origin['cpf']}

    ${resp}=        Post Customer           ${origin}
    ${user_id}=     Convert to String       ${resp.json()['id']}

    ${resp}=        Get Unique Customer     ${user_id}

    Status Should Be    200                         ${resp}
    Should Be Equal     ${resp.json()['cpf']}       ${origin['cpf']}

Customer Not Found

    ${resp}             Get Unique Customer         d456d3c292741baa4bbf308bb941a083

    Status Should Be    404                         ${resp}
    Should Be Equal     ${resp.json()['message']}   Customer not found