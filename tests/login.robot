*** Settings ***
Resource   ../settings/base.robot
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