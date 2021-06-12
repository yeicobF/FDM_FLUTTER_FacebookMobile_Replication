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
import 'package:flutter/material.dart';

import '../config/palette.dart';

/// Clase para crear una foto de perfil.
///
/// La foto de perfil puede ir con el círculo verde indicando que está conectado
/// cuando [isOnline] = true. En caso contrario solamente muestra la foto de
/// perfil.
class ProfileAvatar extends StatelessWidget {
  /// URL de la foto de perfil.
  final String imageUrl;

  /// Booleano que indica si el usuario está conectado o no.
  final bool isOnline;

  /// Booleano para indicar si la foto de perfil tendrá un borde azul alrededor
  /// o no.
  final bool hasBorder;

  const ProfileAvatar({
    Key key,
    @required this.imageUrl,

    /// [this.isOnline] = false: NO ES OBLIGATORIO, Y ES FALSE POR DEFAULT.
    this.isOnline = false,

    /// Valor opcional.
    this.hasBorder = false,
  }) : super(key: key);

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
