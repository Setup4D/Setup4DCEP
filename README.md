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

Welcome to the Setup4DCEP project repository! This application was developed to streamline the search for CEP (ZIP code) and IBGE codes (Brazilian Institute of Geography and Statistics). With Setup4DCEP, you can perform interactions with procedures and functions in your Delphi applications quickly, simply, and reliably.

## 📐 How to Use

### ⚙️ Installation

#### ⚡️ Automatic (via boss)

* Using [**Boss**](https://github.com/HashLoad/boss) is recommended to simplify the installation of Setup4DCEP. Just run the following command in a terminal, such as Windows PowerShell, to perform the installation more conveniently:

   ```shell
   boss install github.com/Setup4D/Setup4DCEP
   ```

   + This automates the installation process and dependency management, making the Setup4DCEP configuration simpler. Make sure that Boss is set up and ready for use in your Delphi environment before running this command.

#### 🚧 Manual (Delphi)

* If you choose to perform the installation manually, follow the steps below:

   1. [Download](https://github.com/Setup4D/Setup4DCEP/archive/refs/heads/main.zip) the project.
   2. Unzip the downloaded file to a folder of your choice.
   3. Add the extracted folder to your project by following these steps:
   
      1. In Delphi, go to the "Project" menu.
      2. Select "Options."
      3. In the options panel, go to "Resource Compiler."
      4. Under "Directories and Conditionals," choose "Include file search path."
      5. Click on "Browse" and add the extracted project folder.
   
         + This will allow your project to access the necessary files and resources from Setup4DCEP. Make sure to save the settings after following these steps.

            ```
            .\{Folder}\src
            .\{Folder}\src\Interfaces
            .\{Folder}\src\Configuration
            .\{Folder}\src\Configuration\Proxy
            .\{Folder}\src\Configuration\Web Service
            .\{Folder}\src\Filter
            .\{Folder}\src\Filter\IBGE
            .\{Folder}\src\Filter\Zip Code
            .\{Folder}\src\Searech
            .\{Folder}\src\Searech\IBGE
            .\{Folder}\src\Searech\Zip Code            
            .\{Folder}\src\Result
            .\{Folder}\src\Result\IBGE
            .\{Folder}\src\Result\Zip Code
            ```
### 📚 Dependencies

* This project depends on [**Setup4DUtility**](https://github.com/Setup4D/Setup4DUtility), playing a crucial role in its operational functionalities. When using [**Boss**](https://github.com/HashLoad/boss) as the framework installer, the installation of **Setup4DUtility** occurs automatically. However, if you choose a manual installation, follow the steps below:

   1. [**Download**](https://github.com/Setup4D/Setup4DUtility/archive/refs/heads/main.zip) the project or access the [**project page**](https://github.com/Setup4D/Setup4DUtility) and download it.
   2. Unzip the downloaded file to a folder of your choice.
   3. Add the extracted folder to your project by going to *Project > Options > Resource Compiler > Directories and Conditionals > Include file search path*.<p>      
   
   ```
   ./{Folder}/src
   ```

## 🌐 Usage Mode

### 🎤 Message Language

* The system supports two languages, with English being the default language. However, it is possible to use the application in Brazilian Portuguese. To do this, follow the steps below:

   * **Option 1: Configuration via Delphi:**
   
      ```
      Go to Project > Options > Delphi Compiler > Conditionals Defines
      ```

      1. In Delphi, go to the "Project" menu.
      2. Select "Options."
      3. In the options panel, go to "Delphi Compiler."
      4. Under "Conditionals Defines," add the directive *HAS_PORTUGUES*.

         + This will allow the application to be used in Brazilian Portuguese. Remember to save the settings and recompile the project after making these changes.

   * **Option 2: Manual Configuration:**

      1. Make sure that the line *{$DEFINE HAS_PORTUGUES}* in the file *Setup4DCEPLanguage.inc*, located in *.\{folder}\src\requires\inc*, is uncommented (i.e., without the double slashes "//").

         + This will also allow the application to be used in Brazilian Portuguese. Don't forget to save the changes and recompile the project for the settings to take effect.

## 📐 Functions of TSetup4DCep

* The class `TSetup4DCep` plays a fundamental role in supporting the framework's functionalities. It centralizes various functions and procedures that will be used by the framework, allowing dynamic and simplified programming, aligned with the agility of Delphi's inline programming.

### 🎯 Methods

#### 📦 `function Configuration: ISetup4DCEPConfiguration`

This method returns or creates an instance of the configuration associated with the CEP service.

- **Return:**
  - An instance of `ISetup4DCEPConfiguration` associated with the CEP service.

---

#### 🧹 `function Filter: ISetup4DCEPFilter`

This method returns or creates an instance of the filter associated with the CEP service.

- **Return:**
  - An instance of `ISetup4DCEPFilter` associated with the CEP service.

---

#### 🕵️‍♂️ `function Search: ISetup4DCEPSearch`

This method returns or creates an instance of the search associated with the CEP service.

- **Exceptions:**
  - `EConvertError`: Thrown if the configuration, filter, or result is not instantiated.

- **Return:**
  - An instance of `ISetup4DCEPSearch` associated with the CEP service.

---

#### 🎯 `function Result: ISetup4DCEPResult`

This method returns or creates an instance of the result associated with the CEP service.

- **Return:**
  - An instance of `ISetup4DCEPResult` associated with the CEP service.

---

#### 📡 `Example`

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

## 📐 Functions of TSetup4DCepConfiguration

The class `TSetup4DCepConfiguration` plays a crucial role in configuring TSetup4DCep, providing a set of functionalities to customize and adjust the framework's behavior. It implements the `ISetup4DCEPConfiguration` interface and serves as an essential reference for configuring TSetup4DCep.

### 🎯 Methods

#### 🌐 `function Proxy: ISetup4DCEPConfigurationProxy`

This method returns or creates an instance of the proxy associated with the configuration of the CEP service.

- **Return:**
  - An instance of `ISetup4DCEPConfigurationProxy` associated with the CEP service configuration.

---

#### 🚀 `function WebService: ISetup4DCEPConfigurationWebService`

This method returns or creates an instance of the web service configurations associated with the configuration of the CEP service.

- **Return:**
  - An instance of `ISetup4DCEPConfigurationWebService` associated with the CEP service configuration.

---

#### 🏁 `function Finish: ISetup4DCEP`

This method returns the main instance of the CEP service.

- **Return:**
  - An instance of `ISetup4DCEP` associated with the CEP service.

## 📐 Functions of TSetup4DCepConfigurationProxy

The class `TSetup4DCepConfigurationProxy` plays a crucial role in configuring TSetup4DCep, providing functionalities to customize and adjust options related to the proxy. It implements the `ISetup4DCEPConfigurationProxy` interface and serves as an essential reference for proxy configuration.

### 🎯 Methods

#### ⚙️ `function Host(const AValue: string): ISetup4DCEPConfigurationProxy`

This method allows configuring the host associated with the CEP service proxy.

- **Parameters:**
  - `AValue`: The value of the host to be configured.
- **Return:**
  - An instance of `ISetup4DCEPConfigurationProxy` with the updated host configuration.

---

#### ⚙️ `function Port(const AValue: string): ISetup4DCEPConfigurationProxy`

This method allows configuring the port associated with the CEP service proxy.

- **Parameters:**
  - `AValue`: The value of the port to be configured.
- **Return:**
  - An instance of `ISetup4DCEPConfigurationProxy` with the updated port configuration.

---

#### ⚙️ `function Port(const AValue: Integer): ISetup4DCEPConfigurationProxy`

This method allows configuring the port associated with the CEP service proxy.

- **Parameters:**
  - `AValue`: The value of the port to be configured.
- **Return:**
  - An instance of `ISetup4DCEPConfigurationProxy` with the updated port configuration.

---

#### ⚙️ `function User(const AValue: string): ISetup4DCEPConfigurationProxy`

This method allows configuring the username associated with the CEP service proxy.

- **Parameters:**
  - `AValue`: The value of the username to be configured.
- **Return:**
  - An instance of `ISetup4DCEPConfigurationProxy` with the updated username configuration.

---

#### ⚙️ `function Password(const AValue: string): ISetup4DCEPConfigurationProxy`

This method allows configuring the password associated with the CEP service proxy.

- **Parameters:**
  - `AValue`: The value of the password to be configured.
- **Return:**
  - An instance of `ISetup4DCEPConfigurationProxy` with the updated password configuration.

---

#### ⚙️ `function Host: string`

This method returns the currently configured value for the host associated with the CEP service proxy.

- **Return:**
  - A string containing the currently configured value for the proxy's host.

---

#### ⚙️ `function Port: Integer`

This method returns the currently configured value for the port associated with the CEP service proxy.

- **Return:**
  - An integer containing the currently configured value for the proxy's port.

---

#### ⚙️ `function User: string`

This method returns the currently configured value for the username associated with the CEP service proxy.

- **Return:**
  - A string containing the currently configured value for the proxy's username.

---

#### ⚙️ `function Password: string`

This method returns the currently configured value for the password associated with the CEP service proxy.

- **Return:**
  - A string containing the currently configured value for the proxy's password.

---

#### ⚙️ `function Finish: ISetup4DCEPConfiguration`

This method finishes the configuration of the CEP service proxy, returning to the main configuration interface.

- **Return:**
  - An instance of `ISetup4DCEPConfiguration` to allow further configuration.

---

#### 📡 `Example`

- **Insert:**

  ```delphi
  begin
    FCEP
      .Configuration
        .Proxy
          .Host([PROXY HOST AS STRING])
          .Port([PROXY PORT AS INTEGER])
          .User([USER NAME AS STRING])
          .Password([USER PASSWORD AS STRING])
        .Finish
      .Finish
    .Finish
  end;
  ```   

- **Read:**

  ```delphi
  begin
    ShowMessage(FCEP.Configuration.Proxy.Host);
    ShowMessage(FCEP.Configuration.Proxy.Port.ToString);
    ShowMessage(FCEP.Configuration.Proxy.User);
    ShowMessage(FCEP.Configuration.Proxy.Password);
  end;
  ```   

---

## 📐 Functions of TSetup4DCepConfigurationWebService

The class `TSetup4DCepConfigurationWebService` plays a crucial role in configuring TSetup4DCep, providing functionalities to customize and adjust options related to the web service. It implements the `ISetup4DCEPConfigurationWebService` interface and serves as an essential reference for web service configuration.

### 🎯 Methods

#### ⚙️ `function BaseURL(const AValue: string): ISetup4DCEPConfigurationWebService`

This method allows setting the base URL associated with the CEP service web service.

- **Parameters:**
  - `AValue`: A string containing the base URL to be associated with the web service.

- **Return:**
  - The current instance of the CEP service web service configuration (`ISetup4DCEPConfigurationWebService`).

---

#### ⚙️ `function BaseURL: string`

This method returns the currently configured value for the base URL associated with the CEP service web service.

- **Return:**
  - A string containing the currently configured value for the web service's base URL.

---

#### ⚙️ `function Key(const AValue: string): ISetup4DCEPConfigurationWebService`

This method allows setting the key associated with the CEP service web service.

- **Parameters:**
  - `AValue`: A string containing the key to be associated with the web service.

- **Return:**
  - The current instance of the CEP service web service configuration (`ISetup4DCEPConfigurationWebService`).

---

#### ⚙️ `function Key: string`

This method returns the currently configured value for the key associated with the CEP service web service.

- **Return:**
  - A string containing the currently configured value for the web service's key.

---

#### ⚙️ `function User(const AValue: string): ISetup4DCEPConfigurationWebService`

This method allows setting the username associated with the CEP service web service.

- **Parameters:**
  - `AValue`: A string containing the username to be associated with the web service.

- **Return:**
  - The current instance of the CEP service web service configuration (`ISetup4DCEPConfigurationWebService`).

---

#### ⚙️ `function User: string`

This method returns the currently configured value for the username associated with the CEP service web service.

- **Return:**
  - A string containing the currently configured value for the web service's username.

---

#### ⚙️ `function Password(const AValue: string): ISetup4DCEPConfigurationWebService`

This method allows setting the password associated with the CEP service web service.

- **Parameters:**
  - `AValue`: A string containing the password to be associated with the web service.

- **Return:**
  - The current instance of the CEP service web service configuration (`ISetup4DCEPConfigurationWebService`).

---

#### ⚙️ `function Password: string`

This method returns the currently configured value for the password associated with the CEP service web service.

- **Return:**
  - A string containing the currently configured value for the web service's password.

---

#### ⚙️ `function UpperText(const AValue: Boolean): ISetup4DCEPConfigurationWebService`

This method allows setting whether text formatting (such as the street name) should be converted to uppercase.

- **Parameters:**
  - `AValue`: A boolean value indicating whether text formatting should be converted to uppercase.

- **Return:**
  - The current instance of the CEP service web service configuration (`ISetup4DCEPConfigurationWebService`).

---

#### ⚙️ `function UpperText: Boolean`

This method returns the currently configured value for the uppercase text conversion.

- **Return:**
  - A boolean value indicating whether text formatting should be converted to uppercase.

---

#### ⚙️ `function UpperTextInString: string`

This method returns a string representation of the currently configured value for uppercase text conversion.

- **Return:**
  - A string containing "True" if the conversion to uppercase is enabled or "False" if it is disabled.

---

#### ⌛ `function TimeOut(const AValue: Integer): ISetup4DCEPConfigurationWebService`

This method allows configuring the timeout for requests to the CEP service web service.

- **Parameters:**
  - `AValue`: The timeout value in milliseconds.

- **Return:**
  - The current instance of the CEP service web service configuration (`ISetup4DCEPConfigurationWebService`).

---

#### ⌛ `function TimeOut(const AValue: string): ISetup4DCEPConfigurationWebService`

This method allows configuring the timeout for requests to the CEP service web service, where `AValue` is a string that will be converted to an integer value representing the timeout in milliseconds.

- **Parameters:**
  - `AValue`: The string representing the timeout value in milliseconds.

- **Return:**
  - The current instance of the CEP service web service configuration (`

ISetup4DCEPConfigurationWebService`).

---

#### ⌛ `function TimeOut: Integer`

This method returns the currently configured value for the timeout of requests to the CEP service web service.

- **Return:**
  - An integer value representing the timeout in milliseconds.

---

### 🔧 `function Finish: ISetup4DCEPConfiguration`

Este método conclui a configuração do serviço web no contexto do `Setup4DCEP`.

- **Retorno:**
  - Uma instância de `ISetup4DCEPConfiguration` para permitir métodos encadeados na configuração do serviço web.

---

#### 📡 `Example`

- **Insert:**

  ```delphi
  begin
    FCEP
      .Configuration
        .WebService
            .User([USER NAME AS STRING])
            .Password([USER PASSWORD AS STRING])
            .Key([ACCESS KEY AS STRING])
            .TimeOut([WAITING TIME IN INTEGER])
            .UpperText([UPPERCASE LETTERS IN BOOLEAN])
        .Finish
      .Finish
    .Finish
  end;
  ```   

- **Read:**

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

## 📐 Functions of TSetup4DCEPFilter

The class `TSetup4DCEPFilter` plays a crucial role in TSetup4DCep, offering functionalities to apply filters and customize the framework's behavior. It implements the `ISetup4DCEPFilter` interface and serves as an essential reference for applying filters in TSetup4DCep.

### 🎯 Methods

#### 📍 `function ZipCode: ISetup4DCEPFilterZipCode`

This method allows configuring filters related to CEP, more specifically to the zip code.

- **Return:**
  - An instance of `ISetup4DCEPFilterZipCode` that provides additional methods for configuring specific filters related to the zip code.

---

#### 📍 `function IBGE: ISetup4DCEPFilterIBGE`

This method allows configuring filters related to the IBGE code (Brazilian Institute of Geography and Statistics).

- **Return:**
  - An instance of `ISetup4DCEPFilterIBGE` that provides additional methods for configuring specific filters related to the IBGE code.

---

#### 📍 `function Clear: ISetup4DCEPFilter`

This method clears all filters previously configured in the object.

- **Return:**
  - The current instance of the CEP web service filter configuration (`ISetup4DCEPFilter`).

---

#### 📍 `function Finish: ISetup4DCEP`

This method finishes the configuration of filters for the CEP web service and returns to the main instance (`ISetup4DCEP`) to allow further general configuration.

- **Return:**
  - The main instance of the CEP web service (`ISetup4DCEP`).

---

## 📐 Functions of TSetup4DCEPFilterZipCode

The class `TSetup4DCEPFilterZipCode` plays a crucial role in TSetup4DCep, providing specific functionalities to filter and customize the framework's behavior regarding CEPs. It implements the `ISetup4DCEPFilterZipCode` interface and serves as an essential reference for applying CEP filters in TSetup4DCep.

### 🎯 Methods

#### 📍 `function Value: string`

This method returns the currently configured value for the CEP filter.

- **Return:**
  - A string containing the current value of the CEP filter.

---

#### 📍 `function Value(const AValue: string): ISetup4DCEPFilterZipCode`

This method allows setting the value of the CEP filter.

- **Parameters:**
  - `AValue`: A string representing the value of the CEP filter.

- **Return:**
  - The current instance of the CEP filter configuration (`ISetup4DCEPFilterZipCode`).

---

#### 📍 `function Street: string`

This method returns the currently configured value for the street filter.

- **Return:**
  - A string containing the current value of the street filter.

---

#### 📍 `function Street(const AValue: string): ISetup4DCEPFilterZipCode`

This method allows setting the value of the street filter.

- **Parameters:**
  - `AValue`: A string representing the value of the street filter.

- **Return:**
  - The current instance of the CEP filter configuration (`ISetup4DCEPFilterZipCode`).

---

#### 📍 `function District: string`

This method returns the currently configured value for the district filter.

- **Return:**
  - A string containing the current value of the district filter.

---

#### 📍 `function District(const AValue: string): ISetup4DCEPFilterZipCode`

This method allows setting the value of the district filter.

- **Parameters:**
  - `AValue`: A string representing the value of the district filter.

- **Return:**
  - The current instance of the CEP filter configuration (`ISetup4DCEPFilterZipCode`).

---

#### 📍 `function City: string`

This method returns the currently configured value for the city filter.

- **Return:**
  - A string containing the current value of the city filter.

---

#### 📍 `function City(const AValue: string): ISetup4DCEPFilterZipCode`

This method allows setting the value of the city filter.

- **Parameters:**
  - `AValue`: A string representing the value of the city filter.

- **Return:**
  - The current instance of the CEP filter configuration (`ISetup4DCEPFilterZipCode`).

---

#### 📍 `function State: string`

This method returns the currently configured value for the state filter.

- **Return:**
  - A string containing the current value of the state filter.

---

#### 📍 `function State(const AValue: string): ISetup4DCEPFilterZipCode`

This method allows setting the value of the state filter.

- **Parameters:**
  - `AValue`: A string representing the value of the state filter.

- **Return:**
  - The current instance of the CEP filter configuration (`ISetup4DCEPFilterZipCode`).

---

#### 📍 `function State(const AValue: TSetup4DUtilityEstadoAbreviado): ISetup4DCEPFilterZipCode`

This method allows setting the value of the state filter using the `TSetup4DUtilityEstadoAbreviado` enumeration.

- **Parameters:**
  - `AValue`: A value from the `TSetup4DUtilityEstadoAbreviado` enumeration.

- **Return:**
  - The current instance of the CEP filter configuration (`ISetup4DCEPFilterZipCode`).

---

#### 📍 `function State(const AValue: TSetup4DUtilityEstado): ISetup4DCEPFilterZipCode`

This method allows setting the value of the state filter using the `TSetup4DUtilityEstado` enumeration.

- **Parameters:**
  - `AValue`: A value from the `TSetup4DUtilityEstado` enumeration.

- **Return:**
  - The current instance of the CEP filter configuration (`ISetup4DCEPFilterZipCode`).

---

#### 🚀 `function Finish: ISetup4DCEPFilter`

This method returns the parent instance, allowing the conclusion of the specific configuration for the CEP filter by zip code.

- **Return:**
  - The instance of the CEP filter configuration (`ISetup4DCEPFilter`).

---

#### 📡 `Example`

- **Filter CEP:**

  ```delphi
  begin
    FCEP
      .Filter
        .Clear
        .ZipCode
          .Value([CEP TO FILTER AS STRING])
        .Finish
      .Finish
    .Finish
  end;
  ```   

- **Filter Address:**

  ```delphi
  begin
    FCEP
      .Filter
        .Clear
        .ZipCode
          .Street([STREET NAME AS STRING])
          .District([NEIGHBORHOOD NAME AS STRING])
          .City([CITY NAME AS STRING])
          .State([STATE NAME AS STRING])
        .Finish
      .Finish
    .Finish
  end;
  ```   

- **Read:**

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

## 📐 Functions of TSetup4DCEPFilterIBGE

The class `TSetup4DCEPFilterIBGE` plays a crucial role in TSetup4DCep, offering specific functionalities to filter and customize the framework's behavior regarding IBGE codes. It implements the `ISetup4DCEPFilterIBGE` interface and serves as an essential reference for applying IBGE code filters in TSetup4DCep.

### 🎯 Methods

#### 📍 `function Code: string`

This method returns the currently configured value for the IBGE code filter.

- **Return:**
  - A string containing the current value of the IBGE code filter.

---

#### 📍 `function Code(const AValue: string): ISetup4DCEPFilterIBGE`

This method allows setting the value of the IBGE code filter.

- **Parameters:**
  - `AValue`: A string representing the value of the IBGE code filter.

- **Return:**
  - The current instance of the CEP filter configuration (`ISetup4DCEPFilterIBGE`).

---

#### 📍 `function Country: string`

This method returns the currently configured value for the country filter in the IBGE code.

- **Return:**
  - A string containing the current value of the country filter in the IBGE code.

---

#### 📍 `function Country(const AValue: string): ISetup4DCEPFilterIBGE`

This method allows setting the value of the country filter in the IBGE code.

- **Parameters:**
  - `AValue`: A string representing the value of the country filter in the IBGE code.

- **Return:**
  - The current instance of the CEP filter configuration (`ISetup4DCEPFilterIBGE`).

---

#### 📍 `function City: string`

This method returns the currently configured value for the city filter in the IBGE code.

- **Return:**
  - A string containing the current value of the city filter in the IBGE code.

---

#### 📍 `function City(const AValue: string): ISetup4DCEPFilterIBGE`

This method allows setting the value of the city filter in the IBGE code.

- **Parameters:**
  - `AValue`: A string representing the value of the city filter in the IBGE code.

- **Return:**
  - The current instance of the CEP filter configuration (`ISetup4DCEPFilterIBGE`).

---

#### 📍 `function State: string`

This method returns the currently configured value for the state filter in the IBGE code.

- **Return:**
  - A string containing the current value of the state filter in the IBGE code.

---

#### 📍 `function State(const AValue: string): ISetup4DCEPFilterIBGE`

This method allows setting the value of the state filter in the IBGE code.

- **Parameters:**
  - `AValue`: A string representing the value of the state filter in the IBGE code.

- **Return:**
  - The current instance of the CEP filter configuration (`ISetup4DCEPFilterIBGE`).

---

#### 📍 `function State(const AValue: TSetup4DUtilityEstado): ISetup4DCEPFilterIBGE`

This method allows setting the value of the state filter in the IBGE code using the `TSetup4DUtilityEstado` enumeration.

- **Parameters:**
  - `AValue`: A value from the `TSetup4DUtilityEstado` enumeration representing the state in the IBGE code.

- **Return:**
  - The current instance of the CEP filter configuration (`ISetup4DCEPFilterIBGE`).

---

#### 📍 `function State(const AValue: TSetup4DUtilityEstadoAbreviado): ISetup4DCEPFilterIBGE`

This method allows setting the value of the state filter in the IBGE code using the `TSetup4DUtilityEstadoAbreviado` enumeration.

- **Parameters:**
  - `AValue`: A value from the `TSetup4DUtilityEstadoAbreviado` enumeration representing the state in the IBGE code.

- **Return:**
  - The current instance of the CEP filter configuration (`ISetup4DCEPFilterIBGE`).

---

#### 🚀 `function Finish: ISetup4DCEPFilter`

This method returns the parent instance, allowing the conclusion of the configuration of the CEP filter.

- **Return:**
  - The instance of the CEP filter configuration (`ISetup4DCEPFilter`).

---

#### 📡 `Example`

- **Filter Code:**

  ```delphi
  begin
    FCEP
      .Filter
        .Clear
        .IBGE
          .Code([IBGE CODE TO FILTER AS STRING])
        .Finish
      .Finish
    .Finish
  end;
  ```   

- **Filter City:**

  ```delphi
  begin
    FCEP
      .Filter
        .Clear
        .IBGE
          .City([CITY NAME AS STRING])
          .State([STATE NAME AS STRING])
        .Finish
      .Finish
    .Finish
  end;
  ```   

- **Filter State:**

  ```delphi
  begin
    FCEP
      .Filter
        .Clear
        .IBGE
          .State([STATE NAME AS STRING])
        .Finish
      .Finish
    .Finish
  end;
  ```   

- **Filter Country:**

  ```delphi
  begin
    FCEP
      .Filter
        .Clear
        .IBGE
          .Country([COUNTRY NAME AS STRING])
        .Finish
      .Finish
    .Finish
  end;
  ```   

- **Read:**

  ```delphi
  begin
    ShowMessage(FCEP.Filter.IBGE.Code);
    ShowMessage(FCEP.Filter.IBGE.City);
    ShowMessage(FCEP.Filter.IBGE.State);
    ShowMessage(FCEP.Filter.IBGE.Country);
  end;
  ``` 

---

## 📐 Functions of TSetup4DCEPSearch

The `TSetup4DCEPSearch` class plays a crucial role in TSetup4DCep, providing functionalities for conducting searches and queries related to ZIP codes. It implements the `ISetup4DCEPSearch` interface and serves as an essential reference for conducting searches in TSetup4DCep.

### 🎯 Methods

#### 🏠 `function ZipCode: ISetup4DCEPSearchZipCode`

This method returns the instance for conducting ZIP code searches.

- **Return:**
  - The instance for ZIP code searches (`ISetup4DCEPSearchZipCode`).

This method throws an exception of type `EConvertError` if the configuration (`ISetup4DCEPConfiguration`), filter (`ISetup4DCEPFilter`), or result (`ISetup4DCEPResult`) instances are not properly instantiated.

#### 🌍 `function IBGE: ISetup4DCEPSearchIBGE`

This method returns the instance for conducting searches based on IBGE codes.

- **Return:**
  - The instance for IBGE code searches (`ISetup4DCEPSearchIBGE`).

This method throws an exception of type `EConvertError` if the configuration (`ISetup4DCEPConfiguration`), filter (`ISetup4DCEPFilter`), or result (`ISetup4DCEPResult`) instances are not properly instantiated.

---

#### 🏁 `function Finish: ISetup4DCEP`

This method finalizes the CEP search configuration and returns to the main instance (`ISetup4DCEP`).

- **Return:**
  - The main instance of CEP configuration (`ISetup4DCEP`).

---

## 📐 Functions of TSetup4DCEPSearchZipCode

The `TSetup4DCEPSearchZipCode` class plays a crucial role in TSetup4DCep, providing specific functionalities for conducting searches related to ZIP codes. It implements the `ISetup4DCEPSearchZipCode` interface and serves as an essential reference for conducting ZIP code searches in TSetup4DCep.

### 🎯 Methods

#### 🚀 `function Value: ISetup4DCEPSearchZipCode`

This method conducts a ZIP code search based on the specified ZIP code.

- **Requirements:**
  - The ZIP code must be specified in the search filter.

- **Response Codes:**
  - **200 OK:** The ZIP code data was found and is available.
  - **400 Bad Request:** The server could not understand the request. The response body contains details about the error.
  - **404 Not Found:** The specified ZIP code was not found.

- **Exceptions:**
  - If the ZIP code is not specified, an exception will be thrown indicating the required information.

- **Return:**
  - The instance of the ZIP code search (`ISetup4DCEPSearchZipCode`).

---

#### 📡 `Example`

  ```delphi
  begin
    FCEP
      .Search
        .ZipCode
          .Value
        .Finish
      .Finish;
  end;
  ```

---

#### 🚀 `function Address(AAll: Boolean): ISetup4DCEPSearchZipCode`

This method conducts a ZIP code search based on the address filter information.

- **Requirements:**
  - The mandatory fields for the search must be specified in the filter:

    - **Street:** This field refers to the name of the street where the address is located. It is crucial to include this field for the search to be specific to the desired street.

    - **District:** The district is another important part of an address. Including this field allows for a more refined search, especially in urban areas with multiple districts.

    - **City:** The name of the city is a fundamental component of any address. Including this field in the search is essential to limit the results to a specific city.

    - **State:** The state provides a broader geographical location. Including this field is necessary to restrict the search to a specific region of the country.

- **Parameters:**
  - `AAll`: Indicates whether all address information should be retrieved (optional).

- **Response Codes:**
  - **200 OK:** The address data was found and is available, either as a JSON object or a JSON array, depending on the `AAll` option.
  - **400 Bad Request:** The server could not understand the request. The response body contains details about the error.
  - **404 Not Found:** The specified address was not found.

- **Exceptions:**
  - If any mandatory field for the search is not specified, an exception will be thrown indicating the required information.

---

#### 📡 `Example`

  ```delphi
  begin
    FCEP
      .Search
        .ZipCode
          .Address([ALL RECORDS AS BOOLEAN])
        .Finish
      .Finish;
  end;
  ```

---

#### 🚀 `function Finish: ISetup4DCEPSearch`

This method concludes the configuration of the ZIP code search, returning to the main ZIP code search instance (`ISetup4DCEPSearch`).

- **Return:**
  - The main ZIP code search instance (`ISetup4DCEPSearch`).

---

## 📐 Functions of TSetup4DCEPSearchIBGE

The `TSetup4DCEPSearchIBGE` class plays a crucial role in TSetup4DCep, providing specific functionalities for conducting searches related to IBGE codes. It implements the `ISetup4DCEPSearchIBGE` interface and serves as an essential reference for conducting IBGE code searches in TSetup4DCep.

### 🎯 Methods

#### 🌍 `function Country: ISetup4DCEPSearchIBGE`

This method conducts a detailed search for information related to the country based on the information provided in the filter.

#### Requirements:

  - The mandatory fields for the search must be specified in the filter:

    - **Country:** This is the essential field that must be filled in by the user when conducting a search. It represents the geographical location of interest for the search. Including this field is crucial to ensure that the results are limited to the specified country, providing a more targeted search.

#### Response Codes:

  - **200 OK:** Country data was found and is available in JSON format.
  - **400 Bad Request:** The server could not understand the request. The response body contains details about the error.
  - **404 Not Found:** Information about the specified country was not found.

#### Exceptions:

  - If the mandatory field for the search is not specified, an exception will be thrown indicating the required information.

---

#### 📡 `Example`

  ```delphi
  begin
    FCEP
      .Search
        .IBGE
          .Country
        .Finish
      .Finish;
  end;
  ```

---

####

 🌍 `function State: ISetup4DCEPSearchIBGE`

This method conducts a detailed search for information related to the state based on the information provided in the filter.

#### Requirements:

  - The mandatory fields for the search must be specified in the filter:

    - **State:** This is the essential field that must be filled in by the user when conducting a search. It represents the geographical subdivision of interest for the search. Including this field is crucial to ensure that the results are limited to the specified state, providing a more targeted search.

#### Response Codes:

  - **200 OK:** State data was found and is available in JSON format.
  - **400 Bad Request:** The server could not understand the request. The response body contains details about the error.
  - **404 Not Found:** Information about the specified state was not found.

#### Exceptions:

  - If the mandatory field for the search is not specified, an exception will be thrown indicating the required information.

---

#### 📡 `Example`

  ```delphi
  begin
    FCEP
      .Search
        .IBGE
          .State
        .Finish
      .Finish;
  end;
  ```

---

#### 🌍 `function City: ISetup4DCEPSearchIBGE`

This method conducts a detailed search for information related to the city based on the information provided in the filter.

#### Requirements:

  - The mandatory fields for the search must be specified in the filter:

    - **City:** This is the essential field that must be filled in by the user when conducting a search. It represents the geographical area of interest for the search. Including this field is crucial to ensure that the results are limited to the specified city, providing a more targeted search.

    - **State:** The state to which the city belongs is also a mandatory requirement. It helps to refine the search and ensure accurate results.

#### Response Codes:

  - **200 OK:** City data was found and is available in JSON format.
  - **400 Bad Request:** The server could not understand the request. The response body contains details about the error.
  - **404 Not Found:** Information about the specified city was not found.

#### Exceptions:

  - If any of the mandatory fields for the search are not specified, an exception will be thrown indicating the required information.

---

#### 📡 `Example`

  ```delphi
  begin
    FCEP
      .Search
        .IBGE
          .City
        .Finish
      .Finish;
  end;
  ```

---

#### 🌍 `function Code: ISetup4DCEPSearchIBGE`

This method conducts a detailed search for information related to the code based on the information provided in the filter.

#### Requirements:

  - The mandatory fields for the search must be specified in the filter:

    - **Code:** This is the essential field that must be filled in by the user when conducting a search. It represents a unique identifier associated with the location of interest. Including this field is crucial to ensure that the results are specific to the provided code, providing a more targeted search.

#### Response Codes:

  - **200 OK:** Data associated with the code was found and is available in JSON format.
  - **400 Bad Request:** The server could not understand the request. The response body contains details about the error.
  - **404 Not Found:** Information associated with the specified code was not found.

#### Exceptions:

  - If the mandatory field for the search is not specified, an exception will be thrown indicating the required information.

---

#### 🚀 `function Finish: ISetup4DCEPSearchIBGE`

This method concludes the configuration of the CEP search by IBGE code for the country, returning to the main instance of CEP search by IBGE code (`ISetup4DCEPSearchIBGE`).

- **Parameters:**
  - None.

- **Return:**
  - The main instance of CEP search by IBGE code (`ISetup4DCEPSearchIBGE`).

---

#### 📡 `Example`

  ```delphi
  begin
    FCEP
      .Search
        .IBGE
          .Code
        .Finish
      .Finish;
  end;
  ```

---

## 📐 Functions of TSetup4DCEPResult

The `TSetup4DCEPResult` class plays a crucial role in TSetup4DCep, providing functionalities to manage and present the results of CEP queries. It implements the `ISetup4DCEPResult` interface and serves as an essential reference for result management in TSetup4DCep.

### 🎯 Methods

#### 🚀 `function ZipCode: ISetup4DCEPResultZipCode`

This method allows retrieving the result related to the ZIP code, more specifically the postal code.

- **Return:**
  - An instance of `ISetup4DCEPResultZipCode` that provides additional methods for configuring specific postal code filters.

---

#### 🚀 `function IBGE: ISetup4DCEPResultIBGE`

This method allows retrieving the result related to the IBGE code (Brazilian Institute of Geography and Statistics).

- **Return:**
  - An instance of `ISetup4DCEPResultIBGE` that provides additional methods for configuring and obtaining specific information about the IBGE code.

---

#### 🏁 `function Finish: ISetup4DCEP`

This method returns the main instance of the CEP service.

- **Return:**
  - An instance of `ISetup4DCEP` associated with the CEP service.

---

## 📐 Functions of TSetup4DCEPResultZipCode

The `TSetup4DCEPResultZipCode` class plays a crucial role in TSetup4DCep, providing specific functionalities to manage and present the results of CEP queries. It implements the `ISetup4DCEPResultZipCode` interface and serves as an essential reference for managing CEP results in TSetup4DCep.

### 🎯 Methods

#### 🔄 `function JSONObject(AJSONString: string; AOwner: Boolean): ISetup4DCEPResultZipCode`

This method allows configuring and parsing a JSON object associated with the postal code.

- **Parameters:**
  - `AJSONString`: The string containing the JSON representation to be parsed.
  - `AOwner`: Indicates whether the resulting object is owned (optional).

- **Return:**
  - An instance of `ISetup4DCEPResultZipCode` configured with information extracted from the JSON.

---

#### 🔄 `function JSONArray(AJSONString: string; AOwner: Boolean): ISetup4DCEPResultZipCode`

This method allows configuring and parsing a JSON array associated with the postal code.

- **Parameters:**
  - `AJSONString`: The string containing the JSON array representation to be parsed.
  - `AOwner`: Indicates whether the resulting JSON array is owned (optional).

- **Return:**
  - An instance of `ISetup4DCEPResultZipCode` configured with information extracted from the JSON array.

---

#### 🔤 `function Code: string`

This method returns the postal code associated with the object.

- **Return:**
  - A string containing the postal code value in the JSON object associated with the postal code.

---

#### 🔤 `function Code(const AItem: Integer): string`

This method returns the postal code associated with the object at a specific position in the array.

- **Parameters:**
  - `AItem`: The desired position in the array.

- **Return:**
  - A string containing the postal code value at the specified position in the JSON array associated with the postal code.

---

#### 🏠 `function Street: string`

This method returns the street information associated with the object.

- **Return:**
  - A string containing the street value in the JSON object associated with the postal code.

---

#### 🏠 `function Street(const AItem: Integer): string`

This method returns the street information associated with the object at a specific position in the array.

- **Parameters:**
  - `AItem`: The desired position in the array.

- **Return:**
  - A string containing the street value at the specified position in the JSON array associated with the postal code.

---

#### 🏡 `function StreetComplement: string`

This method returns the street complement information associated with the object.

- **Return:**
  - A string containing the street complement value in the JSON object associated with the postal code.

---

#### 🏡 `function StreetComplement(const AItem: Integer): string`

This method returns the street complement information associated with the object at a specific position in the array.

- **Parameters:**
  - `AItem`: The desired position in the array.

- **Return:**
  - A string containing the street complement value at the specified position in the JSON array associated with the postal code.

---

#### 🏠 `function District: string`

This method returns the district information associated with the object.

- **Return:**
  - A string containing the district value in the JSON object associated with the postal code.

---

#### 🏠 `function District(const AItem: Integer): string`

This method returns the district information associated with the object at a specific position in the array.

- **Parameters:**
  - `AItem`: The desired position in the array.

- **Return:**
  - A string containing the district value at the specified position in the JSON array associated with the postal code.

---

#### 🌆 `function City: string`

This method returns the name of the city associated with the object.

- **Return:**
  - A string containing the city name in the JSON object associated with the postal code.

---

#### 🌆 `function City(const AItem: Integer): string`

This method returns the name of the city associated with the object at a specific position in the array.

- **Parameters:**
  - `AItem`: The desired position in the array.

- **Return:**
  - A string containing the city name at the specified position in the JSON array associated with the postal code.

---

#### 🌆 `function CityIBGE: string`

This method returns the IBGE code of the city associated with the object.

- **Return:**
  - A string containing the IBGE code of the city in the JSON object associated with the postal code.

---

#### 🌆 `function CityIBGE(const AItem: Integer): string`

This method returns the IBGE code of the city associated with the object at a specific position in the array.

- **Parameters:**
  - `AItem`: The desired position in the array.

- **Return:**
  - A string containing the IBGE code of the city at the specified position in the JSON array associated with the postal code.

---

#### 🏠 `function State: string`

This method returns the name of the state associated with the object.

- **Return:**
  - A string containing the name of the state in the JSON object associated with the postal code.

---

#### 🏠 `function State(const AItem: Integer): string`

This method returns the name of the state associated with the object at a specific position in the array.

- **Parameters:**
  - `AItem`: The desired position in the array.

- **Return:**
  - A string containing the name of the state at the specified position in the JSON array associated with the postal code.

---

#### 🏠 `function StateSigla: string`

This method returns the state abbreviation associated with the object.

- **Return:**
  - A string containing the state abbreviation in the JSON object associated with the postal code.

---

#### 🏠 `function StateSigla(const AItem: Integer): string`

This method returns the state abbreviation associated with the object at a specific position in the array.

- **Parameters:**
  - `AItem`: The desired position in the array.

- **Return:**
  - A string containing the state abbreviation at the specified position in the JSON array associated with the postal code.

---

#### 🏠 `function StateIBGE: string`

This method returns the IBGE code of the state associated with the object.

- **Return:**
  - A string containing the IBGE code of the state in the JSON object associated with the postal code.

---

#### 🏠 `function StateIBGE(const AItem: Integer): string`

This method returns the IBGE code of the state associated with the object at a specific position in the array.

- **Parameters:**
  - `AItem`: The desired position in the array.

- **Return:**
  - A string containing the IBGE code of the state at the specified position in the JSON array associated with the postal code.

---

#### 📞 `function DDD: string`

This method returns the area code (DDD) associated with the object.

- **Return:**
  - A string containing the area code (DDD) in the JSON object associated with the postal code.

---

#### 📞 `function DDD(const AItem: Integer): string`

This method returns the area code (DDD) associated with the object at a specific position in the array.

- **Parameters:**
  - `AItem`: The desired position in the array.

- **Return:**
  - A string containing the area code (DDD) at the specified position in the JSON array associated with the postal code.

---

#### 🌍 `function Region: string`

This method returns the region associated with the object.

- **Return:**
  - A string containing the region in the JSON object associated with the postal code.

---

#### 🌍 `function Region(const AItem: Integer): string`

This method returns the region associated with the object at a specific position in the array.

- **Parameters:**
  - `AItem`: The desired position in the array.

- **Return:**
  - A string containing the region at the specified position in the JSON array associated with the postal code.

---

#### 🌐 `function Country: string`

This method returns the name of the country associated with the object.

- **Return:**
  - A string containing the name of the country in the JSON object associated with the postal code.

---

#### 🌐 `function Country(const AItem: Integer): string`

This method returns the name of the country associated with the object at a specific position in the array.

- **Parameters:**
  - `AItem`: The desired position in the array.

- **Return:**
  - A string containing the name of the country at the specified position in the JSON array associated with the postal code.

---

#### 🌐 `function CountrySigla: string`

This method returns the country abbreviation associated with the object.

- **Return:**
  - A string containing the country abbreviation in the JSON object associated with the postal code.

---

#### 🌐 `function CountrySigla(const AItem: Integer): string`

This method returns the country abbreviation associated with the object at a specific position in the array.

- **Parameters:**
  - `AItem`: The desired position in the array.

- **Return:**
  - A string containing the country abbreviation at the specified position in the JSON array associated with the postal code.

---

#### 🌐 `function CountryIBGE: string`

This method returns the IBGE code of the country associated with the object.

- **Return:**
  - A string containing the IBGE code of the country in the JSON object associated with the postal code.

---

#### 🌐 `function CountryIBGE(const AItem: Integer): string`

This method returns the IBGE code of the country associated with the object at a specific position in the array.

- **Parameters:**
  - `AItem`: The desired position in the array.

- **Return:**
  - A string containing the IBGE code of the country at the specified position in the JSON array associated with the postal code.

---

#### 📞 `function DDI: string`

This method returns the Direct Dial International (DDI) code associated with the country.

- **Return:**
  - A string containing the DDI code in the JSON object associated with the postal code.

---

#### 📞 `function DDI(const AItem: Integer): string`

This method returns the Direct Dial International (DDI) code associated with the country at a specific position in the array.

- **Parameters:**
  - `AItem`: The desired position in the array.

- **Return:**
  - A string containing the DDI code at the specified position in the JSON array associated with the postal code.

---

#### 🌍 `function Continent: string`

This method returns the continent associated with the object.

- **Return:**
  - A string containing the continent in the JSON object associated with the postal code.

---

#### 🌍 `function Continent(const AItem: Integer): string`

This method returns the continent associated with the object at a specific position in the array.

- **Parameters:**
  - `AItem`: The desired position in the array.

- **Return:**
  - A string containing the continent at the specified position in the JSON array associated with the postal code.

---

#### 🗺️ `function Altitude: string`

This method returns the altitude associated with the object.

- **Return:**
  - A string containing the altitude in the JSON object associated with the postal code.

---

#### 🗺️ `function Altitude(const AItem: Integer): string`

This method returns the altitude associated with the object at a specific position in the array.

- **Parameters:**
  - `AItem`: The desired position in the array.

- **Return:**
  - A string containing the altitude at the specified position in the JSON array associated with the postal code.

---

#### 🌐 `function Latitude: string`

This method returns the latitude associated with the object.

- **Return:**
  - A string containing the latitude in the JSON object associated with the postal code.

---

#### 🌐 `function Latitude(const AItem: Integer): string`

This method returns the latitude associated with the object at a specific position in the array.

- **Parameters:**
  - `AItem`: The desired position in the array.

- **Return:**
  - A string containing the latitude at the specified position in the JSON array associated with the postal code.

---

#### 🌐 `function Longitude: string`

This method returns the longitude associated with the object.

- **Return:**
  - A string containing the longitude in the JSON object associated with the postal code.

---

#### 🌐 `function Longitude(const AItem: Integer): string`

This method returns the longitude associated with the object at a specific position in the array.

- **Parameters:**
  - `AItem`: The desired position in the array.

- **Return:**
  - A string containing the longitude at the specified position in the JSON array associated with the postal code.

---

#### 💼 `function SIAFICode: string`

This method returns the SIAFI (Integrated Financial Administration System) code associated with the address.

- **Return:**
  - A string containing the SIAFI code in the JSON object associated with the postal code.

---

#### 💼 `function SIAFICode(const AItem: Integer): string`

This method returns the SIAFI code associated with the address at a specific position in the array.

- **Parameters:**
  - `AItem`: The desired position in the array.

- **Return:**
  - A string containing the SIAFI code at the specified position in the JSON array associated with the postal code.

---

#### 💼 `function SIAFIName: string`

This method returns the SIAFI name (Integrated Financial Administration System) associated with the address.

- **Return:**
  - A string containing the SIAFI name in the JSON object associated with the postal code.

---

#### 💼 `function SIAFIName(const AItem: Integer): string`

This method returns the SIAFI name associated with the address at a specific position in the array.

- **Parameters:**
  - `AItem`: The desired position in the array.

- **Return:**
  - A string containing the SIAFI name at the specified position in the JSON array associated with the postal code.

---

#### 💼 `function SIAFICNPJ: string`

This method returns the CNPJ (National Register of Legal Entities) associated with the address in the SIAFI.

- **Return:**
  - A string containing the CNPJ in the JSON object associated with the postal code.

---

#### 💼 `function SIAFICNPJ(const AItem: Integer): string`

This method returns the CNPJ associated with the address in the SIAFI at a specific position in the array.

- **Parameters:**
  - `AItem`: The desired position in the array.

- **Return:**
  - A string containing the CNPJ at the specified position in the JSON array associated with the postal code.

---

#### 📄 `function JSONObject: TJSONObject`

This method returns the JSON object associated with the CEP result.

- **Return:**
  - An instance of `TJSONObject` containing the address information in JSON format.

---

#### 📄 `function JSONObjectInString: string`

This method returns the string representation of the JSON object associated with the CEP result.

- **Return:**
  - A string containing the JSON representation of the address.

---

#### 📄 `function JSONArray: TJSONArray`

This method returns the JSON array associated with the CEP result.

- **Return:**
  - An instance of `TJSONArray` containing the address information in JSON array format.

---

#### 📄 `function JSONArrayInString: string`

This method returns the string representation of the JSON array associated with the CEP result.

- **Return:**
  - A string containing the JSON representation of the array of addresses.

---

#### 📡 `Example`

```delphi
  var
    Memo: TMemo;
    
  begin
    Memo : TMemo.Create(Self);

    Memo.Lines.Clear;
    Memo.Lines.Add( StringOfChar('-',20) );
    Memo.Lines.Add('Return via variable');
    Memo.Lines.Add( StringOfChar('-',20) );
    Memo.Lines.Add(EmptyStr);
    Memo.Lines.Add('CEP: ' + FCEP.Result.ZIPCode.Code(0));
    Memo.Lines.Add('Street: ' + FCEP.Result.ZIPCode.Street(0));
    Memo.Lines.Add('Complement: ' + FCEP.Result.ZIPCode.StreetComplent(0));
    Memo.Lines.Add('District: ' + FCEP.Result.ZIPCode.District(0));
    Memo.Lines.Add('City: '+ FCEP.Result.ZIPCode.City(0));
    Memo.Lines.Add('City IBGE: ' + FCEP.Result.ZIPCode.CityIBGE(0));
    Memo.Lines.Add('State: ' + FCEP.Result.ZIPCode.State(0));
    Memo.Lines.Add('State Abbreviation: ' + FCEP.Result.ZIPCode.StateSigla(0));
    Memo.Lines.Add('State IBGE: ' + FCEP.Result.ZIPCode.StateIBGE(0));
    Memo.Lines.Add('Region: ' + FCEP.Result.ZIPCode.Region(0));
    Memo.Lines.Add('DDD: ' + FCEP.Result.ZIPCode.DDD(0));
    Memo.Lines.Add('Country: ' + FCEP.Result.ZIPCode.Country(0));
    Memo.Lines.Add('Country Abbreviation: '+ FCEP.Result.ZIPCode.CountrySigla(0));
    Memo.Lines.Add('Country IBGE: ' + FCEP.Result.ZIPCode.CountryIBGE(0));
    Memo.Lines.Add('DDI: ' + FCEP.Result.ZIPCode.DDI(0));
    Memo.Lines.Add('Continent: ' + FCEP.Result.ZIPCode

.Continent(0));
    Memo.Lines.Add('Altitude: ' + FCEP.Result.ZIPCode.Altitude(0));
    Memo.Lines.Add('Latitude: ' + FCEP.Result.ZIPCode.Latitude(0));
    Memo.Lines.Add('Longitude: ' + FCEP.Result.ZIPCode.Longitude(0));
    Memo.Lines.Add('SIAFI (Integrated Financial Administration System) - Code: ' + FCEP.Result.ZIPCode.SIAFICode(0));
    Memo.Lines.Add('SIAFI (Integrated Financial Administration System) - CNPJ: ' + FCEP.Result.ZIPCode.SIAFICNPJ(0));
    Memo.Lines.Add('SIAFI (Integrated Financial Administration System) - City: ' + FCEP.Result.ZIPCode.SIAFIName(0));

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

#### 📐 Funções do `TSetup4DCEPResultIBGE`

A classe `TSetup4DCEPResultIBGE` desempenha um papel crucial no `TSetup4DCep`, oferecendo funcionalidades específicas para gerenciar e apresentar os resultados das consultas de códigos IBGE. Implementa a interface `ISetup4DCEPResultIBGE` e serve como uma referência essencial para o gerenciamento de resultados de código IBGE no `TSetup4DCep`.

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

---