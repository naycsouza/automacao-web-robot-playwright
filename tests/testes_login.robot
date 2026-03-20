*** Settings ***
Resource        ../resources/testes_login.resource
Test Teardown   Fechar Navegador

*** Test Cases ***
Cenário 1 - Validar redirecionamento para criação de conta
    Dado que entro na página de login
    Quando clico em Criar conta
    Então sou direcionado para página de criação de conta

Cenário 2 - Validar acesso à recuperação de conta
    Dado que entro na página de login
    Quando clico em Esqueci email
    Então sou direcionado para página de recuperação
    
Cenário 3 - Validar mensagem de erro ao informar email inválido
    Dado que entro na página de login
    Quando escrevo email inválido
    Então deve aparecer mensagem de erro

*** Keywords ***
Dado que entro na página de login
    Abrir Navegador E Acessar Login

Quando escrevo email inválido
    Preencher Email    teste$teste.com

Então deve aparecer mensagem de erro
    Validar Mensagem De Erro De Email

Quando clico em Esqueci email
    Clicar Em Esqueci Email

Então sou direcionado para página de recuperação
    Validar Página De Recuperação

Quando clico em Criar conta
    Clicar Em Criar Conta

Então sou direcionado para página de criação de conta
    Validar Página De Criação De Conta
