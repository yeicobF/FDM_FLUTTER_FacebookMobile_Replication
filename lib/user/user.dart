// Clase en donde se guardarán todos los elementos de un usuario.

// Posts.
import 'package:flutter/material.dart';

import '../globals/global_values.dart' as global_values;
import 'post.dart';

class User {
  String name;
  String profilePicturePath;
  DateTime creationDate;
  // Si está conectado o no.
  bool isConected;
  int _notificationsNumber;
  // Lista de amigos.
  List<User> friends;

  // Lista de todos los post.
  List<Post> postList;

  User(this.name, this.profilePicturePath) {
    // Obtención del momento en que se creó la cuenta.
    creationDate = DateTime.now();
    // Inicialización de listas vacías.
    friends = [];
    postList = [];
    notificationsNumber = 0;
    // Si se creó un usuario (se registró), establecerlo como conectado.
    isConected = true;
  }

/* ---------------------- GETTERS, SETTERS y FUNCIONES ---------------------- */

  // Número de notificaciones.
  // NO PERMITIR GUARDAR VALORES NEGATIVOS.
  set notificationsNumber(int number) {
    if (number < 0){
      _notificationsNumber = 0;
    }
    else {
      _notificationsNumber = number;
    }
  }
  int get notificationsNumber => _notificationsNumber;

  // Obtener número de amigos.
  int get friendsNumber => friends.length;

  // Método para agregar a un amigo.
  void addFriend(User friend) {
    friends.add(friend);
  }

  // Método para agregar a varios amigos.
  void addFriends(List<User> friendsList) {
    for (final User friend in friendsList) {
      friends.add(friend);
    }
  }

  // Método para agregar un post ya creado.
  void addPost(Post post) {
    postList.add(post);
  }

/* ----------------- MÉTODOS PARA CREAR LAS FOTOS DE PERFIL ----------------- */

// - Número de notificaciones: Círuclo rojo en esquina superior derecha con el
//    número de notificaciones pendientes.
// - Si estás conectado: Círculo verde.
// - Si no estás conectado: Círculo rojo.

// Crear la foto de perfil sin nada más (notificaciones, etc).
  Widget createBareProfilePicture(
      double size, EdgeInsetsGeometry customMargin) {

    return Container(
      // 60 es el tamaño promedio.
      width: size,
      height: size,
      // color: Colors.white,
      margin: customMargin,
      // PARA HACER EL CÍRCULO SEGUÍ LO SIGUIENTE:
      // https://stackoverflow.com/questions/50522237/flutter-circle-design/50524531
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          // Ya que tiene un borde establecido por default se lo quitamos.
          border: Border.all(width: 0),
          image: DecorationImage(
            image: AssetImage(profilePicturePath),
            fit: BoxFit.cover,
          )),
    );
  }

  // Crear la foto de perfil con un círculo verde  en la esquina inferior derecha,
  // indicando que un usuario está conectado.
  Widget createConnectedProfilePicture() {}

  // Crear foto de perfil con un número de notificaciones en un círculo rojo en la
  // esquina superior derecha
  Widget createProfilePictureWithNotifications(
      double size, EdgeInsetsGeometry customMargin) {

    const notificationsRed = Color(0xFFea2945);
    // Número de notificaciones a mostrar.
    // Si las notificaciones > 99, mostrar el 99.
    final String notificationsNumberToShow = ((notificationsNumber > 99)
                                             ? 99
                                             : notificationsNumber).toString();



    return Container(
      width: size,
      height: size,
      color: Colors.transparent,
      margin: customMargin,
      child: Stack(
        children: [
          // AQUÍ NECESITAMOS ENVIAR UN MARGEN DE 0, YA QUE SI NO, SE MODIFICA
          // EL TAMAÑO DEL WODGET DE LA FOTO DE PERFIL Y NO QUEDAN BIEN LOS
          // ELEMENTOS.
          // - CREAMOS LA FOTO DE PERFIL.
          createBareProfilePicture(size, const EdgeInsets.all(0)),
          // AQUÍ CREAREMOS EL ÍCONO QUE INDICA LAS NOTIFICACIONES, el cual hay
          // que alinear en la esquina superior derecha.
          Align(
              alignment: Alignment.topRight,
              // Contenedor con el número de notificaciones.
              child: Container(
                width: size / 2.8,
                height: size / 2.8,
                alignment: Alignment.topRight,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    // Color rojo.
                    color: notificationsRed,
                    border: Border.all(
                      color: global_values.darkBackground,
                      width: 2,
                    )),
                // AQUÍ VA EL NÚMERO DE NOTIFICACIONES.
                child: Center(
                  child: Text(
                    notificationsNumberToShow,
                    style: const TextStyle(
                      color: Color(0xFFffffff),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
