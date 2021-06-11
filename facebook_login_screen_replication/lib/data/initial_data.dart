/// Variables e información de la app inicializada, para así poder probar más
/// fácil la app con valores predefinidos.

import '../models/models.dart' show User;

/// Clase que maneja datos iniciales que se manejarán para probar la app.
class InitialData {
  /// Variable que guarda el directorio en donde se encuentran las fotos de
  /// perfil.
  static const String profilePicsPath = "assets/user/profile_pictures";

  /// Usuario actual que utilizará la app.
  ///
  /// Toma la variable [profilePicsPath] para acceder de forma variable al
  /// directorio en donde se encuentran las fotos de perfil.
  static final User currentUser = User(
    name: "Jacob Flores",
    profilePicturePath: "$profilePicsPath/invincible_1.png",
  );

  /// Lista de amigos.
  ///
  /// - Agregaré algunos amigos solo como prueba.
  static final List<User> friendsList = [
    User(
      name: "Germán González",
      profilePicturePath: "$profilePicsPath/german.jpg",
    ),
    User(
      name: "Sergio",
      profilePicturePath: "$profilePicsPath/sergio.jpg",
    ),
    User(
      name: "Rodrigo",
      profilePicturePath: "$profilePicsPath/rodrigo.jpg",
    ),
    User(
      name: "Eduardo",
      profilePicturePath: "$profilePicsPath/eduardo_roca.jpg",
    ),
  ];

  // currentUser = friendsList[1];

  /// Agregar a todos los usuarios a la lista de amigos.
  ///
  /// - MÉTODO 1.
  // currentUser.addFriends(friendsList);

  /// Agregar a todos los usuarios a la lista de amigos.
  /// - MÉTODO 2.
  ///
  /// ```dart
  /// for (final User friend in friendsList) {
  ///   currentUser.addFriend(friend);
  /// }
  /// ```

}
