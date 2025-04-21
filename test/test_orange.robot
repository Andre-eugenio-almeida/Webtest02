*** Settings ***

Documentation  teste site Amazon
Resource    ../resources/orange.resource


Test Setup    Abrir o navegador e acessar o site 
Test Teardown    Close Browser





*** Test Cases ***


TC01 - Acessar o site do Orange HRM 
    [Tags]    TC01   Login
    Verificar se a página foi aberta
   

TC02 - Acessar o site do Orange HRM e fazer login 
    [Tags]    TC02    Login
    Informar o nome de usuário  ${USER_NAME}
    Informar a senha  ${PASSWORD} 
    Clicar no botão de login
    Verificar se o login foi feito


TC03 - Acessar o site do Orange HRM e fazer login com username inválido
    [Tags]    TC03    Login
    Informar o nome de usuário  ${INVALID_USER_NAME} 
    Informar a senha  ${PASSWORD} 
    Clicar no botão de login
    Exibir resposta de credencial inválida


TC04 - Acessar o site do Orange HRM e fazer login com senha inválida
    [Tags]    TC04    Login
    Informar o nome de usuário  ${USER_NAME} 
    Informar a senha  ${INVALID_PASSWORD}
    Clicar no botão de login
    Exibir resposta de senha inválida


TC05 - Atualizar dados do usuário
    [Tags]    TC05
    Informar o nome de usuário  ${USER_NAME}
    Informar a senha  ${PASSWORD} 
    Clicar no botão de login
    Verificar se o login foi feito
    Clicar na opção my info
    Atualizar first name ${FIRST_NAME} 
    Atualizar middle name ${MID_NAME} 
    Atualizar last name ${LAST_NAME}
    Clicar no botão de salvar

