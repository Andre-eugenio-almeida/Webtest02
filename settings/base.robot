*** Settings ***
Library    SeleniumLibrary

#Pages
Resource  ../pages/login_page.robot
Resource  ../pages/home_page.robot

#Keywords
Resource  ../keywords/orange_keywors.robot
Resource  ../keywords/settings_keywords.robot

*** Variables ***
#CONFIGURAÇÃO
${BROWSER}     chrome       
${URL}         https://opensource-demo.orangehrmlive.com/web/index.php/auth/login

#DADO DE TESTE
${USER_NAME}   Admin
${PASSWORD}    admin123
${INVALID_USER_NAME}    Gator