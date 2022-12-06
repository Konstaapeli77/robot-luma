*** Settings ***

Library     Browser

*** Variables ***

${BASE_URL}         https://magento.softwaretestingboard.com/

*** Keywords ***

Open browser
    New Browser     chromium    false
    New Context     viewport={'width': 1280, 'height': 720}
    New Page        ${BASE_URL}
    Log to console  Open new page...

End test
    Log to console  Close browser...
    Close browser

Verify homepage
    Get element count   //*[@id="maincontent"]/div[3]/div/div[2]/div[1]/a/img   >   0

Go to homepage
    Go to               https://magento.softwaretestingboard.com/

Go to whats new page
    Go to               https://magento.softwaretestingboard.com/what-is-new.html

Verify whats new page
    Get element count   xpath=//*[@id="page-title-heading"]/span[contains(text(), "What's New")]  >  0