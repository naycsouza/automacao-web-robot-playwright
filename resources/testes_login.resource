*** Settings ***
Library    Browser

*** Variables ***
${BROWSER}        chromium
${HEADLESS}       false
${LOGIN_URL}      https://accounts.google.com/v3/signin/identifier?dsh=S269696676%3A1773959456916200&flowEntry=ServiceLogin&flowName=GlifWebSignIn&hl=pt-br&ifkv=ASfE1-qnSEde4GG5rtNf1B0RwnxC-f0K0dQ9pL88zECk30fWthPQTzD0TLktTU5KJKTb-wIwR1op
${RECOVERY_TEXT}  Esqueceu o e-mail?
${SIGNUP_TEXT}    Criar conta

*** Keywords ***
Abrir Navegador E Acessar Login
    New Browser    ${BROWSER}    headless=${HEADLESS}
    New Page       ${LOGIN_URL}

Fechar Navegador
    Close Browser

Preencher Email
    [Arguments]    ${email}
    Wait For Elements State    id=identifierId    visible    5
    Fill Text    id=identifierId    ${email}
    Click       text=Avançar

Validar Mensagem De Erro De Email
    Wait For Elements State    css=span.jibhHc    visible    5
    Take Screenshot

Clicar Em Esqueci Email
    Click    text=${RECOVERY_TEXT}

Validar Página De Recuperação
    Wait For Elements State    text=Encontre seu e-mail    visible    5
    ${texto}    Get Text    text=Encontre seu e-mail  
    Should Contain    ${texto}    Encontre seu e-mail
    Log To Console    Carregada a página de recuperação de conta
    Take Screenshot

Clicar Em Criar Conta
    Click    text=${SIGNUP_TEXT}

Validar Página De Criação De Conta
    Selecionar Uso pessoal para criação de conta
    Wait For Elements State    text=Crie uma Conta do Google   visible    5
    ${texto}    Get Text    text=Crie uma Conta do Google 
    Should Contain    ${texto}    Crie uma Conta do Google
    Log To Console    Carregada a página de criação de conta
    Take Screenshot

Selecionar Uso pessoal para criação de conta
    Wait For Elements State    text=Para uso pessoal   visible    5
    Click    text=Para uso pessoal