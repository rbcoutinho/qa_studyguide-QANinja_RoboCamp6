***Settings***
Documentation       Camanda de serviços do projeto de automação

Library             RequestsLibrary

***Variables***
${base_api_url}     http://zepalheta-api:3333

***Keywords***
Post Session
    [Arguments]     ${email}        ${password}

    Create Session      zp-api         ${base_api_url}

    &{headers}=         Create Dictionary       Content-Type=application/json
    &{payload}=         Create Dictionary       email=${email}        password=${password}
    
    ${resp}=            Post Request    zp-api    /sessions   data=${payload}     headers=${headers}

    [return]            ${resp}