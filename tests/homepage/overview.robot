*** Settings ***
Resource    ../../resources/common.robot

Suite Setup     Open browser
Suite Teardown  End test

Documentation        This test has been designed to have as few keywords as possible,
...                  but keep the test cases as readable as possible. 
...                  Contains link -keyword is ment to be used in multiple link identifications

*** Variables ***


*** Test Cases ***

Check homepage is valid
    Has sign in features
    Contains layout elements

Check homepage has images
    Contains pictures

Check footer links exist
    Contains link    More websites for practice
    Contains link    About us
    Contains link    Customer Service
    Contains link    Ask a question
    Contains link    Write for Us
    Contains link    Search Terms
    Contains link    Privacy and Cookie Policy
    Contains link    Advanced Search
    Contains link    Orders and Returns

Check hot sellers exist
    Contains hot sellers header

*** Keywords ***

Contains layout elements
    #Contains header
    Get Element Count    //*/div[2]/header/div[2]/a/img    >  0
    #Contains navigation bar
    Get Element Count    //*[@id="ui-id-3"]/span    >  0
    #Contains main page
    Get Element Count    //*[@id="maincontent"]/div[3]/div/div[2]/div[1]/a/img    >  0
    #Contains footer
    Get Element Count    //*[@id="ui-id-2"]    >  0

Has sign in features
    # Sign in name can be searched from whole document (first line) or narrow down more accurate (second line).
    Get Element Count    //*[contains(text(), "Sign In")]    >  0
    Get Element Count    //*/div[2]/header/div[1]/div/ul/li[2]/a[contains(text(), "Sign In")]    >  0

Contains link
    [Arguments]    ${name}
    # Seach given named link from the whole page
    Get Element Count    //*/a[contains(text(), "${name}")]    >  0

Contains hot sellers header
    # Check that Hot Sellers header can be found
    Get Element Count    //*[@id="maincontent"]/div[3]/div/div[2]/div[2]/h2  >  0

Contains pictures
    # Check that all pictures from the mainpage can be found
    Get Element Count    //*[@id="maincontent"]/div[3]/div/div[2]/div[1]/a/img  >  0
    Get Element Count    //*[@id="maincontent"]/div[3]/div/div[2]/div[1]/div/a[1]/img  >  0
    Get Element Count    //*[@id="maincontent"]/div[3]/div/div[2]/div[1]/div/a[2]/span[1]/img  >  0
    Get Element Count    //*[@id="maincontent"]/div[3]/div/div[2]/div[1]/div/a[3]/span/span[2]  >  0
    Get Element Count    //*[@id="maincontent"]/div[3]/div/div[2]/div[1]/div/a[4]/img  >  0
    Get Element Count    //*[@id="maincontent"]/div[3]/div/div[2]/div[1]/div/a[5]/img  >  0
    


