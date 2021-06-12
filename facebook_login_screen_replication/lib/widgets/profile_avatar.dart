/// AVATAR DE PERFIL.
/// 
/// Es una clase para crear la foto de perfil de un usuario.
/// 
/// Tiene variaciones, ya que depende de qué se quiere mostrar. Los elementos
/// que podría llevar son:
/// 
/// - Número de notificaciones.
/// - Borde azul para cuando se muestra en historias.
/// - Círculo verde indicando que el usuario está conectado.

import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_login_screen_replication/models/models.dart';
import 'package:flutter/material.dart';

import '../config/palette.dart';

/// Clase para crear una foto de perfil.
///
/// La foto de perfil puede ir con el círculo verde indicando que está conectado
/// cuando [isOnline] = true. En caso contrario solamente muestra la foto de
/// perfil.
/// 
/// - Una foto de perfil no puede ser al mismo tiempo de la pantalla Login y de
/// historias.
/// 
/// - Una foto de perfil con ícono de estar conectado solamente se indicará si
/// todos los booleanos que indican qué tipo de imagen será
/// ([isPictureFromLogin], [[isPictureFromStory], [isBarePicture]]),
/// están en false.
class ProfileAvatar extends StatelessWidget {
  /// Usuario al cual le pertenece la foto de perfil.
  final User user;

  /// Tamaño de la foto de perfil.
  final double size;

  /// Booleano para ver si la foto de perfil se trata para una historia.
  /// 
  /// De esto depende si dibujar una foto de perfil con un círculo azul
  /// alrededor o no.
  final bool isPictureFromStory;

  /// Booleano para ver si la foto de perfil se encontrará en la pantalla de
  /// Login.
  /// 
  /// Si la pantalla es de Login, no puede ser de una historia y viceversa.
  final bool isPictureFromLogin;

  /// Indicador de que se quiere mostrar la foto de perfil sin ningún elemento
  /// por encima.

  ProfileAvatar({
    Key key,
    @required this.user,
  }) : super(key: key) {
    /// [this.isOnline] = false: NO ES OBLIGATORIO, Y ES FALSE POR DEFAULT.
    this.isOnline = user.isOnline;

    /// Valor opcional.
    this.hasBorder = false,
  };

  @override
  Widget build(BuildContext context) {
    // Stack es requerido para poder apilar los elementos con el ícono verde que
    // indica que un usuario está conectado.
    return Stack(
      children: [
        /// Crea un círculo azul alrededor de la foto de perfil si [hasBorder]
        /// es true.
        CircleAvatar(
          radius: 20.0,
          backgroundColor: Palette.facebookBlue,

          /// Crea un avatar circular con la foto de perfil del usuario.
          child: CircleAvatar(
            /// Si [hasBorder] == true -> La foto de perfil será más pequeña que
            /// el contenedor padre, por lo que se logrará ver el borde azul
            /// cirular.
            ///
            /// Si [hasBorder] == false -> La foto de perfil será del mismo
            /// tamaño que el contenedor padre [CircleAvatar], por lo que el
            /// borde azul no se verá.
            radius: hasBorder ? 17.0 : 20.0,
            backgroundColor: Colors.grey[200],
            // Imagen de fondo obtenida de un URL.
            backgroundImage: CachedNetworkImageProvider(imageUrl),
          ),
        ),
        // Si [isOnline] == true, mostrar ícono verde indicando conexión.
        // Si no es true, entonces poner un SizedBox del menor tamaño posible.
        isOnline
            // [Positioned] pone el widget en la posición indicada respecto al
            // contenedor.
            ? Positioned(
                bottom: 0.0,
                right: 0.0,
                // [Container] es requerido para mostrar el círculo verde.
                child: Container(
                  height: 15.0,
                  width: 15.0,
                  // [decoration] es requerido para hacer el circulo que indica
                  // la conexión.
                  decoration: BoxDecoration(
                    color: Palette.online,
                    shape: BoxShape.circle,
                    // [border: Border.all(...)] para mostrar el borde circular
                    // blanco
                    // alrededor del círculo verde que indica la conexión.
                    border: Border.all(
                      width: 2.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}

/// Agregar a la foto de perfil el número de notificaciones en un círculo rojo
/// en la esquina superior derecha
class _NotificationsCircle extends StatelessWidget {
  /// Tamaño del círculo de notificaciones.
  final double size;
  /// Número de notificaciones.
  final int notificationsNumber;

  /// Número de notificaciones a mostrar en el círculo.
  /// 
  /// - Si el número de notificaciones([notificationsNumber]) es mayor a  99,
  /// mostrar el 99.
  /// 
  /// - Si el número de notificaciones ([notificationsNumber]) es menor a 0,
  /// mostrar el 0.
  /// 
  /// - Si el número de notificaciones ([notificationsNumber]) es mayor o igual
  /// a 1 y menor o igual a 99, muestra el número sin modificar.
  /// 
  /// - Si el número de notificaciones ([notificationsNumber]) es igual a 0, no
  /// lo muestra. Esto se comprueba desde el [Widget] [ProfileAvatar].
  String notificationsNumberToShow;

  const _NotificationsCircle({
    Key key,
    @required this.size,
    @required this.notificationsNumber,
    }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}




Widget _NotificationsCircle(double size) {
  const notificationsRed = Color(0xFFea2945);

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
