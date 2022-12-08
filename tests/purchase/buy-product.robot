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
    Witness purchase success
    Fill in order details

*** Keywords ***

Fill in order details
    Wait For Elements State      //*[@id="opc-sidebar"]/div[1]/span[contains(text(), "Order Summary")]    visible
    Type Text                    role=textbox[name="Email Address\n*"]     mikko.j.valiaho@gmail.com
    Wait For Elements State      //input[@name="firstname"]        visible
    Type Text                    //input[@name="firstname"]        Mikko
    Type Text                    //input[@name="lastname"]         Mallikas
    Type Text                    //input[@name="street[0]"]        Mallitie 4 C
    Type Text                    //input[@name="city"]             Helsinki
    Sleep     500ms
    Wait For Elements State      //select[@name="region_id"]       visible
    Select Options By            //select[@name="region_id"]       text    Alabama
    Type Text                    //input[@name="postcode"]         01000
    Select Options By            //select[@name="country_id"]      text    Finland
    Type Text                    //input[@name="telephone"]        040-562123
    Check Checkbox               //*[@name="ko_unique_1"]
    Sleep     500ms
    Wait For Elements State      //*[@id="shipping-method-buttons-container"]/div/button   visible
    Click                        //*[@id="shipping-method-buttons-container"]/div/button
    Sleep     500ms
    

