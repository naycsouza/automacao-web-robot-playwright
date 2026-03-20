# Automação de Testes Web com Robot Framework e Playwright

Projeto de automação de testes web utilizando Robot Framework com Browser Library (Playwright),
focado em boas práticas, BDD e reutilização de código.

## 🛠 Tecnologias
- Robot Framework
- Browser Library (Playwright)
- Python
- Chromium

## 🧪 Cenários Automatizados
 1 - Validar redirecionamento para criação de conta
 2 - Validar acesso à recuperação de conta
 3 - Validar mensagem de erro ao informar email inválido

## 📁 Estrutura do Projeto
- resources/ → Keywords reutilizáveis
- tests/ → Casos de teste (BDD)

## ▶️ Como executar

### 1️⃣ Instalar dependências
```bash
pip install robotframework robotframework-browser
rfbrowser init

### Comando para executar os testes
robot tests/testes_login.robot
