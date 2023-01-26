*** Settings ***
Resource    ../../resources/common.robot
Resource    product-mgmt.robot

Suite Setup     Open browser
Suite Teardown  End test

Documentation            Test description

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

Remove product from cart
    Go to shopping cart
    Move product to trash bin

*** Keywords ***


Go to shopping cart
    Wait For Elements State    //html/body/div[2]/header/div[2]/div[1]/a  visible
    Click                      //html/body/div[2]/header/div[2]/div[1]/a

Move product to trash bin
    Wait For Elements State    //*[@id="mini-cart"]/li/div/div/div[3]/div[2]/a  visible
    Click                      //*[@id="mini-cart"]/li/div/div/div[3]/div[2]/a
    Wait For Elements State    //html/body/div[4]/aside[2]/div[2]/footer/button[2]  visible
    Click                      //html/body/div[4]/aside[2]/div[2]/footer/button[2]



    