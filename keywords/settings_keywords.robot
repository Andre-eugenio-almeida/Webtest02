*** Settings ***
Resource  ../settings/base.robot

*** Keywords ***
Abrir o navegador e acessar o site
    Set Selenium Speed    value=0.5
    Open Browser    browser=${BROWSER}    url=${URL}  
    Maximize Browser Window  