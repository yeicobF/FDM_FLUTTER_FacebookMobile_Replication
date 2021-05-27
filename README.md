# **[T2.3] COPIAR DIVERSAS PANTALLAS DE LA APP DE FACEBOOK PARA CELULAR**

> - Para esta actividad trabajaremos en equipo Germán y yo.
>
> - ***IMPORTANTE:*** Si no entregamos el trabajo, nos bajará 2 puntos.

## ***FECHA DE ENTREGA***

> PRIMERA: Jueves, 6 de mayo del 2021

## **NOMBRE DEL PAQUETE DE LA APP**

El nombre del paquete de la app lo cambié para registrarlo con Firebase,
siguiendo la nomenclatura:

> com.company.appname
>
> - NOMBRE DEL PAQUETE:
>   - com.uaslp.facebook_simple_replication

## ***TABLA DE CONTENIDOS***

- [1.3. **PANTALLAS OBJETIVO**](#13-pantallas-objetivo)
- [1.4. **INSTALACIONES**](#14-instalaciones)
  - [1.4.1. **Android Studio**](#141-android-studio)
    - [1.4.1.1. **CONFIGURACIÓN OBLIGATORIA ANDROID STUDIO**](#1411-configuración-obligatoria-android-studio)
      - [1.4.1.1.1. **INSTALACIÓN DE PAQUETES**](#14111-instalación-de-paquetes)
      - [1.4.1.1.2. **INSTALACIÓN DE PLUGINS**](#14112-instalación-de-plugins)
      - [1.4.1.1.3. **COMPROBACIÓN DE ACTUALIZACIONES**](#14113-comprobación-de-actualizaciones)
    - [1.4.1.2. **CREAR UN `EMULADOR DE ANDROID` (`ANDROID VIRTUAL DEVICE`)**](#1412-crear-un-emulador-de-android-android-virtual-device)
      - [1.4.1.2.1. ***RECOMENDACIÓN IMPORTANTE PARA EL AVD***](#14121-recomendación-importante-para-el-avd)
  - [1.4.2. **Flutter**](#142-flutter)
    - [1.4.2.1. ***EN QUÉ DIRECTORIO COLOCAR FLUTTER***](#1421-en-qué-directorio-colocar-flutter)
    - [1.4.2.2. **VARIABLE DE USUARIO**](#1422-variable-de-usuario)
  - [1.4.3. **Chocolatey**](#143-chocolatey)
    - [1.4.3.1. ***INSTRUCCIONES INSTALACIÓN DESDE POWERSHELL***](#1431-instrucciones-instalación-desde-powershell)
  - [1.4.4. **scrcpy**](#144-scrcpy)
    - [1.4.4.1. ***INSTRUCCIONES INSTALACIÓN DESDE POWERSHELL con CHOCOLATEY***](#1441-instrucciones-instalación-desde-powershell-con-chocolatey)
  - [1.4.5. **JAVA**](#145-java)
    - [1.4.5.1. ***INFORMACIÓN SOBRE LAS VERSIONES DE JAVA***](#1451-información-sobre-las-versiones-de-java)
    - [1.4.5.2. **CONCEPTOS EN LOS ACRÓNIMOS DE JAVA:** ***`JDK, JVM, JRE`***](#1452-conceptos-en-los-acrónimos-de-java-jdk-jvm-jre)
    - [1.4.5.3. **DESCARGA DE JAVA**](#1453-descarga-de-java)
- [1.5. ***VARIABLES DEL SISTEMA o de USUARIO***](#15-variables-del-sistema-o-de-usuario)
  - [1.5.1. **ACCEDER A LA SECCIÓN PARA EDITAR LAS VARIABLES**](#151-acceder-a-la-sección-para-editar-las-variables)
  - [1.5.2. **VARIABLE DEL SISTEMA: `JAVA_HOME`**](#152-variable-del-sistema-java_home)
    - [1.5.2.1. VERIFICACIÓN DE QUE JAVA_HOME ESTÁ ESTABLECIDO](#1521-verificación-de-que-java_home-está-establecido)
- [1.6. USO DE ÍCONOS](#16-uso-de-íconos)
  - [1.6.1. GOOGLE FONTS | MATERIAL ICONS](#161-google-fonts--material-icons)
    - [1.6.1.1. Íconos que podríamos utilizar](#1611-íconos-que-podríamos-utilizar)
  - [1.6.2. **Íconos con Font Awesome**](#162-íconos-con-font-awesome)
    - [1.6.2.1. **Íconos que podríamos utilizar**](#1621-íconos-que-podríamos-utilizar)

## 1.3. **PANTALLAS OBJETIVO**

Hay dos pantallas que tenemos como objetivo, pero una es opcional: pantalla de
inicio de sesión, y pantalla después de dar click al botón de inicio de sesión.

- P**antalla principal de inicio de sesión (los colores se modificaron al exportar
  desde Photoshop, ya que le quité la imagen original).**

  | NÚMERO DE PANTALLA | DESCRIPCIÓN DE PANTALLA | IMAGEN DE LA PANTALLA |
  | :----------------: | :---------------------: | :-------------------: |
  | 1 | PRIMERA PANTALLA DE INICIO DE SESIÓN CON LOS COLORES MODIFICADOS | ![1 - MAIN LOGIN SCREEN - PICTURE GONE] |
  | 1 | COLORES ORIGINALES DE LA PRIMERA PANTALLA DE INICIO DE SESIÓN | ![1 - MAIN LOGIN SCREEN - ORIGINAL COLORS] |
  | 2 | PANTALLA PARA INICIAR SESIÓN DESPUÉS DE DAR CLICK AL BOTÓN "Log Into Another Account" | ![2 - LOGIN AFTER CLICKING BUTTON] |
  | 3 | FEED PRINCIPAL DESPUÉS DE HABER INICIADO SESIÓN (LOS ELEMENTOS SON IMPRECISOS RESPECTO A POSICIÓN Y TAMAÑO PORQUE LA IMAGEN FUE EDITADA PARA OCULTAR INFORMACIÓN PERSONAL. NOS BASAMOS EN LA IMAGEN SIN EDITAR.) | ![3 - MAIN FEED - EDITED IMAGE] |

[1 - MAIN LOGIN SCREEN - PICTURE GONE]: <objective-program-screen/LOGIN_SCREENS/1_main-login-with-picture_PICTURE-GONE_MODIFIED-COLORS-PS.png> "1 | MAIN LOGIN SCREEN | PICTURE GONE"
[1 - MAIN LOGIN SCREEN - ORIGINAL COLORS]: <objective-program-screen/LOGIN_SCREENS/1_main-login-with-picture_ORIGINAL-COLORS.png> "1 | MAIN LOGIN SCREEN | ORIGINAL COLORS"
[2 - LOGIN AFTER CLICKING BUTTON]: <objective-program-screen/LOGIN_SCREENS/2_login-into-account-clicked_NO-NUMBER.png> "2 | LOGIN AFTER CLICKING BUTTON"
[3 - MAIN FEED - EDITED IMAGE]: <objective-program-screen/MAIN_FEED_SCREENS/main-feed_screen_1_EDITADA-SIN-DATOS-PERSONALES.png> "3 | MAIN FEED | EDITED IMAGE"

## **RESULTADOS DE LAS PANTALLAS**

| NÚMERO DE PANTALLA | DESCRIPCIÓN DE PANTALLA | IMAGEN DE LA PANTALLA |
| :----------------: | :---------------------: | :-------------------: |
| 1 | PRIMERA PANTALLA DE INICIO DE SESIÓN QUE MUESTRA NÚMERO DE NOTIFICACIONES [SAMSUNG A20S] | ![1 - OWN MAIN LOGIN SCREEN] |

[1 - OWN MAIN LOGIN SCREEN]: <VIDEOS_SS_PROGRESS/JACOB_CELL/loginScreen_1_JACOB_CELL.png> "1 - OWN MAIN LOGIN SCREEN"

## 1.4. **INSTALACIONES**

Para que todo funcione correctamente, hay que instalar varias cosas:

### 1.4.1. **[Android Studio]**

Simplemente descarga el archivo que se encuentra en el enlace y ejecutalo.
Después podrás configurarlo como tú quieras.

#### 1.4.1.1. **CONFIGURACIÓN OBLIGATORIA ANDROID STUDIO**

Para que Android Studio y Flutter funcionen de manera correcta, hay que
configurar unos elementos que serán obligatorios, siguiendo los siguientes pasos:

##### 1.4.1.1.1. **INSTALACIÓN DE PAQUETES**

Hay una serie de paquetes necesarios para trabajar con Flutter y el emulador de
Android, entre otras cosas más.

1. Abre Android Studio.

    ![Ventana inicial AS](README_imgs/AS_CONFIG/as_1.png "Ventana inicial AS")

2. Da click en el botón ⚙ **`Configure`**.

    ![Ventana inicial AS | Botón configure](README_imgs/AS_CONFIG/as_2.png "Ventana inicial AS | Botón configure")

3. Abre la ventana de configuraciones del **`SDK (Software Developer Kit)`**
   dando click en el botón **`SDK Manager`**.

   ![Ventana inicial AS | Configure/SDK Manager](README_imgs/AS_CONFIG/as_3.png "Ventana inicial AS | Configure/SDK Manager")

    - Te aparecerá una ventana con la lista de los **`Android SDK`**, los cuales te
      permitirán desarrollar aplicaciones en ese sistema operativo.

        ![Android SDK/SDK Platforms](README_imgs/AS_CONFIG/as_4.png "Android SDK/SDK Platforms")

4. De la lista de **`SDK Platforms`** puedes elegir el que quieras, pero en mi
   caso tuve que eleguir el **`Android 8.1 (Oreo) | API Level: 27`** porque el
   profesor así lo indicó por su estabilidad.

   ![Android SDK/SDK Platforms/Android 8.1 (Oreo)](README_imgs/AS_CONFIG/as_5.png "Android SDK/SDK Platforms/Android 8.1 (Oreo)")

5. Ahora dirígete a la pestaña de **`SDK Tools`** dentro del mismo submenú. Está
   a la derecha de la pestaña del paso anterior (**`SDK Platforms`**).

   ![Android SDK/SDK Tools](README_imgs/AS_CONFIG/as_6.png "Android SDK/SDK Tools")

6. **Tendrás que seleccionar una serie de elementos** (***sin quitar la selección de
   los seleccionados por default***) que te permitirán trabajar con
   el desarrollo de tus aplicaciones y el uso del ***`emulador de Android`***.
   Estos elementos son los siguientes:

    - **Google USB Driver**

      ![Google USB Driver](README_imgs/AS_CONFIG/as_8.png   "Google USB Driver")

    - ***El siguiente elemento depende de tu procesador***:

      - ***Si tienes un procesador de Intel, selecciona la siguiente opción***:

        > **Intel x86 Emulator Accelerator (HAXM Installer)**

      - ***Si tienes un procesador de AMD, selecciona la siguiente opción***:

        > **Android Emulator Hypervisor Driver for AMD Processors (installer)**

      ![AMD and Intel Emulator elements installer](README_imgs/AS_CONFIG/as_10.png "AMD and Intel Emulator elements installer")

    - [***`OPCIONAL POR SI QUIERES LA ÚLTIMA VERSION (NO ESTABLE) DE ESTE
       ELEMENTO`***]
       **Android SDK Build-Tools 31-rc3** (***YO NO LA SELECCIONARÉ, A MENOS QUE
       TENGA PROBLEMAS CON LA ÚLTIMA VERSIÓN ESTABLE***)

      1. Da click en el botón de la parte inferior derecha que dice
         "***`Show Package Details`***" para mostrar TODAS las versiones de cada
         paquete.

      2. Da click en la última versión del paquete, la cual puede estar hasta
         o hasta abajo de la lista, dependiendo del orden en el que estén
         mostrados. Es la versión con los números más altos.

        ![Android SDK Build-Tools 31-rc3](README_imgs/AS_CONFIG/as_9.png "Android SDK Build-Tools 31-rc3")

    - [***`OPCIONAL POR SI QUIERES PODER UTILIZAR LA LÍNEA DE COMANDOS`***]
       **Android SDK Command-line Tools (latest)**

      ![Android SDK Command-line Tools (latest)](README_imgs/AS_CONFIG/as_7.png   "Android SDK Command-line Tools (latest)")

7. Ahora, para que todo sea instalado, da click en el botón "***`Apply`***".

   ![Apply all installed elements](README_imgs/AS_CONFIG/as_11.png "Apply all installed elements")

8. Aparecerá una ventana que te pedirá confirmar los cambios. Da click en el
   botón "***`OK`***".

   ![Apply all installed elements](README_imgs/AS_CONFIG/as_13.png "Apply all installed elements")

9. Aparecerá otra ventana en donde tendrás que aceptar los términos y
   condiciones de cada licencia. Acéptalos y da click al botón "***`Finish`***".

   ![License Agreement | Accept Terms and Conditions](README_imgs/AS_CONFIG/as_14.png "License Agreement | Accept Terms and Conditions")

10. Después de esto, te mostrará el progreso de instalación de los paquetes.

   ![Component Installer | Installing Requested Components](README_imgs/AS_CONFIG/as_15.png "Component Installer | Installing Requested Components")

11. Una vez terminada la instalación, da click en el botón "***`Finish`***".

    ![Component Installer | Finish](README_imgs/AS_CONFIG/as_16.png "Component Installer | Finish")

12. Ahora da click en el botón "***`OK`***".

   ![Finish configuration](README_imgs/AS_CONFIG/as_17.png "Finish configuration")

##### 1.4.1.1.2. **INSTALACIÓN DE PLUGINS**

Para trabajar con Flutter de forma cómoda, hay que instalar una serie de Plugins
que nos facilitarán el desarrollo de los programas.

1. Abre Android Studio.

   ![Ventana inicial AS](README_imgs/AS_CONFIG/as_1.png "Ventana inicial AS")

2. Da click en el botón ⚙ **`Configure`**.

   ![Ventana inicial AS | Botón configure](README_imgs/AS_CONFIG/as_2.png "Ventana inicial AS | Botón configure")

3. Da click en el botón "***`Plugins`***".

   ![Ventana inicial AS | Configure/Check for Updates](README_imgs/AS_CONFIG/as_24.png "Ventana inicial AS | Configure/Check for Updates")

4. Te aparecerá una nueva ventana. Selecciona el apartado de
   "***``Marketplace``***".

   ![Plugins | Installed](README_imgs/AS_CONFIG/as_25.png "Plugins | Installed")

5. Busca "**`Flutter`**", seleccionalo y da click en "***`Install`***".

   ![Plugins | Marketplace | Flutter](README_imgs/AS_CONFIG/as_26.png "Plugins | Marketplace | Flutter")

6. Te indicará que también tienes que instalar el plugin de "***`Dart`***". Da
   click en "***`Install`***", ya que ***`Flutter` se escribe en `Dart`***, por lo que es
   necesario.

   ![Plugins | Marketplace | Flutter](README_imgs/AS_CONFIG/as_27.png "Plugins | Marketplace | Flutter")

7. Si es que te lo pide, da click en "**`Restart IDE`**" para que se apliquen
   los cambios.

   ![Plugins | Restart IDE](README_imgs/AS_CONFIG/as_23.png "Plugins | Restart IDE")

##### 1.4.1.1.3. **COMPROBACIÓN DE ACTUALIZACIONES**

Hay que comprobar si hay actualizaciones disponibles.

1. Abre Android Studio.

    ![Ventana inicial AS](README_imgs/AS_CONFIG/as_1.png "Ventana inicial AS")

2. Da click en el botón ⚙ **`Configure`**.

    ![Ventana inicial AS | Botón configure](README_imgs/AS_CONFIG/as_2.png "Ventana inicial AS | Botón configure")

3. Da click en el botón "***`Check for Updates`***".

   ![Ventana inicial AS | Configure/Check for Updates](README_imgs/AS_CONFIG/as_18.png "Ventana inicial AS | Configure/Check for Updates")

   - Si hay actualizaciones te lo indicará como en la siguiente captura. Da
     click a ese botón/hipervínculo.

     ![Plugin Updates Available](README_imgs/AS_CONFIG/as_19.png "Plugin Updates Available")

4. Te aparecerá una nueva ventana. Da click a "***`Update`***" de forma
   individual si solo quieres actualizar elementos en específico, o da click en
   "Update all" si quieres que todos los paquetes se actualicen automáticamente.

   ![Updates available](README_imgs/AS_CONFIG/as_20.png "Updates available")
   ![Updating](README_imgs/AS_CONFIG/as_21.png "Updating")

5. Si es que te lo pide, da click en "**`Restart IDE`**" para que se apliquen
   los cambios.

   ![Updates | Restart IDE](README_imgs/AS_CONFIG/as_22.png "Updates | Restart IDE")

   ![Updates | Restart IDE](README_imgs/AS_CONFIG/as_23.png "Updates | Restart IDE")

6. Listo.

#### 1.4.1.2. **CREAR UN `EMULADOR DE ANDROID` (`ANDROID VIRTUAL DEVICE`)**

Para correr un programa podemos utilizar nuestro celular conectándolo a a la
computadora mediante cable USB, o mediante un emulador de Android creado con
Android Studio.

1. Abre Android Studio.

   ![Ventana inicial AS](README_imgs/AS_CONFIG/as_1.png "Ventana inicial AS")

2. Da click en el botón ⚙ **`Configure`**.

   ![Ventana inicial AS | Botón configure](README_imgs/AS_CONFIG/as_2.png "Ventana inicial AS | Botón configure")

3. Da click en la opción de **``AVD Manager``**.

   ![Ventana inicial AS | AVD Manager](README_imgs/AS_CONFIG/as-avd_1.png "Ventana inicial AS | AVD Manager")

   - Se abrirá una nueva ventana "**`Your Virtual Devices`**", en donde se
     encontrará una lista de dispositivos virtuales (emuladores de android).

      ![Android Virtual Device Manager | Your Virtual Devices](README_imgs/AS_CONFIG/as-avd_2.png "Android Virtual Device Manager | Your Virtual Devices")

4. Da click en **`Create Virtual Device`**.

   ![Android Virtual Device Manager | Your Virtual Devices | Create Virtual Device...](README_imgs/AS_CONFIG/as-avd_3.png "Android Virtual Device Manager | Your Virtual Devices | Create Virtual Device...")

5. Aparecerá una nueva ventana: **`Virtual Device Configuration`**. Elige el
   dispositivo que quieras emular. En mi caso elegí el **`Pixel 2`**, que es el
   que recomendó el profesor. Después das click en el botón **`Next`**.

   ![AVD Manager | Virtual Device Configuration | Select Hardware](README_imgs/AS_CONFIG/as-avd_4.png "AVD Manager | Virtual Device Configuration | Select Hardware")

6. Selecciona el Sistema Operativo que quieres que emule el dispositivo virtual.
   En mi caso elegí **`Android 8.1 (Oreo) | API Level: 27`**.

   - Si no lo tienes descargado, lo tendrás que descargar dando click al
     **`Download`** que está a la derecha del nombre del Sistema Operativo.

     ![Oreo (8.1) | Download](README_imgs/AS_CONFIG/as-avd_5.png "Oreo (8.1) | Download")

   ![Oreo (8.1) | Installing](README_imgs/AS_CONFIG/as-avd_6.png "Oreo (8.1) | Installing")

7. Una vez terminada la instalación del API que elegiste, da click en
   **`Finish`**.

   ![Finish API installation](README_imgs/AS_CONFIG/as-avd_7.png "Finish API installation")

8. Da click en **`Next`** después de elegir la API a utilizar.

   ![System Image selected](README_imgs/AS_CONFIG/as-avd_8.png "System Image selected")

9. Verifica tu configuración y cuando todo esté como lo deseas, da click en
   **`Finish`**.

   - En esta sección puedes cambiar el nombre del dispositivo y algunas
     configuraciones avanzadas.

   ![AVD | Verify Configuration](README_imgs/AS_CONFIG/as-avd_9.png "AVD | Verify Configuration")

10. Ya está todo listo. Ahora puedes iniciar tu dispositivo dando click en el
    botón verde bajo la sección "**`Actions`**".

   ![Launch AVD in emulator](README_imgs/AS_CONFIG/as-avd_10.png "Launch AVD in emulator")

##### 1.4.1.2.1. ***RECOMENDACIÓN IMPORTANTE PARA EL AVD***

Cada vez, el AVD va a ir ocupando una mayor cantidad de espacio en el disco
duro, el cual se puede ver en la sección de "**`Size on Disk`**", así que viene
muy bien la liberación de ese espacio.

![AVD Size on Disk](README_imgs/AS_CONFIG/as-avd_11.png "AVD Size on Disk")

1. En la sección "**`Actions`**" da click al botón que tiene la flecha para
   abajo.

   ![AVD Options](README_imgs/AS_CONFIG/as-avd_12.png "AVD Options")

2. Da click a "**`Wipe Data`**".

   ![AVD | Wipe Data](README_imgs/AS_CONFIG/as-avd_13.png "AVD | Wipe Data")

3. Listo. Ahora has liberado una buen cantidad de espacio en el disco duro.
   Puedes hacer esto en cualquier momento (mientras no utilices el dispositivo).

### 1.4.2. **[Flutter]**

Entra al enlace de  la documentación oficial de [Flutter] y en la sección de
***"[Get the Flutter SDK]"*** da click en el botón de descarga, el cual dice
***`flutter_windows_2.0.6-stable.zip`***.

[Get the Flutter SDK]: <https://flutter.dev/docs/get-started/install/windows#get-the-flutter-sdk> "Flutter Windows Install | Get the Flutter SDK"

#### 1.4.2.1. ***EN QUÉ DIRECTORIO COLOCAR FLUTTER***

Para no tener problemas con espacios y demás, coloqué Flutter directamente en el
directorio principal del disco duro (**`C:/`**), creando una carpeta dentro y
extrayéndolo. Entonces quedaría de la siguiente forma:

> **`C:\SDKs\flutter`**

Así, cada vez que quiera encontrar Flutter, será más sencillo.

#### **FLUTTER** ***`SOUND NULL SAFETY`***

> ***A día de hoy, Viernes, 21 de mayo del 2021, aún no lo implementamos, pero
> dejamos las instrucciones para un futuro.***

Habilitamos la opción `Sound Null Safety` de Flutter para evitar problemas con
valores null. Esto lo podemos encontrar en la documentación:

> [Dart | Samples & tutorials/Null Safety](https://dart.dev/null-safety#enable-null-safety "Dart | Samples & tutorials/Null Safety")

Como se indica en el sitio web:

***To make Dart treat your code as null safe, the SDK constraints must***
***require a language version that has null safety support. For example, your***
***`pubspec.yaml` file might have the following constraints:***

> ```yaml
> environment:
>   sdk: ">=2.12.0 <3.0.0"
> ```

Siguiendo lo anterior, `Sound null safety` estaría activado.
#### 1.4.2.2. **VARIABLE DE USUARIO**

Para ver cómo configurar la variable de usuario, dirígete a la **sección del
siguiente enlace** (te enviará dentro del README):

> [CONFIGURACIÓN DE VARIABLE DE USUARIO PARA FLUTTER](#flutter-user-var "VARIABLE DE USUARIO PARA FLUTTER")

### 1.4.3. **[Chocolatey]**
  
  [Chocolatey] es un administrador de paquetes en Windows, con el que podemos
  instalar una diversidad de paquetes (valga la redundancia) de forma sencilla
  corriendo comandos desde una terminal.

  > Este es solo para instalar [scrcpy]

#### 1.4.3.1. ***INSTRUCCIONES INSTALACIÓN DESDE POWERSHELL***

De acuerdo con las instrucciones del sitio web de [Chocolatey], hay que seguir
los siguientes pasos:

> REQUIREMENTS
>
> - Windows 7+ / Windows Server 2003+
> - PowerShell v2+ (minimum is v3 for install from this website due to TLS 1.2
> requirement)
> - .NET Framework 4+ (the installation will attempt to install .NET 4.0 if you do
> not have it installed)(minimum is 4.5 for install from this website due to TLS
> 1.2 requirement)

1. First, ensure that you are using an
   [administrative shell](https://www.howtogeek.com/194041/how-to-open-the-command-prompt-as-administrator-in-windows-8.1/ "administrative shell") -
   you can also install as a non-admin, check out [Non-Administrative
   Installation](https://docs.chocolatey.org/en-us/choco/setup#non-administrative-install "Non-Administrative Installation").

2. Install with powershell.exe

   > ***NOTE:* Please inspect [https://chocolatey.org/install.ps1](https://chocolatey.org/install.ps1 "https://chocolatey.org/install.ps1")
   > prior to running any of these scripts to ensure safety. We already know
   > it's safe, but you should verify the security and contents of any script
   > from the internet you are not familiar with. All of these scripts download
   > a remote PowerShell script and execute it on your machine. We take security
   > very seriously.
   > [Learn more about our security protocols](https://docs.chocolatey.org/en-us/information/security "Learn more about our security protocols")
   > .**

   With PowerShell, you must ensure [Get-ExecutionPolicy](https://go.microsoft.com/fwlink/?LinkID=135170 "Get-ExecutionPolicy")
   is not Restricted. We suggest using `Bypass` to bypass the policy to get
   things installed or `AllSigned` for quite a bit more security.

   - Run `Get-ExecutionPolicy`. If it returns `Restricted`, then run `Set-ExecutionPolicy AllSigned` or `Set-ExecutionPolicy Bypass -Scope Process`.

   Now run the following command:

   > ```ps
   > Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
   > ```

3. Paste the copied text into your shell and press Enter.
4. Wait a few seconds for the command to complete.
5. If you don't see any errors, you are ready to use Chocolatey! Type `choco` or
   `choco -?` now, or see [Getting Started](https://docs.chocolatey.org/en-us/getting-started "Getting Started")
   for usage instructions.

   ![Chocolatey installation ready](README_imgs/ps-chocolatey.png "Chocolatey installation ready")

   ![Chocolatey installation ready](README_imgs/ps-chocolatey-choco.png "Chocolatey installation ready")

### 1.4.4. **[scrcpy]**

[scrcpy] es una aplicación para poder ver la pantalla de tu celular en tu
computadora, conectándolo con un cable USB. Se puede instalar de diversas
formas, indicadas en el GitHub, al que puedes hacer dando click aquí: [scrcpy].

#### 1.4.4.1. ***INSTRUCCIONES INSTALACIÓN DESDE POWERSHELL con CHOCOLATEY***

En mi caso, decidí instalarlo con [Chocolatey], ya que es más rápido y sencillo
que tener que descomprimir carpetas manualmente y cosas así.

Hay que ejecutar los siguientes comandos en la terminal de `Windows Powershell`,
que ya viene instalada en Windows 10.

> **NOTA**: Va a pedir que aceptes varias cosas, por lo que tendrás que hacerlo
> para que los programas se puedas descargar e instalar.
>
> - **`Y`** <- **Correr solo el script actual.**
> - **`A`** <- **Correr todos los scripts.**

1. Hay que instalar una cosa antes, para hacerlo funcionar, que es el `Android
   Debug Bridge (adb)`:

   > ```properties
   > choco install adb
   > ```

   ![choco install adb | Installing](README_imgs/ps-choco-adb_1.png "choco install adb | Installing")

   ![choco install adb | Installed](README_imgs/ps-choco-adb_2.png "choco install adb | Installed")

2. Ahora ya habría que instalar [scrpy] escribiendo lo siguiente:

   > ```properties
   > choco install scrcpy
   > ```

   ![choco install scrcpy | Installing](README_imgs/ps-choco-scrcpy_1.png "choco install scrcpy | Installing")

   ![choco install scrcpy | Installed](README_imgs/ps-choco-scrcpy_2.png "choco install scrcpy | Installed")

### 1.4.5. **JAVA**

Es necesario tener instalado Java y tenerlo en las variables del sistema para
poder ejecutar los programas.

#### 1.4.5.1. ***INFORMACIÓN SOBRE LAS VERSIONES DE JAVA***

Hay diversas versiones de Java, por lo que hay que saber elegir cuál utilizar.
En el siguiente enlace esto viene bien explicado:

> - [stackchief | Which Version of Java Should You Use?]

#### 1.4.5.2. **CONCEPTOS EN LOS ACRÓNIMOS DE JAVA:** ***`JDK, JVM, JRE`***

Hay diversos acrónimos que se manejan en Java, por lo que identificar cuál
significa qué cosa es complicado.

La información para conocer esto la encontré en el siguiente enlace (mismo del
punto anterior):

> - [stackchief | Which Version of Java Should You Use?]
>
> - **`JDK: Java Developer Kit`**
>  
>   The **`Java Developer Kit (JDK)`** is a development environment that you
>   download for developing Java applications. It includes the JRE as well as an
>   interpreter, compiler, and other tools for debugging and development. You'll
>   need the JDK to develop Java applications, but not to run them. This is
>   because the JRE is included with Java installs.
>
> - **`JVM: Java Virtual Machine`**
>
>   The **`Java Virtual Machine (JVM)`** which is an abstract computing machine
>   that enables your computer to run a Java program.
>
> - **`JRE: Java Runtime Environment`**
>
>   Java requires a runtime environment **to execute the code you write**. When
>   you download Java, you also get the **`Java Runtime Environment (JRE)`**.
>   This JRE includes a Java Virtual Machine (JVM) which is an abstract
>   computing machine that enables your computer to run a Java program.

[stackchief | Which Version of Java Should You Use?]: <https://www.stackchief.com/blog/Which%20Version%20of%20Java%20Should%20You%20Use%3F> "stackchief | Which Version of Java Should You Use?"

#### 1.4.5.3. **DESCARGA DE JAVA**

En mi caso descargué la versión **`Java SE 11 (LTS)`**, ya que es la última
versión que se ha lanzado con **`LTS (Long Term Support - Soporte a largo
plazo)`**, lo que significa que es una versión que tendrá soporte por mucho más
tiempo de lo habitual. Esto no debería se un problema y podría instalar la
última versión que se ha lanzado, la **`Java SE 16`**, pero por ahora instalaré
esta.

> - [TheServerSide | Don't ever put a non-Java LTS release into production](https://www.theserverside.com/opinion/Dont-ever-put-a-non-Java-LTS-release-into-production "TheServerSide | Don't ever put a non-Java LTS release into production")

Por lo que leí, la próxima versión de **`Java LTS`** será la versión **`17`**, y
llegará en este año 2021, pero a día de hoy, Mayo del 2021 aún no ha salido.
Cada versión de Java es lanzada cada 6 meses.

> ***ENLACE DE DESCARGA DE VERSIONES DE `JAVA SE (Standard Edition)`***
>
> - [Oracle | Java SE Downloads | Java Platform, Standard Edition](https://www.oracle.com/mx/java/technologies/javase-downloads.html "Oracle | Java SE Downloads | Java Platform, Standard Edition")
>
> ***DESCARGAS DE `Java SE Development Kit (JDK) 11`***
>
> - [Oracle | Java SE Development Kit 11 Downloads](https://www.oracle.com/mx/java/technologies/javase-jdk11-downloads.html "Oracle | Java SE Development Kit 11 Downloads")

- ***Descargué la versión de Windows:***

| Product / File Description | File Size | Download |
| :------------------------: | :-------: | :------: |
| **Windows x64 Installer** | 152.05 MB | jdk-11.0.11_windows-x64_bin.exe |

> ***NOTA: REQUIERES TENER UNA CUENTA DE `ORACLE` PARA LA INSTALACIÓN.***
>
> - ***DIRECTORIO EN MI PC: `C:\Program Files\Java\jdk-11.0.11\`***#

## 1.5. ***VARIABLES DEL SISTEMA o de USUARIO***

Para que los programas funcionen de la mejor forma posible, hay que establecer
las variables del sistema que identifiquen a los programas. Esto se explicará
en esta sección.

Además, las variables del sistema permiten ejecutar ciertas instrucciones desde
la línea de comandos.

### 1.5.1. **ACCEDER A LA SECCIÓN PARA EDITAR LAS VARIABLES**

Para esto hay que seguir una serie de pasos que serán indicados a continuación.

1. Abre el buscador de Windows. Hay 2 formas de hacerlo.
   1. Presiona la lupa que está al lado del ícono de Windows en la barra de
      tareas.
   2. Presiona la combinación de teclas: ***`Windows + S`***
2. Escribir en la barra lo siguiente: **`env`**.
3. Selecciona la opción: "***`Editar las variables de entorno del sistema`***".

   ![Buscar | Editar las variables de entorno del sistema](README_imgs/ENV_VARS/env-vars_1.png "Buscar | Editar las variables de entorno del sistema")

   - Te aparecerá una ventana: **Propiedades del sistema**.

     ![Propiedades del sistema](README_imgs/ENV_VARS/env-vars_2.png "Propiedades del sistema")

4. Selecciona el botón: "**`Variables de entorno...`**".

     ![Propiedades del sistema | Variables del entorno](README_imgs/ENV_VARS/env-vars_3.png "Propiedades del sistema | Variables del entorno")

   - Te aparecerá una nueva ventana: "Variables de entorno", que muestra y da la
     opción de manipular todas las variables de usuario y del sistema.

     ![Variables del entorno](README_imgs/ENV_VARS/env-vars_4.png "Variables del entorno")

5. En esta sección ya puedes modificar las ***variables de usuario o del
   sistema*** como lo requieras.

### 1.5.2. **VARIABLE DEL SISTEMA: `JAVA_HOME`**

Para poder ejecutar los programas necesitamos tener instalado `Java` y agregado a ***`JAVA_HOME`***.

En el siguiene enlace están las instrucciones para establecer ***`JAVA_HOME`***:

> - [Confluence Support | Setting the JAVA_HOME Variable in Windows](https://confluence.atlassian.com/doc/setting-the-java_home-variable-in-windows-8895.html "Confluence Support | Setting the JAVA_HOME Variable in Windows")

1. Accede a la ventana de ***"Variables del entorno"*** como indican los pasos
   del inicio de la sección.

   ![Variables del entorno](README_imgs/ENV_VARS/env-vars_4.png "Variables del entorno")

2. En las ***`variables del sistema`*** da click en "***`Nueva...`***".

   ![Variables del sistema | Nueva...](README_imgs/ENV_VARS/env-vars_5.png "Variables del sistema | Nueva...")

3. En el campo "***`Nombre de la variable:`***" ingresa lo siguiente:

   > JAVA_HOME

   ![Nombre de la variable: JAVA_HOME](README_imgs/ENV_VARS/env-vars_6.png "Nombre de la variable: JAVA_HOME")

4. En el campo "***`Valor de la variable:`***" ingresa el directorio de
   instalación de tu JDK. En mi caso fue el siguiente (no lleva backslash "\\"
   al final):

   > C:\Program Files\Java\jdk-11.0.11

   ![Valor de la variable](README_imgs/ENV_VARS/env-vars_7.png "Valor de la variable")

5. Da click en "***`Aceptar`***".

6. Listo, tu variable del sistema ya está establecida.

   ![JAVA_HOME en VARIABLES DEL SISTEMA](README_imgs/ENV_VARS/env-vars_8.png "JAVA_HOME en VARIABLES DEL SISTEMA")

#### 1.5.2.1. VERIFICACIÓN DE QUE JAVA_HOME ESTÁ ESTABLECIDO

Hay que verificar que todo haya salido bien y el sistema identifica la variable
***`JAVA_HOME`***. Esto se logra ejecutando un comando después de haber
reiniciado cualquier terminal que haya abierta, ya que si no, las variables del
sistema no se actualizan, y si no hay efecto, entonces hay que reiniciar el
sistema.

El comando es el siguiente:

> ```properties
> java --version
> ```

Si todo se configuró correctamente, te mostrará un mensaje con tu versión
instalada de Java.

![java --version | Funcionando correctamente](README_imgs/ENV_VARS/env-vars_9.png "java --version | Funcionando correctamente")

<h3 id="as-user-var"><strong>4.2. ANDROID STUDIO</strong></h3>

Para [Android Studio] solo hay una ***VARIABLE DE USUARIO*** que yo utilicé:

> - ANDROID_SDK_ROOT=C:\Users\\...\AppData\Local\Android\Sdk

<h3 id="flutter-user-var"><strong>4.3. FLUTTER</strong></h3>

Para que flutter sea reconocido en el sistema, hay que agregarlo a las
variables de usuario, [como es indicado en la documentación](https://flutter.dev/docs/get-started/install/windows#update-your-path "Flutter | Windows Install | Update your path").

En la sección de **variables de usuario** hay que revisar si ya hay una variable
llamada **`Path`**.

- Si no la hay, habrá que crearla.
- Si la hay, seguir los siguientes pasos:
  1. Dar click en la variable **`Path`**.
  2. Dar click en el botón **"`Editar...`"**.
  3. Dar click en el botón **"`Nuevo`"**.
  4. En el campo agregar el directorio de **`flutter\bin`** dependiendo de en
     dónde instalaste **`Flutter`**.

     > En mi caso puse lo siguiente en **`Path`**:
     >
     > - ***`C:\SDKs\flutter\bin`***

## FIREBASE

Para poder utilizar Firebase se tuvieron que realizar algunas modificaciones
en algunos archivos, además de hacer la configuración en línea.

> - com.uaslp.facebook_simple_replication

### SCREENSHOTS CONFIGURACIÓN FIREBASE

![Firebase configuration screenshots 1](./README_imgs/FLUTTER_CONFIG/flutterConfiguration_1.png "Firebase configuration screenshots 1")
![Firebase configuration screenshots 2](./README_imgs/FLUTTER_CONFIG/flutterConfiguration_2.png "Firebase configuration screenshots 2")
![Firebase configuration screenshots 3](./README_imgs/FLUTTER_CONFIG/flutterConfiguration_3.png "Firebase configuration screenshots 3")
![Firebase configuration screenshots 4](./README_imgs/FLUTTER_CONFIG/flutterConfiguration_4.png "Firebase configuration screenshots 4")
![Firebase configuration screenshots 5](./README_imgs/FLUTTER_CONFIG/flutterConfiguration_5.png "Firebase configuration screenshots 5")

### AGREGAR LAS SIGUIENTES LÍNEAS

De las instrucciones de ***Agrega Firebase a tu app para Android***:

> 3. Agregar el SDK de Firebase
>
>    El complemento de Google Services para
> [Gradle](https://gradle.org/ "https://gradle.org/") carga el archivo
> google-services.json que acabas de descargar. Para usar el complemento, debes
> modificar los archivos ***`build.gradle`***.
>
>    **Archivo ***`build.gradle`*** de nivel de proyecto**
> (***`<project>/build.gradle`***):
>
>    ```gradle
>    buildscript {
>      repositories {
>        // Check that you have the following line (if not, add it):
>        google()  // Google's Maven repository
>      }
>      dependencies {
>        ...
>        // Add this line
>        classpath 'com.google.gms:google-services:4.3.8'
>      }
>    }
>    
>    allprojects {
>      ...
>      repositories {
>        // Check that you have the following line (if not, add it):
>        google()  // Google's Maven repository
>        ...
>      }
>    }
>    ```
>
>    **Archivo ***`build.gradle`*** de nivel de app**
> (***`<project>/<app-module>/build.gradle`***):
>
>    ```gradle
>    apply plugin: 'com.android.application'
>    // Add this line
>    apply plugin: 'com.google.gms.google-services'
>    
>    dependencies {
>      // Import the Firebase BoM
>      implementation platform('com.google.firebase:firebase-bom:28.0.1')
>    
>      // Add the dependencies for the desired Firebase products
>      // https://firebase.google.com/docs/android/setup#available-libraries
>    }
>    ```
>
> Después de haber realizado estos pasos anteriores, utilizar el comando
> `flutter pacckages get` (equivalente a `flutter pub get`) para que quede todo
> actualizado, el cual es indicado en el siguiente sitio web:
>
> - [Firebase | Documentación | Firebase / Documentos / Información básica / Agrega Firebase a tu app de Flutter](https://firebase.google.com/docs/flutter/setup?platform=android#add-config-file "Firebase | Documentación | Firebase / Documentos / Información básica / Agrega Firebase a tu app de Flutter")

## RECURSOS DE FACEBOOK APP (SVG, ÍCONOS, ...)

Para poder maquetar de forma más precisa las pantallas de la app de Facebook
para celulares, necesitamos diversos recursos, como los íconos de Facebook,
reacciones y demás.

En esta sección se encontrarán diversos enlaces, en los cuales se podrán
encontrar los recursos que utilizamos.

### LOGO DE FACEBOOK

Los logos de Facebook los descargamos de la página oficial de los recursos
(assets):

> - [Brand Resources / Facebook App / “f” Logo](https://en.facebookbrand.com/facebookapp/assets/f-logo/?audience=landing "Brand Resources / Facebook App / “f” Logo")

Los logotipos descargados se encuentran en el siguiente directorio:

[Directorio con todos los logos descargados | assets/fb_official/logos/](assets/fb_official/logos/ "Directorio con todos los logos descargados | assets/fb_official/logos/")

> Los logos con la F blanca y el círculo azul, se encuentran en diversos
> directorios y con diversos tamaños, por lo que los listaré para encontrarlos
> con mayor facilidad y utilizar los que más nos convengan:
>
> - [Carpeta principal de los siguientes logos: assets/fb_official/logos/f_Logo_Online_04_2019/Color/PNG/](assets/fb_official/logos/f_Logo_Online_04_2019/Color/PNG/ "assets/fb_official/logos/f_Logo_Online_04_2019/Color/PNG/")
>
>   - ![assets/fb_official/logos/f_Logo_Online_04_2019/Color/PNG/f_logo_RGB-Blue_58.png](assets/fb_official/logos/f_Logo_Online_04_2019/Color/PNG/f_logo_RGB-Blue_58.png "assets/fb_official/logos/f_Logo_Online_04_2019/Color/PNG/f_logo_RGB-Blue_58.png")
>   - ![assets/fb_official/logos/f_Logo_Online_04_2019/Color/PNG/f_logo_RGB-Blue_72.png](assets/fb_official/logos/f_Logo_Online_04_2019/Color/PNG/f_logo_RGB-Blue_72.png "assets/fb_official/logos/f_Logo_Online_04_2019/Color/PNG/f_logo_RGB-Blue_72.png")
>   - ![assets/fb_official/logos/f_Logo_Online_04_2019/Color/PNG/f_logo_RGB-Blue_100.png](assets/fb_official/logos/f_Logo_Online_04_2019/Color/PNG/f_logo_RGB-Blue_100.png "assets/fb_official/logos/f_Logo_Online_04_2019/Color/PNG/f_logo_RGB-Blue_100.png")
>   - ![assets/fb_official/logos/f_Logo_Online_04_2019/Color/PNG/f_logo_RGB-Blue_144.png](assets/fb_official/logos/f_Logo_Online_04_2019/Color/PNG/f_logo_RGB-Blue_144.png "assets/fb_official/logos/f_Logo_Online_04_2019/Color/PNG/f_logo_RGB-Blue_144.png")
>   - ![assets/fb_official/logos/f_Logo_Online_04_2019/Color/PNG/f_logo_RGB-Blue_250.png](assets/fb_official/logos/f_Logo_Online_04_2019/Color/PNG/f_logo_RGB-Blue_250.png "assets/fb_official/logos/f_Logo_Online_04_2019/Color/PNG/f_logo_RGB-Blue_250.png")
>   - ![assets/fb_official/logos/f_Logo_Online_04_2019/Color/PNG/f_logo_RGB-Blue_512.png](assets/fb_official/logos/f_Logo_Online_04_2019/Color/PNG/f_logo_RGB-Blue_512.png "assets/fb_official/logos/f_Logo_Online_04_2019/Color/PNG/f_logo_RGB-Blue_512.png")
>   - ![assets/fb_official/logos/f_Logo_Online_04_2019/Color/PNG/f_logo_RGB-Blue_1024.png](assets/fb_official/logos/f_Logo_Online_04_2019/Color/PNG/f_logo_RGB-Blue_1024.png "assets/fb_official/logos/f_Logo_Online_04_2019/Color/PNG/f_logo_RGB-Blue_1024.png")
>
> - [Carpeta principal de los siguientes logos: assets/fb_official/logos/f_Logo_TVFilm_04_2019/Color/](assets/fb_official/logos/f_Logo_TVFilm_04_2019/Color/ "Carpeta principal de los siguientes logos: assets/fb_official/logos/f_Logo_TVFilm_04_2019/Color/")
>
>   - ![assets/fb_official/logos/f_Logo_TVFilm_04_2019/Color/f_logo_RGB-Blue_1024.png](assets/fb_official/logos/f_Logo_TVFilm_04_2019/Color/f_logo_RGB-Blue_1024.png "assets/fb_official/logos/f_Logo_TVFilm_04_2019/Color/f_logo_RGB-Blue_1024.png")

### **REACCIONES DE FACEBOOK**

Facebook tiene su propio sitio web en donde provee de estos íconos, pero se
tienen que seguir ciertas pautas para utilizarlos de forma que no se rompan las
normas de Facebook. El enlace es el siguiente:

> - [***Brand Resources / Facebook App / Reactions***](https://en.facebookbrand.com/facebookapp/assets/reactions/ "Brand Resources / Facebook App / Reactions")

El problema es que se descargan como una imagen en PNG y los necesitamos por
separado, por lo que recurrimos al siguiente enlace:

> - [iconscout | Facebook Reaction Icon Pack](https://iconscout.com/icon-pack/facebook-reactions-emoticons "iconscout | Facebook Reaction Icon Pack")

- **Y para poder renderizar y modificar los elementos en SVG podemos utilizar
  el siguiente paquete:**

   > - [pub.dev | flutter_svg 0.22.0](https://pub.dev/packages/flutter_svg "pub.dev | flutter_svg 0.22.0")

### 1.6. USO DE ÍCONOS

Podemos utilizar varios paquetes de íconos. En nuestro caso consideramos
Font Awesome y Material Design.

#### 1.6.1. GOOGLE FONTS | MATERIAL ICONS

> [Google Fonts | Material Icons](https://fonts.google.com/icons "Google Fonts | Material Icons")

##### 1.6.1.1. Íconos que podríamos utilizar

- [Facebook](https://fonts.google.com/icons?selected=Material%20Icons%20Outlined%3Afacebook "Facebook")
- [Search](https://fonts.google.com/icons?selected=Material%20Icons%20Outlined%3Asearch "Search")
- [Add](https://fonts.google.com/icons?selected=Material%20Icons%20Outlined%3Aadd "Add")
- [More Vert](https://fonts.google.com/icons?selected=Material%20Icons%20Outlined%3Amore_vert "https://fonts.google.com/icons?selected=Material%20Icons%20Outlined%3Amore_vert")
- [info_outlined](https://fonts.google.com/icons?selected=Material%20Icons%20Outlined%3Ainfo "info_outlined")

#### 1.6.2. **Íconos con Font Awesome**

Font Awesome, nos provee de una gran cantidad de elementos.

Utilizamos el paquete:

> [pub.dev | font_awesome_flutter 9.0.0](https://pub.dev/packages/font_awesome_flutter "font_awesome_flutter 9.0.0")

Para que funcione hay que agregar el nombre del paquete y la última versión
(9.0.0) a las dependencias del [pubspec.yaml](pubspec.yaml "pubspec.yaml").

##### 1.6.2.1. **Íconos que podríamos utilizar**

- [search](https://fontawesome.com/icons/search?style=solid "search")
  - El problema es que es más robusto que el de facebook.
  - El de Facebook parece ser el `LIGHT`, pero ese requiere versión `PRO`.
- [facebook](https://fontawesome.com/icons/facebook?style=brands "facebook")
- [plus](https://fontawesome.com/icons/plus?style=solid "plus")
  - También es algo robusto.
  - El de Facebook parece ser la versión `LIGHT`.
- [elipsis-v](https://fontawesome.com/icons/ellipsis-v?style=solid "elipsis-v")
  - También parece que la versión de Facebook es la `LIGHT` o la `PRO`.
- [info-circle](https://fontawesome.com/icons/info-circle?style=solid "info-circle")
  - **`LIGHT`**.

## ***ENLACES EXTRA QUE FUERON ÚTILES***

- https://www.youtube.com/watch?v=d5PpeNb-dOY
- https://stackoverflow.com/questions/50081213/how-do-i-use-hexadecimal-color-strings-in-flutter
- https://www.tutorialspoint.com/dart_programming/dart_programming_map.htm
- https://stackoverflow.com/questions/29182581/global-variables-in-dart
- https://stackoverflow.com/questions/49541354/disable-defaultfocushighlightenabled-in-the-android-part-for-a-xamarin-forms-app
  
  - https://github.com/flutter/flutter/issues/16810

- https://aschilken.medium.com/flutter-best-practices-colors-and-textstyles-6e14b06fc3a1
- https://stackoverflow.com/questions/52489458/how-to-change-status-bar-color-in-flutter
- https://stackoverflow.com/questions/64873410/how-to-get-status-bar-height-in-flutter
  - https://stackoverflow.com/questions/61969143/no-mediaquery-ancestor-could-be-found
- https://stackoverflow.com/questions/50522237/flutter-circle-design/50524531
- [Stack Overflow | What is the Dart null checking idiom or best practice?](https://stackoverflow.com/questions/17006664/what-is-the-dart-null-checking-idiom-or-best-practice "Stack Overflow | What is the Dart null checking idiom or best practice?")
  - [Stack Overflow | What is the Dart null checking idiom or best practice? | atreeon's answer](https://stackoverflow.com/a/58027593/13562806 "Stack Overflow | What is the Dart null checking idiom or best practice? | atreeon's answer")
- [Stack Overflow | Button Width Match Parent](https://stackoverflow.com/questions/50014342/button-width-match-parent "Stack Overflow | Button Width Match Parent")
- [GitHub | Genymobile/scrcpy | Screenshot/Record Screen #21](https://github.com/Genymobile/scrcpy/issues/21 "GitHub | Genymobile/scrcpy | Screenshot/Record Screen #21")
  - [GitHub | Genymobile/scrcpy | Screenshot/Record Screen #21 | Command to take Screenshot or record video](https://github.com/Genymobile/scrcpy/issues/21#issuecomment-371967985 "GitHub | Genymobile/scrcpy | Screenshot/Record Screen #21 | Command to take Screenshot or record video")

- [Stack Overflow | How to clear Flutter's Build cache?](https://stackoverflow.com/questions/49279379/how-to-clear-flutters-build-cache "Stack Overflow | How to clear Flutter's Build cache?")
- [Stack Overflow | How can I add a border to a widget in Flutter?](https://stackoverflow.com/questions/47423297/how-can-i-add-a-border-to-a-widget-in-flutter "Stack Overflow | How can I add a border to a widget in Flutter?")
- [Stack Overflow | Flutter Image Variable](https://stackoverflow.com/questions/59878027/flutter-image-variable "Stack Overflow | Flutter Image Variable")
- [Stack Overflow | How to make a widget fill remaining space in a Column](https://stackoverflow.com/questions/49977864/how-to-make-a-widget-fill-remaining-space-in-a-column "Stack Overflow | How to make a widget fill remaining space in a Column")
- [Dart | Effective Dart: Style](https://dart.dev/guides/language/effective-dart/style "Dart | Effective Dart: Style")
- [Medium | DARTLANG | Dart (DartLang) Introduction: String Interpolation](https://medium.com/run-dart/dart-dartlang-introduction-string-interpolation-8ed99174119a "Medium | DARTLANG | Dart (DartLang) Introduction: String Interpolation")
- [Dart getters and setters](https://dev.to/newtonmunene_yg/dart-getters-and-setters-1c8f "Dart getters and setters")
- [Dart | A tour of the Dart language](https://dart.dev/guides/language/language-tour#getters-and-setters "Dart | A tour of the Dart language")
- [GitHub Gist | aruld/foreachlistset.dart](https://gist.github.com/aruld/1299218 "GitHub Gist | aruld/foreachlistset.dart")
- [Stack Overflow | What is the difference between named and positional parameters in Dart? | Seth Ladd](https://stackoverflow.com/a/13264231/13562806 "Stack Overflow | What is the difference between named and positional parameters in Dart? | Seth Ladd")

[//]: <EN ESTA SECCIÓN SE ENCUENTRAN LAS "VARIABLES" UTILIZADAS PARA EL README.>

[Android Studio]: <https://developer.android.com/studio> "Descargar Android Studio en Windows | 4.2 for Windows 64-bit (934 MiB)"
[Flutter]: <https://flutter.dev/docs/get-started/install/windows> "Descargar flutter en Windows | flutter_windows_2.0.6-stable.zip"
[Chocolatey]: <https://chocolatey.org/install> "INSTALLING CHOCOLATEY"
[scrcpy]: <https://github.com/Genymobile/scrcpy> "GitHub | Genymobile/scrcpy"
