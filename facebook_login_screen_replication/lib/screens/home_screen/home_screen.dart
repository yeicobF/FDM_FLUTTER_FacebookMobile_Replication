/// Pantalla en donde se encuentra la feed principal del usuario.
///
/// Se encuentran los siguientes elementos:
///
/// - Contenedor para crear publicación.
/// - Lista de usuarios conectados.
/// - Historias de amigos.
/// - Scroll con todas las publicaciones.

import 'package:flutter/material.dart';

/// Cambiar colores de la "status bar" y la barra inferior con botones del
/// celular.
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart'
    show FlutterStatusbarcolor;

/// ÍCONOS MATERIAL DESIGN.
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart'
    show MdiIcons;

/// Colores.
import '../../config/palette.dart' show Palette;

/// Información predefinida de los usuarios.
import '../../data/initial_data.dart';

/// Modelos de las clases.
import '../../models/models.dart' show Post, Story, User;

/// Botones, ...
import '../../widgets/widgets.dart'
    show CircleButton, CreatePostContainer, PostContainer, Rooms, Stories;

/// CLASE EN LA QUE SE MANEJARÁ LA PANTALLA INICIAL DE FACEBOOK.
class HomeScreen extends StatelessWidget {
  /// Colores del botón del SliverAppBar.
  final fbColors = const {
    "fbIconCircle": Color(0xFFf1f2f6),
    "fbIcon": Color(0xFF010102),
  };

  /// Usuario actual de la aplicación.
  final User currentUser;

  const HomeScreen({
    Key key,
    @required this.currentUser,
  }) : super(key: key);

  /// Función para obtener una lisat con los amigos conectados del usuario
  /// actual.
  List<User> getOnlineFriends() {
    /// Lista de amigos conectados.
    ///
    /// Se inicializa con [final], por lo que se define en tiempo de
    /// compilación (o algo así), y mejora el rendimiento. Aún así, [final] no
    /// permite reasignar un valor a la variable, pero sus valores internos no
    /// son [final], por lo que podemos agregar elementos sin problemas.
    final List<User> onlineFriends = [];

    /// Recorremos a todos los amigos y agregamos a la lista a los que estén
    /// corectados.
    for (final User friend in currentUser.friends) {
      /// Si el amigo está conectado, agregarlo a la lista.
      if (friend.isOnline) {
        onlineFriends.add(friend);
      }
    }
    return onlineFriends;
  }

  /// Función para obtener una lista con todas las historias de los amigos.
  List<Story> getFriendsStories() {
    /// Lista de historias.
    final List<Story> stories = [];

    /// Recorremos a todos los amigos del usuario para obtener las historias.
    ///
    /// Primero se recorre al amigo, y se obtienen todas sus historias.
    ///
    /// - Se agrega la historia [singleStory] si no es null, ya que significa
    /// que sí tiene una historia.
    for (final User friend in currentUser.friends) {
      if (friend.singleStory != null) {
        stories.add(friend.singleStory);
      }
    }
    return stories;
  }

  @override
  Widget build(BuildContext context) {
    /// CAMBIAR COLOR DEL statusBar (barra superior de notificaciones).
    /// https://stackoverflow.com/questions/52489458/how-to-change-status-bar-color-in-flutter
    FlutterStatusbarcolor.setStatusBarColor(Colors.white);

    /// Íconos de la barra superior de notificaciones de color negro.
    FlutterStatusbarcolor.setStatusBarWhiteForeground(false);

    return Scaffold(
      body: CustomScrollView(
        /// [slivers]: Todo deben ser slivers, no solo contenedores.
        slivers: [
          /// [SliverAppBar]:
          /// - Scroll hacia abajo -> Se esconde la barra superior.
          /// - Scroll hacia arriba -> Se muestra la barra superior.
          SliverAppBar(
            // Se cambian los colores de los elementos de la barra de
            // notificaciones.
            brightness: Brightness.light,
            backgroundColor: Colors.white,
            centerTitle: false,

            /// Para no tener que hacer scroll hasta arriba para que se vea la
            /// [AppBar].
            floating: true,
            backwardsCompatibility: true,

            /// Para que se vea una sombra debajo de la [AppBar].
            /// [forceElevated]: true,
            title: const Text(
              "facebook",
              style: TextStyle(
                color: Palette.facebookBlue,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.2,
              ),
            ),

            /// [actions]: Para hacer funcionar a los botones.
            actions: [
              /// Para simular el círculo gris de alrededor del ícono.
              CircleButton(
                icon: Icons.search,
                iconSize: 30.0,
                // icon: FontAwesomeIcons.search,
                // iconSize: 26.0,
                onPressed: () => print("Search"),
              ),
              CircleButton(
                icon: MdiIcons.facebookMessenger,
                iconSize: 30.0,
                onPressed: () => print("Messenger"),
              ),
            ],
          ),

          /// Los elementos requieren estar en un [Sliver] para poder estar
          /// dentro los "[slivers]" del [CustomScrollView].
          SliverToBoxAdapter(
            // Contenedor debajo de la AppBar.
            // Sección para crear una publicación.
            child: CreatePostContainer(
              currentUser: currentUser,
            ),
          ),

          /// [Sliver] con [Padding] para estar separado de la parte superior.
          /// [Rooms] Lista de usuarios conectados.
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),

            /// Toma otro sliver, el cual ya teníamos definido.
            sliver: SliverToBoxAdapter(
              /// Lista de usuarios conectados.
              ///
              /// - Los tomamos de la función en donde se obtiene la lista con
              /// los amigos.
              child: Rooms(onlineUsers: getOnlineFriends()),
            ),
          ),

          /// Lista con todas las historias.
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
            // Toma otro sliver, el cual ya teníamos definido.
            sliver: SliverToBoxAdapter(
              /// [Stories] Lista de las historias.
              child: Stories(
                currentUser: currentUser,
                stories: getFriendsStories(),
              ),
            ),
          ),

          /// Publicaciones de los usuarios.
          SliverList(
            /// [delegate] - {SliverChildDelegate delegate}
            /// Creates a sliver that places box children in a
            /// linear array.
            ///
            /// [SliverChildBuilderDelegate] es como un equivalente al
            /// [ListView.builder()].
            delegate: SliverChildBuilderDelegate(
              /// Función para renderizar todas las publicaciones.
              (BuildContext context, int index) {
                /// Publicación respecto al índice actual.
                final Post post = posts[index];

                /// Renderizar el post actual.
                return PostContainer(post: post);
              },

              /// [childCount]: Número de elementos a mostrar.
              childCount: posts.length,
            ),
          ),
        ],
      ),
    );
  }
}
