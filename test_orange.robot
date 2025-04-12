*** Settings ***
Library    SeleniumLibrary

Test Setup    Abrir o navegador e acessar o site
Test Teardown    Close Browser


*** Variables ***
#CONFIGURAÇÃO
${BROWSER}     chrome       
${URL}         https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
#DADO DE TESTE
${USER_NAME}   Admin
${PASSWORD}    admin123
${INVALID_USER_NAME}    Gator
${INVALID_PASSWORD}     gator123
#LOCATOR
${INPUT_USERNAME}        //Input[@name="username"]  
${INPUT_PASSWORD}        //input[@name="password"]
${BUTTON_LOGIN}          //button[@class="oxd-button oxd-button--medium oxd-button--main orangehrm-login-button"] 
${BUTTON_UPGRADE}        //button[@class="oxd-glass-button orangehrm-upgrade-button" ]
${INVALID_CREDENTIALS}   //p[@class="oxd-text oxd-text--p oxd-alert-content-text"]
${BUTTON_MY_INFO}        //*[@id="app"]/div[1]/div[1]/aside/nav/div[2]/ul/li[6]/a  
${FIRST_NAME_FIELD}     //input[@name="firstName"]
${MID_NAME_FIELD}       //input[@name="middleName"] 
${LAST_NAME_FIELD}      //input[@name="lastName"]
${BUTTON_SAVE}          //button[@class="oxd-button oxd-button--medium oxd-button--secondary orangehrm-left-space"]

*** Keywords ***
Abrir o navegador e acessar o site
    Set Selenium Speed    value=0.5
    Open Browser    browser=${BROWSER}    url=${URL}    


Verificar se a página foi aberta
    Wait Until Element Is Visible    locator=${INPUT_USERNAME}   timeout=15s
     

Informar o nome de usuário
    Input Text    locator=${INPUT_USERNAME}    text=${USER_NAME}


Informar a senha
    Input Text    locator=${INPUT_PASSWORD}      text=${PASSWORD}
    

Clicar no botão de login
    Click Element    locator=${BUTTON_LOGIN}    


Verificar se o login foi feito
    Wait Until Element Is Visible    locator=${BUTTON_UPGRADE}    timeout=15s


Informar o nome de usuário inválido
    Input Text    locator=${INPUT_USERNAME}    text=${INVALID_USER_NAME}


Exibir resposta de credencial inválida
    Wait Until Element Is Visible    locator=${INVALID_CREDENTIALS}


Informar a senha inválida
    Input Text    locator=${INPUT_PASSWORD}     text=${INVALID_PASSWORD}     



Exibir resposta de senha inválida
    Wait Until Element Is Visible    locator=${INVALID_CREDENTIALS}



Trocar de nome e sobrenome
    Click Element    locator=${BUTTON_MY_INFO}    
    Click Element    locator=${FIRST_NAME_FIELD}
    Input Text       locator=${FIRST_NAME_FIELD}    text=Tocha
    Click Element    locator=${MID_NAME_FIELD} 
    Input Text       locator=${MID_NAME_FIELD}    text=Teste
    Click Element    locator=${LAST_NAME_FIELD}
    Input Text       locator=${LAST_NAME_FIELD}  text=Almeida
    Click Element     locator=${BUTTON_SAVE} 
    
    

*** Test Cases ***


TC01 - Acessar o site do Orange HRM 
    [Tags]    TC01   Login
    Verificar se a página foi aberta
   

TC02 - Acessar o site do Orange HRM e fazer login 
    [Tags]    TC02    Login
    Verificar se a página foi aberta
    Informar o nome de usuário
    Informar a senha
    Clicar no botão de login
    Verificar se o login foi feito


TC03 - Acessar o site do Orange HRM e fazer login com username inválido
    [Tags]    TC03    Login
    Verificar se a página foi aberta
    Informar o nome de usuário inválido
    Informar a senha 
    Clicar no botão de login
    Exibir resposta de credencial inválida


TC04 - Acessar o site do Orange HRM e fazer login com senha inválida
    [Tags]    TC04    Login
    Verificar se a página foi aberta
    Informar o nome de usuário 
    Informar a senha inválida
    Clicar no botão de login
    Exibir resposta de senha inválida

TC05 - Acessar o site do Orange HRM e fazer login, e trocar nome do usauario
    [Tags]    TC05    Login
    Verificar se a página foi aberta
    Informar o nome de usuário
    Informar a senha
    Clicar no botão de login
    Verificar se o login foi feito
    Trocar de nome e sobrenome
    

