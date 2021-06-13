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

/// Clase para crear una foto de perfil con diversas variantes.
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

  /// Historia actual que se está mostrando.
  Story currentStory;

  /// Tamaño de la foto de perfil.
  final double size;

  /// Indicador de que se quiere mostrar la foto de perfil sin ningún elemento
  /// por encima.
  final bool isPictureWithoutElements;

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

  ProfileAvatar({
    Key key,
    @required this.user,
    @required this.size,
    @required this.isPictureWithoutElements,
    this.isPictureFromStory = false,
    this.isPictureFromLogin = false,
  }) : super(key: key);

  /// Constructor para la foto de perfil en una historia.
  ProfileAvatar.forStory({
    this.user,
    this.currentStory,
    this.size,
    this.isPictureWithoutElements,
    this.isPictureFromStory,
    this.isPictureFromLogin,
  });

  /// Obtener el radio de la foto de perfil.
  ///
  /// Este se puede ver modificado dependiendo de si se trata de una historia o
  /// no.
  ///
  /// **El tamaño se reduce con la historia porque detrás tiene un círculo azul,
  /// por lo que cuando se reduce el tamaño del widget que muestra la imagen,
  /// se ve ese círculo, el cual es representativo de una historia ([Story])
  /// que no se ha visto.**
  ///
  /// - Si es una historia, entonces ver si la historia ya se vio o no.
  ///
  ///    - Si no se ha visto, reducir el tamaño.
  ///    - Si la historia ya se vio, entonces no reducir el tamaño.
  ///
  /// - Si no es una historia, no reducir el tamaño.
  double _getPictureRadius() {
    /// Si la foto de perfil viene de las historias y se ha visto, se regresa
    /// un tamaño menor.
    ///
    /// Con el [?.] solamente avanzamos en la condición si es que existe una
    /// historia [singleStory]. Si no existe, no sigue avanzando en la
    /// verificación de la condicional.
    if (isPictureFromStory && !user.singleStory?.isViewed) {
      return size - 3;
    }

    /// Si la foto de perfil no se ha visto, regresar el tamaño original.
    else {
      return size;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Stack es requerido para poder apilar los elementos con el ícono verde que
    // indica que un usuario está conectado.
    return Stack(
      children: [
        /// Crea un círculo azul alrededor de la foto de perfil si [hasBorder]
        /// es true.
        CircleAvatar(
          radius: size,
          backgroundColor: Palette.facebookBlue,

          /// Crea un avatar circular con la foto de perfil del usuario.
          ///
          /// Para esto cambiar su tamaño y que se vea el borde, hay que
          /// revisar varias cosas:
          ///
          /// - Si la foto a dibujar se trata de una historia. Una vez revisado
          /// esto, tendríamos que revisar lo siguiente:
          ///
          ///   - Si la historia ya se vio o no.
          child: CircleAvatar(
            /// Si [hasBorder] == true -> La foto de perfil será más pequeña que
            /// el contenedor padre, por lo que se logrará ver el borde azul
            /// cirular.
            ///
            /// Si [hasBorder] == false -> La foto de perfil será del mismo
            /// tamaño que el contenedor padre [CircleAvatar], por lo que el
            /// borde azul no se verá.
            radius: _getPictureRadius(),
            backgroundColor: Colors.grey[200],
            // Imagen de fondo obtenida de un URL.
            backgroundImage: CachedNetworkImageProvider(user.imageUrl),
          ),
        ),
        // Si [isOnline] == true, mostrar ícono verde indicando conexión.
        // Si no es true, entonces poner un SizedBox del menor tamaño posible.
        user.isOnline
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

/// Crear la foto de perfil con el archivo de la imagen.
///
/// Se crea una foto de perfil de distinta forma dependiendo de si la imagen se
/// obtuvo de internet o de los assets del sistema de archivos.
///
/// - AssetImage()
/// - CachedNetworkImageProvider()
class _CreatePicture extends StatelessWidget {
  const _CreatePicture({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

/// Agregar a la foto de perfil el número de notificaciones en un círculo rojo
/// en la esquina superior derecha
class _NotificationsCircle extends StatelessWidget {
  /// Tamaño de la foto de perfil.
  ///
  /// A partir del tamaño de la foto de perfil se calcula el tamaño del círculo
  /// de notifiaciones.
  final double profilePictureSize;

  /// Número de notificaciones.
  final int notificationsNumber;

  /// Color del borde del círculo de notificaciones.
  final Color borderColor;

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

  /// Tamaño del círculo de notificaciones.
  ///
  /// Este será calculado a partir del tamaño de la foto de perfil.
  double notificationsSize;

  _NotificationsCircle({
    Key key,
    @required this.profilePictureSize,
    @required this.notificationsNumber,
    this.borderColor = Palette.darkBackground,
  }) : super(key: key) {
    /// Revisar el número de notificaciones para ver qué número se va a
    /// mostrar.
    notificationsNumberToShow =
        ((notificationsNumber > 99) ? 99 : notificationsNumber).toString();

    /// Calcular el tamaño del círculo de notificaciones.
    notificationsSize = profilePictureSize / 2.8;
  }

  @override
  Widget build(BuildContext context) {
    /// El ícono de notificaciones debe estar alineado en la esquina superior
    /// derecha de la foto de perfil.
    ///
    /// Creo que el [Align] debería estar en el [ProfileAvatar].
    return Align(
      alignment: Alignment.topRight,

      /// Contenedor con el número de notificaciones y su borde.
      ///
      /// El círculo con el color de fondo del número de notificaciones está
      /// definido en el [child] de este [Widget].
      child: Container(
        width: notificationsSize,
        height: notificationsSize,
        // alignment: Alignment.topRight,
        padding: const EdgeInsets.all(0.0),
        margin: const EdgeInsets.all(0.0),
        // color: Colors.transparent,

        /// Borde alrededor del círculo de notificaciones.
        ///
        /// Podría hacerlo con dos [CircleAvatar], uno más grande que el otro,
        /// pero no tendría mucha coherencia con el nombre del [Widget].
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          // Color rojo.
          color: borderColor,
          // border: Border.all(
          //   color: global_values.darkBackground,
          //   // style: BorderStyle.none,
          //   width: 2,
          // )
        ),

        /// PUSE LAS NOTIFICACIONES AQUÍ, ya que con el BoxDecoration y
        /// su borde, se alcanzaba a ver un pequeño borde rojo detrás
        /// del borde gris, lo cual era molesto. Entonces mejor solo
        /// tomé el tamaño relativo del contenedor padre y lo puse del
        /// color de las notificaciones, simulando el borde gris (del
        /// color de la pantalla).
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
              color: Palette.notificationsRed,
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
    );
  }
}
