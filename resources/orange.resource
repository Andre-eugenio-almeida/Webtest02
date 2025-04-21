
*** Settings ***
Library    SeleniumLibrary


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
${IMG_USER}                 //img[@class="employee-image"]
${INPUT_USERNAME}           //Input[@name="username"]  
${INPUT_PASSWORD}           //input[@name="password"]
${BUTTON_LOGIN}             //button[@class="oxd-button oxd-button--medium oxd-button--main orangehrm-login-button"] 
${BUTTON_UPGRADE}           //button[@class="oxd-glass-button orangehrm-upgrade-button" ]
${INVALID_CREDENTIALS}      //p[@class="oxd-text oxd-text--p oxd-alert-content-text"]
${BUTTON_MY_INFO}           //*[@id="app"]/div[1]/div[1]/aside/nav/div[2]/ul/li[6]/a/span  
${INPUT_FIRST_NAME_FIELD}   //input[@class="oxd-input oxd-input--active orangehrm-firstname"]
${INPUT_MID_NAME_FIELD}     //input[@name="middleName"] 
${INPUT_LAST_NAME_FIELD}    //input[@name="lastName"]
${BUTTON_SAVE}              //button[@class="oxd-button oxd-button--medium oxd-button--secondary orangehrm-left-space"]

*** Keywords ***
Abrir o navegador e acessar o site
    Set Selenium Speed    value=0.5
    Open Browser    browser=${BROWSER}    url=${URL}  
    Maximize Browser Window  


Verificar se a página foi aberta
    Wait Until Element Is Visible    locator=${INPUT_USERNAME}   timeout=15s
     

Informar o nome de usuário 
    [Arguments]    ${nome}
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


Clicar na opção my info
    Click Element    locator=${BUTTON_MY_INFO}      

   

Atualizar first name ${first_name}    
    Input Text    locator=${INPUT_FIRST_NAME_FIELD}   text=${first_name} 
    

Atualizar middle name ${mid_name}
    Input Text    locator=${INPUT_MID_NAME_FIELD}     text=${mid_name}


Atualizar last name ${last_name}
    Input Text    locator=${INPUT_LAST_NAME_FIELD}    text=${last_name}


Clicar no botão de salvar
    Click Element    locator=${BUTTON_SAVE} 


Verificar se nome foi substituido com sucesso
    Click Element    locator=${IMG_USER} 
    Wait Until Element Is Visible    locator=${IMG_USER}    timeout=15s
    