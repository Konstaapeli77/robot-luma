*** Settings ***
Resource    ../../resources/common.robot

Suite Setup     Open browser
Suite Teardown  End test

Documentation            This test checks that the category links exist and they are in specific location.

*** Variables ***


*** Test Cases ***

Check all categories exist
    Go to whats new page
    Verify whats new page
    Check womens categories exist
    Check mens categories exist

Browse women jackets
    Go to whats new page
    Click               //*[@id="maincontent"]/div[4]/div[2]/div/div/ul[1]//a[contains(text(), "Jackets")]
    Get element count   //*[@id="page-title-heading"]/span[contains(text(), "Jackets")]     >   0
    End test

*** Keywords ***

Check womens categories exist
    Get element count   //*[@id="maincontent"]//span[contains(text(), "New in women's")]     >   0
    Get element count   //*[@id="maincontent"]/div[4]/div[2]/div/div/ul[1]/li[1]/a[contains(text(), "Hoodies & Sweatshirts")]  >  0
    Get element count   //*[@id="maincontent"]/div[4]/div[2]/div/div/ul[1]/li[2]/a[contains(text(), "Jackets")]  >  0
    Get element count   //*[@id="maincontent"]/div[4]/div[2]/div/div/ul[1]/li[3]/a[contains(text(), "Tees")]  >  0
    Get element count   //*[@id="maincontent"]/div[4]/div[2]/div/div/ul[1]/li[4]/a[contains(text(), "Bras & Tanks")]  >  0
    Get element count   //*[@id="maincontent"]/div[4]/div[2]/div/div/ul[1]/li[5]/a[contains(text(), "Pants")]  >  0
    Get element count   //*[@id="maincontent"]/div[4]/div[2]/div/div/ul[1]/li[6]/a[contains(text(), "Shorts")]  >  0

Check mens categories exist
    Get element count   //*[@id="maincontent"]//span[contains(text(), "New in men's")]     >   0
    Get element count   //*[@id="maincontent"]/div[4]/div[2]/div/div/ul[2]/li[1]/a[contains(text(), "Hoodies & Sweatshirts")]  >  0
    Get element count   //*[@id="maincontent"]/div[4]/div[2]/div/div/ul[2]/li[2]/a[contains(text(), "Jackets")]  >  0
    Get element count   //*[@id="maincontent"]/div[4]/div[2]/div/div/ul[2]/li[3]/a[contains(text(), "Tees")]  >  0
    Get element count   //*[@id="maincontent"]/div[4]/div[2]/div/div/ul[2]/li[4]/a[contains(text(), "Tanks")]  >  0
    Get element count   //*[@id="maincontent"]/div[4]/div[2]/div/div/ul[2]/li[5]/a[contains(text(), "Pants")]  >  0
    Get element count   //*[@id="maincontent"]/div[4]/div[2]/div/div/ul[2]/li[6]/a[contains(text(), "Shorts")]  >  0
