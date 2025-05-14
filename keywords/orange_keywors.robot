*** Settings ***
Resource  ../settings/base.robot

*** Keywords ***
Verificar se a página foi aberta
    Wait Until Element Is Visible    locator=${login_page.input_username}   timeout=15s

Informar o nome de usuário 
    [Arguments]    ${nome}
    Input Text    locator=${login_page.input_username}    text=${nome}

Informar a senha
    [Arguments]  ${password}
    Input Text    locator=${login_page.input_password}      text=${password}

Clicar no botão de login
    Click Element    locator=${login_page.button_login}  

Verificar se o login foi feito
    Wait Until Element Is Visible    locator=${home_page.button_upgrade}    timeout=15s

Exibir resposta de credencial inválida
    Wait Until Element Is Visible    locator=${login_page.txt_invalid_credentials}