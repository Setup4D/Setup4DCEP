[![Logo da Setup4D](https://setup4d.com.br/github/assets/logotransparente.png)](https://www.setup4d.com)

# Setup4DCEP

![Delphi Supported Versions](https://img.shields.io/badge/Delphi%20Supported%20Versions-XE10.3..11-blue.svg)
![Platforms](https://img.shields.io/badge/Supported%20platforms-Win32%20and%20Win64-red.svg)

Bem-vindo(a) ao repositório do projeto Setup4DCEP! Esta aplicação foi desenvolvida para simplificar a pesquisa de CEP e dos Códigos do IBGE. Com o Setup4DCEP, você pode realizar interações com procedimentos e funções em suas aplicações Delphi de maneira rápida, simples e confiável.

## 📐 Como utilizar

### ⚙️ Instalação

#### ⚡️ Automática (via boss)

* `[Optional]` Para facilitar recomendo utilizar [**Boss**](https://github.com/HashLoad/boss) (Dependency Manager for Delphi) para instalação, bastando apenas rodar o comando abaixo em um terminal  (Windows PowerShell for example):

```
boss install github.com/Setup4D/Setup4DCEP
```

#### ⚡️ Manual (Delphi)

* Se você optar por instalar manualmente, basta adicionar a pasta abaixo ao seu projeto, em *Project > Options > Resource Compiler > Directories and Conditionals > Include file search path*.

```
./src
./src/Configuration
./src/Configuration/Proxy
./src/Configuration/Web Service
./src/Enumerated
./src/Execute
./src/Interfaces
./src/Result
./src/Result/IBGE
./src/Result/Zip Code
./src/Search
./src/Search/IBGE
./src/Search/Zip Code
```

## 📐 Modo de uso

### ⚙️ Idioma das mensagens

* O sistema suporta dois idiomas, com o inglês sendo o idioma padrão. No entanto, é possível utilizar o aplicativo em português do Brasil. Para isso, siga as etapas a seguir:

```
Acesse Project > Options > Delphi Compiler > Conditionals Defines
```

* Adicione a diretiva *HAS_PORTUGUES*, necessária para habilitar o idioma português do Brasil ou remova o "//" para descomentar a linha *{$DEFINE HAS_PORTUGUES}* no arquivo *Setup4DCEPLanguage.inc*, que se encontra em *.\src\requires\inc*;

## 📐 Métodos Principal - *ISetup4DCEP*

### ⚙️ Método - *New*

Cria uma nova instância da interface, que é a entrada principal para acessar as funcionalidades do Setup4DCEP.

### ⚙️ Método - *Configuration*

Obtém uma nova instância da classe de configuração do Setup4DCEP, usada para configurar opções relacionadas ao CEP e/ou IBGE. Essa classe é responsável pela configuração das opções associadas à API de CEP ou IBGE e disponibiliza métodos para ajustar as configurações do serviço web e do proxy usadas nas consultas.

  #### ⚡️ Método - *WebService*
  Obtém uma instância da classe de configuração do serviço da web, que permite configurar as opções relacionadas ao serviço de pesquisa da API do CEP.
  
  #### ⚡️ Método - *Proxy*
  Obtém uma instância da classe de configuração do proxy, que permite configurar as opções relacionadas ao proxy de pesquisa do CEP ou IBGE.
  
  #### ⚡️ Método - *Finish*

Finaliza o método de configuração, retornando à classe principal Setup4DCEP.

### ⚙️ Método - *Search*

Obtém uma nova instância da classe de pesquisa do Setup4DCEP para informar os dados a serem pesquisados.

### ⚙️ Método - *Execute*

Obtém uma instância da classe de execução do Setup4DCEP, que permite executar ações relacionadas ao CEP e/ou IBGE.

### ⚙️ Método - *Result*

Obtém uma instância da classe de resultado do Setup4DCEP, que permite apresentar os resultados da execução relacionadas ao CEP ou IBGE.

