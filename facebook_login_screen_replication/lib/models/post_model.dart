import 'package:flutter/material.dart';

/// Clase en donde se manejarán los Post (publicaciones) de los usuarios.
class Post {
  /// Caption del post (descripción o lo que se muestra).
  final String caption;

  /// Ver si el botón está en estado de "like".
  final bool isLiked;

  /// Imágenes del post.
  ///
  /// Las imágenes se guardan en una lista de direcciones en el sistema de
  /// archivos.
  final List<String> imgPathList;

  /// Fecha de creación del post.
  ///
  /// Esta se inicializa cuando se hace la publicación.
  DateTime creationDate;

  /// Usuario al que pertenece el post.
  /// 
  /// No es necesario enviar al usuario, ya que cada usuario guarda sus
  /// publicaciones:
  /// 
  /// ```dart
  /// user.post.atributosPost
  /// ```
  /// 
  // final User user;

  /// Hace cuánto tiempo se hizo la publicación.
  final String timeAgo;


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
  /// backgroundImage: isPictureFromInternet
  ///    ? CachedNetworkImageProvider(imageUrl)
  ///    : AssetImage(imageUrl);
  /// ```
  /// 
  /// > **Por lo que se tuvo que hacer un cast:**
  /// 
  /// ```dart
  /// backgroundImage: isPictureFromInternet
  ///    ? CachedNetworkImageProvider(imageUrl)
  ///    : AssetImage(imageUrl) as ImageProvider;
  /// ```
  /// 
  /// > **Fuente:**
  /// >
  /// > - *https://github.com/flutter/flutter/issues/77782*
  /// > - *https://github.com/flutter/flutter/issues/77782#issuecomment-799560559*
  final bool isPictureFromInternet;

  /// URL de la imagen a mostrar.
  final String imageUrl;

  /// Número de likes.
  final int likes;

  /// Número de comentarios.
  final int comments;

  /// Número de veces que se compartió la publicación.
  final int shares;

  /// Íconos de las reacciones de Facebook en formato SVG.
  ///
  /// Es una variable PRIVADA, por eso el guión bajo (_).
  ///
  /// TODOS SE ENCUENTRAN EN FORMATO SVG.
  /// Solo se dará la ruta.
  static const String _reactionsSvgPath =
      "assets/fb_non-official/facebook-reactions-emoticons/svg";

/* ---------------------- CONSTRUCTOR DE LA CLASE POST. --------------------- */

  Post({
    // @required this.user,
    @required this.caption,
    @required this.isPictureFromInternet,
    @required this.imageUrl,
    @required this.timeAgo,
    @required this.likes,
    @required this.comments,
    @required this.shares,
    this.isLiked = false,
    this.imgPathList,
  }) {
    // Establecemos la creación del Post.
    creationDate = DateTime.now();
  }

/* -------------------- FIN CONSTRUCTOR DE LA CLASE POST. ------------------- */

  /// GETTER de los íconos de reacciones, los cuales son estáticos
  ///
  ///
  /// El siguiente es un ejemplo para acceder al ícono de "like":
  ///
  /// ```dart
  /// post.reactionIcons["like"]
  /// ```
  ///
  /// STATIC para que pueda ser accedida desde fuera sin instanciar la clase.
  ///
  /// https://dev.to/newtonmunene_yg/dart-getters-and-setters-1c8f
  /// https://dart.dev/guides/language/language-tour#getters-and-setters
  static Map<String, String> get reactionIcons => {
        // String INTERPOLATION: https://medium.com/run-dart/dart-dartlang-introduction-string-interpolation-8ed99174119a
        // "Hello, my name is '$name'."
        // "I am \'${age}\' years old and I received "${ grades * 10 }%" score."
        "like": "'$_reactionsSvgPath'/like.svg",
        "love": "'$_reactionsSvgPath'/love.svg",
        "care": "'$_reactionsSvgPath'/care.svg",
        "haha": "'$_reactionsSvgPath'/haha.svg",
        "wow": "'$_reactionsSvgPath'/wow.svg",
        "sad": "'$_reactionsSvgPath'/sad.svg",
        "angry": "'$_reactionsSvgPath'/angry.svg",
      };

  /// Número de reacciones de cada tipo en un arreglo mapeado.
  ///
  /// Es una variable PRIVADA, por eso el guión bajo (_).
  ///
  /// https://www.tutorialspoint.com/dart_programming/dart_programming_map.htm
  Map<String, int> get reactionNumber => {
        "like": 0,
        "love": 0,
        "care": 0,
        "haha": 0,
        "wow": 0,
        "sad": 0,
        "angry": 0,
      };

  /// Función para modificar el número de reacciones.
  void modifyReactionNumber(String reaction, int number) {
    reactionNumber[reaction] = number;
  }
}
