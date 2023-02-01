*** Settings ***
Resource    variables.robot
Library     Browser    timeout=25s

*** Variables ***

${BASE_URL}         https://magento.softwaretestingboard.com/

*** Keywords ***

Open browser
    New Browser     chromium    false
    New Context     viewport={'width': 1920, 'height': 1080}
    New Page        ${BASE_URL}

End test
    Close browser

Verify homepage
    Get element count   //*[@id="maincontent"]/div[3]/div/div[2]/div[1]/a/img   >   0

Go to homepage
    Go to               https://magento.softwaretestingboard.com/

Go to whats new page
    Go to               https://magento.softwaretestingboard.com/what-is-new.html

Go to cart
    Go to              https://magento.softwaretestingboard.com/checkout/cart/

Verify whats new page
    Get element count   xpath=//*[@id="page-title-heading"]/span[contains(text(), "What's New")]  >  0

