*** Settings ***
Resource    ../../resources/common.robot
Resource    ./account-creation.robot

Suite Setup     Run keywords  Open browser  Create Random Email 
Suite Teardown  End test

Documentation        This test does to account creation                

*** Variables ***



*** Test Cases ***

Create account
    Click create account link

Check that customer is registered
    See Registration page

*** Keywords ***

See Registration page
    Get element count         //*[@id="maincontent"]/div[1]/div[2]/div/div/div[contains(text(), "Thank you for registering with Fake Online Clothing Store.")]  >  0
    Get Element Count         //*[@id="maincontent"]/div[2]/div[1]/div[3]/div[2]/div[1]/div[1]/p[contains(text(), "Mikko Mallikas")]  >  0
    Get Element Count         //*[@id="maincontent"]/div[2]/div[1]/div[3]/div[2]/div[1]/div[1]/p[contains(., "${EMAIL}")]  >  0
