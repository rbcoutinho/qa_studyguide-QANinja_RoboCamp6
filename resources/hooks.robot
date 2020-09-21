***Keywords***
Start Session
    Run Keyword If      "${browser}" == "headless"
    ...     Open Firefox Headless

    Run Keyword If      "${browser}" == "firefox" 
    ...     Open Firefox

    Set Window Size     1440    900

Finish TestCase
    Capture Page Screenshot

Finish Session
    Close Browser

Login Session
    Start Session
    Go to           ${base_url}
    Login With      ${admin_user}  ${admin_pass}

### Webdriver
Open Firefox Headless
    Open Browser    about:blank        headlessfirefox      options=add_argument('--disable-dev-shm-usage')

Open Firefox
    Open Browser      about:blank        firefox