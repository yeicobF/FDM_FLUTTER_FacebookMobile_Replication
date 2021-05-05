# **[T2.3] COPIAR MAQUETACIÓN DE PANTALLA LOGIN DE FACEBOOK**

Para esta actividad trabajaremos en equipo Germán y yo.

## ***FECHA DE ENTREGA***

> Jueves, 6 de mayo del 2021

Si no entregamos el trabajo, nos bajará 2 puntos.

## **INSTALACIONES**

Para que todo funcione correctamente, hay que instalar varias cosas:

### **[Android Studio]**

Simplemente descarga el archivo que se encuentra en el enlace y ejecutalo.
Después podrás configurarlo como tú quieras.

#### **CONFIGURACIÓN OBLIGATORIA ANDROID STUDIO**

Para que Android Studio y Flutter funcionen de manera correcta, hay que
configurar unos elementos que serán obligatorios, siguiendo los siguientes pasos:

##### **INSTALACIÓN DE PAQUETES**

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

##### **INSTALACIÓN DE PLUGINS**

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

##### **COMPROBACIÓN DE ACTUALIZACIONES**

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

### **[Flutter]**

Entra al enlace de  la documentación oficial de [Flutter] y en la sección de
***"[Get the Flutter SDK]"*** da click en el botón de descarga, el cual dice
***`flutter_windows_2.0.6-stable.zip`***.

[Get the Flutter SDK]: <https://flutter.dev/docs/get-started/install/windows#get-the-flutter-sdk> "Flutter Windows Install | Get the Flutter SDK"

#### ***EN QUÉ DIRECTORIO COLOCAR FLUTTER***

Para no tener problemas con espacios y demás, coloqué Flutter directamente en el
directorio principal del disco duro (**`C:/`**), creando una carpeta dentro y
extrayéndolo. Entonces quedaría de la siguiente forma:

> **`C:\SDKs\flutter`**

Así, cada vez que quiera encontrar Flutter, será más sencillo.

#### **VARIABLE DE USUARIO**

Para ver cómo configurar la variable de usuario, dirígete a la **sección del
siguiente enlace** (te enviará dentro del README):

> [CONFIGURACIÓN DE VARIABLE DE USUARIO PARA FLUTTER](#flutter-user-var "VARIABLE DE USUARIO PARA FLUTTER")

### **[Chocolatey]**
  
  [Chocolatey] es un administrador de paquetes, con el que podemos instalar una
  diversidad de paquetes (valga la redundancia) de forma sencilla corriendo
  comandos desde una terminal.

  > Este es solo para instalar [scrcpy]

- [scrcpy]

## ***VARIABLES DEL SISTEMA o de USUARIO***

Para que los programas funcionen de la mejor forma posible, hay que establecer
las variables del sistema que identifiquen a los programas. Esto se explicará
en esta sección.

Además, las variables del sistema permiten ejecutar ciertas instrucciones desde
la línea de comandos.

### **ACCEDER A LA SECCIÓN PARA EDITAR LAS VARIABLES**

Para esto hay que seguir una serie de pasos que serán indicados a continuación.

1. Abre el buscador de Windows. Hay 2 formas de hacerlo.
   1. Presiona la lupa que está al lado del ícono de Windows en la barra de
      tareas.
   2. Presiona la combinación de teclas: ***`Windows + S`***
2. Escribir en la barra lo siguiente: **`env`**

<h3 id="as-user-var"><strong>ANDROID STUDIO</strong></h3>

Para [Android Studio] solo hay una ***VARIABLE DE USUARIO*** que yo utilicé:

> - ANDROID_SDK_ROOT=C:\Users\\...\AppData\Local\Android\Sdk

<h3 id="flutter-user-var"><strong>FLUTTER</strong></h3>

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

[//]: <EN ESTA SECCIÓN SE ENCUENTRAN LAS "VARIABLES" UTILIZADAS PARA EL README.>

[Android Studio]: <https://developer.android.com/studio> "Descargar Android Studio en Windows | 4.2 for Windows 64-bit (934 MiB)"
[Flutter]: <https://flutter.dev/docs/get-started/install/windows> "Descargar flutter en Windows | flutter_windows_2.0.6-stable.zip"
[Chocolatey]: <https://chocolatey.org/install> "INSTALLING CHOCOLATEY"
[scrcpy]: <https://github.com/Genymobile/scrcpy> "GitHub | Genymobile/scrcpy"
