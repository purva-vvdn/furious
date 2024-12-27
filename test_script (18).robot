*** Settings ***
Documentation     A test suite with a single test for New Tab
...               Created by hats' Robotcorder
Library           SeleniumLibrary    timeout=10

*** Variables ***
${BROWSER}    chrome
${SLEEP}      10

*** Test Cases ***
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --headless
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    Call Method    ${options}    add_argument    --disable-gpu
    Open Browser    https://vvdntech.atlassian.net/jira/software/c/projects/VVDNSFIT/boards/1852/backlog    ${BROWSER}    options=${options}
    Wait Until Element Is Visible    xpath=//mat-icon[@class="mat-icon    timeout=5
    Click Element    xpath=//mat-icon[@class="mat-icon
    Wait Until Element Is Visible    xpath=(//span)[39]    timeout=5
    Click Element    xpath=(//span)[39]
    Wait Until Element Is Visible    xpath=//button[@class="btn-primary"]    timeout=5
    Click Element    xpath=//button[@class="btn-primary"]
Input Text    name=q   //input[@id="username"]    Wait Until Element Is Visible    xpath=//input[@id="username"]    timeout=5
Input Text    //input[@id="username"]    purvatenant@yopmail.com
Input Text    name=q   //input[@id="password"]    Wait Until Element Is Visible    xpath=//input[@id="password"]    timeout=5
Input Text    //input[@id="password"]    ***
    Wait Until Element Is Visible    xpath=//button[@class="login-btn    timeout=5
    Click Element    xpath=//button[@class="login-btn
    Wait Until Element Is Visible    xpath=//button[@class="login-btn    timeout=5
    Click Element    xpath=//button[@class="login-btn
    Wait Until Element Is Visible    xpath=(//span)[13]    timeout=5
    Click Element    xpath=(//span)[13]
    Wait Until Element Is Visible    xpath=(//span)[10]    timeout=5
    Click Element    xpath=(//span)[10]
    Close Browser
