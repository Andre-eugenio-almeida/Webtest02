*** Variables ***
&{login_page}
...  input_username=//Input[@name="username"]
...  input_password=//input[@name="password"]
...  button_login=//button[@class="oxd-button oxd-button--medium oxd-button--main orangehrm-login-button"] 
...  txt_invalid_credentials=//p[@class="oxd-text oxd-text--p oxd-alert-content-text"]