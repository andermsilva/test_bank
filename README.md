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
    Enter keystore password: 

    Re-enter new password:

    What is your first and last name?
      [Unknown]:  <seu nome>
    What is the name of your organizational unit?
      [Unknown]: <sua unidade organizacional>
    What is the name of your organization?
      [Unknown]:  <sua organização>
    What is the name of your City or Locality?
      [Unknown]: <sua cidade>
    What is the name of your State or Province?
      [Unknown]: <seu estado>
    What is the two-letter country code for this unit?
      [Unknown]: <br>
    Is CN=a, OU=b, O=c, L=d, ST=f, C=g correct?
      [no]:  yes

   - voce deve escolher uma senha para acessar a chave se preverir pressione enter para definir a mesma senha keystore
   
    Generating 2.048 bit RSA key pair and self-signed certificate (SHA256withRSA) with a validity of 10.000 days
        for: CN=a, OU=b, O=c, L=d, ST=f, C=g
    Enter key password for <chaveapp>
        (RETURN if same as keystore password):

  4. inserir o arquivo key.properties, no diretorio android/key.properties
     - com o seguinte conteudo:
       
      storePassword=<password-from-previous-step>(senha definida anteriormente)
      keyPassword=<password-from-previous-step>(senha definida anteriormente)
      keyAlias=<alias>(no ex: chaveapp)
      storeFile=<keystore-file-location>(local onde foicriada a keystore Ex: d:\\projectFlutter\\key.jks )

  5. Adicinar linhas de comando no arquivo build.gradle no diretorio do projeto android/app/build.gradle
    

    ```def keystoreProperties = new Properties()
       def keystorePropertiesFile = rootProject.file('key.properties')
       if (keystorePropertiesFile.exists()) {
         keystoreProperties.load(new FileInputStream(keystorePropertiesFile))
     }```
    
      - android{
      
     ......}
 
## Setup para Teste

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
