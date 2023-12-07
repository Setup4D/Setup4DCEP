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

## 💻 Como utilizar

### ⚙️ Instalação

#### 🚀 Automática (via boss)

 * O uso do [**Boss**](https://github.com/HashLoad/boss) é recomendado para facilitar a instalação do Setup4DCEP. Basta executar o seguinte comando em um terminal, como o Windows PowerShell, para realizar a instalação de forma mais conveniente:

   ```shell
   boss install github.com/Setup4D/Setup4DCEP
   ```

   + Isso automatiza o processo de instalação e gerenciamento de dependências, tornando a configuração do Setup4DCEP mais simples. Certifique-se de que o Boss esteja configurado e pronto para uso em seu ambiente Delphi antes de executar esse comando.

#### 🚧 Manual (Delphi)

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
### 📚 Dependências

* Este projeto depende do [**Setup4DUtility**](https://github.com/Setup4D/Setup4DUtility), desempenhando um papel crucial em suas funcionalidades operacionais. Quando você utiliza o [**Boss**](https://github.com/HashLoad/boss) como instalador do framework, a instalação do **Setup4DUtility** ocorre automaticamente. No entanto, se optar por uma instalação manual, siga os passos abaixo:

   1. Faça o [**download**](https://github.com/Setup4D/Setup4DUtility/archive/refs/heads/main.zip) do projeto ou acesse a  [**pagina do projeto**](https://github.com/Setup4D/Setup4DUtility) e realize o download.
   2. Descompacte o arquivo baixado em uma pasta de sua escolha.
   3. Adicione a pasta extraída ao seu projeto, indo para *Project > Options > Resource Compiler > Directories and Conditionals > Include file search path*.<p>      
   
   ```
   ./{Pasta}/src
   ```

## 🌐 Modo de uso

### 🎤 Idioma das mensagens

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

### 🎯 Métodos

#### 📦 `function Configuration: ISetup4DCEPConfiguration`

Este método retorna ou cria uma instância da configuração associada ao serviço de CEP.

- **Retorno:**
  - Uma instância de `ISetup4DCEPConfiguration` associada ao serviço de CEP.

---

#### 🧹 `function Filter: ISetup4DCEPFilter`

Este método retorna ou cria uma instância do filtro associado ao serviço de CEP.

- **Retorno:**
  - Uma instância de `ISetup4DCEPFilter` associada ao serviço de CEP.

---

#### 🕵️‍♂️ `function Search: ISetup4DCEPSearch`

Este método retorna ou cria uma instância da busca associada ao serviço de CEP. 

- **Exceções:**
  - `EConvertError`: Lançada se a configuração, filtro ou resultado não estiverem instanciados.

- **Retorno:**
  - Uma instância de `ISetup4DCEPSearch` associada ao serviço de CEP.

---

#### 🎯 `function Result: ISetup4DCEPResult`

Este método retorna ou cria uma instância do resultado associado ao serviço de CEP.

- **Retorno:**
  - Uma instância de `ISetup4DCEPResult` associada ao serviço de CEP.

---

#### 📡 `Exemplo`

  ```delphi
  uses
    Setup4D.CEP,
    Setup4D.CEP.interf;

  var
    FCEP : ISetup4DCEP;
    
  begin
    FCEP := TSetup4DCEP.New;
  end;
  ```   

---

## 📐 Funções do TSetup4DCepConfiguration

A classe `TSetup4DCepConfiguration` desempenha um papel crucial na configuração do TSetup4DCep, fornecendo um conjunto de funcionalidades para personalizar e ajustar o comportamento do framework. Implementa a interface `ISetup4DCEPConfiguration` e serve como uma referência essencial para a configuração do TSetup4DCep.

### 🎯 Métodos

#### 🌐 `function Proxy: ISetup4DCEPConfigurationProxy`

Este método retorna ou cria uma instância do proxy associado à configuração do serviço de CEP.

- **Retorno:**
  - Uma instância de `ISetup4DCEPConfigurationProxy` associada à configuração do serviço de CEP.

---

#### 🚀 `function WebService: ISetup4DCEPConfigurationWebService`

Este método retorna ou cria uma instância das configurações do web service associado à configuração do serviço de CEP.

- **Retorno:**
  - Uma instância de `ISetup4DCEPConfigurationWebService` associada à configuração do serviço de CEP.

---

#### 🏁 `function Finish: ISetup4DCEP`

Este método retorna a instância principal do serviço de CEP.

- **Retorno:**
  - Uma instância de `ISetup4DCEP` associada ao serviço de CEP.

---

## 📐 Funções do TSetup4DCepConfigurationProxy

A classe `TSetup4DCepConfigurationProxy` desempenha um papel crucial na configuração do TSetup4DCep, fornecendo funcionalidades para personalizar e ajustar as opções relacionadas ao proxy. Implementa a interface `ISetup4DCEPConfigurationProxy` e serve como uma referência essencial para a configuração do proxy.

### 🎯 Métodos

#### ⚙️ `function Host(const AValue: string): ISetup4DCEPConfigurationProxy`

Este método permite configurar o host associado ao proxy do serviço de CEP.

- **Parâmetros:**
  - `AValue`: O valor do host a ser configurado.
- **Retorno:**
  - Uma instância de `ISetup4DCEPConfigurationProxy` com a configuração do host atualizada.

---

#### ⚙️ `function Port(const AValue: string): ISetup4DCEPConfigurationProxy`

Este método permite configurar a porta associada ao proxy do serviço de CEP.

- **Parâmetros:**
  - `AValue`: O valor da porta a ser configurado.
- **Retorno:**
  - Uma instância de `ISetup4DCEPConfigurationProxy` com a configuração da porta atualizada.

---

#### ⚙️ `function Port(const AValue: Integer): ISetup4DCEPConfigurationProxy`

Este método permite configurar a porta associada ao proxy do serviço de CEP.

- **Parâmetros:**
  - `AValue`: O valor da porta a ser configurado.
- **Retorno:**
  - Uma instância de `ISetup4DCEPConfigurationProxy` com a configuração da porta atualizada.

---

#### ⚙️ `function User(const AValue: string): ISetup4DCEPConfigurationProxy`

Este método permite configurar o nome de usuário associado ao proxy do serviço de CEP.

- **Parâmetros:**
  - `AValue`: O valor do nome de usuário a ser configurado.
- **Retorno:**
  - Uma instância de `ISetup4DCEPConfigurationProxy` com a configuração do nome de usuário atualizada.

---

#### ⚙️ `function Password(const AValue: string): ISetup4DCEPConfigurationProxy`

Este método permite configurar a senha associada ao proxy do serviço de CEP.

- **Parâmetros:**
  - `AValue`: O valor da senha a ser configurada.
- **Retorno:**
  - Uma instância de `ISetup4DCEPConfigurationProxy` com a configuração da senha atualizada.

---

#### ⚙️ `function Host: string`

Este método retorna o valor atualmente configurado para o host associado ao proxy do serviço de CEP.

- **Retorno:**
  - Uma string contendo o valor atualmente configurado para o host do proxy.

---

#### ⚙️ `function Port: Integer`

Este método retorna o valor atualmente configurado para a porta associada ao proxy do serviço de CEP.

- **Retorno:**
  - Um inteiro contendo o valor atualmente configurado para a porta do proxy.

---

#### ⚙️ `function User: string`

Este método retorna o valor atualmente configurado para o nome de usuário associado ao proxy do serviço de CEP.

- **Retorno:**
  - Uma string contendo o valor atualmente configurado para o nome de usuário do proxy.

---

#### ⚙️ `function Password: string`

Este método retorna o valor atualmente configurado para a senha associada ao proxy do serviço de CEP.

- **Retorno:**
  - Uma string contendo o valor atualmente configurado para a senha do proxy.

---

#### ⚙️ `function Finish: ISetup4DCEPConfiguration`

Este método finaliza a configuração do proxy do serviço de CEP, retornando à interface principal de configuração.

- **Retorno:**
  - Uma instância de `ISetup4DCEPConfiguration` para permitir a continuação da configuração.

---

#### 📡 `Exemplo`

- **Inserir:**

  ```delphi
  begin
    FCEP
      .Configuration
        .Proxy
          .Host([HOST PROXY EM STRING])
          .Port([PORTA DO PROXY EM INTERGER])
          .User([NOME DO USUARIO EM STRING])
          .Password([SENHA DO USUARIO EM STRING])
        .Finish
      .Finish
    .Finish
  end;
  ```   

- **Ler:**

  ```delphi
  begin
    ShowMessage(FCEP.Configuration.Proxy.Host);
    ShowMessage(FCEP.Configuration.Proxy.Port.ToString);
    ShowMessage(FCEP.Configuration.Proxy.User);
    ShowMessage(FCEP.Configuration.Proxy.Password);
  end;
  ```   

---


## 📐 Funções do TSetup4DCepConfigurationWebService

A classe `TSetup4DCepConfigurationWebService` desempenha um papel crucial na configuração do TSetup4DCep, fornecendo funcionalidades para personalizar e ajustar as opções relacionadas ao serviço web. Implementa a interface `ISetup4DCEPConfigurationWebService` e serve como uma referência essencial para a configuração do serviço web.

### 🎯 Métodos

#### ⚙️ `function BaseURL(const AValue: string): ISetup4DCEPConfigurationWebService`

Este método permite definir a URL base associada ao serviço web do serviço de CEP.

- **Parâmetros:**
  - `AValue`: Uma string contendo a URL base a ser associada ao serviço web.

- **Retorno:**
  - A instância atual da configuração do serviço web de CEP (`ISetup4DCEPConfigurationWebService`).

---

#### ⚙️ `function BaseURL: string`

Este método retorna o valor atualmente configurado para a URL base associada ao serviço web do serviço de CEP.

- **Retorno:**
  - Uma string contendo o valor atualmente configurado para a URL base do serviço web.

---

#### ⚙️ `function Key(const AValue: string): ISetup4DCEPConfigurationWebService`

Este método permite definir a chave associada ao serviço web do serviço de CEP.

- **Parâmetros:**
  - `AValue`: Uma string contendo a chave a ser associada ao serviço web.

- **Retorno:**
  - A instância atual da configuração do serviço web de CEP (`ISetup4DCEPConfigurationWebService`).

---

#### ⚙️ `function Key: string`

Este método retorna o valor atualmente configurado para a chave associada ao serviço web do serviço de CEP.

- **Retorno:**
  - Uma string contendo o valor atualmente configurado para a chave do serviço web.  

---

#### ⚙️ `function User(const AValue: string): ISetup4DCEPConfigurationWebService`

Este método permite definir o nome de usuário associado ao serviço web do serviço de CEP.

- **Parâmetros:**
  - `AValue`: Uma string contendo o nome de usuário a ser associado ao serviço web.

- **Retorno:**
  - A instância atual da configuração do serviço web de CEP (`ISetup4DCEPConfigurationWebService`).

---

#### ⚙️ `function User: string`

Este método retorna o valor atualmente configurado para o nome de usuário associado ao serviço web do serviço de CEP.

- **Retorno:**
  - Uma string contendo o valor atualmente configurado para o nome de usuário do serviço web.

---

#### ⚙️ `function Password(const AValue: string): ISetup4DCEPConfigurationWebService`

Este método permite definir a senha associada ao serviço web do serviço de CEP.

- **Parâmetros:**
  - `AValue`: Uma string contendo a senha a ser associada ao serviço web.

- **Retorno:**
  - A instância atual da configuração do serviço web de CEP (`ISetup4DCEPConfigurationWebService`).

---

#### ⚙️ `function Password: string`

Este método retorna o valor atualmente configurado para a senha associada ao serviço web do serviço de CEP.

- **Retorno:**
  - Uma string contendo o valor atualmente configurado para a senha do serviço web.

---

#### ⚙️ `function UpperText(const AValue: Boolean): ISetup4DCEPConfigurationWebService`

Este método permite definir se a formatação do texto (como o nome do logradouro) deve ser convertida para maiúsculas.

- **Parâmetros:**
  - `AValue`: Um valor booleano indicando se a formatação do texto deve ser convertida para maiúsculas.

- **Retorno:**
  - A instância atual da configuração do serviço web de CEP (`ISetup4DCEPConfigurationWebService`).

---

#### ⚙️ `function UpperText: Boolean`

Este método retorna o valor atualmente configurado para a conversão de texto em maiúsculas.

- **Retorno:**
  - Um valor booleano indicando se a formatação do texto deve ser convertida para maiúsculas.

---

#### ⚙️ `function UpperTextInString: string`

Este método retorna uma representação em string do valor atualmente configurado para a conversão de texto em maiúsculas.

- **Retorno:**
  - Uma string contendo "True" se a conversão para maiúsculas estiver ativada, ou "False" se estiver desativada.

---

#### ⌛ `function TimeOut(const AValue: Integer): ISetup4DCEPConfigurationWebService`

Este método permite configurar o tempo limite (timeout) para solicitações ao serviço web de CEP.

- **Parâmetros:**
  - `AValue`: O valor do tempo limite em milissegundos.

- **Retorno:**
  - A instância atual da configuração do serviço web de CEP (`ISetup4DCEPConfigurationWebService`).

---

#### ⌛ `function TimeOut(const AValue: string): ISetup4DCEPConfigurationWebService`

Este método permite configurar o tempo limite (timeout) para solicitações ao serviço web de CEP, onde `AValue` é uma string que será convertida para um valor inteiro representando os milissegundos do timeout.

- **Parâmetros:**
  - `AValue`: A string que representa o valor do tempo limite em milissegundos.

- **Retorno:**
  - A instância atual da configuração do serviço web de CEP (`ISetup4DCEPConfigurationWebService`).

---

#### ⌛ `function TimeOut: Integer`

Este método retorna o valor atualmente configurado para o tempo limite (timeout) de solicitações ao serviço web de CEP.

- **Retorno:**
  - Um valor inteiro representando o tempo limite em milissegundos.

---

#### 🔧 `function Finish: ISetup4DCEPConfiguration`

Este método conclui a configuração do serviço web no contexto do Setup4DCEP.

- **Retorno:**
  - Uma instância de `ISetup4DCEPConfiguration` para permitir métodos encadeados na configuração do serviço web.

---

#### 📡 `Exemplo`

- **Inserir:**

  ```delphi
  begin
    FCEP
      .Configuration
        .WebService
            .User([NOME DO USUARIO EM STRING])
            .Password([SENHA DO USUARIO EM STRING])
            .Key([CHAVE DE ACESSO EM STRING])
            .TimeOut([TEMPO DE ESPERA EM INTEGER])
            .UpperText([LETRAS MAISUCULAS EM BOOLEAN])
        .Finish
      .Finish
    .Finish
  end;
  ```   

- **Ler:**

  ```delphi
  begin
    ShowMessage(FCEP.Configuration.Proxy.Key);
    ShowMessage(FCEP.Configuration.Proxy.TimeOut.ToString);
    ShowMessage(FCEP.Configuration.Proxy.User);
    ShowMessage(FCEP.Configuration.Proxy.Password);
    ShowMessage(BoolToStr(FCEP.Configuration.Proxy.UpperText));
  end;
  ```   

---

## 📐 Funções do TSetup4DCEPFilter

A classe `TSetup4DCEPFilter` desempenha um papel crucial no TSetup4DCep, oferecendo funcionalidades para aplicar filtros e personalizar o comportamento do framework. Implementa a interface `ISetup4DCEPFilter` e serve como uma referência essencial para a aplicação de filtros no TSetup4DCep.

### 🎯 Métodos

#### 📍 `function ZipCode: ISetup4DCEPFilterZipCode`

Este método permite configurar filtros relacionados ao CEP, mais especificamente ao código postal.

- **Retorno:**
  - Uma instância de `ISetup4DCEPFilterZipCode` que oferece métodos adicionais para configuração de filtros específicos do código postal.

---

#### 📍 `function IBGE: ISetup4DCEPFilterIBGE`

Este método permite configurar filtros relacionados ao código do IBGE (Instituto Brasileiro de Geografia e Estatística).

- **Retorno:**
  - Uma instância de `ISetup4DCEPFilterIBGE` que oferece métodos adicionais para configuração de filtros específicos do código IBGE.

---

#### 📍 `function Clear: ISetup4DCEPFilter`

Este método limpa todos os filtros anteriormente configurados no objeto.

- **Retorno:**
  - A instância atual da configuração de filtro do serviço web de CEP (`ISetup4DCEPFilter`).

---

#### 📍 `function Finish: ISetup4DCEP`

Este método finaliza a configuração dos filtros do serviço web de CEP e retorna à instância principal (`ISetup4DCEP`) para permitir a continuação da configuração geral.

- **Retorno:**
  - A instância principal do serviço web de CEP (`ISetup4DCEP`).

---

## 📐 Funções do TSetup4DCEPFilterZipCode

A classe `TSetup4DCEPFilterZipCode` desempenha um papel crucial no TSetup4DCep, proporcionando funcionalidades específicas para filtrar e personalizar o comportamento do framework em relação aos CEPs. Implementa a interface `ISetup4DCEPFilterZipCode` e serve como uma referência essencial para a aplicação de filtros de CEP no TSetup4DCep.

### 🎯 Métodos

#### 📍 `function Value: string`

Este método retorna o valor atualmente configurado para o filtro de CEP.

- **Retorno:**
  - Uma string contendo o valor atual do filtro de CEP.

---

#### 📍 `function Value(const AValue: string): ISetup4DCEPFilterZipCode`

Este método permite definir o valor do filtro de CEP.

- **Parâmetros:**
  - `AValue`: Uma string representando o valor do filtro de CEP.

- **Retorno:**
  - A instância atual da configuração do filtro de CEP (`ISetup4DCEPFilterZipCode`).

---

#### 📍 `function Street: string`

Este método retorna o valor atualmente configurado para o filtro de logradouro.

- **Retorno:**
  - Uma string contendo o valor atual do filtro de logradouro.

---

#### 📍 `function Street(const AValue: string): ISetup4DCEPFilterZipCode`

Este método permite definir o valor do filtro de logradouro.

- **Parâmetros:**
  - `AValue`: Uma string representando o valor do filtro de logradouro.

- **Retorno:**
  - A instância atual da configuração do filtro de CEP (`ISetup4DCEPFilterZipCode`).

---

#### 📍 `function District: string`

Este método retorna o valor atualmente configurado para o filtro de bairro.

- **Retorno:**
  - Uma string contendo o valor atual do filtro de bairro.

---

#### 📍 `function District(const AValue: string): ISetup4DCEPFilterZipCode`

Este método permite definir o valor do filtro de bairro.

- **Parâmetros:**
  - `AValue`: Uma string representando o valor do filtro de bairro.

- **Retorno:**
  - A instância atual da configuração do filtro de CEP (`ISetup4DCEPFilterZipCode`).

---

#### 📍 `function City: string`

Este método retorna o valor atualmente configurado para o filtro de cidade.

- **Retorno:**
  - Uma string contendo o valor atual do filtro de cidade.

---

#### 📍 `function City(const AValue: string): ISetup4DCEPFilterZipCode`

Este método permite definir o valor do filtro de cidade.

- **Parâmetros:**
  - `AValue`: Uma string representando o valor do filtro de cidade.

- **Retorno:**
  - A instância atual da configuração do filtro de CEP (`ISetup4DCEPFilterZipCode`).

---

#### 📍 `function State: string`

Este método retorna o valor atualmente configurado para o filtro de estado.

- **Retorno:**
  - Uma string contendo o valor atual do filtro de estado.

---

#### 📍 `function State(const AValue: string): ISetup4DCEPFilterZipCode`

Este método permite definir o valor do filtro de estado.

- **Parâmetros:**
  - `AValue`: Uma string representando o valor do filtro de estado.

- **Retorno:**
  - A instância atual da configuração do filtro de CEP (`ISetup4DCEPFilterZipCode`).

---

#### 📍 `function State(const AValue: TSetup4DUtilityEstadoAbreviado): ISetup4DCEPFilterZipCode`

Este método permite definir o valor do filtro de estado usando a enumeração `TSetup4DUtilityEstadoAbreviado`.

- **Parâmetros:**
  - `AValue`: Um valor da enumeração `TSetup4DUtilityEstadoAbreviado`.

- **Retorno:**
  - A instância atual da configuração do filtro de CEP (`ISetup4DCEPFilterZipCode`).

---

#### 📍 `function State(const AValue: TSetup4DUtilityEstado): ISetup4DCEPFilterZipCode`

Este método permite definir o valor do filtro de estado usando a enumeração `TSetup4DUtilityEstado`.

- **Parâmetros:**
  - `AValue`: Um valor da enumeração `TSetup4DUtilityEstado`.

- **Retorno:**
  - A instância atual da configuração do filtro de CEP (`ISetup4DCEPFilterZipCode`).

---

#### 🚀 `function Finish: ISetup4DCEPFilter`

Este método retorna a instância pai, permitindo concluir a configuração específica para o filtro de CEP por código postal.

- **Retorno:**
  - A instância da configuração do filtro de CEP (`ISetup4DCEPFilter`).

---

#### 📡 `Exemplo`

- **Filtrar CEP:**

  ```delphi
  begin
    FCEP
      .Filter
        .Clear
        .ZipCode
          .Value([CEP PARA FILTRAR EM STRING])
        .Finish
      .Finish
    .Finish
  end;
  ```   

- **Filtrar Endereço:**

  ```delphi
  begin
    FCEP
      .Filter
        .Clear
        .ZipCode
          .Street([NOME DA RUA EM STRING])
          .District([NOME DO BAIRRO EM STRING])
          .City([NOME DA CIDADE EM STRING])
          .State([NOME DO ESTADO EM STRING])
        .Finish
      .Finish
    .Finish
  end;
  ```   

- **Ler:**

  ```delphi
  begin
    ShowMessage(FCEP.Filter.ZipCode.Value);
    ShowMessage(FCEP.Filter.ZipCode.Street);
    ShowMessage(FCEP.Filter.ZipCode.District);
    ShowMessage(FCEP.Filter.ZipCode.City);
    ShowMessage(FCEP.Filter.ZipCode.State);
  end;
  ``` 

---


## 📐 Funções do TSetup4DCEPFilterIBGE

A classe `TSetup4DCEPFilterIBGE` desempenha um papel crucial no TSetup4DCep, oferecendo funcionalidades específicas para filtrar e personalizar o comportamento do framework em relação aos códigos IBGE. Implementa a interface `ISetup4DCEPFilterIBGE` e serve como uma referência essencial para a aplicação de filtros de código IBGE no TSetup4DCep.

### 🎯 Métodos


#### 📍 `function Code: string`

Este método retorna o valor atualmente configurado para o filtro de código IBGE.

- **Retorno:**
  - Uma string contendo o valor atual do filtro de código IBGE.

---

#### 📍 `function Code(const AValue: string): ISetup4DCEPFilterIBGE`

Este método permite definir o valor do filtro de código IBGE.

- **Parâmetros:**
  - `AValue`: Uma string representando o valor do filtro de código IBGE.

- **Retorno:**
  - A instância atual da configuração do filtro de CEP (`ISetup4DCEPFilterIBGE`).

---

#### 📍 `function Country: string`

Este método retorna o valor atualmente configurado para o filtro de país no código IBGE.

- **Retorno:**
  - Uma string contendo o valor atual do filtro de país no código IBGE.

---

#### 📍 `function Country(const AValue: string): ISetup4DCEPFilterIBGE`

Este método permite definir o valor do filtro de país no código IBGE.

- **Parâmetros:**
  - `AValue`: Uma string representando o valor do filtro de país no código IBGE.

- **Retorno:**
  - A instância atual da configuração do filtro de CEP (`ISetup4DCEPFilterIBGE`).

---

#### 📍 `function City: string`

Este método retorna o valor atualmente configurado para o filtro de cidade no código IBGE.

- **Retorno:**
  - Uma string contendo o valor atual do filtro de cidade no código IBGE.

---

#### 📍 `function City(const AValue: string): ISetup4DCEPFilterIBGE`

Este método permite definir o valor do filtro de cidade no código IBGE.

- **Parâmetros:**
  - `AValue`: Uma string representando o valor do filtro de cidade no código IBGE.

- **Retorno:**
  - A instância atual da configuração do filtro de CEP (`ISetup4DCEPFilterIBGE`).

---

#### 📍 `function State: string`

Este método retorna o valor atualmente configurado para o filtro de estado no código IBGE.

- **Retorno:**
  - Uma string contendo o valor atual do filtro de estado no código IBGE.

---

#### 📍 `function State(const AValue: string): ISetup4DCEPFilterIBGE`

Este método permite definir o valor do filtro de estado no código IBGE.

- **Parâmetros:**
  - `AValue`: Uma string representando o valor do filtro de estado no código IBGE.

- **Retorno:**
  - A instância atual da configuração do filtro de CEP (`ISetup4DCEPFilterIBGE`).

---

#### 📍 `function State(const AValue: TSetup4DUtilityEstado): ISetup4DCEPFilterIBGE`

Este método permite definir o valor do filtro de estado no código IBGE usando a enumeração `TSetup4DUtilityEstado`.

- **Parâmetros:**
  - `AValue`: Um valor da enumeração `TSetup4DUtilityEstado` representando o estado no código IBGE.

- **Retorno:**
  - A instância atual da configuração do filtro de CEP (`ISetup4DCEPFilterIBGE`).

---

#### 📍 `function State(const AValue: TSetup4DUtilityEstadoAbreviado): ISetup4DCEPFilterIBGE`

Este método permite definir o valor do filtro de estado no código IBGE usando a enumeração `TSetup4DUtilityEstadoAbreviado`.

- **Parâmetros:**
  - `AValue`: Um valor da enumeração `TSetup4DUtilityEstadoAbreviado` representando o estado no código IBGE.

- **Retorno:**
  - A instância atual da configuração do filtro de CEP (`ISetup4DCEPFilterIBGE`).

---

#### 🚀 `function Finish: ISetup4DCEPFilter`

Este método retorna a instância pai, permitindo concluir a configuração do filtro de CEP.

- **Retorno:**
  - A instância da configuração do filtro de CEP (`ISetup4DCEPFilter`).

---

#### 📡 `Exemplo`

- **Filtrar Código:**

  ```delphi
  begin
    FCEP
      .Filter
        .Clear
        .IBGE
          .Code([CODIGO IBGE PARA FILTRAR EM STRING])
        .Finish
      .Finish
    .Finish
  end;
  ```   

- **Filtrar Cidade:**

  ```delphi
  begin
    FCEP
      .Filter
        .Clear
        .IBGE
          .City([NOME DA CIDADE EM STRING])
          .State([NOME DO ESTADO EM STRING])
        .Finish
      .Finish
    .Finish
  end;
  ```   

- **Filtrar Estado:**

  ```delphi
  begin
    FCEP
      .Filter
        .Clear
        .IBGE
          .State([NOME DO ESTADO EM STRING])
        .Finish
      .Finish
    .Finish
  end;
  ```   

- **Filtrar Pais:**

  ```delphi
  begin
    FCEP
      .Filter
        .Clear
        .IBGE
          .Country([NOME DA RUA EM STRING])
        .Finish
      .Finish
    .Finish
  end;
  ```   

- **Ler:**

  ```delphi
  begin
    ShowMessage(FCEP.Filter.IBGE.Code);
    ShowMessage(FCEP.Filter.IBGE.City);
    ShowMessage(FCEP.Filter.IBGE.State);
    ShowMessage(FCEP.Filter.IBGE.Country);
  end;
  ``` 

---

## 📐 Funções do TSetup4DCEPSearech

A classe `TSetup4DCEPSearech` desempenha um papel crucial no TSetup4DCep, fornecendo funcionalidades para realizar pesquisas e consultas relacionadas a CEPs. Implementa a interface `ISetup4DCEPSearech` e serve como uma referência essencial para a realização de pesquisas no TSetup4DCep.

### 🎯 Métodos

#### 🏠 `function ZipCode: ISetup4DCEPSearechZipCode`

Este método retorna a instância para realizar a pesquisa de CEP por código postal.

- **Retorno:**
  - A instância da pesquisa de CEP por código postal (`ISetup4DCEPSearechZipCode`).

Este método lança uma exceção do tipo `EConvertError` se as instâncias de configuração (`ISetup4DCEPConfiguration`), filtro (`ISetup4DCEPFilter`), ou resultado (`ISetup4DCEPResult`) não estiverem devidamente instanciadas.

#### 🌍 `function IBGE: ISetup4DCEPSearechIBGE`

Este método retorna a instância para realizar a pesquisa de CEP por código IBGE.

- **Retorno:**
  - A instância da pesquisa de CEP por código IBGE (`ISetup4DCEPSearechIBGE`).

Este método lança uma exceção do tipo `EConvertError` se as instâncias de configuração (`ISetup4DCEPConfiguration`), filtro (`ISetup4DCEPFilter`), ou resultado (`ISetup4DCEPResult`) não estiverem devidamente instanciadas.

---

#### 🏁 `function Finish: ISetup4DCEP`

Este método finaliza a configuração da pesquisa de CEP e retorna à instância principal (`ISetup4DCEP`).

- **Retorno:**
  - A instância principal da configuração de CEP (`ISetup4DCEP`).
  
---

## 📐 Funções do TSetup4DCEPSearechZipCode

A classe `TSetup4DCEPSearechZipCode` desempenha um papel crucial no TSetup4DCep, proporcionando funcionalidades específicas para realizar pesquisas e consultas relacionadas a CEPs. Implementa a interface `ISetup4DCEPSearechZipCode` e serve como uma referência essencial para a realização de pesquisas de CEP no TSetup4DCep.

### 🎯 Métodos

#### 🚀 `function Value: ISetup4DCEPSearechZipCode`

Este método realiza a pesquisa de CEP com base no CEP especificado.

- **Requisitos:**
  - O CEP deve ser especificado no filtro de pesquisa.

- **Códigos de Resposta:**
  - **200 OK:** Os dados do CEP foram encontrados e são disponibilizados.
  - **400 Bad Request:** O servidor não conseguiu entender a requisição. O corpo da resposta contém detalhes sobre o erro.
  - **404 Not Found:** O CEP especificado não foi encontrado.

- **Exceções:**
  - Se o CEP não for especificado, uma exceção será lançada indicando a informação requerida.

- **Retorno:**
  - A instância da pesquisa de CEP (`ISetup4DCEPSearechZipCode`).

---

#### 📡 `Exemplo`

  ```delphi
  begin
    FCEP
      .Searech
        .ZipCode
          .Value
        .Finish
      .Finish;
  end;
  ```   

---

#### 🚀 `function Address(AAll: Boolean): ISetup4DCEPSearechZipCode`

Este método realiza uma pesquisa do CPE com base nas informações do filtro referente ao endereço.

- **Requisitos:**
  - Os campos obrigatórios para pesquisa devem ser especificados no filtro:

    - **Street (Rua):** Este campo refere-se ao nome da rua onde o endereço está localizado. É crucial incluir este campo para que a pesquisa seja específica em relação à rua desejada.

    - **District (Bairro):** O bairro é outra parte importante de um endereço. Incluir este campo permite uma busca mais refinada, especialmente em áreas urbanas com vários bairros.

    - **City (Cidade):** O nome da cidade é um componente fundamental de qualquer endereço. Incluir este campo na pesquisa é essencial para limitar os resultados a uma cidade específica.

    - **State (Estado):** O estado fornece uma localização geográfica mais ampla. Incluir este campo é necessário para restringir a pesquisa a uma região específica do país.

- **Parâmetros:**
  - `AAll`: Indica se todas as informações do endereço devem ser recuperadas (opcional).

- **Códigos de Resposta:**
  - **200 OK:** Os dados do endereço foram encontrados e são disponibilizados, podendo ser um objeto JSON ou um array JSON, dependendo da opção `AAll`.
  - **400 Bad Request:** O servidor não conseguiu entender a requisição. O corpo da resposta contém detalhes sobre o erro.
  - **404 Not Found:** O endereço especificado não foi encontrado.

- **Exceções:**
  - Se algum campo obrigatório para pesquisa não for especificado, uma exceção será lançada indicando a informação requerida.

---

#### 📡 `Exemplo`

  ```delphi
  begin
    FCEP
      .Searech
        .ZipCode
          .Address([TODOS OS REGISTROS EM BOOLEAN])
        .Finish
      .Finish;
  end;
  ```   

---

#### 🚀 `function Finish: ISetup4DCEPSearech`

Este método conclui a configuração da pesquisa de CEP, retornando à instância principal de pesquisa de CEP (`ISetup4DCEPSearech`).

- **Retorno:**
  - A instância principal de pesquisa de CEP (`ISetup4DCEPSearech`).

---

## 📐 Funções do TSetup4DCEPSearechIBGE

A classe `TSetup4DCEPSearechIBGE` desempenha um papel crucial no TSetup4DCep, oferecendo funcionalidades específicas para realizar pesquisas e consultas relacionadas aos códigos IBGE. Implementa a interface `ISetup4DCEPSearechIBGE` e serve como uma referência essencial para a realização de pesquisas de código IBGE no TSetup4DCep.

### 🎯 Métodos

#### 🌍 `function Country: ISetup4DCEPSearechIBGE`

Este método realiza uma pesquisa detalhada de informações relacionadas ao país com base nas informações fornecidas no filtro.

#### Requisitos:

  - Os campos obrigatórios para pesquisa devem ser especificados no filtro:

    - **Country (País):** Este é o campo essencial que deve ser preenchido obrigatoriamente pelo usuário ao realizar uma pesquisa. Ele representa a localização geográfica de interesse para a pesquisa. A inclusão deste campo é crucial para garantir que os resultados sejam limitados ao país especificado, proporcionando uma pesquisa mais direcionada.

#### Códigos de Resposta:

  - **200 OK:** Os dados do país foram encontrados e estão disponíveis em formato JSON.
  - **400 Bad Request:** O servidor não conseguiu entender a requisição. O corpo da resposta contém detalhes sobre o erro.
  - **404 Not Found:** As informações do país especificado não foram encontradas.

#### Exceções:

  - Se o campo obrigatório para pesquisa não for especificado, uma exceção será lançada indicando a informação requerida.

---

#### 📡 `Exemplo`

  ```delphi
  begin
    FCEP
      .Searech
        .IBGE
          .Country
        .Finish
      .Finish;
  end;
  ```   

---

#### 🌍 `function State: ISetup4DCEPSearechIBGE`

Este método realiza uma pesquisa detalhada de informações relacionadas ao estado com base nas informações fornecidas no filtro.

#### Requisitos:

  - Os campos obrigatórios para pesquisa devem ser especificados no filtro:

    - **State (Estado):** Este é o campo essencial que deve ser preenchido obrigatoriamente pelo usuário ao realizar uma pesquisa. Ele representa a subdivisão geográfica de interesse para a pesquisa. A inclusão deste campo é crucial para garantir que os resultados sejam limitados ao estado especificado, proporcionando uma pesquisa mais direcionada.

#### Códigos de Resposta:

  - **200 OK:** Os dados do estado foram encontrados e estão disponíveis em formato JSON.
  - **400 Bad Request:** O servidor não conseguiu entender a requisição. O corpo da resposta contém detalhes sobre o erro.
  - **404 Not Found:** As informações do estado especificado não foram encontradas.

#### Exceções:

  - Se o campo obrigatório para pesquisa não for especificado, uma exceção será lançada indicando a informação requerida.

---

#### 📡 `Exemplo`

  ```delphi
  begin
    FCEP
      .Searech
        .IBGE
          .State
        .Finish
      .Finish;
  end;
  ```   

---

#### 🌍 `function City: ISetup4DCEPSearechIBGE`

Este método realiza uma pesquisa detalhada de informações relacionadas à cidade com base nas informações fornecidas no filtro.

#### Requisitos:

  - Os campos obrigatórios para pesquisa devem ser especificados no filtro:

    - **City (Cidade):** Este é o campo essencial que deve ser preenchido obrigatoriamente pelo usuário ao realizar uma pesquisa. Ele representa a área geográfica de interesse para a pesquisa. A inclusão deste campo é crucial para garantir que os resultados sejam limitados à cidade especificada, proporcionando uma pesquisa mais direcionada.

    - **State (Estado):** O estado ao qual a cidade pertence também é um requisito obrigatório. Ele ajuda a refinar a pesquisa e garantir resultados precisos.

#### Códigos de Resposta:

  - **200 OK:** Os dados da cidade foram encontrados e estão disponíveis em formato JSON.
  - **400 Bad Request:** O servidor não conseguiu entender a requisição. O corpo da resposta contém detalhes sobre o erro.
  - **404 Not Found:** As informações da cidade especificada não foram encontradas.

#### Exceções:

  - Se algum dos campos obrigatórios para pesquisa não for especificado, uma exceção será lançada indicando a informação requerida.

---

#### 📡 `Exemplo`

  ```delphi
  begin
    FCEP
      .Searech
        .IBGE
          .City
        .Finish
      .Finish;
  end;
  ```   

---

#### 🌍 `function Code: ISetup4DCEPSearechIBGE`

Este método realiza uma pesquisa detalhada de informações relacionadas ao código com base nas informações fornecidas no filtro.

#### Requisitos:

  - Os campos obrigatórios para pesquisa devem ser especificados no filtro:

    - **Code (Código):** Este é o campo essencial que deve ser preenchido obrigatoriamente pelo usuário ao realizar uma pesquisa. Ele representa um identificador único associado à localidade de interesse. A inclusão deste campo é crucial para garantir que os resultados sejam específicos para o código fornecido, proporcionando uma pesquisa mais direcionada.

#### Códigos de Resposta:

  - **200 OK:** Os dados associados ao código foram encontrados e estão disponíveis em formato JSON.
  - **400 Bad Request:** O servidor não conseguiu entender a requisição. O corpo da resposta contém detalhes sobre o erro.
  - **404 Not Found:** As informações associadas ao código especificado não foram encontradas.

#### Exceções:

  - Se o campo obrigatório para pesquisa não for especificado, uma exceção será lançada indicando a informação requerida.

---

#### 🚀 `function Finish: ISetup4DCEPSearechIBGE`

Este método conclui a configuração da pesquisa de CEP por código IBGE do país, retornando à instância principal de pesquisa de CEP por código IBGE (`ISetup4DCEPSearechIBGE`).

- **Parâmetros:**
  - Nenhum.

- **Retorno:**
  - A instância principal de pesquisa de CEP por código IBGE (`ISetup4DCEPSearechIBGE`).

---

#### 📡 `Exemplo`

  ```delphi
  begin
    FCEP
      .Searech
        .IBGE
          .Code
        .Finish
      .Finish;
  end;
  ```   

---

## 📐 Funções do TSetup4DCEPResult

A classe `TSetup4DCEPResult` desempenha um papel crucial no TSetup4DCep, fornecendo funcionalidades para gerenciar e apresentar os resultados das consultas de CEP. Implementa a interface `ISetup4DCEPResult` e serve como uma referência essencial para o gerenciamento de resultados no TSetup4DCep.

### 🎯 Métodos

#### 🚀 `function ZipCode: ISetup4DCEPResultZipCode`

Este método permite obter o resultado relacionados ao CEP, mais especificamente ao código postal.

- **Retorno:**
  - Uma instância de `ISetup4DCEPResultZipCode` que oferece métodos adicionais para configuração de filtros específicos do código postal.

---

#### 🚀 `function IBGE: ISetup4DCEPResultIBGE`

Este método permite obter o resultado relacionado ao código do IBGE (Instituto Brasileiro de Geografia e Estatística).

- **Retorno:**
  - Uma instância de `ISetup4DCEPResultIBGE` que oferece métodos adicionais para configuração e obtenção de informações específicas do código do IBGE.

---

#### 🏁 `function Finish: ISetup4DCEP`

Este método retorna a instância principal do serviço de CEP.

- **Retorno:**
  - Uma instância de `ISetup4DCEP` associada ao serviço de CEP.

---

## 📐 Funções do TSetup4DCEPResultZipCode

A classe `TSetup4DCEPResultZipCode` desempenha um papel crucial no TSetup4DCep, proporcionando funcionalidades específicas para gerenciar e apresentar os resultados das consultas de CEP. Implementa a interface `ISetup4DCEPResultZipCode` e serve como uma referência essencial para o gerenciamento de resultados de CEP no TSetup4DCep.

### 🎯 Métodos

#### 🔄 `function JSONObject(AJSONString: string; AOwner: Boolean): ISetup4DCEPResultZipCode`

Este método permite configurar e analisar um objeto JSON associado ao código postal.

- **Parâmetros:**
  - `AJSONString`: A string contendo a representação JSON a ser analisada.
  - `AOwner`: Indica se o objeto resultante é de propriedade (opcional).

- **Retorno:**
  - Uma instância de `ISetup4DCEPResultZipCode` configurada com as informações extraídas do JSON.

---

#### 🔄 `function JSONArray(AJSONString: string; AOwner: Boolean): ISetup4DCEPResultZipCode`

Este método permite configurar e analisar um array JSON associado ao código postal.

- **Parâmetros:**
  - `AJSONString`: A string contendo a representação do array JSON a ser analisada.
  - `AOwner`: Indica se o array JSON resultante é de propriedade (opcional).

- **Retorno:**
  - Uma instância de `ISetup4DCEPResultZipCode` configurada com as informações extraídas do array JSON.

---

#### 🔤 `function Code: string`

Este método retorna o código postal associado ao objeto.

- **Retorno:**
  - Uma string contendo o valor do código postal no objeto JSON associado ao código postal.

---

#### 🔤 `function Code(const AItem: Integer): string`

Este método retorna o código postal associado ao objeto em uma posição específica do array.

- **Parâmetros:**
  - `AItem`: A posição desejada no array.

- **Retorno:**
  - Uma string contendo o valor do código postal na posição especificada do array JSON associado ao código postal.

---

#### 🏠 `function Street: string`

Este método retorna a informação do logradouro associada ao objeto.

- **Retorno:**
  - Uma string contendo o valor do logradouro no objeto JSON associado ao código postal.

---

#### 🏠 `function Street(const AItem: Integer): string`

Este método retorna a informação do logradouro associada ao objeto em uma posição específica do array.

- **Parâmetros:**
  - `AItem`: A posição desejada no array.

- **Retorno:**
  - Uma string contendo o valor do logradouro na posição especificada do array JSON associado ao código postal.

---

#### 🏡 `function StreetComplement: string`

Este método retorna a informação do complemento do logradouro associado ao objeto.

- **Retorno:**
  - Uma string contendo o valor do complemento do logradouro no objeto JSON associado ao código postal.

---

#### 🏡 `function StreetComplement(const AItem: Integer): string`

Este método retorna a informação do complemento do logradouro associado ao objeto em uma posição específica do array.

- **Parâmetros:**
  - `AItem`: A posição desejada no array.

- **Retorno:**
  - Uma string contendo o valor do complemento do logradouro na posição especificada do array JSON associado ao código postal.

---

#### 🏠 `function District: string`

Este método retorna a informação do bairro associada ao objeto.

- **Retorno:**
  - Uma string contendo o valor do bairro no objeto JSON associado ao código postal.

---

#### 🏠 `function District(const AItem: Integer): string`

Este método retorna a informação do bairro associada ao objeto em uma posição específica do array.

- **Parâmetros:**
  - `AItem`: A posição desejada no array.

- **Retorno:**
  - Uma string contendo o valor do bairro na posição especificada do array JSON associado ao código postal.

---

#### 🌆 `function City: string`

Este método retorna o nome da cidade associado ao objeto.

- **Retorno:**
  - Uma string contendo o nome da cidade no objeto JSON associado ao código postal.

---

#### 🌆 `function City(const AItem: Integer): string`

Este método retorna o nome da cidade associado ao objeto em uma posição específica do array.

- **Parâmetros:**
  - `AItem`: A posição desejada no array.

- **Retorno:**
  - Uma string contendo o nome da cidade na posição especificada do array JSON associado ao código postal.

---

#### 🌆 `function CityIBGE: string`

Este método retorna o código IBGE da cidade associado ao objeto.

- **Retorno:**
  - Uma string contendo o código IBGE da cidade no objeto JSON associado ao código postal.

---

#### 🌆 `function CityIBGE(const AItem: Integer): string`

Este método retorna o código IBGE da cidade associado ao objeto em uma posição específica do array.

- **Parâmetros:**
  - `AItem`: A posição desejada no array.

- **Retorno:**
  - Uma string contendo o código IBGE da cidade na posição especificada do array JSON associado ao código postal.

---

#### 🏠 `function State: string`

Este método retorna o nome do estado associado ao objeto.

- **Retorno:**
  - Uma string contendo o nome do estado no objeto JSON associado ao código postal.

---

#### 🏠 `function State(const AItem: Integer): string`

Este método retorna o nome do estado associado ao objeto em uma posição específica do array.

- **Parâmetros:**
  - `AItem`: A posição desejada no array.

- **Retorno:**
  - Uma string contendo o nome do estado na posição especificada do array JSON associado ao código postal.

---

#### 🏠 `function StateSigla: string`

Este método retorna a sigla do estado associado ao objeto.

- **Retorno:**
  - Uma string contendo a sigla do estado no objeto JSON associado ao código postal.

---

#### 🏠 `function StateSigla(const AItem: Integer): string`

Este método retorna a sigla do estado associado ao objeto em uma posição específica do array.

- **Parâmetros:**
  - `AItem`: A posição desejada no array.

- **Retorno:**
  - Uma string contendo a sigla do estado na posição especificada do array JSON associado ao código postal.

---

#### 🏠 `function StateIBGE: string`

Este método retorna o código IBGE do estado associado ao objeto.

- **Retorno:**
  - Uma string contendo o código IBGE do estado no objeto JSON associado ao código postal.

---

#### 🏠 `function StateIBGE(const AItem: Integer): string`

Este método retorna o código IBGE do estado associado ao objeto em uma posição específica do array.

- **Parâmetros:**
  - `AItem`: A posição desejada no array.

- **Retorno:**
  - Uma string contendo o código IBGE do estado na posição especificada do array JSON associado ao código postal.

---

#### 📞 `function DDD: string`

Este método retorna o código de área (DDD) associado ao objeto.

- **Retorno:**
  - Uma string contendo o código de área (DDD) no objeto JSON associado ao código postal.

---

#### 📞 `function DDD(const AItem: Integer): string`

Este método retorna o código de área (DDD) associado ao objeto em uma posição específica do array.

- **Parâmetros:**
  - `AItem`: A posição desejada no array.

- **Retorno:**
  - Uma string contendo o código de área (DDD) na posição especificada do array JSON associado ao código postal.

---

#### 🌍 `function Region: string`

Este método retorna a região associada ao objeto.

- **Retorno:**
  - Uma string contendo a região no objeto JSON associado ao código postal.

---

#### 🌍 `function Region(const AItem: Integer): string`

Este método retorna a região associada ao objeto em uma posição específica do array.

- **Parâmetros:**
  - `AItem`: A posição desejada no array.

- **Retorno:**
  - Uma string contendo a região na posição especificada do array JSON associado ao código postal.

---

#### 🌐 `function Country: string`

Este método retorna o nome do país associado ao objeto.

- **Retorno:**
  - Uma string contendo o nome do país no objeto JSON associado ao código postal.

---

#### 🌐 `function Country(const AItem: Integer): string`

Este método retorna o nome do país associado ao objeto em uma posição específica do array.

- **Parâmetros:**
  - `AItem`: A posição desejada no array.

- **Retorno:**
  - Uma string contendo o nome do país na posição especificada do array JSON associado ao código postal.

---

#### 🌐 `function CountrySigla: string`

Este método retorna a sigla do país associado ao objeto.

- **Retorno:**
  - Uma string contendo a sigla do país no objeto JSON associado ao código postal.

---

#### 🌐 `function CountrySigla(const AItem: Integer): string`

Este método retorna a sigla do país associado ao objeto em uma posição específica do array.

- **Parâmetros:**
  - `AItem`: A posição desejada no array.

- **Retorno:**
  - Uma string contendo a sigla do país na posição especificada do array JSON associado ao código postal.

---

#### 🌐 `function CountryIBGE: string`

Este método retorna o código IBGE do país associado ao objeto.

- **Retorno:**
  - Uma string contendo o código IBGE do país no objeto JSON associado ao código postal.

---

#### 🌐 `function CountryIBGE(const AItem: Integer): string`

Este método retorna o código IBGE do país associado ao objeto em uma posição específica do array.

- **Parâmetros:**
  - `AItem`: A posição desejada no array.

- **Retorno:**
  - Uma string contendo o código IBGE do país na posição especificada do array JSON associado ao código postal.

---

#### 📞 `function DDI: string`

Este método retorna o código DDI (Código de Discagem Direta Internacional) associado ao país.

- **Retorno:**
  - Uma string contendo o código DDI no objeto JSON associado ao código postal.

---

#### 📞 `function DDI(const AItem: Integer): string`

Este método retorna o código DDI (Código de Discagem Direta Internacional) associado ao país em uma posição específica do array.

- **Parâmetros:**
  - `AItem`: A posição desejada no array.

- **Retorno:**
  - Uma string contendo o código DDI na posição especificada do array JSON associado ao código postal.

---

#### 🌍 `function Continent: string`

Este método retorna o continente associado ao objeto.

- **Retorno:**
  - Uma string contendo o continente no objeto JSON associado ao código postal.

---

#### 🌍 `function Continent(const AItem: Integer): string`

Este método retorna o continente associado ao objeto em uma posição específica do array.

- **Parâmetros:**
  - `AItem`: A posição desejada no array.

- **Retorno:**
  - Uma string contendo o continente na posição especificada do array JSON associado ao código postal.

---

#### 🗺️ `function Altitude: string`

Este método retorna a altitude associada ao objeto.

- **Retorno:**
  - Uma string contendo a altitude no objeto JSON associado ao código postal.

---

#### 🗺️ `function Altitude(const AItem: Integer): string`

Este método retorna a altitude associada ao objeto em uma posição específica do array.

- **Parâmetros:**
  - `AItem`: A posição desejada no array.

- **Retorno:**
  - Uma string contendo a altitude na posição especificada do array JSON associado ao código postal.

---

#### 🌐 `function Latitude: string`

Este método retorna a latitude associada ao objeto.

- **Retorno:**
  - Uma string contendo a latitude no objeto JSON associado ao código postal.

---

#### 🌐 `function Latitude(const AItem: Integer): string`

Este método retorna a latitude associada ao objeto em uma posição específica do array.

- **Parâmetros:**
  - `AItem`: A posição desejada no array.

- **Retorno:**
  - Uma string contendo a latitude na posição especificada do array JSON associado ao código postal.

---

#### 🌐 `function Longitude: string`

Este método retorna a longitude associada ao objeto.

- **Retorno:**
  - Uma string contendo a longitude no objeto JSON associado ao código postal.

---

#### 🌐 `function Longitude(const AItem: Integer): string`

Este método retorna a longitude associada ao objeto em uma posição específica do array.

- **Parâmetros:**
  - `AItem`: A posição desejada no array.

- **Retorno:**
  - Uma string contendo a longitude na posição especificada do array JSON associado ao código postal.

---

#### 💼 `function SIAFICode: string`

Este método retorna o código SIAFI (Sistema Integrado de Administração Financeira) associado ao endereço.

- **Retorno:**
  - Uma string contendo o código SIAFI no objeto JSON associado ao código postal.

---

#### 💼 `function SIAFICode(const AItem: Integer): string`

Este método retorna o código SIAFI (Sistema Integrado de Administração Financeira) associado ao endereço em uma posição específica do array.

- **Parâmetros:**
  - `AItem`: A posição desejada no array.

- **Retorno:**
  - Uma string contendo o código SIAFI na posição especificada do array JSON associado ao código postal.

---

#### 💼 `function SIAFIName: string`

Este método retorna o nome SIAFI (Sistema Integrado de Administração Financeira) associado ao endereço.

- **Retorno:**
  - Uma string contendo o nome SIAFI no objeto JSON associado ao código postal.

---

#### 💼 `function SIAFIName(const AItem: Integer): string`

Este método retorna o nome SIAFI (Sistema Integrado de Administração Financeira) associado ao endereço em uma posição específica do array.

- **Parâmetros:**
  - `AItem`: A posição desejada no array.

- **Retorno:**
  - Uma string contendo o nome SIAFI na posição especificada do array JSON associado ao código postal.

---

#### 💼 `function SIAFICNPJ: string`

Este método retorna o CNPJ (Cadastro Nacional da Pessoa Jurídica) associado ao endereço no SIAFI.

- **Retorno:**
  - Uma string contendo o CNPJ no objeto JSON associado ao código postal.

---

#### 💼 `function SIAFICNPJ(const AItem: Integer): string`

Este método retorna o CNPJ (Cadastro Nacional da Pessoa Jurídica) associado ao endereço no SIAFI em uma posição específica do array.

- **Parâmetros:**
  - `AItem`: A posição desejada no array.

- **Retorno:**
  - Uma string contendo o CNPJ na posição especificada do array JSON associado ao código postal.

---

#### 📄 `function JSONObject: TJSONObject`

Este método retorna o objeto JSON associado ao resultado do CEP.

- **Retorno:**
  - Uma instância de `TJSONObject` contendo as informações do endereço em formato JSON.

---

#### 📄 `function JSONObjectInString: string`

Este método retorna a representação em string do objeto JSON associado ao resultado do CEP.

- **Retorno:**
  - Uma string contendo a representação JSON do endereço.

---

#### 📄 `function JSONArray: TJSONArray`

Este método retorna o array JSON associado ao resultado do CEP.

- **Retorno:**
  - Uma instância de `TJSONArray` contendo as informações do endereço em formato de array JSON.

---

#### 📄 `function JSONArrayInString: string`

Este método retorna a representação em string do array JSON associado ao resultado do CEP.

- **Retorno:**
  - Uma string contendo a representação JSON do array de endereços.

---

#### 📡 `Exemplo`

```delphi
  var
    Memo: TMemo;
    
  begin
    Memo : TMemo.Create(Self);

    Memo.Lines.Clear;
    Memo.Lines.Add( StringOfChar('-',20) );
    Memo.Lines.Add('Retorno por variável');
    Memo.Lines.Add( StringOfChar('-',20) );
    Memo.Lines.Add(EmptyStr);
    Memo.Lines.Add('CEP: ' + FCEP.Result.ZIPCode.Code(0));
    Memo.Lines.Add('Rua: ' + FCEP.Result.ZIPCode.Street(0));
    Memo.Lines.Add('Complemento: ' + FCEP.Result.ZIPCode.StreetComplent(0));
    Memo.Lines.Add('Bairro: ' + FCEP.Result.ZIPCode.District(0));
    Memo.Lines.Add('Cidade: '+ FCEP.Result.ZIPCode.City(0));
    Memo.Lines.Add('IBGE da Cidade: ' + FCEP.Result.ZIPCode.CityIBGE(0));
    Memo.Lines.Add('Estado: ' + FCEP.Result.ZIPCode.State(0));
    Memo.Lines.Add('Sigla do Estado: ' + FCEP.Result.ZIPCode.StateSigla(0));
    Memo.Lines.Add('IBGE do Estado: ' + FCEP.Result.ZIPCode.StateIBGE(0));
    Memo.Lines.Add('Região: ' + FCEP.Result.ZIPCode.Region(0));
    Memo.Lines.Add('DDD: ' + FCEP.Result.ZIPCode.DDD(0));
    Memo.Lines.Add('País: ' + FCEP.Result.ZIPCode.Country(0));
    Memo.Lines.Add('Sigla do País: '+ FCEP.Result.ZIPCode.CountrySigla(0));
    Memo.Lines.Add('IBGE do País: ' + FCEP.Result.ZIPCode.CountryIBGE(0));
    Memo.Lines.Add('DDI: ' + FCEP.Result.ZIPCode.DDI(0));
    Memo.Lines.Add('Continente: ' + FCEP.Result.ZIPCode.Continent(0));
    Memo.Lines.Add('Altitude: ' + FCEP.Result.ZIPCode.Altitude(0));
    Memo.Lines.Add('Latitude: ' + FCEP.Result.ZIPCode.Latitude(0));
    Memo.Lines.Add('Longitude: ' + FCEP.Result.ZIPCode.Longitude(0));
    Memo.Lines.Add('SIAFI (Sistema Integrado de Administração Financeira) - Código: ' + FCEP.Result.ZIPCode.SIAFICode(0));
    Memo.Lines.Add('SIAFI (Sistema Integrado de Administração Financeira) - CNPJ: ' + FCEP.Result.ZIPCode.SIAFICNPJ(0));
    Memo.Lines.Add('SIAFI (Sistema Integrado de Administração Financeira) - Cidade: ' + FCEP.Result.ZIPCode.SIAFIName(0));

    Memo.Lines.Add(EmptyStr);
    Memo.Lines.Add( StringOfChar('-',20) );
    Memo.Lines.Add('JSON Array');
    Memo.Lines.Add(FCEP.Result.ZIPCode.JSONArray.Format);
    Memo.Lines.Add( StringOfChar('-',20) );
    Memo.Lines.Add(EmptyStr);

    Memo.Lines.Add(EmptyStr);
    Memo.Lines.Add( StringOfChar('-',20) );
    Memo.Lines.Add('JSON Array');
    Memo.Lines.Add(FCEP.Result.ZIPCode.JSONArrayInString);
    Memo.Lines.Add( StringOfChar('-',20) );
    Memo.Lines.Add(EmptyStr);

    Memo.Lines.Add(EmptyStr);
    Memo.Lines.Add( StringOfChar('-',20) );
    Memo.Lines.Add('JSON Object');
    Memo.Lines.Add(FCEP.Result.ZIPCode.JSONObject.Format);
    Memo.Lines.Add( StringOfChar('-',20) );
    Memo.Lines.Add(EmptyStr);

    Memo.Lines.Add(EmptyStr);
    Memo.Lines.Add( StringOfChar('-',20) );
    Memo.Lines.Add('JSON String');
    Memo.Lines.Add(FCEP.Result.ZIPCode.JSONObjectInString);
    Memo.Lines.Add( StringOfChar('-',20) );
    Memo.Lines.Add(EmptyStr);

  end;
```

---

## 📐 Funções do TSetup4DCEPResultIBGE

A classe `TSetup4DCEPResultIBGE` desempenha um papel crucial no TSetup4DCep, oferecendo funcionalidades específicas para gerenciar e apresentar os resultados das consultas de códigos IBGE. Implementa a interface `ISetup4DCEPResultIBGE` e serve como uma referência essencial para o gerenciamento de resultados de código IBGE no TSetup4DCep.

### 🎯 Métodos

#### 📄 `function JSONObject(AJSONString: string; AOwner: Boolean): ISetup4DCEPResultIBGE`

Este método permite associar um objeto JSON ao resultado do CEP relacionado ao código IBGE.

- **Parâmetros:**
  - `AJSONString`: A representação em string do objeto JSON a ser associado.
  - `AOwner`: Indica se o objeto resultante é o proprietário (opcional).

- **Retorno:**
  - Uma instância de `ISetup4DCEPResultIBGE` para permitir métodos encadeados.

---

#### 🔤 `function CountryCode: string`

Este método retorna o código IBGE associado ao país no resultado do CEP.

- **Retorno:**
  - Uma string contendo o código IBGE do país no objeto JSON associado ao código IBGE.

---

#### 🌐 `function Country: string`

Este método retorna o nome do país associado ao resultado do CEP.

- **Retorno:**
  - Uma string contendo o nome do país no objeto JSON associado ao código IBGE.

---

#### 🔤 `function StateCode: string`

Este método retorna o código IBGE do estado associado ao resultado do CEP.

- **Retorno:**
  - Uma string contendo o código IBGE do estado no objeto JSON associado ao código IBGE.

---

#### 🔤 `function State: string`

Este método retorna o nome do estado associado ao resultado do CEP.

- **Retorno:**
  - Uma string contendo o nome do estado no objeto JSON associado ao código IBGE.

---

#### 🔤 `function CityCode: string`

Este método retorna o código IBGE da cidade associado ao resultado do CEP.

- **Retorno:**
  - Uma string contendo o código IBGE da cidade no objeto JSON associado ao código IBGE.

---

#### 🔤 `function City: string`

Este método retorna o nome da cidade associado ao resultado do CEP.

- **Retorno:**
  - Uma string contendo o nome da cidade no objeto JSON associado ao código IBGE.

---

#### 📄 `function JSONObject: TJSONObject`

Este método retorna o objeto JSON associado ao resultado do CEP relacionado ao código IBGE.

- **Retorno:**
  - Uma instância de `TJSONObject` contendo as informações do endereço em formato JSON.

---

#### 📄 `function JSONObjectInString: string`

Este método retorna a representação em string do objeto JSON associado ao resultado do CEP relacionado ao código IBGE.

- **Retorno:**
  - Uma string contendo a representação JSON do endereço.

---

#### 📡 `Exemplo`

```delphi
  var
    Memo: TMemo;
    
  begin
    Memo : TMemo.Create(Self);

        Memo.Lines.Clear;
        Memo.Lines.Add( StringOfChar('-',20) );
        Memo.Lines.Add('Retorno por variável');
        Memo.Lines.Add( StringOfChar('-',20) );
        Memo.Lines.Add(EmptyStr);

        Memo.Lines.Add(EmptyStr);
        Memo.Lines.Add('Código do País: ' + FCEP.Result.IBGE.CountryCode);
        Memo.Lines.Add('País: '+ FCEP.Result.IBGE.Country);
        Memo.Lines.Add('Código do Estado: ' + FCEP.Result.IBGE.StateCode);
        Memo.Lines.Add('Estado: '+ FCEP.Result.IBGE.State);
        Memo.Lines.Add('Código da Cidade: ' + FCEP.Result.IBGE.CityCode);
        Memo.Lines.Add('Cidade: '+ FCEP.Result.IBGE.City);

        Memo.Lines.Add(EmptyStr);
        Memo.Lines.Add( StringOfChar('-',20) );
        Memo.Lines.Add('JSON Object');
        Memo.Lines.Add(FCEP.Result.IBGE.JSONObject.Format);
        Memo.Lines.Add( StringOfChar('-',20) );
        Memo.Lines.Add(EmptyStr);

        Memo.Lines.Add(EmptyStr);
        Memo.Lines.Add( StringOfChar('-',20) );
        Memo.Lines.Add('JSON String');
        Memo.Lines.Add(FCEP.Result.IBGE.JSONObjectInString);
        Memo.Lines.Add( StringOfChar('-',20) );
        Memo.Lines.Add(EmptyStr);
  end;
```