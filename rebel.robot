*** Settings***
# [Documentation]        Import all Library here
Library        Collections
Library        Dialogs

*** Variables ***
@{listData}        Radha    Rani    Ka    Naam    Japo
&{dicData}         Name=Radha    Designation=Rani

*** Test Cases ***
Tc_001
    [Documentation]    List Operation
    [Tags]    list
    Append To List        ${listData}        Amit
    Log to console      ${listData}

Tc_002
    [Documentation]    Perform Task on Dictionary
    [Tags]    Dictionary
    Set To Dictionary    ${dicData}    Name=Amit    Designation=Devloper    
    # Log to console       &{dicData} 
Tc_003
    [Documentation]    Remove from Dictionary
    [Tags]    Dictionary
    Remove From Dictionary    ${dicData}    Name
Tc_004
    [Documentation]    Remove from List
    [Tags]    list
    Remove From List    ${listData}    4
    Log to console      ${listData}
    ${newvar}        Combine Lists    ${listData}    ${listData}
    Log to console    ${newvar}

Tc_005
    [Documentation]        Dialogs Operation
    [Tags]        Dialogs
    ${user}       Get Selection From User    Select user    Admit    User1    User2
    Log to console    ${user}
    Pause Execution
    ${detail}     Get Value From User    Input your email
    ${password}    Get Value From User    Enter you password    hidden=yes
    Log to console    ${detail}
    Log to console    ${password}