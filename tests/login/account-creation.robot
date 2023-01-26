*** Settings ***
Resource    ../../resources/common.robot

Library  ../../Library/RandomEmail.py

*** Keywords ***

Create random email
    ${EMAIL}=  Random Email
    Set suite variable  ${EMAIL}
    ${EMAIL_PREFIX}=  Random Email Prefix   kokeilu
#    ${EMAIL_PREFIX}=  Random Email Prefix   ${EMAIL}
    Set suite variable  ${EMAIL_PREFIX}

Click create account link
    Get Element Count         //html/body/div[2]/header/div[1]/div/ul/li[3]/a    >  0
    Click                     //html/body/div[2]/header/div[1]/div/ul/li[3]/a
    Get Element Count         //*[@id="maincontent"]/div[1]/h1/span[contains(text(), "Create New Customer Account")]    >  0
    Type Text                 //input[@name="firstname"]         ${USER_FIRSTNAME}
    Type Text                 //input[@name="lastname"]          ${USER_LASTNAME}
    Check Checkbox            //input[@name="is_subscribed"]
    
#    Type Text                 internal:label=Email             ${EMAIL}
    Type Text                 //input[@id="email_address"]             ${EMAIL}
    Type Text                 //input[@id="password"]          mall1kas!
    Type Text                 //input[@name="password_confirmation"]          mall1kas!
    Click                     //*[@id="form-validate"]/div/div[1]/button

