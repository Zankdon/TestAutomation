*** Settings ***
Library           SeleniumLibrary
Library           BuiltIn
Library           String
Library           Collections

*** Variables ***
${url}            https://academybugs.com/find-bugs/
${url2}           https://academybugs.com/store/professional-suit/
${blue_hoodie}    https://academybugs.com/store/blue-hoodie/

*** Test Cases ***
TestCase1
    Open Browser    ${url}    Chrome
    ${price}    Get Text    //html/body/div[3]/div/div/div/main/article/div/section/ul/li[1]/div/div[3]/div[1]/span
    Log    Price1: ${price}
    Click Element    //html/body/div[3]/div/div/div/main/article/div/section/ul/li[1]/div/div[1]/a
    ${price2}    Get Text    //html/body/div[3]/div/div/div[1]/main/article/div/section/div[1]/div[1]/div[1]/span
    Log    Price2: ${price2}
    ${price}=    Remove String    ${price}    $
    ${price2}=    Remove String    ${price2}    $
    Should be equal    ${price}    ${price2}
    Log    ${price}==${price2}

TestCase2
    Open Browser    ${url}    Chrome
    Click Element    //html/body/div[3]/div/div/div/main/article/div/section/div[1]/select
    Click Element    //html/body/div[3]/div/div/div/main/article/div/section/div[1]/select/option[2]

    ${i}=    Set Variable    ${18}
    WHILE    ${i} > 0
        ${product_price}=    Get Text    //html/body/div[3]/div/div/div/main/article/div/section/ul/li[${i}]/div/div[3]/div[1]/span
        Log    ${product_price}
    ${i}=    Evaluate    ${i} - 1
    END
    Log    Lowest Price: ${product_price}

TestCase3
    Open Browser    ${blue_hoodie}    Chrome
    ${modelnumber}    Get Text    //html/body/div[3]/div/div/div[1]/main/article/div/section/div[1]/div[3]/form/div[3]
    ${modelnumber} =    Remove String    ${modelnumber}    Model Number:
    Log    suitnumber: ${modelnumber}
    Set Suite Variable    ${model_numbers}    ${modelnumber}
    Log    ${model_numbers}

TestCase4
    Open Browser    ${blue_hoodie}    Chrome
    Log    ${model_numbers}
    Input Text    //html/body/div[3]/div/div/div[2]/aside[2]/div/form/input[1]    ${model_numbers}
    Click Button    //html/body/div[3]/div/div/div[2]/aside[2]/div/form/input[2]
