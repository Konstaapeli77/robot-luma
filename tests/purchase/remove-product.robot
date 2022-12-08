*** Settings ***
Resource    ../../resources/common.robot
Resource    product-mgmt.robot

Suite Setup     Open browser
Suite Teardown  End test

Documentation            Test description

*** Variables ***

*** Test Cases ***

Buy product
    Browse to jackets 
    Add product to cart
    Click cart icon
    Remove product from cart

*** Keywords ***

Remove product from cart
    # Check that h1 Shopping cart is visible
    Wait For Elements State      //*[@id="maincontent"]/div[1]/h1/span[contains(text(), "Shopping Cart")]    visible
    Get Element Count            //*[@id="maincontent"]/div[1]/h1/span[contains(text(), "Shopping Cart")]    >  0
    # Wait & click trash bin
    Wait For Elements State      //*[@id="shopping-cart-table"]/tbody/tr[2]/td/div/a[2]    visible
    Click                        //*[@id="shopping-cart-table"]/tbody/tr[2]/td/div/a[2]
    Wait For Elements State      //*[@id="maincontent"]/div[3]/div/div[2]/p[1][contains(text(), "You have no items in your shopping cart.")]    visible                                                            


    