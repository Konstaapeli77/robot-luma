*** Settings ***
Resource    ../../resources/common.robot

Suite Setup     Open browser
Suite Teardown  End test

*** Variables ***


*** Test Cases ***

Verify navigation
    Show whats new

Browse women clothing
    Browse women jackets
    
Browse men clothing
    Browse men jackets

*** Keywords ***

Show whats new
    Get Element count        //*[@id="ui-id-3"]/span    >  0
    
Browse women jackets
    Hover                    //*[@id="ui-id-4"]/span[2][contains(text(), "Women")]
    Get Element Count        //*[@id="ui-id-9"]/span[2][contains(text(), "Tops")]    >  0
    Hover                    //*[@id="ui-id-9"]/span[2][contains(text(), "Tops")]
    Get Element Count        //*[@id="ui-id-11"]/span[contains(text(), "Jackets")]    >  0
    Click                    //*[@id="ui-id-11"]/span[contains(text(), "Jackets")]    
    Get Element Count        //*[@id="page-title-heading"]/span    >  0

Browse men jackets
    Hover                    //*[@id="ui-id-5"]/span[2][contains(text(), "Men")]
    Get Element Count        //*[@id="ui-id-17"]/span[2][contains(text(), "Tops")]    >  0




