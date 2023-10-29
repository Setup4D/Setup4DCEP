[![Logo da Setup4D](https://setup4d.com.br/github/assets/logotransparente.png)](https://www.setup4d.com.br)

<a href="https://github.com/Setup4D/Setup4DCEP/blob/main/README.md">
   <img src="https://user-images.githubusercontent.com/138676601/275272281-5f9f5df0-d563-4046-b5a9-207f0fa0e674.png">
</a>

<a href="https://github.com/Setup4D/Setup4DCEP/blob/main/README-PTBr.md">
   <img src="https://user-images.githubusercontent.com/138676601/275272225-61609e1d-764f-4e9d-9ead-8593985af595.png">
</a>

# Setup4DCEP

![Delphi Supported Versions](https://img.shields.io/badge/Delphi%20Supported%20Versions-XE10.3..11-blue.svg)
![Platforms](https://img.shields.io/badge/Supported%20platforms-Win32%20and%20Win64-red.svg)

Bem-vindo(a) ao repositório do projeto Setup4DCEP! Esta aplicação foi desenvolvida para simplificar a pesquisa de CEP (Código de Endereçamento Postal) e dos Códigos do IBGE (Instituto Brasileiro de Geografia e Estatística). Com o Setup4DCEP, você pode realizar interações com procedimentos e funções em suas aplicações Delphi de maneira rápida, simples e confiável.

## 📐 Como utilizar

### ⚙️ Instalação

#### ⚡️ Automática (via boss)

 * O uso do [**Boss**](https://github.com/HashLoad/boss) é recomendado para facilitar a instalação do Setup4DCEP. Basta executar o seguinte comando em um terminal, como o Windows PowerShell, para realizar a instalação de forma mais conveniente:

   ```shell
   boss install github.com/Setup4D/Setup4DCEP
   ```

   + Isso automatiza o processo de instalação e gerenciamento de dependências, tornando a configuração do Setup4DCEP mais simples. Certifique-se de que o Boss esteja configurado e pronto para uso em seu ambiente Delphi antes de executar esse comando.

#### ⚡️ Manual (Delphi)

* Se você optar por realizar a instalação manualmente, siga os passos abaixo:

   1. Faça o [download](https://github.com/Setup4D/Setup4DCEP/archive/refs/heads/main.zip) do projeto.
   2. Descompacte o arquivo baixado em uma pasta de sua escolha.
   3. Adicione a pasta extraída ao seu projeto, seguindo os passos abaixo:
   
      1. No Delphi, acesse o menu "Project" (Projeto).
      2. Selecione "Options" (Opções).
      3. No painel de opções, vá para "Resource Compiler" (Compilador de Recursos).
      4. Em "Directories and Conditionals" (Diretórios e Condicional), escolha "Include file search path" (Caminho de busca de arquivos de inclusão).
      5. Clique em "Browse" (Navegar) e adicione a pasta extraída do projeto.
   
         + Isso permitirá que seu projeto tenha acesso aos arquivos e recursos necessários do Setup4DCEP. Certifique-se de salvar as configurações após seguir esses passos.

            ```
            .\{Pasta}\src
            .\{Pasta}\src\requires\inc
            .\{Pasta}\src\requires\ACBrComum
            .\{Pasta}\src\requires\ACBrTCP
            .\{Pasta}\src\requires\Terceiros\FastStringReplace
            .\{Pasta}\src\requires\Terceiros\GZIPUtils
            .\{Pasta}\src\requires\Terceiros\JsonDataObjects\Source
            .\{Pasta}\src\requires\Terceiros\synalist
            .\{Pasta}\src\Enumerated
            .\{Pasta}\src\Interfaces
            .\{Pasta}\src\Configuration
            .\{Pasta}\src\Configuration\Proxy
            .\{Pasta}\src\Configuration\Web Service
            .\{Pasta}\src\Filter
            .\{Pasta}\src\Filter\IBGE
            .\{Pasta}\src\Filter\Zip Code
            .\{Pasta}\src\Searech
            .\{Pasta}\src\Searech\IBGE
            .\{Pasta}\src\Searech\Zip Code            
            .\{Pasta}\src\Result
            .\{Pasta}\src\Result\IBGE
            .\{Pasta}\src\Result\Zip Code
            ```
### ⚙️ Dependências

* Este projeto depende do [**Setup4DUtility**](https://github.com/Setup4D/Setup4DUtility), desempenhando um papel crucial em suas funcionalidades operacionais. Quando você utiliza o [**Boss**](https://github.com/HashLoad/boss) como instalador do framework, a instalação do **Setup4DUtility** ocorre automaticamente. No entanto, se optar por uma instalação manual, siga os passos abaixo:

   1. Faça o [**download**](https://github.com/Setup4D/Setup4DUtility/archive/refs/heads/main.zip) do projeto ou acesse a  [**pagina do projeto**](https://github.com/Setup4D/Setup4DUtility) e realize o download.
   2. Descompacte o arquivo baixado em uma pasta de sua escolha.
   3. Adicione a pasta extraída ao seu projeto, indo para *Project > Options > Resource Compiler > Directories and Conditionals > Include file search path*.<p>      
   
   ```
   ./{Pasta}/src
   ```

## 📐 Modo de uso

### ⚙️ Idioma das mensagens

* O sistema oferece suporte a dois idiomas, com o inglês sendo o idioma padrão. No entanto, é possível utilizar o aplicativo em português do Brasil. Para fazer isso, siga as etapas abaixo:

   * **Opção 1: Configuração via Delphi:**
   
      ```
      Acesse Project > Options > Delphi Compiler > Conditionals Defines
      ```

      1. No Delphi, acesse o menu "Project" (Projeto).
      2. Selecione "Options" (Opções).
      3. No painel de opções, vá para "Delphi Compiler" (Compilador Delphi).
      4. Em "Conditionals Defines" (Definições Condicionais), adicione a diretiva *HAS_PORTUGUES*.

         + Isso permitirá que o aplicativo seja utilizado em português do Brasil. Lembre-se de salvar as configurações e recompilar o projeto após fazer essas alterações.

   * **Opção 2: Configuração manual:**

      1. Certifique-se de que a linha *{$DEFINE HAS_PORTUGUES}* no arquivo *Setup4DCEPLanguage.inc*, localizado em *.\{pasta}\src\requires\inc*, esteja descomentada (ou seja, sem as barras duplas "//").

         + Isso também permitirá que o aplicativo seja utilizado em português do Brasil. Não se esqueça de salvar as alterações e recompilar o projeto para que as configurações tenham efeito.

## 📐 Funções do TSetup4DCep

* A classe `TSetup4DCep` desempenha um papel fundamental como suporte para as funcionalidades do framework. Ela centraliza diversas funções e procedimentos que serão utilizados pelo framework, permitindo uma programação dinâmica e simplificada, alinhada com a agilidade da programação inline do Delphi.

### ⚙️ Enumerados do Setup4DCep

#### 💻 `TSetup4DCEPWebService`

* Essa enumeração representa os serviços web disponíveis para consulta de CEP. O escopo está habilitado, o que significa que para acessar os valores da enumeração, você deve sempre informar `TSetup4DCEPWebService` antes do nome do enumerado. Por exemplo, `TSetup4DCEPWebService.Nenhum`. Vou explicar o código em detalhes:

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

* A interface principal do framework Setup4DCEP é o ponto de entrada para acessar as funcionalidades relacionadas ao CEP (Código de Endereçamento Postal) e ao IBGE (Instituto Brasileiro de Geografia e Estatística). Essa interface serve como o núcleo do framework, e todas as outras interfaces são dependentes dela. Ao utilizar esta interface principal, você pode acessar as demais funcionalidades do framework de forma organizada e simplificada.

* Esta abordagem foi projetada para reduzir a complexidade e permitir que os desenvolvedores explorem as funcionalidades de forma flexível e adaptativa.

#### 💻 `ISetup4DCEPConfiguration`

* Esta interface estende a interface [ISetup4DCEP](#-isetup4dcep), fornecendo métodos específicos para a configuração relacionada ao serviço web e ao proxy.

#### 💻 `ISetup4DCEPConfigurationWebService`

* Esta interface estende a interface [ISetup4DCEPConfiguration](#-isetup4dcepconfiguration), fornecendo métodos específicos para a configuração relacionada ao serviço web.

#### 💻 `ISetup4DCEPConfigurationWebServiceZIPCode`

* Esta interface estende a interface [ISetup4DCEPConfigurationWebService](#-isetup4dcepconfigurationwebservice) e oferece métodos específicos para a configuração relacionada a consultas de CEP.

#### 💻 `ISetup4DCEPConfigurationWebServiceIBGE`

* Esta interface se estende a interface [ISetup4DCEPConfigurationWebService](#-isetup4dcepconfigurationwebservice) e disponibiliza métodos específicos para a configuração relacionada a consultas do IBGE.

#### 💻 `ISetup4DCEPConfigurationProxy`

* Esta interface estende a interface [ISetup4DCEPConfiguration](#-isetup4dcepconfiguration), fornecendo métodos específicos para a configuração relacionada ao proxy.

#### 💻 `ISetup4DCEPFilter`

* Esta interface estende a interface [ISetup4DCEP](#-isetup4dcep), fornecendo métodos específicos para a configuração relacionada ao filtros do CEP ou IBGE.

#### 💻 `ISetup4DCEPFilterZipCode`

* Essa interface amplia a funcionalidade da interface [ISetup4DCEPFilter](#-isetup4dcepfilter), oferecendo métodos específicos para a inclusão de dados destinados a filtrar a pesquisa relacionada ao CEP.

#### 💻 `ISetup4DCEPFilterZipCodeKey`

* Essa interface amplia a funcionalidade da interface [ISetup4DCEPFilterZipCode](#-isetup4dcepfilterzipcode), oferecendo métodos específicos para a inclusão de informações relacionadas ao código do CEP a ser pesquisado.

#### 💻 `ISetup4DCEPFilterZipCodeAddress`

* Essa interface amplia a funcionalidade da interface [ISetup4DCEPFilterZipCode](#-isetup4dcepfilterzipcode), oferecendo métodos específicos para a inclusão de informações relacionadas ao endereço do CEP a ser pesquisado.
  
#### 💻 `ISetup4DCEPFilterIBGE`

* Essa interface amplia a funcionalidade da interface [ISetup4DCEPFilter](#-isetup4dcepfilter), oferecendo métodos específicos para a inclusão de dados destinados a filtrar a pesquisa relacionada ao IBGE.

#### 💻 `ISetup4DCEPFilterIBGEKey`

* Essa interface amplia a funcionalidade da interface [ISetup4DCEPFilterIBGE](#-isetup4dcepfilteribge), oferecendo métodos específicos para a inclusão de informações relacionadas ao código do CEP a ser pesquisado.

#### 💻 `ISetup4DCEPFilterIBGEAddress`

* Essa interface amplia a funcionalidade da interface [ISetup4DCEPFilterIBGE](#-isetup4dcepfilteribge), oferecendo métodos específicos para a inclusão de informações relacionadas ao endereço do IBGE a ser pesquisado.

#### 💻 `ISetup4DCEPSearech`

* Esta interface estende a interface [ISetup4DCEP](#-isetup4dcep), fornecendo métodos específicos para a realização de pesquisas com base nos filtros do CEP ou do IBGE.

#### 💻 `ISetup4DCEPSearechZipCode`

* Essa interface se estende a interface [ISetup4DCEPSearech](#-isetup4dcepsearech) e oferece métodos específicos para ações relacionadas a consultas de CEP.

#### 💻 `ISetup4DCEPSearechIBGE`

* Essa interface se estende a interface [ISetup4DCEPSearech](#-isetup4dcepsearech) e disponibiliza métodos específicos para ações relacionadas a consultas do IBGE.

#### 💻 `ISetup4DCEPResult`

* Esta interface estende a interface [ISetup4DCEP](#-isetup4dcep), fornecendo métodos específicos  para apresentar o resultado da pesquisaa executada.

#### 💻 `ISetup4DCEPResultZipCode`

* Esta interface se estende a interface [ISetup4DCEPResult](#-isetup4dcepresult) e oferece métodos específicos para obter resultados de ações relacionadas a consultas de CEP.

#### 💻 `iSetup4DCEPResultZipCodeDisplay`

* Esta interface se estende a interface [ISetup4DCEPResultZipCode](#-isetup4dcepresultzipcode) e oferece métodos específicos para exibir os resultados de consultas de CEP.

#### 💻 `ISetup4DCEPResultIBGE`

* Esta interface se estende a interface [ISetup4DCEPResult](#-isetup4dcepresult) e disponibiliza métodos específicos para obter resultados de ações relacionadas a consultas do IBGE.

#### 💻 `iSetup4DCEPResultIBGEDisplay`

* Esta interface se estende a interface [ISetup4DCEPResultibge](#-isetup4dcepresultibge) e oferece métodos específicos para exibir os resultados de consultas do IBGE.

### ⚙️ Métodos TSetup4DCEP

   - Esta função implementa a interface ISetup4DCEP juntamente com todas as dependências necessárias. Ela engloba informações cruciais para a execução de pesquisas de CEP, incluindo a configuração de Web Service, Proxy, filtros, pesquisas e a gestão de resultados relacionados ao IBGE e ao CEP.

#### 💻 `class function New: ISetup4DCEP;`

   + Este é um método de classe, o que permite sua chamada direta na classe, sem a necessidade de criar uma instância da mesma. Ele retorna um tipo que implementa a interface [ISetup4DCEP](#-isetup4dcep), indicando que o método cria e retorna uma instância da classe que implementa essa interface. O método cria uma nova instância da própria classe [TSetup4DCep](#-funções-do-tsetup4dcep) utilizando o construtor, o que implica que o método New retorna uma nova instância de [TSetup4DCep](#-funções-do-tsetup4dcep). Esse padrão é empregado para criar novas instâncias de classes sem a necessidade de criar uma instância manualmente, simplificando a criação de objetos. A função New é uma maneira conveniente de instanciar essa classe.

#### 🧬 `function Configuration : ISetup4DCEPConfiguration;`

* Este método fornece uma instância que implementa a interface [ISetup4DCEPConfiguration](#-isetup4dcepconfiguration), permitindo o acesso às configurações relacionadas ao CEP e IBGE. É importante destacar que existe um construtor disponível para garantir a reutilização do mesmo objeto de configuração ao longo da execução do [TSetup4DCep](#-funções-do-tsetup4dcep), evitando a necessidade de criar instâncias adicionais. Isso contribui para uma gestão eficiente e reduz a complexidade no desenvolvimento.

##### ⚡️ `function WebService:ISetup4DCEPConfigurationWebService;`

   + Este método fornece uma instância que implementa a interface [ISetup4DCEPConfigurationWebService](#-isetup4dcepconfigurationwebservice), permitindo o acesso às configurações dos serviços web. É importante destacar que existe um construtor disponível para garantir a reutilização do mesmo objeto de configuração ao longo da execução do [TSetup4DCep](#-funções-do-tsetup4dcep), evitando a necessidade de criar instâncias adicionais. Isso contribui para uma gestão eficiente e reduz a complexidade no desenvolvimento.

   1. `function ZipCode: ISetup4DCEPConfigurationWebServiceZIPCode;`

      - Este método permite obter uma instância da classe que fornece configurações específicas para o serviço de pesquisa do CEP. Abaixo estão listadas todas as funções existentes:
         
         - Aqui estão os serviços web disponíveis para seleção na pesquisa de CEP:
         
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
            
            - Esta função retorna um valor inteiro que corresponde à conversão de um valor do tipo enumerado [TSetup4DCEPWebService](#-tsetup4dcepwebservice) em um valor inteiro.
         
         - `function Key(const AValue: string): ISetup4DCEPConfigurationWebServiceZIPCode; overload;`
            
            - Este é um método que permite configurar a chave a ser usada para autenticação ao acessar o serviço de consulta de CEP. 
                    
         - `function Key: string; overload;`
            
            - Este é um método que permite obter a chave atualmente configurada. Ele retorna a chave que será utilizada nas solicitações ao serviço de consulta de CEP para acessar informações específicas ou para autenticação, dependendo das necessidades do serviço.
         
         - `function User(const AValue: string): ISetup4DCEPConfigurationWebServiceZIPCode; overload;` 

            - Este é um método que permite configurar o nome de usuário a ser usado para autenticação ao acessar o serviço de consulta de CEP. 
         
         - `function User: string; overload;`
            
            - Este é um método que permite obter o nome de usuário atualmente configurado. Ele retorna o nome de usuário que será utilizado nas solicitações ao serviço de consulta de CEP para autenticação, se necessário.
         
         - `function Password(const AValue: string): ISetup4DCEPConfigurationWebServiceZIPCode; overload;` e
            
            - Este é um método que permite configurar a senha a ser usada para autenticação ao acessar o serviço de consulta de CEP. 
         
         - `function Password: string; overload;`
            
            - Este é um método que permite obter a senha atualmente configurada. Ele retorna a senha que será utilizada nas solicitações ao serviço de consulta de CEP para autenticação, se necessário.
         
         - `function ReturnIBGE(const AValue: Boolean): ISetup4DCEPConfigurationWebServiceZIPCode; overload;` e
            
            - Este é um método que possibilita a configuração do serviço de consulta de CEP para determinar se ele deve ou não retornar informações do IBGE.
         
         - `function ReturnIBGE: Boolean; overload;`
            
            - Este é um método que retorna um valor booleano que indica se o serviço de consulta de CEP também deve retornar informações do IBGE. Quando configurado como verdadeiro, o serviço irá fornecer informações adicionais do IBGE, além dos dados de CEP.
         
         - `function Finish: ISetup4DCEPConfigurationWebService;`

            - Este método é responsável por finalizar a configuração do serviço web do CEP e retornar a interface [ISetup4DCEPConfigurationWebService](#-isetup4dcepconfigurationwebservice). É utilizado para concluir a configuração do proxy e obter uma referência à instância TSetup4DCepConfigurationWebService. Portanto, esta linha simplesmente retorna a referência à instância que a invocou.

   2. `function IBGE: ISetup4DCEPConfigurationWebServiceIBGE;`

      - Este método permite obter uma instância da classe que fornece configurações específicas para o serviço de pesquisa do IBGE. Abaixo estão listadas todas as funções existentes:

         - `function CacheName(Const AValue: string): ISetup4DCEPConfigurationWebServiceIBGE; overload;`
           
           - Este é um método que permite configurar o nome do cache utilizado para armazenar os resultados das consultas ao IBGE.

         - `function CacheName: string; overload;`

           - Este é um método retorna o nome do cache configurado para armazenar os resultados das consultas ao IBGE.

         - `function CacheValidity (Const AValue: Integer) : ISetup4DCEPConfigurationWebServiceIBGE; overload;`

           - Este é um método que permite configurar o tempo de validade do cache para armazenar os resultados das consultas ao IBGE. Ele recebe um valor inteiro representando o tempo de validade em milissegundos.
         
         - `function CacheValidity (Const AValue: string) : ISetup4DCEPConfigurationWebServiceIBGE; overload;`

           - Este é um método que permite configurar o tempo de validade do cache para armazenar os resultados das consultas ao IBGE. Ele recebe uma string representando o tempo de validade em milissegundos.
         
         - `function CacheValidity : Integer; overload;`

           - Este é um método que permite obter o tempo de validade do cache configurado para armazenar os resultados das consultas relacionadas ao IBGE.
         
         - `function CacheValidityInStr : string; overload;`

           - Este é um método que retorna o tempo de validade do cache configurado como uma string.

         - `function CacheClear : ISetup4DCEPConfigurationWebServiceIBGE;`

           - Este é um método que permite limpar o cache de resultados de consultas. 

         - `function CaseSensitive(Const AValue: Boolean) : ISetup4DCEPConfigurationWebServiceIBGE;  overload;`

           - Este é um método que permite configurar se a pesquisa é sensível a maiúsculas e minúsculas. 
         
         - `function CaseSensitive : Boolean;  overload;`

           - Este é um método que permite obter o estado atual da sensibilidade a maiúsculas e minúsculas na pesquisa.

         - `function Finish: ISetup4DCEPConfigurationWebService;`

            - Este método é responsável por finalizar a configuração do serviço web do IBGE e retornar a interface [ISetup4DCEPConfigurationWebService](#-isetup4dcepconfigurationwebservice). É utilizado para concluir a configuração do proxy e obter uma referência à instância TSetup4DCepConfigurationWebService. Portanto, esta linha simplesmente retorna a referência à instância que a invocou.
   
   3. `function TimeOut(const AValue: string): ISetup4DCEPConfigurationWebService; overload;`
      
      - Este método é utilizado para configurar o tempo limite para as solicitações no serviço web. Ele aceita um valor que deve ser uma string representando o tempo limite em milissegundos.
   
   4. `function TimeOut(const AValue: Integer): ISetup4DCEPConfigurationWebService; overload;`
      
      - Este método é utilizado para configurar o tempo limite para as solicitações no serviço web. Ele aceita um valor que deve ser um inteiro representando o tempo limite em milissegundos.
   
   5. `function TimeOutInStr: string;`

      - Este método retorna o valor atual do tempo limite configurado para as solicitações no serviço web, representado como uma string.
   
   6. `function TimeOut: Integer;`:
      
      - Este método retorna o valor atual do tempo limite configurado para as solicitações no serviço web. 
   
   7. `function ParseText(const AValue: Boolean): ISetup4DCEPConfigurationWebService; overload;`

      - Este método é usado para configurar a propriedade do Parse Text, que determina se o serviço web deve analisar o texto da resposta. Ele aceita um parâmetro booleano 
   
   8. `function ParseText: Boolean;`

      - Este método é usado para obter o valor da propriedade ParseText, que representa se o serviço web deve analisar o texto da resposta.
   
   9. `function Finish: ISetup4DCEPConfiguration;`

      - Este método é responsável por finalizar a configuração do proxy e retornar a interface [ISetup4DCEPConfiguration](#-isetup4dcepconfiguration). É utilizado para concluir a configuração do proxy e obter uma referência à instância TSetup4DCepConfiguration. Portanto, esta linha simplesmente retorna a referência à instância que a invocou.

##### ⚡️ `function Proxy : ISetup4DCEPConfigurationProxy;`

   + Este método fornece uma instância que implementa a interface [ISetup4DCEPConfigurationProxy](#-isetup4dcepconfigurationproxy), permitindo o acesso às configurações dos serviços web. É importante destacar que existe um construtor disponível para garantir a reutilização do mesmo objeto de configuração ao longo da execução do [TSetup4DCep](#-funções-do-tsetup4dcep), evitando a necessidade de criar instâncias adicionais. Isso contribui para uma gestão eficiente e reduz a complexidade no desenvolvimento. 

      1. `function Host(Const AValue: string) : ISetup4DCEPConfigurationProxy; overload;`
      
         -  Este método permite configurar o host do proxy utilizado para consultas de CEP ou IBGE. Ele aceita um valor de string.
      
      2. `function Host : string; overload;`
      
         - Este método permite obter o valor do host utilizado no proxy para consultas CEP ou IBGE. Retorna uma string que representa o host.
      
      3. `function Port(Const AValue: string) : ISetup4DCEPConfigurationProxy; overload;`
      
         - Este método permite configurar a porta do proxy utilizado para consultas CEP ou IBGE. Ele aceita um valor de string.
      
      4. `function Port(Const AValue: integer) : ISetup4DCEPConfigurationProxy; overload;`

         - Este método permite configurar a porta do proxy utilizado para consultas CEP ou IBGE. Ele aceita um valor de inteiro.
      
      5. `function Port : integer; overload;`

         - Este método permite obter o valor da porta utilizado no proxy para consultas CEP ou IBGE. Retorna um inteiro que representa a porta.
    
      6. `function PortInStr : string; overload;`
      
         - Este método permite obter o valor da porta utilizado no proxy para consultas CEP ou IBGE. Retorna uma string que representa a porta.
      
      7. `function User(Const AValue: string) : ISetup4DCEPConfigurationProxy; overload;`
      
         - Este método permite configurar o nome de usuário do proxy utilizado para consultas CEP ou IBGE. Ele aceita um valor de string.
      
      8. `function User : string; overload;`
      
         - Este método permite obter o nome do usuário utilizado no proxy para consultas de CEP ou IBGE. Retorna uma string que representa o usuário.
      
      9. `function Password(Const AValue: string) : ISetup4DCEPConfigurationProxy; overload;`
      
         - Este método permite configurar a senha do proxy utilizado para consultas CEP ou IBGE. Ele aceita um valor de string.
      
      10. `function Password : string; overload;`

          - Este método permite obter a senha do usuário utilizado no proxy para consultas de CEP ou IBGE. Retorna uma string que representa o senha.

      11. `function Finish: ISetup4DCEPConfiguration;`

          - Este método é responsável por finalizar a configuração do proxy e retornar a interface [ISetup4DCEPConfiguration](#-isetup4dcepconfiguration). É utilizado para concluir a configuração do proxy e obter uma referência à instância TSetup4DCepConfiguration. Portanto, esta linha simplesmente retorna a referência à instância que a invocou.

##### ⚡️ `function Finish: ISetup4DCEP;`

   + Este método fornece uma instância que implementa a interface [ISetup4DCEP](#-isetup4dcep). É utilizado para concluir a configuração e obter uma referência à instância principal de [TSetup4DCep](#-funções-do-tsetup4dcep). Portanto, esta linha simplesmente retorna a referência à instância que a invocou.
     
#### 🧬 `function Filter : ISetup4DCEPFilter;`

* Este método fornece uma instância que implementa a interface [ISetup4DCEPFilter](#-isetup4dcepfilter), permitindo o acesso às informações dos filtros para pesquisa relacionadas ao CEP e IBGE.É importante destacar que existe um construtor disponível para garantir a reutilização do mesmo objeto de configuração ao longo da execução do [TSetup4DCep](#-funções-do-tsetup4dcep), evitando a necessidade de criar instâncias adicionais. Isso contribui para uma gestão eficiente e reduz a complexidade no desenvolvimento.
  
##### ⚡️ `function ZipCode:ISetup4DCEPFilterZipCode;`

   + Este método fornece uma instância que implementa a interface [ISetup4DCEPFilterZipCode](#-isetup4dcepfilterzipcode), permitindo o acesso aos filtros de pesquisa do CEP. É importante destacar que existe um construtor disponível para garantir a reutilização do mesmo objeto de configuração ao longo da execução do [TSetup4DCep](#-funções-do-tsetup4dcep), evitando a necessidade de criar instâncias adicionais. Isso contribui para uma gestão eficiente e reduz a complexidade no desenvolvimento.

      1. `function Key:ISetup4DCEPFilterZipCodeKey;`

         + Este método fornece uma instância que implementa a interface [ISetup4DCEPFilterZipCodeKey](#-isetup4dcepfilterzipcodekey), permitindo o acesso às configuração do filtro pelo código postal. É importante destacar que existe um construtor disponível para garantir a reutilização do mesmo objeto de configuração ao longo da execução do [TSetup4DCep](#-funções-do-tsetup4dcep), evitando a necessidade de criar instâncias adicionais. Isso contribui para uma gestão eficiente e reduz a complexidade no desenvolvimento. 

            1. `function Value(Const AValue: string) : ISetup4DCEPFilterZipCodeKey; overload;`

               - Esta função permite configurar o valor de consulta para o filtro de CEP.
            
            2. `function Value : string; overload;`

               - Esta função é usado para obter o filtro definido para o código postal do CEP. Isto é útil para acessar e utilizar os critérios definidos.

            3. `function Finish: ISetup4DCEPFilterZipCode;` 

               - Este método é responsável por finalizar a configuração do filtro Zip Code e retornar a interface [ISetup4DCEPFilterZipCode](#-isetup4dcepfilterzipcode). É utilizado para concluir a configuração do filtro e obter uma referência à instância TSetup4DCEPFilterZipCode. Portanto, esta linha simplesmente retorna a referência à instância que a invocou. 
            
      2. `function Address:ISetup4DCEPFilterZipCodeAddress;` 

         + Este método fornece uma instância que implementa a interface [ISetup4DCEPFilterZipCodeAddress](#-isetup4dcepfilterzipcodeaddress), permitindo o acesso às configuração do filtro pelo endereço. É importante destacar que existe um construtor disponível para garantir a reutilização do mesmo objeto de configuração ao longo da execução do [TSetup4DCep](#-funções-do-tsetup4dcep), evitando a necessidade de criar instâncias adicionais. Isso contribui para uma gestão eficiente e reduz a complexidade no desenvolvimento. 

            1. `function Types(Const AValue : string): ISetup4DCEPFilterZipCodeAddress; overload;`

               - Está função permite configurar os tipos de logradouro (rua, avenida, praça, jardim, largo, caminho, etc...) a ser considerados na consulta de CEP.
            
            2. `function Street(Const AValue : string): ISetup4DCEPFilterZipCodeAddress; overload;`

               - Está função permite configurar o nome da rua a ser considerados na consulta de CEP.
            
            3. `function City(Const AValue : string): ISetup4DCEPFilterZipCodeAddress; overload;` 

               - Está função permite configurar o nome da cidade a ser considerados na consulta de CEP.

            4. `function StateAbbreviated(Const AValue : string): ISetup4DCEPFilterZipCodeAddress; overload;`

               - Está função permite configurar a abreviatura do estado a ser considerados na consulta de CEP.
                           
            5. `function StateAbbreviated(Const AValue : TSetup4DUtilityEstadoAbreviado): ISetup4DCEPFilterZipCodeAddress; overload;`

               - Esta função permite configurar o enumerado do Setup4DUtility que contém as abreviaturas dos estados a serem considerados na consulta de CEP.
                           
            6. `function District(Const AValue : string): ISetup4DCEPFilterZipCodeAddress; overload;` 

               - Está função Está função permite configurar o nome da rua a ser considerados na consulta de CEP.
                           
            7. `function Types: string; overload;`

               - Está função é usado para obter os tipos de logradouro configurado no filtro de endereço do CEP. Isso pode ser útil para acessar e utilizar os critérios de filtro definidos.
            
            8. `function Street: string; overload;`

               - Está função é usado para obter o nome da rua configurado no filtro de endereço do CEP. Isso pode ser útil para acessar e utilizar os critérios de filtro definidos.

            9. `function City: string; overload;` 

               - Está função é usado para obter o nome da cidade configurado no filtro de endereço do CEP. Isso pode ser útil para acessar e utilizar os critérios de filtro definidos.

            10. `function StateAbbreviated: string; overload;`

                - Está função é usado para obter a abreviatura do estado configurado no filtro de endereço do CEP. Isso pode ser útil para acessar e utilizar os critérios de filtro definidos.
            
            11. `function District: string; overload;`

                - Está função é usado para obter o nome do bairro configurado no filtro de endereço do CEP. Isso pode ser útil para acessar e utilizar os critérios de filtro definidos.

            12. `function Finish: ISetup4DCEPFilterZipCode;` 

                - Este método é responsável por finalizar a configuração do filtro do Zip code e retornar a interface [ISetup4DCEPFilterZipCode](#-isetup4dcepfilterzipcode). É utilizado para concluir a configuração do filtro e obter uma referência à instância TSetup4DCEPFilterZipCode. Portanto, esta linha simplesmente retorna a referência à instância que a invocou.

      3. `function Finish: ISetup4DCEPFilter;`

         - Este método é responsável por finalizar a configuração do filtro e retornar a interface [ISetup4DCEPFilter](#-isetup4dcepfilter). É utilizado para concluir a configuração do filtro e obter uma referência à instância TSetup4DCEPFilter. Portanto, esta linha simplesmente retorna a referência à instância que a invocou.

##### ⚡️ `function IBGE:ISetup4DCEPFilterIBGE;`

   + Este método fornece uma instância que implementa a interface[ISetup4DCEPFilterIBGE](#-isetup4dcepfilteribge), permitindo o acesso aos filtros de pesquisa do IBGE. É importante destacar que existe um construtor disponível para garantir a reutilização do mesmo objeto de configuração ao longo da execução do [TSetup4DCep](#-funções-do-tsetup4dcep), evitando a necessidade de criar instâncias adicionais. Isso contribui para uma gestão eficiente e reduz a complexidade no desenvolvimento.

      1. `function Key:ISetup4DCEPFilterIBGEKey;`

         + Este método fornece uma instância que implementa a interface [ISetup4DCEPFilterIBGEKey](#-isetup4dcepfilteribgekey), permitindo o acesso às configuração do filtro pelo código do IBGE. É importante destacar que existe um construtor disponível para garantir a reutilização do mesmo objeto de configuração ao longo da execução do [TSetup4DCep](#-funções-do-tsetup4dcep), evitando a necessidade de criar instâncias adicionais. Isso contribui para uma gestão eficiente e reduz a complexidade no desenvolvimento.

            1. `function Value(Const AValue: string) : ISetup4DCEPFilterIBGEKey; overload;`

               - Esta função permite configurar o valor de consulta para o filtro do codigo do IBGE.

            2. `function Value : string; overload;`

               - Esta função é usado para obter o filtro definido para o código do IBGE. Isto é útil para acessar e utilizar os critérios definidos.

            3. `function Finish: ISetup4DCEPFilterIBGE;` 

               - Este método é responsável por finalizar a configuração do filtro do IBGE e retornar a interface [ISetup4DCEPFilterIBGE](#-isetup4dcepfilteribge). É utilizado para concluir a configuração do filtro e obter uma referência à instância TSetup4DCEPFilterIBGE. Portanto, esta linha simplesmente retorna a referência à instância que a invocou.

      2. `function Address:ISetup4DCEPFilterIBGEAddress;`

         + Este método fornece uma instância que implementa a interface [ISetup4DCEPFilterIBGEAddress](#-isetup4dcepfilteribgeaddress), permitindo o acesso às configuração do filtro pelo endereço. É importante destacar que existe um construtor disponível para garantir a reutilização do mesmo objeto de configuração ao longo da execução do [TSetup4DCep](#-funções-do-tsetup4dcep), evitando a necessidade de criar instâncias adicionais. Isso contribui para uma gestão eficiente e reduz a complexidade no desenvolvimento.  

            1. `function City(Const AValue : string): ISetup4DCEPFilterIBGEAddress; overload;`

               - Está função permite configurar o nome da cidade a ser considerados na consulta do IBGE.
            
            2. `function StateAbbreviated(Const AValue : string): ISetup4DCEPFilterIBGEAddress; overload;`

               - Está função permite configurar a abreviatura do estado a ser considerados na consulta do IBGE.

            3. `function StateAbbreviated(Const AValue : TSetup4DUtilityEstadoAbreviado): ISetup4DCEPFilterIBGEAddress; overload;` 

               - Esta função permite configurar o enumerado do Setup4DUtility que contém as abreviaturas dos estados a serem considerados na consulta do IBGE.

            4. `function City: string; overload;`

               - Está função é usado para obter o nome da cidade configurado no filtro de endereço do IBGE. Isso pode ser útil para acessar e utilizar os critérios de filtro definidos.
            
            5. `function StateAbbreviated: string; overload;`

               - Está função é usado para obter a abreviatura do estado configurado no filtro de endereço do CEP. Isso pode ser útil para acessar e utilizar os critérios de filtro definidos.

            6. `function Finish: ISetup4DCEPFilterIBGE;` 

               - Este método é responsável por finalizar a configuração do filtro do IBGE e retornar a interface [ISetup4DCEPFilterIBGE](#-isetup4dcepfilteribge). É utilizado para concluir a configuração do filtro e obter uma referência à instância TSetup4DCEPFilterIBGE. Portanto, esta linha simplesmente retorna a referência à instância que a invocou.

      3. `function Finish: ISetup4DCEPFilter;`
         - Este método é responsável por finalizar a configuração do filtro e retornar a interface [ISetup4DCEPFilter](#-isetup4dcepfilter). É utilizado para concluir a configuração do filtro e obter uma referência à instância TSetup4DCEPFilter. Portanto, esta linha simplesmente retorna a referência à instância que a invocou.

##### ⚡️ `function Clear : ISetup4DCEPFilter;`

   + Este método permite limpar todos os dados do filtro. É aconselhável usar esta função antes de informar o filtro de pesquisa para evitar resultados incorretos ou indesejados.
     
##### ⚡️ `function Finish: ISetup4DCEP;`

   + Este método fornece uma instância que implementa a interface [ISetup4DCEP](#-isetup4dcep). É utilizado para concluir a configuração e obter uma referência à instância principal de [TSetup4DCep](#-funções-do-tsetup4dcep). Portanto, esta linha simplesmente retorna a referência à instância que a invocou.

#### 🧬 `function Searech : ISetup4DCEPSearech;`

* Este método fornece uma instância que implementa a interface [ISetup4DCEPSearech](#-isetup4dcepsearech), permitindo o acesso à execução relacionada à pesquisa de CEP e IBGE. É importante destacar que existe um construtor disponível para garantir a reutilização do mesmo objeto de configuração ao longo da execução do [TSetup4DCep](#-funções-do-tsetup4dcep), evitando a necessidade de criar instâncias adicionais. Isso contribui para uma gestão eficiente e reduz a complexidade no desenvolvimento.

##### ⚡️ `function ZipCode: ISetup4DCEPSearechZipCode;`

   + Este método fornece uma instância que implementa a interface [ISetup4DCEPSearechZipCode](#-isetup4dcepsearechzipcode), permitindo executar as informações referentes ao filtro da pesquisa do CEP. É importante destacar que existe um construtor disponível para garantir a reutilização do mesmo objeto de configuração ao longo da execução do [TSetup4DCep](#-funções-do-tsetup4dcep), evitando a necessidade de criar instâncias adicionais. Isso contribui para uma gestão eficiente e reduz a complexidade no desenvolvimento.

      1. `function Reconfiguration: ISetup4DCEPSearechZipCode;`

         - Está função reconfigura o proxy e o web service da pesquisa de CEP.

      2. `function Code : ISetup4DCEPSearechZipCode;` 

         - Esta função efetua a pesquisa do código postal referente ao CEP, validando sua existência e a presença de informações. Ademais, lida com exceções relacionadas à ausência de DLLs da OpenSSL.

      3. `function Address : ISetup4DCEPSearechZipCode;`

         - Esta função é encarregada de executar uma consulta do CEP com base nas informações do endereço fornecidas. Ela verifica se todos os dados essenciais foram informados e trata possíveis exceções que possam surgir durante a consulta. 

      4. `function Component : TComponent;`
 
         - Essa função permite adquirir um componente relacionado a consulta do CEP que possibilita o acesso a funcionalidades adicionais.

      5. `function Finish: ISetup4DCEPSearech;`

         - Este método fornece uma instância que implementa a interface [ISetup4DCEPSearech](#-isetup4dcepsearech). É utilizado para concluir a execução e obter uma referência à instância principal de TSetup4DCEPSearech. Portanto, esta linha simplesmente retorna a referência à instância que a invocou.

##### ⚡️ `function IBGE: ISetup4DCEPSearechIBGE;`

   + Este método fornece uma instância que implementa a interface [ISetup4DCEPSearechIBGE](#-isetup4dcepsearechibge), permitindo executar as informações referentes ao filtro da pesquisa do IBGE. É importante destacar que existe um construtor disponível para garantir a reutilização do mesmo objeto de configuração ao longo da execução do [TSetup4DCep](#-funções-do-tsetup4dcep), evitando a necessidade de criar instâncias adicionais. Isso contribui para uma gestão eficiente e reduz a complexidade no desenvolvimento.

      1. `function Reconfiguration: ISetup4DCEPSearechIBGE;`

         - Está função reconfigura o proxy e o web service da pesquisa do IBGE.

      2. `function Code : ISetup4DCEPSearechIBGE;`

         - Esta função efetua a pesquisa do código referente ao IBGE, validando sua existência e a presença de informações. Ademais, lida com exceções relacionadas à ausência de DLLs da OpenSSL.

      3. `function State : ISetup4DCEPSearechIBGE;`

         - Está função permite buscar informações do IBGE relacionadas a um estado (UF) com base no filtro fornecido, tratando exceções específicas relacionadas a erros que podem ocorrer durante o processo de busca. 

      4. `function City : ISetup4DCEPSearechIBGE;` 

         - Está função permite buscar informações do IBGE relacionadas a uma cidade com base no filtro fornecido, tratando exceções específicas relacionadas a erros que podem ocorrer durante o processo de busca. 

      5. `function Component : TComponent;`

         - Está função permite adquirir um componente relacionado a consulta do IBGE que possibilita o acesso a funcionalidades adicionais.  

      6. `function Finish: ISetup4DCEPSearech;`

         - Este método fornece uma instância que implementa a interface [ISetup4DCEPSearech](#-isetup4dcepsearech). É utilizado para concluir a execução e obter uma referência à instância principal de TSetup4DCEPSearech. Portanto, esta linha simplesmente retorna a referência à instância que a invocou.

##### ⚡️ `function Finish: ISetup4DCEP;`

   + Este método fornece uma instância que implementa a interface [ISetup4DCEP](#-isetup4dcep). É utilizado para concluir a configuração e obter uma referência à instância principal de [TSetup4DCep](#-funções-do-tsetup4dcep). Portanto, esta linha simplesmente retorna a referência à instância que a invocou.

#### 🧬 `function Result : ISetup4DCEPResult;`

* Este método fornece uma instância que implementa a interface [ISetup4DCEPResult](#-isetup4dcepresult), permitindo o acesso aos resultados relacionados à pesquisa de CEP e IBGE. É importante destacar que existe um construtor disponível para garantir a reutilização do mesmo objeto de configuração ao longo da execução do [TSetup4DCep](#-funções-do-tsetup4dcep), evitando a necessidade de criar instâncias adicionais. Isso contribui para uma gestão eficiente e reduz a complexidade no desenvolvimento.

##### ⚡️ `function ZipCode: ISetup4DCEPResultZipCode;`

   + Este método fornece uma instância que implementa a interface [ISetup4DCEPResultZipCode](#-isetup4dcepresultzipcode), apresentando o resultado do CEP referente à execução dos filtros da pesquisa informados. É importante destacar que existe um construtor disponível para garantir a reutilização do mesmo objeto de configuração ao longo da execução do [TSetup4DCep](#-funções-do-tsetup4dcep), evitando a necessidade de criar instâncias adicionais. Isso contribui para uma gestão eficiente e reduz a complexidade no desenvolvimento.

      1. `function Display: iSetup4DCEPResultZipCodeDisplay;`

         - Essa função exibe os resultados de uma consulta do CEP após realizar a conversão necessária. Ela retorna uma instância pronta para a exibição dos resultados, conforme as opções a seguir:

            1. `function Code : string;`

               - Essa função obtém o código postal do CEP contido no objeto JSON, desde que o objeto JSON tenha sido informado. Se o objeto JSON não for informado, uma exceção é lançada.

            2. `function Types : string;`

               - Essa função obtém o tipo de logradouro (rua, avenida, praça, jardim, largo, caminho, etc...)  do CEP contido no objeto JSON, desde que o objeto JSON tenha sido informado. Se o objeto JSON não for informado, uma exceção é lançada. 

            3. `function Street : string;` 

               - Essa função obtém o nome da rua do CEP contido no objeto JSON, desde que o objeto JSON tenha sido informado. Se o objeto JSON não for informado, uma exceção é lançada.

            4. `function StreetComplete : string;` 

               - Essa função obtém o tipo e nome da rua do CEP contido no objeto JSON, desde que o objeto JSON tenha sido informado. Se o objeto JSON não for informado, uma exceção é lançada.

            5. `function Complement : string;`

               - Essa função obtém o complemento do CEP contido no objeto JSON, desde que o objeto JSON tenha sido informado. Se o objeto JSON não for informado, uma exceção é lançada. 

            6. `function District : string;` 

               - Essa função obtém o bairro do CEP contido no objeto JSON, desde que o objeto JSON tenha sido informado. Se o objeto JSON não for informado, uma exceção é lançada.

            7. `function City : string;` 

               - Essa função obtém a cidade do CEP contido no objeto JSON, desde que o objeto JSON tenha sido informado. Se o objeto JSON não for informado, uma exceção é lançada.

            8. `function IBGECity : string;`

               - Essa função obtém o código IBGE da cidade do CEP contido no objeto JSON, desde que o objeto JSON tenha sido informado. Se o objeto JSON não for informado, uma exceção é lançada.    

            9. `function State : string;` 

               - Essa função obtém o estado do CEP contido no objeto JSON, desde que o objeto JSON tenha sido informado. Se o objeto JSON não for informado, uma exceção é lançada.

            10. `function IBGEState : string;`

                - Essa função obtém o código IBGE do estado do CEP contido no objeto JSON, desde que o objeto JSON tenha sido informado. Se o objeto JSON não for informado, uma exceção é lançada. 

            11. `function DDD : string;` 

                - Essa função obtém o DDD (DISCAGEM DIRETA A DISTÂNCIA) do CEP contido no objeto JSON, desde que o objeto JSON tenha sido informado. Se o objeto JSON não for informado, uma exceção é lançada.

            12. `function GIA : string;`

                - Essa função obtém a GIA (Guia Nacional de Informação e Apuração do ICMS) do CEP contido no objeto JSON, desde que o objeto JSON tenha sido informado. Se o objeto JSON não for informado, uma exceção é lançada. 

            13. `function SIAFI : string;`

                - Essa função obtém a SIAFI (Sistema Integrado de Administração Financeira) do CEP contido no objeto JSON, desde que o objeto JSON tenha sido informado. Se o objeto JSON não for informado, uma exceção é lançada.  

            14. `function Altitude : string;` 

                - Essa função obtém a altitude do CEP contido no objeto JSON, desde que o objeto JSON tenha sido informado. Se o objeto JSON não for informado, uma exceção é lançada.

            15. `function Latitude : string;`

                - Essa função obtém a latitude do CEP contido no objeto JSON, desde que o objeto JSON tenha sido informado. Se o objeto JSON não for informado, uma exceção é lançada. 

            16. `function Longitude : string;`

                - Essa função obtém a longitude do CEP contido no objeto JSON, desde que o objeto JSON tenha sido informado. Se o objeto JSON não for informado, uma exceção é lançada. 

            17. `function JSON (Const AValue: TJSONObject) : iSetup4DCEPResultZipCodeDisplay; overload;` 

                - Este método obtém o objeto JSON que contém os resultados da consulta do CEP e, em seguida, verifica se o objeto foi informado antes de realizar as atribuições nos campos.

            18. `function Finish: iSetup4DCEPResultZipCode;` 

                - Este método fornece uma instância que implementa a interface [iSetup4DCEPResultZipCode](#-isetup4dcepresultZipCode). É utilizado para concluir a execução e obter uma referência à instância principal de TSetup4DCEPResultZipCode. Portanto, esta linha simplesmente retorna a referência à instância que a invocou.

      2. `function JSONObject(out AValue : TJSONObject): ISetup4DCEPResultZipCode; overload;` 

         - Este método possibilita obter um objeto JSON contendo os resultados da consulta do CEP.

      3. `function JSONObject: TJSONObject; overload;`

         - Este método possibilita obter o objeto JSON com os resultados da consulta do CEP.

      4. `function JSONObjectInStr: String; overload;`

         - Este método possibilita obter o objeto JSON String com os resultados da consulta do CEP. 

      5. `function JSONArray: TJSONArray; overload;`

         - Este método possibilita obter o objeto JSON Array com os resultados da consulta do CEP.

      6. `function RecordCount : Int64;`

         - Este método possibilita obter o total de endereços encontrado (Inteiro) com os resultados da consulta de CEP.

      7. `function RecordCountInStr : string;`

         - Este método possibilita obter o total de endereços encontrado (String) com os resultados da consulta de CEP.

      8. `function Finish: ISetup4DCEPResult;`

         - Este método fornece uma instância que implementa a interface [ISetup4DCEPResult](#-isetup4dcepresult). É utilizado para concluir a execução e obter uma referência à instância principal de TSetup4DCEPResult. Portanto, esta linha simplesmente retorna a referência à instância que a invocou.

##### ⚡️ `function IBGE: ISetup4DCEPResultIBGE;`

   + Este método fornece uma instância que implementa a interface [ISetup4DCEPResultIBGE](#-isetup4dcepresultibge), apresentando o resultado do IBGE referente à execução dos filtros da pesquisa informados. É importante destacar que existe um construtor disponível para garantir a reutilização do mesmo objeto de configuração ao longo da execução do [TSetup4DCep](#-funções-do-tsetup4dcep), evitando a necessidade de criar instâncias adicionais. Isso contribui para uma gestão eficiente e reduz a complexidade no desenvolvimento.

      1. `function Display: iSetup4DCEPResultIBGEDisplay;`

         - Essa função exibe os resultados de uma consulta do IBGE após realizar a conversão necessária. Ela retorna uma instância pronta para a exibição dos resultados, conforme as opções a seguir:

            1. `function StateCode : string;` 

               - Essa função obtém o código do IBGE do estado contido no objeto JSON, desde que o objeto JSON tenha sido informado. Se o objeto JSON não for informado, uma exceção é lançada.

            2. `function State : string;` 

               - Essa função obtém o estado do IBGE contido no objeto JSON, desde que o objeto JSON tenha sido informado. Se o objeto JSON não for informado, uma exceção é lançada.

            3. `function CityCode : string;`

               - Essa função obtém o código do IBGE da cidade contido no objeto JSON, desde que o objeto JSON tenha sido informado. Se o objeto JSON não for informado, uma exceção é lançada. 

            4. `function City : string;` 

               - Essa função obtém a cidade do IBGE contido no objeto JSON, desde que o objeto JSON tenha sido informado. Se o objeto JSON não for informado, uma exceção é lançada.    

            5. `function Zone : string;` 

               - Essa função obtém o tamanho da área do IBGE contido no objeto JSON, desde que o objeto JSON tenha sido informado. Se o objeto JSON não for informado, uma exceção é lançada. 

            6. `function JSON (Const AValue: TJSONObject) : iSetup4DCEPResultIBGEDisplay; overload;` 

               - Este método obtém o objeto JSON que contém os resultados da consulta do CEP e, em seguida, verifica se o objeto foi informado antes de realizar as atribuições nos campos.

            7. `function Finish: iSetup4DCEPResultIBGE;`

               - Este método fornece uma instância que implementa a interface [iSetup4DCEPResultIBGE](#-isetup4dcepresultibge). É utilizado para concluir a execução e obter uma referência à instância principal de TSetup4DCEPResultIBGE. Portanto, esta linha simplesmente retorna a referência à instância que a invocou. 

      2. `function JSONObject(out AValue : TJSONObject): ISetup4DCEPResultIBGE; overload;` 

         - Este método possibilita obter um objeto JSON contendo os resultados da consulta do IBGE.

      3. `function JSONObject: TJSONObject; overload;`

         - Este método possibilita obter o objeto JSON com os resultados da consulta do IBGW.

      4. `function JSONObjectInStr: String; overload;` 

         - Este método possibilita obter o objeto JSON String com os resultados da consulta do CEP.

      5. `function Finish: ISetup4DCEPResult;`

         - Este método fornece uma instância que implementa a interface [ISetup4DCEPResult](#-isetup4dcepresult). É utilizado para concluir a execução e obter uma referência à instância principal de TSetup4DCEPResult. Portanto, esta linha simplesmente retorna a referência à instância que a invocou.

##### ⚡️ `function Finish: ISetup4DCEP;`

   + Este método fornece uma instância que implementa a interface [ISetup4DCEP](#-isetup4dcep). É utilizado para concluir a configuração e obter uma referência à instância principal de [TSetup4DCep](#-funções-do-tsetup4dcep). Portanto, esta linha simplesmente retorna a referência à instância que a invocou.
