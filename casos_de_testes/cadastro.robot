*** Settings ***
Resource        ../keywords/setup.robot
Test Setup      Abrir app
Test Teardown   Close Application


*** Test Cases ***
Cadastro
    Cadastrar novo usuario
    Login com usuario valido
    Login com usuario invalido