import 'package:meta/meta.dart';

/// Clase para manejar las historias.
///
/// Guarda un [bool] que indica si ya se vio la historia o no.
///
/// No toma al usuario como parámetro, ya que el mismo usuario es el que
/// almacena la historia, por lo que se llama al método de creación de historias
/// desde ahí y se pasa al mismo usuario como parámetro.
class Story {
  /// Usuario de quien es la historia.
  // final User user;

  /// URL de la imagen de la historia.
  final String imageUrl;

  /// Indicador de si la imagen proviene de internet o no.
  final bool isPictureFromInternet;

  /// Indicador de si ya se vio la historia o aún no.
  final bool isViewed;

  const Story({
    // @required this.user,
    @required this.imageUrl,
    @required this.isPictureFromInternet,
    this.isViewed = false,
  });
}
