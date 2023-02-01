*** Settings ***
Resource    ../../resources/common.robot


Documentation                    This robot file includes shared keywords of purchase tests


*** Keywords ***

# many places in use
Hover over womens collection
    Hover                        //*[@id="ui-id-4"]/span[2][contains(text(), "Women")]
    Get Element Count            //*[@id="ui-id-9"]/span[2][contains(text(), "Tops")]    >  0
    Hover                        //*[@id="ui-id-9"]/span[2][contains(text(), "Tops")]
    Get Element Count            //*[@id="ui-id-11"]/span[contains(text(), "Jackets")]    >  0

# many places in use
Select womens jacket category
    Click                        //*[@id="ui-id-11"]/span[contains(text(), "Jackets")]    
    Get Element Count            //*[@id="page-title-heading"]/span[contains(text(), "Jackets")]    >  0

# many places in use
Select blue jacket from the listing
    Get Element Count            //*[@id="maincontent"]/div[3]/div[1]/div[3]/ol/li[1]/div/a/span/span/img    >  0
    Click                        //*[@id="maincontent"]/div[3]/div[1]/div[3]/ol/li[1]/div/a/span/span/img

# many places in use
See the product in product page
    Get Element Count            //*[@id="maincontent"]/div[2]/div/div[1]/div[1]/h1/span[contains(text(), "Olivia 1/4 Zip Light Jacket")]  >  0

# manyt places in use
Select size XS, blue color and pick 3 quantity
    Click                        id=option-label-size-143-item-166
    Click                        id=option-label-color-93-item-50
    Type Text                    //input[@id='qty']    3

# many places in use
Add product to cart
    Click                        id=product-addtocart-button 

# many places in use
Wait to see that products were added to the cart
    Wait For Elements State      //*[@id="maincontent"]/div[1]/div[2]/div/div/div[contains(text(), "You added")]    visible
    Get Element Count            //*[@id="maincontent"]/div[1]/div[2]/div/div/div[contains(text(), "You added")]    >  0
