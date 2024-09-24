*** Settings ***
Library    AppiumLibrary
Library    ../.venv/Lib/site-packages/robot/libraries/XML.py

*** Variables ***
${REMOTE_URL}    http://127.0.0.1:4723/wd/hub
${PLATFORM_NAME}    Android
${DEVICE_NAME}     Pixel 4 API 33
${APP}     C:/Users/rapha/Desktop/teste_desafio_moibile/apk/app-debug.apk
${appium:automationName}    UiAutomator2

*** Keywords ***
Abrir app
    Open Application    ${REMOTE_URL}    platformName=${PLATFORM_NAME}    deviceName=${DEVICE_NAME}    app=${APP}  appium:automationName=${appium:automationName}

fechar app
    Close Application

Cadastrar novo usuario
    Click Element    com.example.vamsi.login:id/tvRegister
    Wait Until Element Is Visible    com.example.vamsi.login:id/etRegName
    Input Text    com.example.vamsi.login:id/etRegName  teste
    Input Text   com.example.vamsi.login:id/etRegPhone  1198268811
    Input Text    com.example.vamsi.login:id/etRegGmail  teste@gmail.com
    Input Text    com.example.vamsi.login:id/etRegPassword  707070
    Click Element    com.example.vamsi.login:id/btnRegLogin
    Click Element    com.example.vamsi.login:id/btnGotoLogin

Login com usuario valido
    Wait Until Element Is Visible     com.example.vamsi.login:id/etLogGmail
    Input Text    com.example.vamsi.login:id/etLogGmail    teste@gmail.com
    Input Text    com.example.vamsi.login:id/etLoginPassword    707070
    Click Element    com.example.vamsi.login:id/btnLogin
    Wait Until Element Is Visible    xpath=//android.widget.TextView[contains(@text, 'You are now logged in')]
    Go Back
    

Login com usuario invalido
    Wait Until Element Is Visible     com.example.vamsi.login:id/etLogGmail
    Input Text    com.example.vamsi.login:id/etLogGmail    USUARIOINVALIDO
    Input Text    com.example.vamsi.login:id/etLoginPassword    123123
    Click Element    com.example.vamsi.login:id/btnLogin
    Wait Until Page Contains    Login error