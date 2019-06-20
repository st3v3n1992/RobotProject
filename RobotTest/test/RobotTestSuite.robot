*** Settings ***
Library    SeleniumLibrary   

Suite Setup        Log    I am inside Test Suite Setup  
Suite Teardown     Log    I am inside Test Suite Teardown
Test Setup         Log    I am inside Test Suite Setup
Test Teardown      Log    I am inside Test Teardown    

Default Tags    sanity


*** Test Cases ***
MyFirstTest
    [Tags]    smoke
    Log    Hello World...    
    
MySecondTest
    [Tags]    example
    Log    I am inside 2nd test      
    Set Tags    regression1  
    Remove Tags    regression1
    
MyThirdTest
    Log    I am inside 3rd test
    
MyFourthTest
    Log    I am inside 4th test

FirstSeleniumTest

    Open Browser    https:google.com    gc
    Set Browser Implicit Wait    5
    Input Text    name=q    Automation step by step
    Press Keys    name=q    ENTER
    # Click Button    name=btnK    
    Sleep    2    
    Close Browser
    Log    Test Comleted    
    
SampleLoginTest
    
    [Documentation]    This is a sample login test
    Open Browser       ${URL}    gc
    Set Browser Implicit Wait    10
    LoginKW
    Click Element     id=userDropdownOpenLink  
    Click Element     link=Logout
    Close Browser
    Log               Test completed
    Log               This test was executed by %{username} on %{os}    
        
*** Variables ***
${URL}    https://na1.replicon.com/TriOpSys/
@{CREDENTIALS}    svanvugt    K1llz0n3_1992_
&{LOGIN}    username=svanvugt    password=K1llz0n3_1992_

*** Keywords ***
LoginKW
    Input Text        id=LoginNameTextBox    @{CREDENTIALS}[0]
    Input Password    id=PasswordTextBox    &{LOGIN}[password]  
    Click Button      id=LoginButton    