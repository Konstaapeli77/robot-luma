*** Settings ***
Resource    ./account-creation.robot

Suite Setup     Run keywords  Open browser  Create Random Email 
Suite Teardown  End test

Documentation        This test does signs in the user. 

*** Variables ***



*** Test Cases ***

Log in
    Sign in

Manage Account
    Go To Account Page
    Check Account page

*** Keywords ***

Sign in
    Click                      //html/body/div[2]/header/div[1]/div/ul/li[2]/a[contains(text(), "Sign In")]
    Sleep  1s
    Type Text                  //*[@id="email"]  ${USER_EMAIL}
    Type Text                  //*[@name="login[password]"]    ${PASSWORD}
    Sleep  1s
    Click                      role=button[name="Sign In"]
    Sleep  2s
    Wait For Elements State    //html/body/div[2]/header/div[1]/div/ul/li[1]/span    visible
    Wait For Elements State    //html/body/div[2]/header/div[1]/div/ul/li[2]/span/button    visible
    Wait For Elements State    //html/body/div[2]/header/div[1]/div/ul/li[1]/span[contains(text(), "Welcome, Etunimi Sukunimi!")]    visible
    Get Element Count          //html/body/div[2]/header/div[1]/div/ul/li[1]/span[contains(text(), "Welcome, Etunimi Sukunimi!")]  >  0

Go to Account page
    Click                      //html/body/div[2]/header/div[1]/div/ul/li[2]/span/button
    Click                      //html/body/div[2]/header/div[1]/div/ul/li[2]/div/ul/li[1]/a[contains(text(), "My Account")]

Check Account page
    Get Element Count          //*[@id="maincontent"]/div[2]/div[1]/div[1]/h1/span  >  0

    Get Element Count          //*[@id="maincontent"]/div[2]/div[1]/div[3]/div[2]/div[1]/div[1]/p[contains(text(), "Etunimi Sukunimi")]  >  0

    Get Element Count          //*[@id="maincontent"]/div[2]/div[1]/div[3]/div[2]/div[1]/div[1]/p[contains(., "${USER_EMAIL}")]  >  0
