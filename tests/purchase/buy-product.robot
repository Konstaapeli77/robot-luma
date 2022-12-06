*** Settings ***
Resource    ../../resources/common.robot

Suite Setup     Open browser
Suite Teardown  End test

Documentation            Test description

*** Variables ***

*** Test Cases ***

Buy product
    Browse to jackets 
    Select product
    Witness purchase success
    Fill in order details

*** Keywords ***

Browse to jackets
    Hover                    //*[@id="ui-id-4"]/span[2][contains(text(), "Women")]
    Get Element Count        //*[@id="ui-id-9"]/span[2][contains(text(), "Tops")]    >  0
    Hover                    //*[@id="ui-id-9"]/span[2][contains(text(), "Tops")]
    Get Element Count        //*[@id="ui-id-11"]/span[contains(text(), "Jackets")]    >  0
    Click                    //*[@id="ui-id-11"]/span[contains(text(), "Jackets")]    
    Get Element Count        //*[@id="page-title-heading"]/span[contains(text(), "Jackets")]    >  0

Select product
    Get Element Count        //*[@id="maincontent"]/div[3]/div[1]/div[3]/ol/li[1]/div/a/span/span/img    >  0
    Click                    //*[@id="maincontent"]/div[3]/div[1]/div[3]/ol/li[1]/div/a/span/span/img
    Get Element Count        //*[@id="maincontent"]/div[2]/div/div[1]/div[1]/h1/span[contains(text(), "Olivia 1/4 Zip Light Jacket")]
    Click                    id=option-label-size-143-item-166
    Click                    id=option-label-color-93-item-50
    Type Text                //input[@id='qty']    3
    Click                    id=product-addtocart-button

Witness purchase success
    Wait For Elements State      //*[@id="maincontent"]/div[1]/div[2]/div/div/div[contains(text(), "You added")]    visible
    Get Element Count            //*[@id="maincontent"]/div[1]/div[2]/div/div/div[contains(text(), "You added")]    >  0
    Wait For Elements State      //*/div[2]/header/div[2]/div[1]/a/span[1][contains(text(), "My Cart")]    visible
    
    # Do not remove this sleep. Cart needs some time to process.
    Sleep    500ms
    
    Click                        //*/div[2]/header/div[2]/div[1]/a/span[1][contains(text(), "My Cart")]
    Wait For Elements State      //*[@id="top-cart-btn-checkout"]    visible
    Click                        //*[@id="top-cart-btn-checkout"]

Fill in order details
    Wait For Elements State    //*[@id="opc-sidebar"]/div[1]/span[contains(text(), "Order Summary")]    visible
    Type Text                   role=textbox[name="Email Address\n*"]     mikko.j.valiaho@gmail.com
    Wait For Elements State      //input[@name="firstname"]    visible
    Type Text                    //input[@name="firstname"]    Mikko
    Type Text                    //input[@name="lastname"]    Mallikas
    Type Text                    //input[@name="street[0]"]    Mallitie 4 C
    Type Text                    //input[@name="city"]    Helsinki
    Sleep     500ms
    Wait For Elements State      //select[@name="region_id"]    visible
    Select Options By            //select[@name="region_id"]    text    Alabama
    Type Text                    //input[@name="postcode"]    01000
    Select Options By            //select[@name="country_id"]    text    Finland
    Type Text                    //input[@name="telephone"]    040-562123
    Check Checkbox               //*[@name="ko_unique_1"]
    Sleep     500ms
    Click                        //*[@id="shipping-method-buttons-container"]/div/button
    Sleep     500ms
# //*[@id="checkout-shipping-method-load"]/table/tbody/tr[1]/td[1]/input
    

