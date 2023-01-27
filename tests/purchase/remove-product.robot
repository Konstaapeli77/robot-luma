*** Settings ***
Resource    ../../resources/common.robot
Resource    product-mgmt.robot

Suite Setup     Open browser
Suite Teardown  End test

Documentation            Remove product from cart dialog using transh bin icon.

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

Remove product from cart dialog
    Go to shopping cart dialog
    Move product to trash bin

Select the product again
    Hover over womens collection
    Select womens jacket category
    Select blue jacket from the listing

Choose product properties and add to cart again
    See the product in product page
    Select size XS, blue color and pick 3 quantity
    Add product to cart
    Wait to see that products were added to the cart

Remove product from cart page
    Go to cart page
    Delete product

*** Keywords ***


Go to shopping cart dialog
    Wait For Elements State    //html/body/div[2]/header/div[2]/div[1]/a  visible
    Click                      //html/body/div[2]/header/div[2]/div[1]/a

Move product to trash bin
    Wait For Elements State    //*[@id="mini-cart"]/li/div/div/div[3]/div[2]/a  visible
    Click                      //*[@id="mini-cart"]/li/div/div/div[3]/div[2]/a
    Wait For Elements State    //html/body/div[4]/aside[2]/div[2]/footer/button[2]  visible
    Click                      //html/body/div[4]/aside[2]/div[2]/footer/button[2]

Go to cart page
    Click                    //html/body/div[2]/header/div[2]/div[1]/a

Delete product
    Click                    //*[@id="minicart-content-wrapper"]/div[2]/div[5]/div/a
    Click                    //*[@id="shopping-cart-table"]/tbody/tr[2]/td/div/a[2]
    Wait For Elements State  //*[@id="maincontent"]/div[3]/div/div[2]/p[1]  visible
    Get Element Count        //*[@id="maincontent"]/div[3]/div/div[2]/p[1][contains(text(), "You have no items in your shopping cart.")]

    