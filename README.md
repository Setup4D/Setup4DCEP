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

* Se você escolher fazer a instalação manualmente, siga os passos abaixo:

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

* Este projeto depende do [**Setup4DUtility**](https://github.com/Setup4D/Setup4DUtility), desempenhando um papel crucial em suas funcionalidades operacionais. Quando você utiliza o [**Boss**](https://github.com/HashLoad/boss) como instalador do framework, a instalação do **Setup4DUtility** ocorre automaticamente. No entanto, se optar por uma instalação manual, siga os passos abaixo:

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

* A classe `TSetup4DCep` atua como um suporte fundamental para as funcionalidades do framework. Ela centraliza diversas funções e procedimentos que serão utilizados pelo framework, proporcionando uma programação dinâmica e simplificada, alinhada com a agilidade da programação inline do Delphi.

### ⚙️ Enumerados do Setup4DCep

#### 💻 `TSetup4DCEPWebService`

* Representa os serviços web disponíveis para consulta de CEP. O escopo está habilitado, para pode acessar os valores da enumeração tem que sempre inforamar `TSetup4DCEPWebService` antes do nome do enumerado, por exemplo, `TSetup4DCEPWebService.Nenhum`. Vou explicar o código em detalhes:

   - `Nenhum`: Representa a ausência de um serviço web para consulta de CEP.
   - `BuscarCep`: Representa o serviço web "BuscarCep".
   - `CepLivre`: Representa o serviço web "CepLivre".
   - `RepublicaVirtual`: Representa o serviço web "RepublicaVirtual".
   - `Bases4you`: Representa o serviço web "Bases4you".
   - `RNSolucoes`: Representa o serviço web "RNSolucoes".
   - `KingHost`: Representa o serviço web "KingHost".
   - `ByJG`: Representa o serviço web "ByJG".
   - `Correios`: Representa o serviço web "Correios".
   - `DevMedia`: Representa o serviço web "DevMedia".
   - `ViaCep`: Representa o serviço web "ViaCep".
   - `CorreiosSIGEP`: Representa o serviço web "CorreiosSIGEP".
   - `CepAberto`: Representa o serviço web "CepAberto".
   - `WSCep`: Representa o serviço web "WSCep".
   - `OpenCep`: Representa o serviço web "OpenCep".
   - `BrasilAPI`: Representa o serviço web "BrasilAPI".

### ⚙️ Interfaces do Setup4DCep

#### 💻 `ISetup4DCEP`

* A interface principal do framework Setup4DCEP é o ponto de entrada para acessar as funcionalidades relacionadas ao **CEP (Código de Endereçamento Postal)** ou **IBGE (Instituto Brasileiro de Geografia e Estatística)**. Essa interface serve como o núcleo do framework, e todas as outras interfaces são dependentes dela. Ao utilizar esta interface principal, você pode acessar as demais funcionalidades do framework de forma organizada e simplificada.

* Essa abordagem foi projetada para reduzir a complexidade e permitir que os desenvolvedores explorem as funcionalidades de forma flexível e adaptativa.

#### 💻 `ISetup4DCEPConfiguration`

* É responsável por configurar opções relacionadas à pesquisa de CEP ou IBGE. Ela oferece métodos para configurar o serviço da web e o proxy utilizados nas consultas de CEP ou IBGE.

#### 💻 `ISetup4DCEPConfigurationWebService`

* É usada para configurar as opções relacionadas ao serviço da web na pesquisa de CEP ou IBGE.

#### 💻 `ISetup4DCEPConfigurationWebServiceZIPCode`

* Se estende a interface `ISetup4DCEPConfigurationWebService` e fornece métodos específicos para configuração relacionada a consultas de CEP.

#### 💻 `ISetup4DCEPConfigurationWebServiceIBGE`

* Se estende a interface `ISetup4DCEPConfigurationWebService` e fornece métodos específicos para configuração relacionada a consultas do IBGE.

#### 💻 `ISetup4DCEPConfigurationProxy`

* É  usada para configurar as opções relacionadas ao proxy na pesquisa de CEP ou IBGE.

#### 💻 `ISetup4DCEPSearch`

* Oferece métodos para realizar pesquisas de CEP.

#### 💻 `ISetup4DCEPSearchZipCode`

* Se estende a interface `ISetup4DCEPSearch` e fornece métodos específicos para pesquisa de CEP.

#### 💻 `ISetup4DCEPSearchZipCodeData`

* É usada para obter dados relacionados a consultas do CEP.

#### 💻 `ISetup4DCEPSearchZipCodeAddress`

* É usada para obter informações do endereço relacionadas a consultas do CEP.

#### 💻 `ISetup4DCEPSearchIBGE`

* Se estende a interface `ISetup4DCEPSearch` e fornece métodos específicos para pesquisa do IBGE.

#### 💻 `ISetup4DCEPSearchIBGEData`

* É usada para obter dados relacionados a consultas do IBGE.

#### 💻 `ISetup4DCEPSearchIBGEAddress`

* É usada para obter informações de endereço relacionadas a consultas do IBGE.

#### 💻 `ISetup4DCEPExecute`

* Oferece métodos para executar ações relacionadas ao CEP ou IBGE.

#### 💻 `ISetup4DCEPExecuteZipCode`

* Se estende a interface `ISetup4DCEPExecute` e fornece métodos específicos para ações relacionadas a consultas de CEP.

#### 💻 `ISetup4DCEPExecuteIBGE`

* Se estende a interface `ISetup4DCEPExecute` e fornece métodos específicos para ações relacionadas a consultas do IBGE.

#### 💻 `ISetup4DCEPResult`

* Oferece métodos para obter resultados de ações relacionadas ao CEP.

#### 💻 `ISetup4DCEPResultZipCode`

* Se estende a interface `ISetup4DCEPResult` e fornece métodos específicos para obter resultados de ações relacionadas a consultas de CEP.

#### 💻 `iSetup4DCEPResultZipCodeDisplay`

* É usada para exibir os resultados de consultas de CEP.

#### 💻 `ISetup4DCEPResultIBGE`

* Se estende a interface `ISetup4DCEPResult` e fornece métodos específicos para obter resultados de ações relacionadas a consultas do IBGE.

#### 💻 `iSetup4DCEPResultIBGEDisplay`

* É usada para exibir os resultados de consultas do IBGE.

### ⚙️ Métodos TSetup4DCEP

#### 💻 `class function New: ISetup4DCEP;`

   + Este é um método de classe, o que permite chamá-lo diretamente na classe, sem a necessidade de criar uma instância da classe. Ele retorna um tipo que implementa a interface [ISetup4DCEP](#-isetup4dcep), indicando que o método cria e retorna uma instância da classe que implementa essa interface. O método cria uma nova instância da própria classe [TSetup4DCep](#-funções-do-tsetup4dcep) usando o construtor, o que significa que o método New retorna uma nova instância de TSetup4DCEP. Esse padrão é empregado para criar novas instâncias de classes sem a necessidade de criar uma instância manualmente, simplificando a criação de objetos. A função New é uma maneira conveniente de criar instâncias dessa classe.

#### 🧬 `function Configuration : ISetup4DCEPConfiguration;`

   + Este método retorna um tipo que implementa a interface [ISetup4DCEPConfiguration](#-isetup4dcepconfiguration), fornecendo acesso a configurações relacionadas ao CEP e IBGE. O método construtor está disponível para garantir que o mesmo objeto de configuração seja utilizado ao longo da execução do [TSetup4DCep](#-funções-do-tsetup4dcep), evitando criações repetidas.

##### ⚡️ `function WebService:ISetup4DCEPConfigurationWebService;`

   + Este método retorna um tipo que implementa a interface [ISetup4DCEPConfigurationWebService](#-isetup4dcepconfigurationwebservice), fornecendo acesso a configurações do serviços web. O método construtor está disponível para garantir que o mesmo objeto de configuração seja utilizado ao longo da execução do [TSetup4DCep](#-funções-do-tsetup4dcep), evitando criações repetidas. 

   1. `function ZipCode: ISetup4DCEPConfigurationWebServiceZIPCode;`

      - São funções que permitem acessar a configuração específica para o serviço de pesquisa do IBGE. E Todas essas funções abaixo são usadas para acessar configurações específicas para o serviço de pesquisa do CEP:
         
         - Esses são os serviços web que você pode escolher para utilizar na pesquisa:
         
            1. Nenhum (Não seleciona nenhum serviço)
            2. Buscar Cep
            3. Cep Livre
            4. Republica Virtual
            5. Bases4 you
            6. RN Solucoes
            7. KingHost
            8. ByJG
            9. Correios
            10. DevMedia
            11. Via Cep
            12. Correios SIGEP
            13. Cep Aberto
            14. WSCep
            15. Open Cep
            16. Brasil API
      
         - `function Index: Integer;`
            - Retorna o índice do serviço web selecionado.
         
         - `function Key(const AValue: string): ISetup4DCEPConfigurationWebServiceZIPCode; overload;`
            - Configura a chave de acesso ao serviço.
         
         - `function Key: string; overload;`
            - Obtém a chave de acesso ao serviço.
         
         - `function User(const AValue: string): ISetup4DCEPConfigurationWebServiceZIPCode; overload;` 
            - Configura o nome de usuário para autenticação no serviço web.
         
         - `function User: string; overload;`
            - Obtém o nome de usuário para autenticação no serviço web.
         
         - `function Password(const AValue: string): ISetup4DCEPConfigurationWebServiceZIPCode; overload;` e
            - Configura a senha para autenticação no serviço web.
         
         - `function Password: string; overload;`
            - Obtém a senha para autenticação no serviço web.
         
         - `function ReturnIBGE(const AValue: Boolean): ISetup4DCEPConfigurationWebServiceZIPCode; overload;` e
            - Configura a opção de retorno dos códigos do IBGE na pesquisa de CEP.
         
         - `function ReturnIBGE: Boolean; overload;`
            - Obtém a opção de retorno dos códigos do IBGE na pesquisa de CEP.
         
         - `function Finish: ISetup4DCEPConfigurationWebService;`
            - Conclui a configuração do serviço web e retorna para a classe de configuração do webservice.

   2. `function IBGE: ISetup4DCEPConfigurationWebServiceIBGE;`
      - São funções que permitem acessar a configuração específica para o serviço de pesquisa do IBGE. E Todas essas funções abaixo são usadas para acessar configurações específicas para o serviço de pesquisa do IBGE:

         - `function CacheName(Const AValue: string): ISetup4DCEPConfigurationWebServiceIBGE; overload;`
           - Configura o nome do cache utilizado para armazenar resultados de consultas ao IBGE.

         - `function CacheName: string; overload;`
           - Obtém o nome do arquivo de cache.

         - `function CacheValidity (Const AValue: Integer) : ISetup4DCEPConfigurationWebServiceIBGE; overload;`
           - Configura o tempo de validade do cache em minutos para resultados de consultas ao IBGE.
         
         - `function CacheValidity (Const AValue: string) : ISetup4DCEPConfigurationWebServiceIBGE; overload;`
           - Configura o tempo de validade do cache em formato de string para resultados de consultas ao IBGE.
         
         - `function CacheValidity : Integer; overload;`
           - Obtém o tempo de validade do cache em minutos para resultados de consultas ao IBGE.
         
         - `function CacheValidityInStr : string; overload;`
           - Obtém o tempo de validade do cache em formato de string para resultados de consultas ao IBGE.

         - `function CacheClear : ISetup4DCEPConfigurationWebServiceIBGE;`
           - Limpa o cache de resultados de consultas ao IBGE.

         - `function CaseSensitive(Const AValue: Boolean) : ISetup4DCEPConfigurationWebServiceIBGE;  overload;`
           - Configura se a pesquisa no cache de consultas ao IBGE deve ser sensível a maiúsculas e minúsculas.
         
         - `function CaseSensitive : Boolean;  overload;`
           - Obtém o status de pesquisa sensível a maiúsculas e minúsculas no cache de consultas ao IBGE.

         - `function Finish: ISetup4DCEPConfigurationWebService;`
           - Conclui a configuração do serviço da web do IBGE e retrona para a configuração do Web Service.
   
   3. `function TimeOut(const AValue: string): ISetup4DCEPConfigurationWebService; overload;`
      - Utilizado um valor em string para configurar o tempo limite para a pesquisa na API.
   
   4. `function TimeOut(const AValue: Integer): ISetup4DCEPConfigurationWebService; overload;`
      - Utilizado um valor inteiro para configurar o tempo limite para a pesquisa na API.
   
   5. `function TimeOutInStr: string;`
      - Permite obter o tempo limite configurado em formato de string.
   
   6. `function TimeOut: Integer;`:
      - Retorna o tempo limite como um valor inteiro.
   
   7. `function ParseText(const AValue: Boolean): ISetup4DCEPConfigurationWebService; overload;`
      - Define se deve analisar o texto nas respostas do serviço web.
   
   8. `function ParseText: Boolean;`
      - Obtém se deve analisar o texto nas respostas do serviço web.
   
   9. `function Finish: ISetup4DCEPConfiguration;`
      - É usado para concluir a configuração do serviço da web e retornar para a classe de configuração.

##### ⚡️ `function Proxy : ISetup4DCEPConfigurationProxy;`

   + Este método retorna um tipo que implementa a interface [ISetup4DCEPConfigurationProxy](#-isetup4dcepconfigurationproxy), fornecendo acesso a configurações do serviços web. O método construtor está disponível para garantir que o mesmo objeto de configuração seja utilizado ao longo da execução do [TSetup4DCep](#-funções-do-tsetup4dcep), evitando criações repetidas. 

   1. `function Host(Const AValue: string) : ISetup4DCEPConfigurationProxy; overload;`
      - Configura o host (servidor) do proxy.
   
   2. `function Host : string; overload;`
      - Obtém o host (servidor) do proxy.

   3. `function Port(Const AValue: string) : ISetup4DCEPConfigurationProxy; overload;`
      - Configura a porta do proxy como uma string.
   
   4. `function Port(Const AValue: integer) : ISetup4DCEPConfigurationProxy; overload;`
      - Configura a porta do proxy como um número inteiro.
   
   5. `function Port : integer; overload;`
      - Obtém a porta do proxy como um valor inteiro.

   6. `function PortInStr : string; overload;`
      - Obtém a porta do proxy em formato de string.

   7. `function User(Const AValue: string) : ISetup4DCEPConfigurationProxy; overload;`
      - Configura o nome de usuário do proxy.
   
   8. `function User : string; overload;`
      - Obtém o nome de usuário do proxy.

   9. `function Password(Const AValue: string) : ISetup4DCEPConfigurationProxy; overload;`
      - Configura a senha do proxy.
   
   10.  `function Password : string; overload;`
         - Obtém a senha do proxy.
   
   11. `function Finish: ISetup4DCEPConfiguration;`
         - Conclui a configuração do proxy e retorna para a classe de configuração.

##### ⚡️ `function Finish: [ISetup4DCEP](#-isetup4dcep);`

   + Este método retorna uma instância da interface [ISetup4DCEP](#-isetup4dcep). Esse método é usado para finalizar a configuração e obter uma referência à instância principal do [TSetup4DCep](#-funções-do-tsetup4dcep).  Portanto, essa linha simplesmente retorna a referência à instância principal.

#### 🧬 `function Search : ISetup4DCEPSearch;`

* Obtém uma nova instância da classe de pesquisa do Setup4DCEP para informar os dados a serem pesquisados.

#### 🧬 `function Execute : ISetup4DCEPExecute;`

* Obtém uma instância da classe de execução do Setup4DCEP, que permite executar ações relacionadas ao CEP e/ou IBGE.

#### 🧬 `function Result : ISetup4DCEPResult;`

* Obtém uma instância da classe de resultado do Setup4DCEP, que permite apresentar os resultados da execução relacionadas ao CEP ou IBGE.

  
