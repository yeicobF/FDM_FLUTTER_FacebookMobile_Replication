import 'package:facebook_login_screen_replication/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

/// Datos iniciales de la app.
import '../../data/initial_data.dart';

/// Todos los widgets.
import '../../widgets/widgets.dart' show CustomTabBar;

/// PANTALLAS de la feed principal.
import 'screens.dart';

/// Pantallas de navegación.
///
/// En esta clase se manejarán todas las pantallas.
///
/// Permitirá tener una [CustomTabBar] para poder cambiar entre pantallas y que
/// siempre se mantenga a la vista.
///
/// Es stateful, ya que tendrá que manejar los cambios entre pantallas,
/// manteniendo el estado de la pestaña seleccionada.
class NavScreen extends StatefulWidget {
  /// Usuario que está utilizando la app.
  final User currentUser;

  const NavScreen({
    Key key,
    @required this.currentUser,
  }) : super(key: key);

  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  /// Lista con las pantallas.
  ///
  /// Se inicializa en [initState()], ya que depende de la información del
  /// [Widget] para inicializar [currentUser].
  ///
  /// Para accceder a los atributos del [Widget] se hace de la siguiente forma:
  ///
  /// ```dart
  /// widget.currentUser
  /// ```
  ///
  /// - Fuente: https://stackoverflow.com/questions/50818770/passing-data-to-a-stateful-widget
  List<Widget> _screens;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    /// Inicializamos las pantallas con [currentUser] que viene desde el
    /// [Widget] como tal.
    _screens = [
      HomeScreen(
        currentUser: widget.currentUser,
      ),
      // Scaffold por ahora, ya que no están hechas las pantallas.
      const Scaffold(),
      const Scaffold(),
      const Scaffold(),
      const Scaffold(),
      const Scaffold(),
    ];
  }

  /// Lista de íconos para la [CustomTabBar].
  final List<IconData> _icons = const [
    Icons.home,
    Icons.ondemand_video,
    MdiIcons.accountCircleOutline,
    MdiIcons.accountGroupOutline,
    MdiIcons.bellOutline,
    Icons.menu,
  ];

  /// Índice seleccionado.
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // _screens.

    /// CAMBIAR COLOR DEL statusBar (barra superior de notificaciones).
    /// https://stackoverflow.com/questions/52489458/how-to-change-status-bar-color-in-flutter
    FlutterStatusbarcolor.setStatusBarColor(Colors.white);

    /// Íconos de la barra superior de notificaciones de color negro.
    FlutterStatusbarcolor.setStatusBarWhiteForeground(false);

    /// [DefaultTabController] para manejar el número de pestañas.
    return DefaultTabController(
      /// Número de pestañas = número de íconos.
      length: _icons.length,
      child: Scaffold(
        /// [_screens[_selectedIndex]: Número de pantalla seleccionada.
        /// -> Esto no debería de estar así. body: _screens[_selectedIndex],

        /// [body]: [TabBarView] son los elementos que se verán al seleccionar
        /// la [TabBar], por lo que se pasa como [children] nuestra lista de
        /// pantallas ([_screens]).
        ///
        /// - En web pueden generar problemas de rendimiento. Además, no se
        /// guarda el estado de la pestaña anterior.
        ///
        ///body: TabBarView(
        ///  /// "[physics]: const [NeverScrollableScrollPhysics()]"
        ///  /// Esto significa que no se permitirá hacer un scroll entre las
        ///  /// pantallas. Se tomó esta decisión porque el índice no se
        ///  /// actualizaba correctamente al hacer scroll entre las pantallas.
        ///  physics: const NeverScrollableScrollPhysics(),
        ///  children: _screens,
        ///),

        /// [IndexedStack]
        /// Esta es una mejor alternativa, ya que tiene un  mejor rendimiento,
        /// y guarda la posición del scroll de todas las pestañas, no se
        /// reinicia.
        body: IndexedStack(
          /// Su índice es el índice de la selección.
          index: _selectedIndex,

          /// Pantallas de la app.
          children: _screens,
        ),

        /// [bottomNavigationBar]: Barra inferior de navegación.
        bottomNavigationBar: CustomTabBar(
          icons: _icons,
          selectedIndex: _selectedIndex,

          /// El índice actual de la pestaña seleccionada es el que se
          /// establece como el índice de la pantalla actual.
          onTap: (int index) => setState(() => _selectedIndex = index),
        ),
      ),
    );
  }
}
