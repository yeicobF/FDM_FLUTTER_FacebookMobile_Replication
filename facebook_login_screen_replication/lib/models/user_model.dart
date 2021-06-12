/// Archivo en el que se manejan los datos de usuario.
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../config/palette.dart' show Palette;
import 'models.dart';

/// Clase en donde se guardarán todos los elementos de un usuario.
class User {
  /// Nombre del usuario.
  final String name;

  /// Booleano para indicar si la foto de perfil proviene del sistema de
  /// archivos o de internet.
  final bool isProfilePictureFromInternet;

  /// Dirección de la foto de perfil.
  ///
  /// Puede ser obtenida de internet o del sistema de archivos. Esto lo define la variable [isProfilePictureFromInternet].
  final String imageUrl;

  /// Indicador de que el usuario está conectado.
  bool isOnline;

  /// Imagen obtenida de un URL de internet.
  ///
  /// Esta propiedad será opcional.
  // final String propilePictureUrl;

  /// Fecha de creación de la cuenta.
  ///
  /// Se inicializa cuando se crea la instancia de la cuenta.
  DateTime creationDate;

  /// Número de notificaciones del usuario.
  int _notificationsNumber;

  /// Lista de amigos.
  List<User> friends;

  /// Lista de todos los post que ha hecho el usuario.
  List<Post> postList;

  /// Solo una publicación.
  final Post singlePost;

  /// Solo una hisoria.
  final Story singleStory;

  /// Constructor de la clase.
  ///
  /// Inicializa las variables, además de recibir unos parámetros nombrados
  /// obligatorios.
  ///
  /// - Puede recibir tanto una imagen del directorio, como una imagen de
  /// internet.
  User({
    @required this.name,
    @required this.isProfilePictureFromInternet,

    /// Inicializarla como vacía nos permite la posibilidad de revisar si se
    /// envió una imagen o no.
    @required this.imageUrl,

    /// Lista de posts por si los auieren enviar.
    this.postList,

    /// Solo una publicación.
    this.singlePost,

    /// Solo una historia.
    this.singleStory,
  }) {
    /// Obtención del momento en que se creó la cuenta.
    creationDate = DateTime.now();

    /// Inicialización de listas vacías.
    friends = [];
    postList = [];

    /// Inicializar el número de notificaciones.
    notificationsNumber = 0;

    /// Si se creó un usuario (se registró), establecerlo como conectado.
    isOnline = true;
  }

/* ---------------------- GETTERS, SETTERS y FUNCIONES ---------------------- */

  /// Setter del número de notificaciones.
  set notificationsNumber(int number) {
    if (number < 0) {
      _notificationsNumber = 0;
    } else {
      _notificationsNumber = number;
    }
  }

  /// Getter del número de notificaciones.
  int get notificationsNumber => _notificationsNumber;

  /// Obtener número de amigos.
  int get friendsNumber => friends.length;

  /// Método para agregar a un amigo.
  ///
  /// Recibe como parámetro una instancia de la clase [User].
  void addFriend(User friend) {
    friends.add(friend);
  }

  /// Método para agregar a varios amigos.
  ///
  /// Recibe una lista de tipo [User].
  void addFriends(List<User> friendsList) {
    for (final User friend in friendsList) {
      friends.add(friend);
    }
  }

  /// Método para agregar un post ya creado.
  void addPost(Post post) {
    postList.add(post);
  }

  /// Obtener número total de publicaciones que ha hecho el usuario.
  int get totalPosts => postList.length;
}

/* ----------------- MÉTODOS PARA CREAR LAS FOTOS DE PERFIL ----------------- */

// - Número de notificaciones: Círuclo rojo en esquina superior derecha con el
//    número de notificaciones pendientes.
// - Si estás conectado: Círculo verde.
// - Si no estás conectado: Círculo rojo.

// Crear la foto de perfil sin nada más (notificaciones, etc).
Widget createBareProfilePicture(double size) {
  return Container(
    // 60 es el tamaño promedio.
    width: size,
    height: size,
    // color: Colors.white,

    // PARA HACER EL CÍRCULO SEGUÍ LO SIGUIENTE:
    // https://stackoverflow.com/questions/50522237/flutter-circle-design/50524531
    decoration: BoxDecoration(
      color: Colors.white,
      shape: BoxShape.circle,
      // Ya que tiene un borde establecido por default se lo quitamos.
      border: Border.all(
        // YA NO SE MUESTRA EL BORDE NEGRO QUE SE VEÍA EN LA FOTO DE PERFIL.
        color: Colors.transparent,
        width: 0,
      ),
      image: DecorationImage(
        /// Revisar si la imagen proviene de internet o del sistema de
        /// archivos. Dependiendo de la procedencia, se utiliza uno u otro
        /// widget.
        image: AssetImage(imageUrl),

        // image: isProfilePictureFromInternet
        //     ? CachedNetworkImageProvider(imageUrl)
        //     : AssetImage(imageUrl),

        // Así se baja la calidad.
        // image: ResizeImage(
        //   AssetImage(imageUrl),
        //   width: size.toInt(),
        //   height: size.toInt()
        // ),
        fit: BoxFit.cover,
      ),
    ),
  );
}

// Crear la foto de perfil con un círculo verde  en la esquina inferior derecha,
// indicando que un usuario está conectado.
Widget createConnectedProfilePicture() {}

// Crear foto de perfil con un número de notificaciones en un círculo rojo en la
// esquina superior derecha
Widget createProfilePictureWithNotifications(double size) {
  const notificationsRed = Color(0xFFea2945);
  // Número de notificaciones a mostrar.
  // Si las notificaciones > 99, mostrar el 99.
  final String notificationsNumberToShow =
      ((notificationsNumber > 99) ? 99 : notificationsNumber).toString();

  return Container(
    width: size,
    height: size,
    color: Colors.transparent,
    child: Stack(
      children: [
        // AQUÍ NECESITAMOS ENVIAR UN MARGEN DE 0, YA QUE SI NO, SE MODIFICA
        // EL TAMAÑO DEL WODGET DE LA FOTO DE PERFIL Y NO QUEDAN BIEN LOS
        // ELEMENTOS.
        // - CREAMOS LA FOTO DE PERFIL.
        createBareProfilePicture(size),
        // AQUÍ CREAREMOS EL ÍCONO QUE INDICA LAS NOTIFICACIONES, el cual hay
        // que alinear en la esquina superior derecha.
        Align(
          alignment: Alignment.topRight,
          // Contenedor con el número de notificaciones.
          child: Container(
            width: size / 2.8,
            height: size / 2.8,
            // alignment: Alignment.topRight,
            padding: const EdgeInsets.all(0.0),
            margin: const EdgeInsets.all(0.0),
            // color: Colors.transparent,

            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              // Color rojo.
              color: Palette.darkBackground,
              // border: Border.all(
              //   color: global_values.darkBackground,
              //   // style: BorderStyle.none,
              //   width: 2,
              // )
            ),

            /** PUSE LAS NOTIFICACIONES AQUÍ, ya que con el BoxDecoration y
               * su borde, se alcanzaba a ver un pequeño borde rojo detrás
               * del borde gris, lo cual era molesto. Entonces mejor solo
               * tomé el tamaño relativo del contenedor padre y lo puse del
               * color de las notificaciones, simulando el borde gris (del
               * color de la pantalla).
               * */
            child: FractionallySizedBox(
              // alignment: Alignment.center,
              heightFactor: 0.8,
              widthFactor: 0.8,
              child: Container(
                // color: Colors.green,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  // Color rojo.
                  color: notificationsRed,
                ),
                // AQUÍ VA EL NÚMERO DE NOTIFICACIONES.
                child: Text(
                  notificationsNumberToShow,
                  style: const TextStyle(
                    color: Color(0xFFffffff),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
