*** Settings ***
Resource    ../../resources/common.robot

Suite Setup     Open browser
Suite Teardown  End test

Documentation        Selects two men clothes to the comparison.
...                  Note! How to dialog/modal/aside was handled!

*** Variables ***


*** Test Cases ***

Select two products for comparison
    Select grey M size tank to compare
    Select green M size hoodie to compare
    Go to compare page
    Remove compared product

*** Keywords ***


Select grey M size tank to compare
    Click                //html/body/div[2]/main/div[3]/div/div[2]/div[3]/div/div/ol/li[3]/div/div/div[2]/div[1]/div/div[3]
    Click                //html/body/div[2]/main/div[3]/div/div[2]/div[3]/div/div/ol/li[3]/div/div/div[2]/div[2]/div/div
    Click                //html/body/div[2]/main/div[3]/div/div[2]/div[3]/div/div/ol/li[3]/div/div/div[3]/div/div[2]/a[2]
    Get Element Count    //*[@id="maincontent"]/div[2]/div[2]/div/div/div/a[contains(text(), "comparison list")]  >  0


Select green M size hoodie to compare
    Click                //html/body/div[2]/main/div[3]/div/div[2]/div[3]/div/div/ol/li[4]/div/div/div[2]/div[1]/div/div[3]
    Click                //html/body/div[2]/main/div[3]/div/div[2]/div[3]/div/div/ol/li[4]/div/div/div[2]/div[2]/div/div[3]
    Click                //html/body/div[2]/main/div[3]/div/div[2]/div[3]/div/div/ol/li[4]/div/div/div[3]/div/div[2]/a[2]
    Get Element Count    //*[@id="maincontent"]/div[2]/div[2]/div/div/div/a[contains(text(), "comparison list")]  >  0


Go to compare page
    Click                //*[@id="maincontent"]/div[2]/div[2]/div/div/div/a 
    Get Element Count    //*[@id="maincontent"]/div[1]/h1/span[contains(text(), "Compare Products")]  >  0
    Get Element Count    //*[@id="maincontent"]//a[contains(text(), "Hero Hoodie")]  >  0
    Get Element Count    //*[@id="maincontent"]//a[contains(text(), "Argus All-Weather Tank")]  >  0


Remove compared product
    Click                    //*[@id="product-comparison"]/thead/tr/td[1]/a
    Click                    //*[@class="action-primary action-accept"]
    Get Element Count        //*[@id="maincontent"]/div[2]/div[2]/div/div/div[contains(text(), "You removed product Hero Hoodie from the comparison list.")]  >  0
    Sleep  2s
