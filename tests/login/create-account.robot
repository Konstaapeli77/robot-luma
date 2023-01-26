*** Settings ***
Resource    ../../resources/common.robot
#Resource    ./account-creation.robot
Library  ../../Library/RandomEmail.py

Suite Setup     Run keywords  Open browser  Create Random Email 
Suite Teardown  End test

Documentation        This test does to account creation                

*** Variables ***



*** Test Cases ***

Create account
    Go to the create account page
    Type in user account details 
    Press submit

Check that customer is registered
    Check that registration page is shown
    Check that user name is visible
    Check that password is visible

*** Keywords ***

Create random email
    ${EMAIL}=  Random Email
    Set suite variable  ${EMAIL}

Go to the create account page
    Get Element Count         //html/body/div[2]/header/div[1]/div/ul/li[3]/a    >  0
    Click                     //html/body/div[2]/header/div[1]/div/ul/li[3]/a
    Get Element Count         //*[@id="maincontent"]/div[1]/h1/span[contains(text(), "Create New Customer Account")]    >  0

Type in user account details    
    Type Text                 //input[@name="firstname"]         ${USER_FIRSTNAME}
    Type Text                 //input[@name="lastname"]          ${USER_LASTNAME}
    Check Checkbox            //input[@name="is_subscribed"]  
    Type Text                 //input[@id="email_address"]             ${EMAIL}
    Type Text                 //input[@id="password"]          mall1kas!
    Type Text                 //input[@name="password_confirmation"]          mall1kas!

Press submit
    Click                     //*[@id="form-validate"]/div/div[1]/button

Check that registration page is shown
    Get element count         //*[@id="maincontent"]/div[1]/div[2]/div/div/div[contains(text(), "Thank you for registering with Fake Online Clothing Store.")]  >  0

Check that user name is visible
    Get Element Count         //*[@id="maincontent"]/div[2]/div[1]/div[3]/div[2]/div[1]/div[1]/p[contains(text(), "Mikko Mallikas")]  >  0

Check that password is visible
    Get Element Count         //*[@id="maincontent"]/div[2]/div[1]/div[3]/div[2]/div[1]/div[1]/p[contains(., "${EMAIL}")]  >  0
