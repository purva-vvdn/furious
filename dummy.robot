*** Settings ***
Documentation    A simple test suite without external libraries.

*** Variables ***
${STRING1}       Hello
${STRING2}       World
${NUMBER1}       10
${NUMBER2}       20

*** Test Cases ***

Check Equality of Strings
    [Tags]    String
    Should Be Equal    ${STRING1}    Hello

Concatenate Strings
    [Tags]    String
    ${result}=    Evaluate    '${STRING1} ${STRING2}'
    Should Be Equal    ${result}    Hello World

Verify Numbers Are Equal
    [Tags]    Numbers
    Should Be Equal    ${NUMBER1}    10

Compare Two Numbers
    [Tags]    Numbers
    Should Be True    ${NUMBER2} > ${NUMBER1}

Calculate Sum of Numbers
    [Tags]    Numbers
    ${sum}=    Evaluate    ${NUMBER1} + ${NUMBER2}
    Should Be Equal    ${sum}    30

Check If Value Exists in List
    [Tags]    List
    ${list}=    Create List    Apple    Banana    Cherry
    List Should Contain Value    ${list}    Banana

Count Items in List
    [Tags]    List
    ${list}=    Create List    A    B    C    D
    ${count}=    Get Length    ${lis
