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
  /// 
  /// - Si la imagen viene de internet, utilizar
  /// [CachedNetworkImageProvider].
  /// 
  /// - Si la imagen no viene de internet significa que viene de los
  /// [Asset]s, por lo que hay que utilizar [AssetImage].
  /// 
  /// **El linter marcaba error si el casting se hacía de la siguiente
  /// manera:**
  /// 
  /// ```dart
  /// backgroundImage: isProfilePictureFromInternet
  ///    ? CachedNetworkImageProvider(imageUrl)
  ///    : AssetImage(imageUrl);
  /// ```
  /// 
  /// > **Por lo que se tuvo que hacer un cast:**
  /// 
  /// ```dart
  /// backgroundImage: isProfilePictureFromInternet
  ///    ? CachedNetworkImageProvider(imageUrl)
  ///    : AssetImage(imageUrl) as ImageProvider;
  /// ```
  /// 
  /// > **Fuente:**
  /// >
  /// > - *https://github.com/flutter/flutter/issues/77782*
  /// > - *https://github.com/flutter/flutter/issues/77782#issuecomment-799560559*
  final bool isProfilePictureFromInternet;

  /// Dirección de la foto de perfil.
  ///
  /// Puede ser obtenida de internet o del sistema de archivos. Esto lo define
  /// la variable [isProfilePictureFromInternet].
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

// /* ----------------- MÉTODOS PARA CREAR LAS FOTOS DE PERFIL ----------------- */
// 
// // - Número de notificaciones: Círuclo rojo en esquina superior derecha con el
// //    número de notificaciones pendientes.
// // - Si estás conectado: Círculo verde.
// // - Si no estás conectado: Círculo rojo.
// 
// // Crear la foto de perfil sin nada más (notificaciones, etc).
// Widget createBareProfilePicture(double size) {
//   return Container(
//     // 60 es el tamaño promedio.
//     width: size,
//     height: size,
//     // color: Colors.white,
// 
//     // PARA HACER EL CÍRCULO SEGUÍ LO SIGUIENTE:
//     // https://stackoverflow.com/questions/50522237/flutter-circle-design/50524531
//     decoration: BoxDecoration(
//       color: Colors.white,
//       shape: BoxShape.circle,
//       // Ya que tiene un borde establecido por default se lo quitamos.
//       border: Border.all(
//         // YA NO SE MUESTRA EL BORDE NEGRO QUE SE VEÍA EN LA FOTO DE PERFIL.
//         color: Colors.transparent,
//         width: 0,
//       ),
//       image: DecorationImage(
//         /// Revisar si la imagen proviene de internet o del sistema de
//         /// archivos. Dependiendo de la procedencia, se utiliza uno u otro
//         /// widget.
//         image: AssetImage(imageUrl),
// 
//         // image: isProfilePictureFromInternet
//         //     ? CachedNetworkImageProvider(imageUrl)
//         //     : AssetImage(imageUrl),
// 
//         // Así se baja la calidad.
//         // image: ResizeImage(
//         //   AssetImage(imageUrl),
//         //   width: size.toInt(),
//         //   height: size.toInt()
//         // ),
//         fit: BoxFit.cover,
//       ),
//     ),
//   );
// }
// 
// // Crear la foto de perfil con un círculo verde  en la esquina inferior derecha,
// // indicando que un usuario está conectado.
// Widget createConnectedProfilePicture() {}
// 
