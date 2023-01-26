*** Settings ***
Resource    ../../resources/common.robot

Suite Setup     Open browser
Suite Teardown  End test

Documentation        This tests shows how to use virtual mouse hover.

*** Variables ***


*** Test Cases ***

Check navigation bar exists
    Whats new is visible

Browse women clothing
    Browse women jackets
    
Browse men clothing
    Browse men tops

*** Keywords ***

Whats new is visible
    Get Element count        //*[@id="ui-id-3"]/span    >  0
    
Browse women jackets
    Hover                    //*[@id="ui-id-4"]/span[2][contains(text(), "Women")]
    Get Element Count        //*[@id="ui-id-9"]/span[2][contains(text(), "Tops")]    >  0
    Hover                    //*[@id="ui-id-9"]/span[2][contains(text(), "Tops")]
    Get Element Count        //*[@id="ui-id-11"]/span[contains(text(), "Jackets")]    >  0
    Click                    //*[@id="ui-id-11"]/span[contains(text(), "Jackets")]    
    Get Element Count        //*[@id="page-title-heading"]/span    >  0

Browse men tops
    Hover                    //*[@id="ui-id-5"]/span[2][contains(text(), "Men")]
    Get Element Count        //*[@id="ui-id-17"]/span[2][contains(text(), "Tops")]    >  0




