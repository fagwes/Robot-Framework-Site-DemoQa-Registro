*** Settings ***
Library    SeleniumLibrary
Library    ScreenCapLibrary
Library    Dialogs
*** Variables ***
#Dados do teste
${FirstName}    Wesley 
${LastName}     Amorim   
${UserName}     fagwes
${senha}     @Paliodhu6643



#Variaveis de configuracao
${url}    https://demoqa.com/register 
${brownser}    chrome    
    

#Elementos
${input_firstname}                 xpath= //*[@id="firstname"]
${input_lastname}                  xpath= //*[@id="lastname"]
${input_username}                  xpath= //*[@id="userName"]
${password_codigo}                 xpath= //*[@id="password"]
${button_robo}                     xpath= //*[@id="recaptcha-anchor"]/div[1]
${button_register}                 xpath= //*[@id="register"]

*** Keywords ***

Given que eu esteja no site do DemoQA
    
    Open Browser    ${url}        ${brownser}    
    Maximize Browser Window
    Start Gif Recording

When digito os dados nas lacunas 
    Input Text    ${input_firstname}       ${FirstName}
    Input Text    ${input_lastname}        ${LastName}
    Input Text    ${input_username}        ${UserName}
    Input Text    ${password_codigo}       ${senha}

And clico no botao robo
    Execute Manual Step   ${button_robo}
    
And clico no botao registro
    Click Element    ${button_register}

Then registro realizado com sucesso
       
    Close Browser
    Stop Gif Recording

*** Test Cases ***
Cenario 1: registro de usuário no site DemoQA
    Given que eu esteja no site do DemoQA
    When digito os dados nas lacunas 
    And clico no botao robo
    And clico no botao registro
    Then registro realizado com sucesso