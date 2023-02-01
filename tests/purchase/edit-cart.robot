*** Settings ***
Resource    ../../resources/common.robot
Resource    product-mgmt.robot

Suite Setup     Open browser
Suite Teardown  End test

Documentation            Edit order from cart dialog and from cart page
...                      Note! Press Enter key in input field

*** Variables ***

*** Test Cases ***

Select the product
    Hover over womens collection
    Select womens jacket category
    Select blue jacket from the listing

Choose product properties and add to cart
    See the product in product page
    Select size XS, blue color and pick 3 quantity
    Add product to cart
    Wait to see that products were added to the cart

Edit product in cart dialog
    Open cart dialog
    Change quantity to 2

Edit product in cart
    Go to cart



*** Keywords ***

Open cart dialog
    Click                        //html/body/div[2]/header/div[2]/div[1]/a

Change quantity to 2
    Wait For Elements State      //*[@class="item-qty cart-item-qty"]    visible
    Focus                        //*[@class="item-qty cart-item-qty"]
    Type Text                    //*[@class="item-qty cart-item-qty"]    2
    Wait For Elements State      //*[@class="update-cart-item"]/span    visible
    Click                        //*[@class="update-cart-item"]/span
    Wait For Elements State      //*[@id="minicart-content-wrapper"]/div[2]/div[1]/span[1][contains(text(), "2")]    visible
    Get Element Count            //*[@id="minicart-content-wrapper"]/div[2]/div[1]/span[1][contains(text(), "2")]    >  0

Go to cart
    Click                        //*[@id="minicart-content-wrapper"]/div[2]/div[5]/div/a
    Wait For Elements State      //*[@id="maincontent"]/div[1]/h1/span    visible

Change quantity to 50 and press enter
    Type Text                    //*[@class="input-text qty"]    50
    Keyboard Key                 press    Enter
    Wait For Elements State      //*[@id="shopping-cart-table"]/tbody/tr[1]/td[4]/span/span/span[contains(text(), "$3,850.00")]     visible
