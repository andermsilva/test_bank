# Test Bank

## Descrição    
Este projeto é um teste de desenvolvimento de um aplicativo. O aplicativo foi desenvolvido em Flutter e possui as seguintes funcionalidades:
- Saque (R$ 100)
- Depósito (R$ 100)
- Exibição de saldo
- Botão de exibir/ocultar saldo

=======
## Comandos para disponibilizar para web
- No diretorio do projeto
- $ flutter config --enable-web
- $ flutter build web
- sera gerado uma pasta web no diretorio build => build/web
### Publicar na web
- Publicar no netlify
- acesse: Add new site -> Deploy manually
- faça o upload da pasta bulid/web do projeto flutter


=======

## Publicar app no PlayStore

### Gerar KeyStore (no windows)

 1. Utilize o aplicativo keytool, se encontra no diretorio do java instalado no seu Pc exemplo:(C:\andorid\Android Studio\jbr\bin) ou (C:\java17\bin)

 2. No diretorio bin abra o CMD e execute o comando: C:\java17\bin> keytool -genkey -v -keystore d:\projectFlutter\key.jks -storetype JKS -keyalg RSA -keysize 2048 -validity 10000 -alias <chaveapp>

 3. Será preencher algumas informações:
    - Senha e confimação de senha
    - nome e sobrenome
    - nome de sua organização (onde trabalho ou estuda)
    - nome da unidade de sua oraganização
    - nome da sua localidade cidade
    - nome do Estado
    - Duas letrar que endica qual o seu pais
    - Escolher uma senha para acessar
   
    Enter keystore password: </br>

    Re-enter new password: </br>

    What is your first and last name?</br>
      [Unknown]:  <seu nome></br>
    What is the name of your organizational unit?</br>
      [Unknown]: <sua unidade organizacional></br>
    What is the name of your organization?</br>
      [Unknown]:  <sua organização></br>
    What is the name of your City or Locality?</br>
      [Unknown]: <sua cidade></br>
    What is the name of your State or Province?</br>
      [Unknown]: <seu estado></br>
    What is the two-letter country code for this unit?</br>
      [Unknown]: < br > </br>
    Is CN=a, OU=b, O=c, L=d, ST=f, C=g correct?</br>
      [no]:  yes </br>

   - voce deve escolher uma senha para acessar a chave se preferir pressione enter para definir a mesma senha keystore
   
    Generating 2.048 bit RSA key pair and self-signed certificate (SHA256withRSA) with a validity of 10.000 days
        for: CN=a, OU=b, O=c, L=d, ST=f, C=g
    Enter key password for <chaveapp>
        (RETURN if same as keystore password):

  4. Cria um arquivo key.properties, no diretorio android do projeto [diretorio_projeto]/android/key.properties
     - com o seguinte conteudo:
      ``` 
      storePassword=<password-from-previous-step>(senha definida anteriormente)
      keyPassword=<password-from-previous-step>(senha definida anteriormente)
      keyAlias=<alias>(nome do alias, ex: chaveapp)
      storeFile=<keystore-file-location>(local onde foi criada a keystore Ex: d:\\projectFlutter\\key.jks )

  5. Adicinar linhas de comando no arquivo build.gradle no diretorio do projeto android/app/build.gradle
    
    ```
       def keystoreProperties = new Properties()
          def keystorePropertiesFile = rootProject.file('key.properties')
              if (keystorePropertiesFile.exists()) {
                   keystoreProperties.load(new FileInputStream(keystorePropertiesFile))
              }
       android{
      
      ...}
     
  6. Adicionar ao arquivo build.gradle (android/app/build.gradle)
    
        ```
        { ....

          buildTypes {
            release {
                // TODO: Add your own signing config for the release build.
                // Signing with the debug keys for now,
                // so `flutter run --release` works.
                
                signingConfig = signingConfigs.release
            }
        }
          ...
      }
 
 ## Compilar um app 

  ### Compilando uma versão release.

  - No terminal do vsCode na raiz do projeto use o comando:

  - PS D:\diretoriProjeto\seu_app>  flutter build appbundle
  - Esse comando resultara na geração do executavel: [diretorio_projeto]/build/app/outputs/bundle/release/app.aab
  - Esse app ja esta pronto para ser publicado na PlayStore
  
  - Também é possivem criar um app com extensão apk  (app.apk) porém para que seu app não seja compilado </br> 
    com o seu codigo dart e para evitar a engenharia reversa, utilize o comando flutter build apk --split-per-abi.

  ### Instalando um app em um dispositivo.

  - PS D:\diretoriProjeto\seu_app>  flutter build --split-per-abi

  - Esse comando resutara na criação de arquivos:
  
    - [diretorio_projeto]/build/app/outputs/apk/release/app-armeabi-v7a-release.apk
    - [diretorio_projeto]/build/app/outputs/apk/release/app-arm64-v8a-release.apk
    - [diretorio_projeto]/build/app/outputs/apk/release/app-x86_64-release.apk
  
  - para as diferentes arquiteturas de hardwares de dispositivos
 
  - Para instalar o seu app em um dispositivo, remova a flag --split-per-abi
  - Ex: app-arm64-v8a-release.apk removendo a flag -> app-release.apk
  - Conecte o cabo USB no dispositivo (permitir depuração via USB no dispositivo)
  - Execute o comando flutter install, ex: PS D:\diretorio_projeto\seu_app> flutter install


## Setup para Teste.

- Clone o repositório
- Configure o ambiente de desenvolvimento Flutter para Android e Web
- Execute o projeto
- Faça as alterações necessárias (caso queira)
- Gere o BUILD do projeto versão Android
- Execute o arquivo APK gerado no seu dispositivo Android
- Gere o BUILD do projeto versão Web
- Publique o projeto em um servidor web (Netlify, Firebase, etc)


Links de Referência:
- [Flutter](https://flutter.dev/)
- [Build Web](https://docs.flutter.dev/platform-integration/web/building)
- [Build Android](https://flutter.dev/docs/deployment/android)
