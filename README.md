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

#### ⚡️ Manual (Delphi)

* If you choose to install manually, follow the steps below:

   1. Download the project from [here](https://github.com/Setup4D/Setup4DCEP/archive/refs/heads/main.zip).
   2. Unzip the downloaded file to a folder of your choice.
   3. Add the extracted folder to your project by following the steps below:

      1. In Delphi, go to the "Project" menu.
      2. Select "Options."
      3. In the options panel, navigate to "Resource Compiler."
      4. Under "Directories and Conditionals," choose "Include file search path."
      5. Click "Browse" and add the folder extracted from the project.

         + This will enable your project to access the necessary files and resources from Setup4DCEP. Be sure to save the settings after following these steps.

            ```
            .\{Folder}\src
            .\{Folder}\src\requires\inc
            .\{Folder}\src\requires\ACBrComum
            .\{Folder}\src\requires\ACBrTCP
            .\{Folder}\src\requires\ThirdParty\FastStringReplace
            .\{Folder}\src\requires\ThirdParty\GZIPUtils
            .\{Folder}\src\requires\ThirdParty\JsonDataObjects\Source
            .\{Folder}\src\requires\ThirdParty\synalist
            .\{Folder}\src\Enumerated
            .\{Folder}\src\Interfaces
            .\{Folder}\src\Configuration
            .\{Folder}\src\Configuration\Proxy
            .\{Folder}\src\Configuration\Web Service
            .\{Folder}\src\Filter
            .\{Folder}\src\Filter\IBGE
            .\{Folder}\src\Filter\Zip Code
            .\{Folder}\src\Search
            .\{Folder}\src\Search\IBGE
            .\{Folder}\src\Search\Zip Code
            .\{Folder}\src\Result
            .\{Folder}\src\Result\IBGE
            .\{Folder}\src\Result\Zip Code
           ```

### ⚙️ Dependencies

* This project relies on [**Setup4DUtility**](https://github.com/Setup4D/Setup4DUtility), playing a crucial role in its operational functionalities. When using [**Boss**](https://github.com/HashLoad/boss) as the framework installer, the installation of **Setup4DUtility** happens automatically. However, if you prefer a manual installation, follow the steps below:

   1. Download the project from [**here**](https://github.com/Setup4D/Setup4DUtility/archive/refs/heads/main.zip) or visit the [**project page**](https://github.com/Setup4D/Setup4DUtility) and download it.
   2. Unzip the downloaded file to a folder of your choice.
   3. Add the extracted folder to your project by going to *Project > Options > Resource Compiler > Directories and Conditionals > Include file search path*.<p>

   ```
   ./{Folder}/src
   ```

## 📐 Usage Mode

### ⚙️ Language of Messages

* The system supports two languages, with English being the default language. However, it's possible to use the application in Brazilian Portuguese. To do so, follow the steps below:

   * **Option 1: Configuration via Delphi:**
   
      ```
      Go to Project > Options > Delphi Compiler > Conditionals Defines
      ```

      1. In Delphi, go to the "Project" menu.
      2. Select "Options."
      3. In the options panel, navigate to "Delphi Compiler."
      4. Under "Conditionals Defines," add the directive *HAS_PORTUGUES*.

         + This will allow the application to be used in Brazilian Portuguese. Remember to save the settings and recompile the project after making these changes.

   * **Option 2: Manual Configuration:**

      1. Ensure that the line *{$DEFINE HAS_PORTUGUES}* in the file *Setup4DCEPLanguage.inc*, located in *.\{folder}\src\requires\inc*, is uncommented (i.e., without the double slashes "//").

         + This will also enable the application to be used in Brazilian Portuguese. Don't forget to save the changes and recompile the project for the settings to take effect.

## 📐 Functions of TSetup4DCep

* The class `TSetup4DCep` plays a fundamental role in supporting the framework's functionalities. It centralizes various functions and procedures that will be used by the framework, allowing for dynamic and simplified programming, aligned with Delphi's inline programming agility.

### ⚙️ Enumerations of Setup4DCep

#### 💻 `TSetup4DCEPWebService`

* This enumeration represents the web services available for CEP (Postal Addressing Code) lookup. The scope is enabled, which means that to access the enumeration values, you should always prefix with `TSetup4DCEPWebService`. For example, `TSetup4DCEPWebService.None`. I will explain the code in detail:

   - `None`: Represents the absence of a web service for CEP lookup.
   - `BuscarCep`: Represents the "BuscarCep" web service.
   - `CepLivre`: Represents the "CepLivre" web service.
   - `RepublicaVirtual`: Represents the "RepublicaVirtual" web service.
   - `Bases4you`: Represents the "Bases4you" web service.
   - `RNSolucoes`: Represents the "RNSolucoes" web service.
   - `KingHost`: Represents the "KingHost" web service.
   - `ByJG`: Represents the "ByJG" web service.
   - `Correios`: Represents the "Correios" web service.
   - `DevMedia`: Represents the "DevMedia" web service.
   - `ViaCep`: Represents the "ViaCep" web service.
   - `CorreiosSIGEP`: Represents the "CorreiosSIGEP" web service.
   - `CepAberto`: Represents the "CepAberto" web service.
   - `WSCep`: Represents the "WSCep" web service.
   - `OpenCep`: Represents the "OpenCep" web service.
   - `BrasilAPI`: Represents the "BrasilAPI" web service.

### ⚙️ Interfaces of Setup4DCep

#### 💻 `ISetup4DCEP`

* The main interface of the Setup4DCEP framework is the entry point for accessing functionalities related to CEP (Postal Addressing Code) and IBGE (Brazilian Institute of Geography and Statistics). This interface serves as the core of the framework, and all other interfaces depend on it. By using this main interface, you can access the framework's other functionalities in an organized and simplified manner.

* This approach is designed to reduce complexity and allow developers to explore the functionalities flexibly and adaptively.

#### 💻 `ISetup4DCEPConfiguration`

* This interface extends the [ISetup4DCEP](#-isetup4dcep) interface, providing specific methods for configuration related to web service and proxy.

#### 💻 `ISetup4DCEPConfigurationWebService`

* This interface extends the [ISetup4DCEPConfiguration](#-isetup4dcepconfiguration), providing specific methods for configuration related to web service.

#### 💻 `ISetup4DCEPConfigurationWebServiceZIPCode`

* This interface extends the [ISetup4DCEPConfigurationWebService](#-isetup4dcepconfigurationwebservice) and offers specific methods for configuration related to CEP queries.

#### 💻 `ISetup4DCEPConfigurationWebServiceIBGE`

* This interface extends the [ISetup4DCEPConfigurationWebService](#-isetup4dcepconfigurationwebservice) and provides specific methods for configuration related to IBGE queries.

#### 💻 `ISetup4DCEPConfigurationProxy`

* This interface extends the [ISetup4DCEPConfiguration](#-isetup4dcepconfiguration), providing specific methods for proxy configuration.

#### 💻 `ISetup4DCEPFilter`

* This interface extends the [ISetup4DCEP](#-isetup4dcep) interface, providing specific methods for configuring CEP or IBGE filters.

#### 💻 `ISetup4DCEPFilterZipCode`

* This interface extends the functionality of the [ISetup4DCEPFilter](#-isetup4dcepfilter), offering specific methods for including data related to filtering CEP searches.

#### 💻 `ISetup4DCEPFilterZipCodeKey`

* This interface extends the functionality of the [ISetup4DCEPFilterZipCode](#-isetup4dcepfilterzipcode), offering specific methods for including information related to the CEP code to be searched.

#### 💻 `ISetup4DCEPFilterZipCodeAddress`

* This interface extends the functionality of the [ISetup4DCEPFilterZipCode](#-isetup4dcepfilterzipcode), offering specific methods for including information related to the address of the CEP to be searched.

#### 💻 `ISetup4DCEPFilterIBGE`

* This interface extends the functionality of the [ISetup4DCEPFilter](#-isetup4dcepfilter), offering specific methods for including data related to filtering IBGE searches.

#### 💻 `ISetup4DCEPFilterIBGEKey`

* This interface extends the functionality of the [ISetup4DCEPFilterIBGE](#-isetup4dcepfilteribge), offering specific methods for including information related to the CEP code to be searched.

#### 💻 `ISetup4DCEPFilterIBGEAddress`

* This interface extends the functionality of the [ISetup4DCEPFilterIBGE](#-isetup4dcepfilteribge), offering specific methods for including information related to the address of the IBGE to be searched.

#### 💻 `ISetup4DCEPSearech`

* This interface extends the [ISetup4DCEP](#-isetup4dcep) interface, providing specific methods for conducting searches based on CEP or IBGE filters.

#### 💻 `ISetup4DCEPSearechZipCode`

* This interface extends the [ISetup4DCEPSearech](#-isetup4dcepsearech) and offers specific methods for actions related to CEP queries.

#### 💻 `ISetup4DCEPSearechIBGE`

* This interface extends the [ISetup4DCEPSearech](#-isetup4dcepsearech) and provides specific methods for actions related to IBGE queries.

#### 💻 `ISetup4DCEPResult`

* This interface extends the [ISetup4DCEP](#-isetup4dcep) interface, providing specific methods for presenting the results of the executed search.

#### 💻 `ISetup4DCEPResultZipCode`

* This interface extends the [ISetup4DCEPResult](#-isetup4dcepresult) and offers specific methods for obtaining results of actions related to CEP queries.

#### 💻 `iSetup4DCEPResultZipCodeDisplay`

* This interface extends the [ISetup4DCEPResultZipCode](#-isetup4dcepresultzipcode) and offers specific methods for displaying the results of CEP queries.

#### 💻 `ISetup4DCEPResultIBGE`

* This interface extends the [ISetup4DCEPResult](#-isetup4dcepresult) and provides specific methods for obtaining results of actions related to IBGE queries.

#### 💻 `iSetup4DCEPResultIBGEDisplay`

* This interface extends the [ISetup4DCEPResultibge](#-isetup4dcepresultibge) and offers specific methods for displaying the results of IBGE queries.

### ⚙️ Methods of TSetup4DCEP

- This function implements the ISetup4DCEP interface along with all the necessary dependencies. It encompasses crucial information for conducting CEP searches, including the configuration of web services, proxies, filters, searches, and the management of results related to IBGE and CEP.

#### 💻 `class function New: ISetup4DCEP;`

   + This is a class method, allowing its direct invocation on the class without the need to create an instance of it. It returns a type that implements the [ISetup4DCEP](#-isetup4dcep) interface, indicating that the method creates and returns an instance of the class implementing this interface. The method creates a new instance of the class itself [TSetup4DCep](#-funções-do-tsetup4dcep) using the constructor, implying that the New method returns a new instance of [TSetup4DCep](#-funções-do-tsetup4dcep). This pattern is employed to create new instances of classes without the need to manually create an instance, simplifying object creation. The New function is a convenient way to instantiate this class.

#### 🧬 `function Configuration: ISetup4DCEPConfiguration;`

* This method provides an instance that implements the [ISetup4DCEPConfiguration](#-isetup4dcepconfiguration) interface, allowing access to settings related to CEP and IBGE. It is important to highlight that there is a constructor available to ensure the reuse of the same configuration object throughout the execution of [TSetup4DCep](#-funções-do-tsetup4dcep), avoiding the need to create additional instances. This contributes to efficient management and reduces complexity in development.

##### ⚡️ `function WebService: ISetup4DCEPConfigurationWebService;`

   + This method provides an instance that implements the [ISetup4DCEPConfigurationWebService](#-isetup4dcepconfigurationwebservice) interface, allowing access to web service settings. It is important to highlight that there is a constructor available to ensure the reuse of the same configuration object throughout the execution of [TSetup4DCep](#-funções-do-tsetup4dcep), avoiding the need to create additional instances. This contributes to efficient management and reduces complexity in development.

   1. `function ZipCode: ISetup4DCEPConfigurationWebServiceZIPCode;`

      - This method allows you to obtain an instance of the class that provides specific settings for the CEP lookup service. Below are all the existing functions:

         - Here are the web services available for selection in the CEP search:
         
            1. None (Selects no service)
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

            - This function returns an integer value that corresponds to the conversion of a value of the [TSetup4DCEPWebService](#-tsetup4dcepwebservice) enumerated type into an integer value.

         - `function Key(const AValue: string): ISetup4DCEPConfigurationWebServiceZIPCode; overload;`

            - This is a method that allows you to configure the key to be used for authentication when accessing the CEP lookup service.

         - `function Key: string; overload;`

            - This is a method that allows you to retrieve the currently configured key. It returns the key that will be used in requests to the CEP lookup service to access specific information or for authentication, depending on the service's requirements.

         - `function User(const AValue: string): ISetup4DCEPConfigurationWebServiceZIPCode; overload;`

            - This is a method that allows you to configure the username to be used for authentication when accessing the CEP lookup service.

         - `function User: string; overload;`

            - This is a method that allows you to retrieve the currently configured username. It returns the username that will be used in requests to the CEP lookup service for authentication, if necessary.

         - `function Password(const AValue: string): ISetup4DCEPConfigurationWebServiceZIPCode; overload;`

            - This is a method that allows you to configure the password to be used for authentication when accessing the CEP lookup service.

         - `function Password: string; overload;`

            - This is a method that allows you to retrieve the currently configured password. It returns the password that will be used in requests to the CEP lookup service for authentication, if necessary.

         - `function ReturnIBGE(const AValue: Boolean): ISetup4DCEPConfigurationWebServiceZIPCode; overload;`

            - This is a method that enables the configuration of the CEP lookup service to determine whether or not it should return IBGE information.

         - `function ReturnIBGE: Boolean; overload;`

            - This is a method that returns a boolean value indicating whether the CEP lookup service should also return IBGE information. When configured as true, the service will provide additional IBGE information in addition to the CEP data.

         - `function Finish: ISetup4DCEPConfigurationWebService;`

            - This method is responsible for finalizing the configuration of the CEP web service and returning the [ISetup4DCEPConfigurationWebService](#-isetup4dcepconfigurationwebservice) interface. It is used to complete the proxy configuration and obtain a reference to the TSetup4DCepConfigurationWebService instance. Therefore, this line simply returns the reference to the invoking instance.
   
   2. `function IBGE: ISetup4DCEPConfigurationWebServiceIBGE;`

      - This method allows you to obtain an instance of the class that provides specific settings for the IBGE lookup service. Below are all the existing functions:

         - `function CacheName(const AValue: string): ISetup4DCEPConfigurationWebServiceIBGE; overload;`
           
           - This is a method that allows you to configure the name of the cache used to store the results of IBGE queries.

         - `function CacheName: string; overload;`

           - This is a method that returns the name of the cache configured to store the results of IBGE queries.

         - `function CacheValidity(const AValue: Integer): ISetup4DCEPConfigurationWebServiceIBGE; overload;`

           - This is a method that allows you to configure the cache validity time to store the results of IBGE queries. It takes an integer value representing the validity time in milliseconds.
         
         - `function CacheValidity(const AValue: string): ISetup4DCEPConfigurationWebServiceIBGE; overload;`

           - This is a method that allows you to configure the cache validity time to store the results of IBGE queries. It takes a string representing the validity time in milliseconds.
         
         - `function CacheValidity: Integer; overload;`

           - This is a method that allows you to retrieve the cache validity time configured to store the results of IBGE-related queries.
         
         - `function CacheValidityInStr: string; overload;`

           - This is a method that returns the cache validity time configured as a string.

         - `function CacheClear: ISetup4DCEPConfigurationWebServiceIBGE;`

           - This is a method that allows you to clear the cache of query results.

         - `function CaseSensitive(const AValue: Boolean): ISetup4DCEPConfigurationWebServiceIBGE; overload;`

           - This is a method that allows you to configure whether the search is case-sensitive or not.
         
         - `function CaseSensitive: Boolean; overload;`

           - This is a method that allows you to retrieve the current state of case sensitivity in the search.

         - `function Finish: ISetup4DCEPConfigurationWebService;`

            - This method is responsible for finalizing the configuration of the IBGE web service and returning the [ISetup4DCEPConfigurationWebService](#-isetup4dcepconfigurationwebservice) interface. It is used to complete the proxy configuration and obtain a reference to the TSetup4DCepConfigurationWebService instance. Therefore, this line simply returns the reference to the invoking instance.
   
   3. `function TimeOut(const AValue: string): ISetup4DCEPConfigurationWebService; overload;`
      
      - This method is used to configure the timeout for requests in the web service. It accepts a value that should be a string representing the timeout in milliseconds.

   4. `function TimeOut(const AValue: Integer): ISetup4DCEPConfigurationWebService; overload;`
      
      - This method is used to configure the timeout for requests in the web service. It accepts a value that should be an integer representing the timeout in milliseconds.

   5. `function TimeOutInStr: string;`
      
      - This method returns the current value of the timeout configured for requests in the web service, represented as a string.

   6. `function TimeOut: Integer;`
      
      - This method returns the current value of the timeout configured for requests in the web service.

   7. `function ParseText(const AValue: Boolean): ISetup4DCEPConfigurationWebService; overload;`
      
      - This method is used to configure the Parse Text property, which determines whether the web service should parse the response text. It accepts a boolean parameter.

   8. `function ParseText: Boolean;`
      
      - This method is used to retrieve the value of the ParseText property, which represents whether the web service should parse the response text.

   9. `function Finish: ISetup4DCEPConfiguration;`
      
      - This method is responsible for finalizing the proxy configuration and returning the [ISetup4DCEPConfiguration](#-isetup4dcepconfiguration) interface. It is used to complete the proxy configuration and obtain a reference to the TSetup4DCepConfiguration instance. Therefore, this line simply returns the reference to the invoking instance.   

##### ⚡️ `function Proxy : ISetup4DCEPConfigurationProxy;`

   + This method provides an instance that implements the [ISetup4DCEPConfigurationProxy](#-isetup4dcepconfigurationproxy) interface, allowing access to the web service settings. It is important to note that there is a constructor available to ensure the reuse of the same configuration object throughout the execution of [TSetup4DCep](#-funções-do-tsetup4dcep), avoiding the need to create additional instances. This contributes to efficient management and reduces complexity in development.

      1. `function Host(Const AValue: string) : ISetup4DCEPConfigurationProxy; overload;`
      
         -  This method is used to configure the host of the proxy used for CEP or IBGE queries. It accepts a string value.
      
      2. `function Host : string; overload;`
      
         - This method is used to retrieve the host value used in the proxy for CEP or IBGE queries. It returns a string representing the host.
      
      3. `function Port(Const AValue: string) : ISetup4DCEPConfigurationProxy; overload;`
      
         - This method is used to configure the port of the proxy used for CEP or IBGE queries. It accepts a string value.
      
      4. `function Port(Const AValue: integer) : ISetup4DCEPConfigurationProxy; overload;`

         - This method is used to configure the port of the proxy used for CEP or IBGE queries. It accepts an integer value.
      
      5. `function Port : integer; overload;`

         - This method is used to retrieve the port value used in the proxy for CEP or IBGE queries. It returns an integer representing the port.
    
      6. `function PortInStr : string; overload;`

         - This method is used to retrieve the port value used in the proxy for CEP or IBGE queries. It returns a string representing the port.
      
      7. `function User(Const AValue: string) : ISetup4DCEPConfigurationProxy; overload;`
      
         - This method is used to configure the username of the proxy used for CEP or IBGE queries. It accepts a string value.
      
      8. `function User : string; overload;`
      
         - This method is used to retrieve the username used in the proxy for CEP or IBGE queries. It returns a string representing the username.
      
      9. `function Password(Const AValue: string) : ISetup4DCEPConfigurationProxy; overload;`
      
         - This method is used to configure the password of the proxy used for CEP or IBGE queries. It accepts a string value.
      
      10. `function Password : string; overload;`

          - This method is used to retrieve the password used in the proxy for CEP or IBGE queries. It returns a string representing the password.

      11. `function Finish: ISetup4DCEPConfiguration;`

          - This method is responsible for finalizing the proxy configuration and returning the [ISetup4DCEPConfiguration](#-isetup4dcepconfiguration) interface. It is used to complete the proxy configuration and obtain a reference to the TSetup4DCepConfiguration instance. Therefore, this line simply returns the reference to the invoking instance.

##### ⚡️ `function Finish: ISetup4DCEP;`

   + This method provides an instance that implements the [ISetup4DCEP](#-isetup4dcep) interface. It is used to complete the configuration and obtain a reference to the main instance of [TSetup4DCep](#-funções-do-tsetup4dcep). Therefore, this line simply returns the reference to the invoking instance.
     
#### 🧬 `function Filter : ISetup4DCEPFilter;`

* This method provides an instance that implements the [ISetup4DCEPFilter](#-isetup4dcepfilter) interface, allowing access to filter information for CEP and IBGE related searches. It is important to note that there is a constructor available to ensure the reuse of the same configuration object throughout the execution of [TSetup4DCep](#-funções-do-tsetup4dcep), avoiding the need to create additional instances. This contributes to efficient management and reduces complexity in development.
  
##### ⚡️ `function ZipCode:ISetup4DCEPFilterZipCode;`

   + This method provides an instance that implements the [ISetup4DCEPFilterZipCode](#-isetup4dcepfilterzipcode) interface, allowing access to CEP search filters. It is important to note that there is a constructor available to ensure the reuse of the same configuration object throughout the execution of [TSetup4DCep](#-funções-do-tsetup4dcep), avoiding the need to create additional instances. This contributes to efficient management and reduces complexity in development.

      1. `function Key:ISetup4DCEPFilterZipCodeKey;`

         + This method provides an instance that implements the [ISetup4DCEPFilterZipCodeKey](#-isetup4dcepfilterzipcodekey) interface, allowing access to key filter configuration for the ZIP code. It is important to note that there is a constructor available to ensure the reuse of the same configuration object throughout the execution of [TSetup4DCep](#-funções-do-tsetup4dcep), avoiding the need to create additional instances. This contributes to efficient management and reduces complexity in development. 

            1. `function Value(Const AValue: string) : ISetup4DCEPFilterZipCodeKey; overload;`

               - This function allows you to configure the query value for the ZIP code filter.
            
            2. `function Value : string; overload;`

               - This function is used to retrieve the filter set for the ZIP code. This is useful for accessing and using the defined criteria.

            3. `function Finish: ISetup4DCEPFilterZipCode;` 

               - This method is responsible for finalizing the Zip Code filter configuration and returning the [ISetup4DCEPFilterZipCode](#-isetup4dcepfilterzipcode) interface. It is used to complete the filter configuration and obtain a reference to the TSetup4DCEPFilterZipCode instance. Therefore, this line simply returns the reference to the invoking instance. 
            
      2. `function Address:ISetup4DCEPFilterZipCodeAddress;` 

         + This method provides an instance that implements the [ISetup4DCEPFilterZipCodeAddress](#-isetup4dcepfilterzipcodeaddress) interface, allowing access to address filter configuration. It is important to note that there is a constructor available to ensure the reuse of the same configuration object throughout the execution of [TSetup4DCep](#-funções-do-tsetup4dcep), avoiding the need to create additional instances. This contributes to efficient management and reduces complexity in development. 

            1. `function Types(Const AValue : string): ISetup4DCEPFilterZipCodeAddress; overload;`

               - This function allows you to configure the types of street (street, avenue, square, garden, square, path, etc...) to be considered in the CEP query.
            
            2. `function Street(Const AValue : string): ISetup4DCEPFilterZipCodeAddress; overload;`

               - This function allows you to configure the street name to be considered in the CEP query.
            
            3. `function City(Const AValue : string): ISetup4DCEPFilterZipCodeAddress; overload;` 

               - This function allows you to configure the city name to be considered in the CEP query.

            4. `function StateAbbreviated(Const AValue : string): ISetup4DCEPFilterZipCodeAddress; overload;`

               - This function allows you to configure the abbreviated state to be considered in the CEP query.
                           
            5. `function StateAbbreviated(Const AValue : TSetup4DUtilityEstadoAbreviado): ISetup4DCEPFilterZipCodeAddress; overload;`

               - This function allows you to configure the Setup4DUtility enumerator containing the state abbreviations to be considered in the CEP query.
                           
            6. `function District(Const AValue : string): ISetup4DCEPFilterZipCodeAddress; overload;` 

               - This function allows you to configure the district name to be considered in the CEP query.
                           
            7. `function Types: string; overload;`

               - This function is used to retrieve the street types configured in the CEP address filter. This can be useful to access and use the defined filter criteria.
            
            8. `function Street: string; overload;`

               - This function is used to retrieve the street name configured in the CEP address filter. This can be useful to access and use the defined filter criteria.

            9. `function City: string; overload;` 

               - This function is used to retrieve the city name configured in the CEP address filter. This can be useful to access and use the defined filter criteria.

            10. `function StateAbbreviated: string; overload;`

                - This function is used to retrieve the state abbreviation configured in the CEP address filter. This can be useful to access and use the defined filter criteria.
            
            11. `function District: string; overload;`

                - This function is used to retrieve the district name configured in the CEP address filter. This can be useful to access and use the defined filter

##### ⚡️ `function IBGE:ISetup4DCEPFilterIBGE;`

   + This method provides an instance that implements the [ISetup4DCEPFilterIBGE](#-isetup4dcepfilteribge) interface, allowing access to IBGE search filters. It is important to note that there is a constructor available to ensure the reuse of the same configuration object throughout the execution of [TSetup4DCep](#-funções-do-tsetup4dcep), avoiding the need to create additional instances. This contributes to efficient management and reduces complexity in development.

      1. `function Key:ISetup4DCEPFilterIBGEKey;`

         + This method provides an instance that implements the [ISetup4DCEPFilterIBGEKey](#-isetup4dcepfilteribgekey) interface, allowing access to key filter configuration for IBGE code. It is important to note that there is a constructor available to ensure the reuse of the same configuration object throughout the execution of [TSetup4DCep](#-funções-do-tsetup4dcep), avoiding the need to create additional instances. This contributes to efficient management and reduces complexity in development. 

            1. `function Value(Const AValue: string) : ISetup4DCEPFilterIBGEKey; overload;`

               - This function allows you to configure the query value for the IBGE code filter.

            2. `function Value : string; overload;`

               - This function is used to retrieve the filter set for the IBGE code. This is useful for accessing and using the defined criteria.

            3. `function Finish: ISetup4DCEPFilterIBGE;` 

               - This method is responsible for finalizing the IBGE filter configuration and returning the [ISetup4DCEPFilterIBGE](#-isetup4dcepfilteribge) interface. It is used to complete the filter configuration and obtain a reference to the TSetup4DCEPFilterIBGE instance. Therefore, this line simply returns the reference to the invoking instance.

      2. `function Address:ISetup4DCEPFilterIBGEAddress;`

         + This method provides an instance that implements the [ISetup4DCEPFilterIBGEAddress](#-isetup4dcepfilteribgeaddress) interface, allowing access to address filter configuration. It is important to note that there is a constructor available to ensure the reuse of the same configuration object throughout the execution of [TSetup4DCep](#-funções-do-tsetup4dcep), avoiding the need to create additional instances. This contributes to efficient management and reduces complexity in development. 

            1. `function City(Const AValue : string): ISetup4DCEPFilterIBGEAddress; overload;`

               - This function allows you to configure the city name to be considered in the IBGE query.
            
            2. `function StateAbbreviated(Const AValue : string): ISetup4DCEPFilterIBGEAddress; overload;`

               - This function allows you to configure the abbreviated state to be considered in the IBGE query.

            3. `function StateAbbreviated(Const AValue : TSetup4DUtilityEstadoAbreviado): ISetup4DCEPFilterIBGEAddress; overload;` 

               - This function allows you to configure the Setup4DUtility enumerator containing the state abbreviations to be considered in the IBGE query.

            4. `function City: string; overload;`

               - This function is used to retrieve the city name configured in the IBGE address filter. This can be useful to access and use the defined filter criteria.
            
            5. `function StateAbbreviated: string; overload;`

               - This function is used to retrieve the state abbreviation configured in the IBGE address filter. This can be useful to access and use the defined filter criteria.

            6. `function Finish: ISetup4DCEPFilterIBGE;` 

               - This method is responsible for finalizing the IBGE filter configuration and returning the [ISetup4DCEPFilterIBGE](#-isetup4dcepfilteribge) interface. It is used to complete the filter configuration and obtain a reference to the TSetup4DCEPFilterIBGE instance. Therefore, this line simply returns the reference to the invoking instance.

      3. `function Finish: ISetup4DCEPFilter;`
         - This method is responsible for finalizing the filter configuration and returning the [ISetup4DCEPFilter](#-isetup4dcepfilter). It is used to complete the filter configuration and obtain a reference to the TSetup4DCEPFilter instance. Therefore, this line simply returns the reference to the invoking instance.

##### ⚡️ `function Clear : ISetup4DCEPFilter;`

   + This method allows clearing all the filter data. It is advisable to use this function before specifying the search filter to avoid incorrect or unwanted results.
     
##### ⚡️ `function Finish: ISetup4DCEP;`

   + This method provides an instance that implements the [ISetup4DCEP](#-isetup4dcep) interface. It is used to complete the configuration and obtain a reference to the main [TSetup4DCep](#-funções-do-tsetup4dcep) instance. Therefore, this line simply returns the reference to the invoking instance.

#### 🧬 `function Searech : ISetup4DCEPSearech;`

* This method provides an instance that implements the [ISetup4DCEPSearech](#-isetup4dcepsearech) interface, allowing access to the execution related to CEP and IBGE search. It is important to note that there is a constructor available to ensure the reuse of the same configuration object throughout the execution of [TSetup4DCep](#-funções-do-tsetup4dcep), avoiding the need to create additional instances. This contributes to efficient management and reduces complexity in development.

##### ⚡️ `function ZipCode: ISetup4DCEPSearechZipCode;`

   + This method provides an instance that implements the [ISetup4DCEPSearechZipCode](#-isetup4dcepsearechzipcode) interface, allowing the execution of information related to the CEP search filter. It is important to note that there is a constructor available to ensure the reuse of the same configuration object throughout the execution of [TSetup4DCep](#-funções-do-tsetup4dcep), avoiding the need to create additional instances. This contributes to efficient management and reduces complexity in development.

      1. `function Reconfiguration: ISetup4DCEPSearechZipCode;`

         - This function reconfigures the proxy and web service for the CEP search.

      2. `function Code : ISetup4DCEPSearechZipCode;` 

         - This function performs the search for the postal code related to the CEP, validating its existence and the presence of information. Additionally, it handles exceptions related to the absence of OpenSSL DLLs.

      3. `function Address : ISetup4DCEPSearechZipCode;`

         - This function is responsible for executing a CEP query based on the provided address information. It verifies if all essential data has been provided and handles any exceptions that may arise during the query.

      4. `function Component : TComponent;`
 
         - This function allows you to acquire a component related to the CEP query, providing access to additional features.

      5. `function Finish: ISetup4DCEPSearech;`

         - This method provides an instance that implements the [ISetup4DCEPSearech](#-isetup4dcepsearech) interface. It is used to complete the execution and obtain a reference to the main TSetup4DCEPSearech instance. Therefore, this line simply returns the reference to the invoking instance.

##### ⚡️ `function IBGE: ISetup4DCEPSearechIBGE;`

   + This method provides an instance that implements the [ISetup4DCEPSearechIBGE](#-isetup4dcepsearechibge) interface, allowing the execution of information related to the IBGE search filter. It is important to note that there is a constructor available to ensure the reuse of the same configuration object throughout the execution of [TSetup4DCep](#-funções-do-tsetup4dcep), avoiding the need to create additional instances. This contributes to efficient management and reduces complexity in development.

      1. `function Reconfiguration: ISetup4DCEPSearechIBGE;`

         - This function reconfigures the proxy and web service for the IBGE search.

      2. `function Code : ISetup4DCEPSearechIBGE;`

         - This function performs the search for the IBGE code, validating its existence and the presence of information. Additionally, it handles exceptions related to the absence of OpenSSL DLLs.

      3. `function State : ISetup4DCEPSearechIBGE;`

         - This function allows you to retrieve IBGE information related to a state (UF) based on the provided filter, handling specific exceptions related to errors that may occur during the search process.

      4. `function City : ISetup4DCEPSearechIBGE;` 

         - This function allows you to retrieve IBGE information related to a city based on the provided filter, handling specific exceptions related to errors that may occur during the search process.

      5. `function Component : TComponent;`

         - This function allows you to acquire a component related to the IBGE query, providing access to additional features.

      6. `function Finish: ISetup4DCEPSearech;`

         - This method provides an instance that implements the [ISetup4DCEPSearech](#-isetup4dcepsearech) interface. It is used to complete the execution and obtain a reference to the main TSetup4DCEPSearech instance. Therefore, this line simply returns the reference to the invoking instance.

##### ⚡️ `function Finish: ISetup4DCEP;`

   + This method provides an instance that implements the [ISetup4DCEP](#-isetup4dcep) interface. It is used to complete the configuration and obtain a reference to the main [TSetup4DCep](#-funções-do-tsetup4dcep) instance. Therefore, this line simply returns the reference to the invoking instance.

#### 🧬 `function Result : ISetup4DCEPResult;`

* This method provides an instance that implements the [ISetup4DCEPResult](#-isetup4dcepresult) interface, allowing access to results related to the CEP and IBGE search. It is important to note that there is a constructor available to ensure the reuse of the same configuration object throughout the execution of [TSetup4DCep](#-funções-do-tsetup4dcep), avoiding the need to create additional instances. This contributes to efficient management and reduces complexity in development.

##### ⚡️ `function ZipCode: ISetup4DCEPResultZipCode;`

   + This method provides an instance that implements the [ISetup4DCEPResultZipCode](#-isetup4dcepresultzipcode) interface, presenting the result of the CEP regarding the execution of the specified search filters. It is important to note that there is a constructor available to ensure the reuse of the same configuration object throughout the execution of [TSetup4DCep](#-funções-do-tsetup4dcep), avoiding the need to create additional instances. This contributes to efficient management and reduces complexity in development.

      1. `function Display: iSetup4DCEPResultZipCodeDisplay;`

         - This function displays the results of a CEP query after performing the necessary conversion. It returns an instance ready to display the results, as follows:

            1. `function Code : string;`

               - This function retrieves the postal code of the CEP contained in the JSON object, provided that the JSON object has been informed. If the JSON object is not provided, an exception is thrown.

            2. `function Types : string;`

               - This function retrieves the type of street (e.g., street, avenue, square, garden, lane, etc.) of the CEP contained in the JSON object, provided that the JSON object has been informed. If the JSON object is not provided, an exception is thrown.

            3. `function Street : string;` 

               - This function retrieves the street name of the CEP contained in the JSON object, provided that the JSON object has been informed. If the JSON object is not provided, an exception is thrown.

            4. `function StreetComplete : string;` 

               - This function retrieves the type and name of the street of the CEP contained in the JSON object, provided that the JSON object has been informed. If the JSON object is not provided, an exception is thrown.

            5. `function Complement : string;`

               - This function retrieves the complement of the CEP contained in the JSON object, provided that the JSON object has been informed. If the JSON object is not provided, an exception is thrown.

            6. `function District : string;` 

               - This function retrieves the district of the CEP contained in the JSON object, provided that the JSON object has been informed. If the JSON object is not provided, an exception is thrown.

            7. `function City : string;` 

               - This function retrieves the city of the CEP contained in the JSON object, provided that the JSON object has been informed. If the JSON object is not provided, an exception is thrown.

            8. `function IBGECity : string;`

               - This function retrieves the IBGE code of the city of the CEP contained in the JSON object, provided that the JSON object has been informed. If the JSON object is not provided, an exception is thrown.

            9. `function State : string;` 

               - This function retrieves the state of the CEP contained in the JSON object, provided that the JSON object has been informed. If the JSON object is not provided, an exception is thrown.

            10. `function IBGEState : string;`

                - This function retrieves the IBGE code of the state of the CEP contained in the JSON object, provided that the JSON object has been informed. If the JSON object is not provided, an exception is thrown.

            11. `function DDD : string;` 

                - This function retrieves the DDD (Direct Distance Dialing) of the CEP contained in the JSON object, provided that the JSON object has been informed. If the JSON object is not provided, an exception is thrown.

            12. `function GIA : string;`

                - This function retrieves the GIA (National Guide for Information and ICMS Assessment) of the CEP contained in the JSON object, provided that the JSON object has been informed. If the JSON object is not provided, an exception is thrown.

            13. `function SIAFI : string;`

                - This function retrieves the SIAFI (Integrated Financial Administration System) of the CEP contained in the JSON object, provided that the JSON object has been informed. If the JSON object is not provided, an exception is thrown.

            14. `function Altitude : string;` 

                - This function retrieves the altitude of the CEP contained in the JSON object, provided that the JSON object has been informed. If the JSON object is not provided, an exception is thrown.

            15. `function Latitude : string;`

                - This function retrieves the latitude of the CEP contained in the JSON object, provided that the JSON object has been informed. If the JSON object is not provided, an exception is thrown.

            16. `function Longitude : string;`

                - This function retrieves the longitude of the CEP contained in the JSON object, provided that the JSON object has been informed.

            17. `function JSON (Const AValue: TJSONObject) : iSetup4DCEPResultZipCodeDisplay; overload;` 

                - This method retrieves the JSON object containing the CEP query results and then checks if the object was provided before making assignments to the fields.

            18. `function Finish: iSetup4DCEPResultZipCode;` 

                - This method provides an instance that implements the [iSetup4DCEPResultZipCode](#-isetup4dcepresultZipCode) interface. It is used to complete the execution and obtain a reference to the main TSetup4DCEPResultZipCode instance. Therefore, this line simply returns the reference to the invoking instance.

      2. `function JSONObject(out AValue : TJSONObject): ISetup4DCEPResultZipCode; overload;` 

         - This method allows you to obtain a JSON object containing the results of the CEP query.

      3. `function JSONObject: TJSONObject; overload;`

         - This method allows you to obtain the JSON object with the results of the CEP query.

      4. `function JSONObjectInStr: String; overload;`

         - This method allows you to obtain the JSON object as a JSON string with the results of the CEP query.

      5. `function JSONArray: TJSONArray; overload;`

         - This method allows you to obtain the JSON object as a JSON array with the results of the CEP query.

      6. `function RecordCount : Int64;`

         - This method allows you to obtain the total number of addresses found (Integer) with the CEP query results.

      7. `function RecordCountInStr : string;`

         - This method allows you to obtain the total number of addresses found (String) with the CEP query results.

      8. `function Finish: ISetup4DCEPResult;`

         - This method provides an instance that implements the [ISetup4DCEPResult](#-isetup4dcepresult). It is used to complete the execution and obtain a reference to the main TSetup4DCEPResult instance. Therefore, this line simply returns the reference to the invoking instance.

##### ⚡️ `function IBGE: ISetup4DCEPResultIBGE;`

   + This method provides an instance that implements the [ISetup4DCEPResultIBGE](#-isetup4dcepresultibge) interface, presenting the result of the IBGE regarding the execution of the specified search filters. It is important to note that there is a constructor available to ensure the reuse of the same configuration object throughout the execution of [TSetup4DCep](#-funções-do-tsetup4dcep), avoiding the need to create additional instances. This contributes to efficient management and reduces complexity in development.

      1. `function Display: iSetup4DCEPResultIBGEDisplay;`

         - This function displays the results of an IBGE query after performing the necessary conversion. It returns an instance ready to display the results, as follows:

            1. `function StateCode : string;` 

               - This function retrieves the IBGE code of the state contained in the JSON object, provided that the JSON object has been informed. If the JSON object is not provided, an exception is thrown.

            2. `function State : string;` 

               - This function retrieves the state of the IBGE contained in the JSON object, provided that the JSON object has been informed. If the JSON object is not provided, an exception is thrown.

            3. `function CityCode : string;`

               - This function retrieves the IBGE code of the city contained in the JSON object, provided that the JSON object has been informed. If the JSON object is not provided, an exception is thrown. 

            4. `function City : string;` 

               - This function retrieves the city of the IBGE contained in the JSON object, provided that the JSON object has been informed.

            5. `function Zone : string;` 

               - This function retrieves the area size of the IBGE contained in the JSON object, provided that the JSON object has been informed. 

            6. `function JSON (Const AValue: TJSONObject) : iSetup4DCEPResultIBGEDisplay; overload;` 

               - This method retrieves the JSON object containing the IBGE query results and then checks if the object was provided before making assignments to the fields.

            7. `function Finish: iSetup4DCEPResultIBGE;`

               - This method provides an instance that implements the [iSetup4DCEPResultIBGE](#-isetup4dcepresultibge) interface. It is used to complete the execution and obtain a reference to the main TSetup4DCEPResultIBGE instance.

      2. `function JSONObject(out AValue : TJSONObject): ISetup4DCEPResultIBGE; overload;` 

         - This method allows you to obtain a JSON object containing the results of the IBGE query.

      3. `function JSONObject: TJSONObject; overload;`

         - This method allows you to obtain the JSON object with the results of the IBGE query.

      4. `function JSONObjectInStr: String; overload;` 

         - This method allows you to obtain the JSON object as a JSON string with the results of the IBGE query.

      5. `function Finish: ISetup4DCEPResult;`

         - This method provides an instance that implements the [ISetup4DCEPResult](#-isetup4dcepresult). It is used to complete the execution and obtain a reference to the main TSetup4DCEPResult instance. Therefore, this line simply returns the reference to the invoking instance.

##### ⚡️ `function Finish: ISetup4DCEP;`

   + This method provides an instance that implements the [ISetup4DCEP](#-isetup4dcep) interface. It is used to complete the configuration and obtain a reference to the main [TSetup4DCep](#-funções-do-tsetup4dcep) instance. Therefore, this line simply returns the reference to the invoking instance.
