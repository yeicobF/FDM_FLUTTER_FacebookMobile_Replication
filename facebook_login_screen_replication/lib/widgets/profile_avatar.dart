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
///
///
/// **NOTA:** *Las clases [@immutable] deben tener todos sus atributos como
/// [final] y los constructores deben ser preferiblemente [const].*
///
///   - Aún así, por ahora no lo haré así, porque quiero definir diversos
/// parámetros con diferentes constructores y si tengo todos en [final] no los
/// puedo tener. Esto es porque cuenta como que los parámetros ya están
/// inicializados por ser final y tenerlos en diversos constructores.
class ProfileAvatar extends StatelessWidget {
  /// Usuario al cual le pertenece la foto de perfil.
  final User user;

  /// Tamaño de la foto de perfil.
  final double size;

  /// Indicador de que se quiere mostrar la foto de perfil sin ningún elemento
  /// por encima.
  ///
  /// > [!isPictureWithoutElements] significa que la foto sí tendrá
  /// elementos.
  bool isPictureWithoutElements;

  /// Booleano para ver si la foto de perfil se encontrará en la pantalla de
  /// Login.
  ///
  /// Si la pantalla es de Login, no puede ser de una historia y viceversa.
  bool isPictureFromLogin;

  /// Booleano para ver si la foto de perfil se trata para una historia.
  ///
  /// De esto depende si dibujar una foto de perfil con un círculo azul
  /// alrededor o no.
  bool isPictureFromStory;

  /// Historia actual que se está mostrando.
  Story currentStory;

  /// Constructor para mostrar la foto de perfil con o sin símbolo de estar
  /// conectado.
  ///
  /// Es el constructor genérico para mostrar la foto de perfil.
  ///
  /// Las opciones son:
  ///
  /// - La de pantalla de Login con círculo de notificaciones.
  /// - La de las historias con el borde alrededor.
  /// - La foto sin ningún elementos por encima.
  /// - Si no es ninguna de las anteriores, mostrarla con el círculo verde
  /// si es que está conectado el usuario.
  ///
  /// [isPictureFromLogin] y [isPictureFromStory] = false porque en este
  /// constructor se muestra la imagen con Online o sin elementos, dependiendo
  /// de lo que se envíe en [isPictureWithoutElements].
  ///
  /// - Estos ya tienen sus propios constructores.
  ///
  /// Los elementos que están después de los dos puntos (:) están siendo
  /// inicializados.
  ProfileAvatar({
    Key key,
    @required this.user,
    this.size = 20.0,
    this.isPictureWithoutElements = false,
  })  : isPictureFromLogin = false,
        isPictureFromStory = false,
        currentStory = null,
        super(key: key);

  /// Constructor para la foto de perfil en una historia.
  ProfileAvatar.forStory({
    @required this.user,
    @required this.currentStory,
    this.size = 20.0,
  })  :

        /// La imagen sí es de las historias.
        isPictureFromStory = true,
        isPictureWithoutElements = false,
        isPictureFromLogin = false;

  /// Constructor para la foto de perfil en la pantalla de Login.
  ///
  /// En esta pantalla se muestra el círculo de notificaciones.
  ProfileAvatar.forLogin({
    @required this.user,
    @required this.size,
  })  : isPictureFromLogin = true,
        isPictureFromStory = false,
        isPictureWithoutElements = false;

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
      return size - 3.0;
    }

    /// Si la foto de perfil no se ha visto, regresar el tamaño original.
    else {
      return size;
    }
  }

  @override
  Widget build(BuildContext context) {
    /// [Stack] es requerido para poder apilar los elementos.

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
          child: _CreatePicture(
            size: _getPictureRadius(),
            imageUrl: user.imageUrl,
            isProfilePictureFromInternet: user.isProfilePictureFromInternet,
          ),
        ),

        /// Revisar qué tipo de foto de perfil se quiere mostrar.
        ///
        /// > [!isPictureWithoutElements] significa que la foto sí tendrá
        /// elementos.
        ///
        /// Las opciones son:
        ///
        /// - La de pantalla de Login con círculo de notificaciones.
        /// - La de las historias con el borde alrededor.
        /// - La foto sin ningún elementos por encima.
        /// - Si no es ninguna de las anteriores, mostrarla con el círculo verde
        if (!isPictureWithoutElements)

          /// No se pueden poner corchetes ({}) en los [if], ya que se
          /// interpreta como un [Set<Widget>].
          /// 
          /// - https://stackoverflow.com/questions/63247314/how-can-use-if-statement-with-container-widget-in-flutter
          if (isPictureFromLogin)
            _NotificationsCircle(
              profilePictureSize: size,
              notificationsNumber: user.notificationsNumber,
            )
          else if (user.isOnline)

            /// - Si es que está conectado el usuario.
            /// - Si [isOnline] == true, mostrar ícono verde indicando conexión.
            /// - Si no es true, entonces poner un SizedBox del menor tamaño posible.
            // [Positioned] pone el widget en la posición indicada respecto al
            // contenedor.
            const Positioned(
              bottom: 0.0,
              right: 0.0,
              // [Container] es requerido para mostrar el círculo verde.
              child: _OnlineIndicator(),
            )
            /// Si el usuario no está online.
            else const SizedBox.shrink()
        /// Si la imagen sí tiene elementos.
        /// 
        /// Este [else] corresponde al [if]:
        /// 
        /// ```dart
        /// if (!isPictureWithoutElements)
        /// ```
        else const SizedBox.shrink(),
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
  /// Tamaño de la imagen.
  final double size;

  /// Url de la imagen.
  final String imageUrl;

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

  const _CreatePicture({
    Key key,
    @required this.size,
    @required this.imageUrl,
    @required this.isProfilePictureFromInternet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// Aquí puede devolver una u otra forma de renderizar la imagen
    /// dependiendo de si viene de internet o no.
    return CircleAvatar(
      /// Si [hasBorder] == true -> La foto de perfil será más pequeña que
      /// el contenedor padre, por lo que se logrará ver el borde azul
      /// cirular.
      ///
      /// Si [hasBorder] == false -> La foto de perfil será del mismo
      /// tamaño que el contenedor padre [CircleAvatar], por lo que el
      /// borde azul no se verá.
      radius: size,
      backgroundColor: Colors.grey[200],

      /// Imagen de fondo obtenida de un URL.
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
      backgroundImage: isProfilePictureFromInternet
          ? CachedNetworkImageProvider(imageUrl)
          : AssetImage(imageUrl) as ImageProvider,
          
    );
  }
}

/// Crear el círculo verde que indica si el usuario está online.
class _OnlineIndicator extends StatelessWidget {
  /// Tamaño del indicador de estado, que es color verde.
  final double indicatorSize;

  /// Tamaño del borde del círculo verde.
  final double borderSize;

  const _OnlineIndicator({
    Key key,
    this.indicatorSize = 15.0,
    this.borderSize = 2.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: indicatorSize,
      width: indicatorSize,
      // [decoration] es requerido para hacer el circulo que indica
      // la conexión.
      decoration: BoxDecoration(
        color: Palette.online,
        shape: BoxShape.circle,
        // [border: Border.all(...)] para mostrar el borde circular
        // blanco
        // alrededor del círculo verde que indica la conexión.
        border: Border.all(
          width: borderSize,
          color: Colors.white,
        ),
      ),
    );
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
