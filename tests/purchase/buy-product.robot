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

Fill in order details
    Add person details
    Add address details    
    Add shipping method
    Place order


*** Keywords ***

Hover over womens collection
    Hover                        //*[@id="ui-id-4"]/span[2][contains(text(), "Women")]
    Get Element Count            //*[@id="ui-id-9"]/span[2][contains(text(), "Tops")]    >  0
    Hover                        //*[@id="ui-id-9"]/span[2][contains(text(), "Tops")]
    Get Element Count            //*[@id="ui-id-11"]/span[contains(text(), "Jackets")]    >  0


Select womens jacket category
    Click                        //*[@id="ui-id-11"]/span[contains(text(), "Jackets")]    
    Get Element Count            //*[@id="page-title-heading"]/span[contains(text(), "Jackets")]    >  0


Select blue jacket from the listing
    Get Element Count            //*[@id="maincontent"]/div[3]/div[1]/div[3]/ol/li[1]/div/a/span/span/img    >  0
    Click                        //*[@id="maincontent"]/div[3]/div[1]/div[3]/ol/li[1]/div/a/span/span/img


See the product in product page
    Get Element Count            //*[@id="maincontent"]/div[2]/div/div[1]/div[1]/h1/span[contains(text(), "Olivia 1/4 Zip Light Jacket")]  >  0


Select size XS, blue color and pick 3 quantity
    Click                        id=option-label-size-143-item-166
    Click                        id=option-label-color-93-item-50
    Type Text                    //input[@id='qty']    3


Add product to cart
    Click                        id=product-addtocart-button 


Wait to see that products were added to the cart
    Wait For Elements State      //*[@id="maincontent"]/div[1]/div[2]/div/div/div[contains(text(), "You added")]    visible
    Get Element Count            //*[@id="maincontent"]/div[1]/div[2]/div/div/div[contains(text(), "You added")]    >  0
    Wait For Elements State      //*/div[2]/header/div[2]/div[1]/a/span[1][contains(text(), "My Cart")]    visible
    # Do not remove this sleep. Cart needs some time to process.
    Sleep    500ms
    Click                        //*/div[2]/header/div[2]/div[1]/a/span[1][contains(text(), "My Cart")]
    Wait For Elements State      //*[@id="top-cart-btn-checkout"]    visible
    Click                        //*[@id="top-cart-btn-checkout"]
    Sleep  1s


Click cart icon
    Click                        //*/div[2]/header/div[2]/div[1]/a/span[1][contains(text(), "My Cart")]
    Wait For Elements State      //*[@id="minicart-content-wrapper"]/div[2]/div[5]/div/a/span[contains(text(), "View and Edit Cart")]    visible
    Click                        //*[@id="minicart-content-wrapper"]/div[2]/div[5]/div/a/span[contains(text(), "View and Edit Cart")]
    Sleep  1s


Fill in order details
    Wait For Elements State      //*[@id="opc-sidebar"]/div[1]/span[contains(text(), "Order Summary")]    visible

Add person details
    Type Text                    role=textbox[name="Email Address\n*"]     mikko.mallikas@tamaeioleoikeasahkopostiosoite.org
    Wait For Elements State      //input[@name="firstname"]        visible
    Type Text                    //input[@name="firstname"]        Mikko
    Type Text                    //input[@name="lastname"]         Mallikas

Add address details
    Type Text                    //input[@name="street[0]"]        Mallitie 4 C
    Type Text                    //input[@name="city"]             Helsinki
    Sleep     500ms
    Wait For Elements State      //select[@name="region_id"]       visible
    Select Options By            //select[@name="country_id"]      text    Finland
    Select Options By            //select[@name="region_id"]       text    Lappi
    Type Text                    //input[@name="postcode"]         01000
    Type Text                    //input[@name="telephone"]        040-562123

Add shipping method
    Check Checkbox               //*[@name="ko_unique_2"]
    Sleep     500ms

    # Jotain
    Wait For Elements State      //*[@id="shipping-method-buttons-container"]/div/button   visible
    Click                        //*[@id="shipping-method-buttons-container"]/div/button
    Sleep     5s
    
Place order
    Wait For Elements State    //*[@id="checkout-payment-method-load"]/div/div/div[2]/div[2]/div[4]/div/button  visible
    Click                      //*[@id="checkout-payment-method-load"]/div/div/div[2]/div[2]/div[4]/div/button
    Sleep   5s
    Wait For Elements State    //*[@id="maincontent"]/div[1]/h1/span[contains(text(), "Thank you for your purchase!")]  visible
    
