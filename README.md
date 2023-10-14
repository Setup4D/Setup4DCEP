[![Logo da Setup4D](https://setup4d.com.br/github/assets/logotransparente.png)](https://www.setup4d.com.br)

<a href="https://github.com/Setup4D/Setup4DCEP/blob/main/README-PTBr.md">
   <img src="https://user-images.githubusercontent.com/138676601/275272225-61609e1d-764f-4e9d-9ead-8593985af595.png">
</a>
<a href="https://github.com/Setup4D/Setup4DCEP/blob/main/README.md">
   <img src="https://user-images.githubusercontent.com/138676601/275272281-5f9f5df0-d563-4046-b5a9-207f0fa0e674.png">
</a>

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

Se você escolher fazer a instalação manualmente, siga os passos abaixo:

1. Faça o [**download**](https://github.com/Setup4D/Setup4DCEP/archive/refs/heads/main.zip) do projeto.
2. Descompacte o arquivo baixado em uma pasta de sua escolha.
3. Adicione a pasta extraída ao seu projeto, indo para *Project > Options > Resource Compiler > Directories and Conditionals > Include file search path*.

```
./{Pasta}/src
./{Pasta}/src/Configuration
./{Pasta}/src/Configuration/Proxy
./{Pasta}/src/Configuration/Web Service
./{Pasta}/src/Enumerated
./{Pasta}/src/Execute
./{Pasta}/src/Interfaces
./{Pasta}/src/Result
./{Pasta}/src/Result/IBGE
./{Pasta}/src/Result/Zip Code
./{Pasta}/src/Search
./{Pasta}/src/Search/IBGE
./{Pasta}/src/Search/Zip Code
```
### ⚙️ Dependências

Este projeto depende do [**Setup4DUtility**](https://github.com/Setup4D/Setup4DUtility), desempenhando um papel crucial em suas funcionalidades operacionais. Quando você utiliza o [**Boss**](https://github.com/HashLoad/boss) como instalador do framework, a instalação do **Setup4DUtility** ocorre automaticamente. No entanto, se optar por uma instalação manual, siga os passos abaixo:

1. Faça o [**download**](https://github.com/Setup4D/Setup4DUtility/archive/refs/heads/main.zip) do projeto ou acesse a  [**pagina do projeto**](https://github.com/Setup4D/Setup4DUtility) e realize o download.

2. Descompacte o arquivo baixado em uma pasta de sua escolha.

3. Adicione a pasta extraída ao seu projeto, indo para *Project > Options > Resource Compiler > Directories and Conditionals > Include file search path*.

```
./{Pasta}/src
```

## 📐 Modo de uso

### ⚙️ Idioma das mensagens

* O sistema suporta dois idiomas, com o inglês sendo o idioma padrão. No entanto, é possível utilizar o aplicativo em português do Brasil. Para isso, siga as etapas a seguir:

```
Acesse Project > Options > Delphi Compiler > Conditionals Defines
```

* Adicione a diretiva *HAS_PORTUGUES*, necessária para habilitar o idioma português do Brasil ou remova o "//" para descomentar a linha *{$DEFINE HAS_PORTUGUES}* no arquivo *Setup4DCEPLanguage.inc*, que se encontra em *.\src\requires\inc*;

## 📐 Funções do TSetup4DCep

A classe `TSetup4DCep` atua como um suporte fundamental para as funcionalidades do framework. Ela centraliza diversas funções e procedimentos que serão utilizados pelo framework, proporcionando uma programação dinâmica e simplificada, alinhada com a agilidade da programação inline do Delphi.

### ⚙️ Métodos

#### 💻 `class function New: ISetup4DCEP;`

Cria uma nova instância da interface, que é a entrada principal para acessar as funcionalidades do Setup4DCEP.

#### 🧬 `function Configuration : ISetup4DCEPConfiguration;`

Esta função obtém uma nova instância da classe de configuração do Setup4DCEP, a qual desempenha um papel crucial na configuração das opções relacionadas ao CEP e/ou IBGE. Ela oferece métodos para ajustar as configurações do serviço web e do proxy utilizadas nas consultas, proporcionando flexibilidade e personalização no uso da API de CEP ou IBGE.

  ##### ⚡️ `function WebService:ISetup4DCEPConfigurationWebService;`

  Obtém uma instância da classe de configuração do serviço da web, que permite configurar as opções relacionadas ao serviço de pesquisa da API do CEP.
  
  ##### ⚡️ `function Proxy:ISetup4DCEPConfigurationProxy;`

  Obtém uma instância da classe de configuração do proxy, que permite configurar as opções relacionadas ao proxy de pesquisa do CEP ou IBGE.
  
  ##### ⚡️ `function Finish: ISetup4DCEP;`

  Finaliza o método de configuração, retornando à classe principal TSetup4DCEP.

#### 🧬 `function Search : ISetup4DCEPSearch;`

Obtém uma nova instância da classe de pesquisa do Setup4DCEP para informar os dados a serem pesquisados.

#### 🧬 `function Execute : ISetup4DCEPExecute;`

Obtém uma instância da classe de execução do Setup4DCEP, que permite executar ações relacionadas ao CEP e/ou IBGE.

#### 🧬 `function Result : ISetup4DCEPResult;`

Obtém uma instância da classe de resultado do Setup4DCEP, que permite apresentar os resultados da execução relacionadas ao CEP ou IBGE.

