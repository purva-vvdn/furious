*** Settings ***
Library           SeleniumLibrary
Library           RequestsLibrary

*** Variables ***
${URL}            https://example.com
${BROWSER}        Chrome
${USERNAME}       testuser
${PASSWORD}       password123
${API_URL}        https://api.example.com

*** Test Cases ***

Login with Valid Credentials
    [Tags]    Regression    Smoke
    Open Browser    ${URL}    ${BROWSER}
    Input Text    id:username    ${USERNAME}
    Input Text    id:password    ${PASSWORD}
    Click Button    id:login
    Wait Until Element Is Visible    id:dashboard    timeout=10
    Page Should Contain Element    id:logout
    Close Browser

Login with Invalid Credentials
    [Tags]    Regression
    Open Browser    ${URL}    ${BROWSER}
    Input Text    id:username    invaliduser
    Input Text    id:password    wrongpassword
    Click Button    id:login
    Page Should Contain    Invalid username or password
    Close Browser

Add Item to Cart
    [Tags]    E-commerce
    Open Browser    ${URL}    ${BROWSER}
    Input Text    id:username    ${USERNAME}
    Input Text    id:password    ${PASSWORD}
    Click Button    id:login
    Click Element    css:.add-to-cart
    Wait Until Element Is Visible    css:.cart-items-count
    Element Text Should Be    css:.cart-items-count    1
    Close Browser

Check API Response for Valid Data
    [Tags]    API    Smoke
    Create Session    MyAPI    ${API_URL}
    ${response}=    Get Request    MyAPI    /endpoint?query=valid
    Status Should Be    200
    Should Contain    ${response.json()}    "success"

Check API Response for Invalid Data
    [Tags]    API
    Create Session    MyAPI    ${API_URL}
    ${response}=    Get Request    MyAPI    /endpoint?query=invalid
    Status Should Be    404
    Should Contain    ${response.json()}    "error"

Verify Dropdown Functionality
    [Tags]    UI
    Open Browser    ${URL}    ${BROWSER}
    Input Text    id:username    ${USERNAME}
    Input Text    id:password    ${PASSWORD}
    Click Button    id:login
    Select From List By Value    id:dropdown    option1
    Element Text Should Be    id:dropdown-selected    Option 1 Selected
    Close Browser

File Upload Test
    [Tags]    UI
    Open Browser    ${URL}    ${BROWSER}
    Input Text    id:username    ${USERNAME}
    Input Text    id:password    ${PASSWORD}
    Click Button    id:login
    Choose File    id:file-upload    /path/to/file.txt
    Click Button    id:upload
    Wait Until Element Is Visible    id:upload-success
    Close Browser

Check Page Load Time
    [Tags]    Performance
    Open Browser    ${URL}    ${BROWSER}
    ${time}=    Get Time
    Wait Until Element Is Visible    id:main-content
    ${load_time}=    Evaluate    Get Time() - ${time}
    Should Be True    ${load_time} < 5
    Close Browser

Verify Password Reset
    [Tags]    Regression
    Open Browser    ${URL}    ${BROWSER}
    Click Element    link:Forgot Password
    Input Text    id:email    test@example.com
    Click Button    id:reset
    Page Should Contain    Password reset link sent
    Close Browser

Test Cross-Window Navigation
    [Tags]    UI
    Open Browser    ${URL}    ${BROWSER}
    Click Link    link:Open New Tab
    Switch Window    New Tab
    Page Should Contain    Welcome to New Tab
    Close Browser
