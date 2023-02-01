*** Settings ***
Resource    ../../resources/common.robot

Suite Setup     Open browser
Suite Teardown  End test

Documentation        This tests goes through navigatino links
...                  First women tops>jackets and then men tops.

*** Variables ***


*** Test Cases ***

Check navigation bar exists
    User is on the main page

Browse women clothing
    Hover over women jackets
    Select women jackets category
    Select size M filter

Browse men clothing
    Hover over men tops


*** Keywords ***

User is on the main page
    Get Element count        //*[@id="ui-id-3"]/span    >  0
    
Hover over women jackets
    Hover                    //*[@id="ui-id-4"]/span[2][contains(text(), "Women")]
    Get Element Count        //*[@id="ui-id-9"]/span[2][contains(text(), "Tops")]    >  0
    Hover                    //*[@id="ui-id-9"]/span[2][contains(text(), "Tops")]

Select women jackets category
    Get Element Count        //*[@id="ui-id-11"]/span[contains(text(), "Jackets")]    >  0
    Click                    //*[@id="ui-id-11"]/span[contains(text(), "Jackets")]    
    Get Element Count        //*[@id="page-title-heading"]/span    >  0

Select size M filter
    Wait For Elements State  //*[@id="narrow-by-list"]/div[2]/div[1]  visible 
    Click                    //*[@id="narrow-by-list"]/div[2]/div[1]
    Wait For Elements State  //*[@id="narrow-by-list"]/div[2]/div[2]/div/div/a[3]/div  visible
    Click                    //*[@id="narrow-by-list"]/div[2]/div[2]/div/div/a[3]/div
    Wait For Elements State  //*[@id="layered-filter-block"]/div[2]/div[1]/ol/li/span[2][contains(text(), "M")]  visible
    Get Element Count        //*[@id="layered-filter-block"]/div[2]/div[1]/ol/li/span[2][contains(text(), "M")]   >  0

Hover over men tops                            
    Hover                    //*[@id="ui-id-5"]/span[2][contains(text(), "Men")]
    Hover                    //*[@id="ui-id-17"]/span[2][contains(text(), "Tops")]                             
    Hover                    //*[@id="ui-id-21"]/span[contains(text(), "Tees")]

Select men tees
    Click                    //*[@id="ui-id-21"]/span[contains(text(), "Tees")]




