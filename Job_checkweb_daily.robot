*** Settings ***
Documentation     
...                       Robot Framework
...                       Last update version : 0.0.1
Resource                  ../Resources/CommonFunctions.robot
Resource                  ../Resources/Variables.robot 
Resource                  ../Resources/Genlink.robot
# Library                   Browser
# Resource                  /Users/it01gb/Documents/Robot/DataTest/1020.text
Suite Teardown            Close All Browsers 

*** Variables ***
${gbprimepay}  https://www.gbprimepay.com/en/           #PRD
${globalprimepay}  https://www.globalprimepay.com/      #UAT
${api_edc}  https://api-edc.gbprimepay.com
${atome_gbprimepay}  https://atome.gbprimepay.com
${shop_gbprimepay}  https://shop.gbprimepay.com
${shop_api}  https://shop-api.gbprimepay.com
${doc_gbprimepay}  https://doc.gbprimepay.com
${checkout_gbprimepay}  https://checkout.gbprimepay.com
${gbwallet}  https://www.gbwallet.co
${pathCapture}  ${OUTPUTDIR}/Result
# ${pathLog}  ${OUTPUTDIR}/Log


*** Test Cases ***

TestCase001
    [Documentation]
        ...   ${gbprimepay}${\n}

    Gen Current Date
    Open Browser Chrome  ${gbprimepay}
    Wait Until Page Contains   GB Prime Pay Services  45s
    Capture Page Screenshot  ${pathCapture}/${genDataDate}_gbprimepay.png

TestCase002
    [Documentation]
        ...   ${globalprimepay}${\n}
    Gen Current Date
    Open Browser Chrome  ${globalprimepay}
    Wait Until Page Contains   GB PRIME PAY CUSTOMIZE YOUR PAYMENT  45s
    Capture Page Screenshot  ${pathCapture}/${genDataDate}_globalprimepay.png

TestCase003
    [Documentation]
        ...   ${api_edc}${\n}
    Gen Current Date
    Open Browser Chrome  ${api_edc}
    Wait Until Page Contains   404 page not found  45s
    Capture Page Screenshot  ${pathCapture}/${genDataDate}_api_edc.png

TestCase004
    [Documentation]
        ...   ${atome_gbprimepay}${\n}
    Gen Current Date
    Open Browser Chrome  ${atome_gbprimepay}
    Wait Until Page Does Not Contain   HTTP Status  45s
    Capture Page Screenshot  ${pathCapture}/${genDataDate}_atome_gbprimepay.png

TestCase005
    [Documentation]
        ...   ${shop_gbprimepay}${\n}
    Gen Current Date
    Open Browser Chrome  ${shop_gbprimepay}
    Wait Until Page Contains Element  //input[contains(@id,'email')]  45s
    Capture Page Screenshot  ${pathCapture}/${genDataDate}_shop_gbprimepay.png

TestCase006
    [Documentation]
        ...   ${shop_api}${\n}
    Gen Current Date
    Open Browser Chrome  ${shop_api}
    Wait Until Page Contains  {"error":"Not found"}  45s
    Capture Page Screenshot  ${pathCapture}/${genDataDate}_shop_api.png

TestCase007
    [Documentation]
        ...   ${doc_gbprimepay}${\n}
    Gen Current Date
    Open Browser Chrome  ${doc_gbprimepay}
    Wait Until Page Contains  Getting started  45s
    Capture Page Screenshot  ${pathCapture}/${genDataDate}_doc_gbprimepay.png

TestCase008
    [Documentation]
        ...   ${checkout_gbprimepay}${\n}
    Gen Current Date
    Open Browser Chrome  ${checkout_gbprimepay}
    Wait Until Page Contains  GBPrimePay Checkout  45s
    Capture Page Screenshot  ${pathCapture}/${genDataDate}_checkout_gbprimepay.png

TestCase009
    [Documentation]
        ...   ${gbwallet}${\n}
    Gen Current Date
    Open Browser Chrome  ${gbwallet}
    Wait Until Page Contains Element  (//img[@src='https://www.gbwallet.co/wp-content/uploads/2018/12/GB-Wallet_logo.png'])[1]  45s
    Capture Page Screenshot  ${pathCapture}/${genDataDate}_gbwallet.png
    # sleep  2s

TestCase010
    [Documentation]
        ...   Check Login Facebook${\n}
    Gen Current Date
    Open Browser Chrome  ${gbprimepay}
    Click Element :  ${btn_SignIn}
    # Click Element :  //*[@id="gbpdpa"]/button
    # Switch Window 	 locator=MAIN 	 timeout=45s 	
    Accept PDPA 
    Wait Until Element Is Visible 	 (//button[@type='submit'][contains(.,'LOGIN WITH FACEBOOK')])[2] 	 timeout=45s 	 error=None
    Click Element :  (//button[@type='submit'][contains(.,'LOGIN WITH FACEBOOK')])[2]
    Wait Until Element Is Visible 	 id:email 	 	 error=Error Open Login Facebook
    Capture Page Screenshot  ${pathCapture}/${genDataDate}_checkFacebook.png
    # sleep  2s


# savelog
#     CommonFunctions.Save Report Log :  ${OUTPUTDIR}/Log
