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
${FIRST_NAME}           André
${MID_NAME}             Tocha
${LAST_NAME}            Almeida
#LOCATOR
${INPUT_USERNAME}        //Input[@name="username"]  
${INPUT_PASSWORD}        //input[@name="password"]
${BUTTON_LOGIN}          //button[@class="oxd-button oxd-button--medium oxd-button--main orangehrm-login-button"] 
${BUTTON_UPGRADE}        //button[@class="oxd-glass-button orangehrm-upgrade-button" ]
${INVALID_CREDENTIALS}   //p[@class="oxd-text oxd-text--p oxd-alert-content-text"]
${BUTTON_MY_INFO}        //a[@class="oxd-main-menu-item active"] 
${INPUT_FIRST_NAME_FIELD}     //input[@class="oxd-input oxd-input--active orangehrm-firstname"]
${INPUT_MID_NAME_FIELD}       //input[@name="middleName"] 
${INPUT_LAST_NAME_FIELD}      //input[@name="lastName"]
${BUTTON_SAVE}          //button[@class="oxd-button oxd-button--medium oxd-button--secondary orangehrm-left-space"]

*** Keywords ***
Abrir o navegador e acessar o site
    Set Selenium Speed    value=0.5
    Open Browser    browser=${BROWSER}    url=${URL}    


Verificar se a página foi aberta
    Wait Until Element Is Visible    locator=${INPUT_USERNAME}   timeout=15s
     

Informar o nome de usuário ${nome}
    Input Text    locator=${INPUT_USERNAME}    text=${nome}


Informar a senha
    [Arguments]  ${password}
    Input Text    locator=${INPUT_PASSWORD}      text=${password}
    

Clicar no botão de login
    Click Element    locator=${BUTTON_LOGIN}    


Verificar se o login foi feito
    Wait Until Element Is Visible    locator=${BUTTON_UPGRADE}    timeout=15s


Exibir resposta de credencial inválida
    Wait Until Element Is Visible    locator=${INVALID_CREDENTIALS}
  

Exibir resposta de senha inválida
    Wait Until Element Is Visible    locator=${INVALID_CREDENTIALS}



Trocar de nome e sobrenome
    Click Element    locator=${BUTTON_MY_INFO}    
    Click Element    locator=${INPUT_FIRST_NAME_FIELD}
    Input Text       locator=${INPUT_FIRST_NAME_FIELD}    text=Tocha
    Click Element    locator=${INPUT_MID_NAME_FIELD} 
    Input Text       locator=${INPUT_MID_NAME_FIELD}    text=Teste
    Click Element    locator=${INPUT_LAST_NAME_FIELD} 
    Input Text       locator=${INPUT_LAST_NAME_FIELD}   text=Almeida
    Click Element     locator=${BUTTON_SAVE} 
    


Clicar na opção my info
    Click Element    locator=${BUTTON_MY_INFO}        


Atualizar first name ${first_name}  
    Input Text    locator=${INPUT_FIRST_NAME_FIELD}      text=${first_name} 


Atualizar middle name ${mid_name}
    Input Text    locator=//input[@name="middleName"]     text=${mid_name}


Atualizar last name ${last_name}
    Input Text    locator=${INPUT_LAST_NAME_FIELD}    text=${last_name}


Clicar no botão de salvar
    Click Element    locator=${BUTTON_SAVE} 


*** Test Cases ***


TC01 - Acessar o site do Orange HRM 
    [Tags]    TC01   Login
    Verificar se a página foi aberta
   

TC02 - Acessar o site do Orange HRM e fazer login 
    [Tags]    TC02    Login
    Informar o nome de usuário ${USER_NAME}
    Informar a senha  ${PASSWORD} 
    Clicar no botão de login
    Verificar se o login foi feito


TC03 - Acessar o site do Orange HRM e fazer login com username inválido
    [Tags]    TC03    Login
    Informar o nome de usuário ${INVALID_USER_NAME} 
    Informar a senha  ${PASSWORD} 
    Clicar no botão de login
    Exibir resposta de credencial inválida


TC04 - Acessar o site do Orange HRM e fazer login com senha inválida
    [Tags]    TC04    Login
    Informar o nome de usuário ${USER_NAME} 
    Informar a senha  ${INVALID_PASSWORD}
    Clicar no botão de login
    Exibir resposta de senha inválida

TC05 - Atualizar dados do usuário
    [Tags]    TC05
    Informar o nome de usuário ${USER_NAME}
    Informar a senha  ${PASSWORD} 
    Clicar no botão de login
    Verificar se o login foi feito
    Clicar na opção my info
    Atualizar first name ${FIRST_NAME} 
    Atualizar middle name ${MID_NAME} 
    Atualizar last name ${LAST_NAME}
    Clicar no botão de salvar

