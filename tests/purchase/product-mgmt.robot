*** Settings ***
Resource    ../../resources/common.robot


Documentation                    This robot file includes shared keywords of purchase tests


*** Keywords ***

Browse to jackets
    Hover                        //*[@id="ui-id-4"]/span[2][contains(text(), "Women")]
    Get Element Count            //*[@id="ui-id-9"]/span[2][contains(text(), "Tops")]    >  0
    Hover                        //*[@id="ui-id-9"]/span[2][contains(text(), "Tops")]
    Get Element Count            //*[@id="ui-id-11"]/span[contains(text(), "Jackets")]    >  0
    Click                        //*[@id="ui-id-11"]/span[contains(text(), "Jackets")]    
    Get Element Count            //*[@id="page-title-heading"]/span[contains(text(), "Jackets")]    >  0

Add product to cart
    Get Element Count            //*[@id="maincontent"]/div[3]/div[1]/div[3]/ol/li[1]/div/a/span/span/img    >  0
    Click                        //*[@id="maincontent"]/div[3]/div[1]/div[3]/ol/li[1]/div/a/span/span/img
    Get Element Count            //*[@id="maincontent"]/div[2]/div/div[1]/div[1]/h1/span[contains(text(), "Olivia 1/4 Zip Light Jacket")]
    # Select size XS
    Click                        id=option-label-size-143-item-166
    # Select color blue
    Click                        id=option-label-color-93-item-50
    Type Text                    //input[@id='qty']    3
    Click                        id=product-addtocart-button 
    Wait For Elements State      //*[@id="maincontent"]/div[1]/div[2]/div/div/div[contains(text(), "You added")]    visible
    Get Element Count            //*[@id="maincontent"]/div[1]/div[2]/div/div/div[contains(text(), "You added")]    >  0
    Wait For Elements State      //*/div[2]/header/div[2]/div[1]/a/span[1][contains(text(), "My Cart")]    visible
    # Do not remove this sleep. Cart needs some time to process.
    Sleep    500ms

Witness purchase success  
    Click                        //*/div[2]/header/div[2]/div[1]/a/span[1][contains(text(), "My Cart")]
    Wait For Elements State      //*[@id="top-cart-btn-checkout"]    visible
    Click                        //*[@id="top-cart-btn-checkout"]

Click cart icon
    Click                        //*/div[2]/header/div[2]/div[1]/a/span[1][contains(text(), "My Cart")]
    Wait For Elements State      //*[@id="minicart-content-wrapper"]/div[2]/div[5]/div/a/span[contains(text(), "View and Edit Cart")]    visible
    Click                        //*[@id="minicart-content-wrapper"]/div[2]/div[5]/div/a/span[contains(text(), "View and Edit Cart")]