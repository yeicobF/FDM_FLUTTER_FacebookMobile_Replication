// Clase en donde se manejarán los Post (publicaciones) de los usuarios.

class Post {
  // Caption del post (descripción o lo que se muestra).
  String caption;
  // Imágenes del post.
  // TODAS ESPECIFICARÁN UN DIRECTORIO EN DONDE SE ENCONTRARÁN.
  List<String> imgPathList;
  // Fecha de creación del post.
  DateTime creationDate;

  // Íconos de las reacciones.
  // TODOS SE ENCUENTRAN EN FORMATO SVG.
  // Solo se dará la ruta.
  // Es una variable PRIVADA, por eso el guión bajo (_).
  //
  static const String _reactionsSvgPath = "assets/fb_non-official/facebook-reactions-emoticons/svg";

/* ---------------------- CONSTRUCTOR DE LA CLASE POST. --------------------- */

  Post(this.caption, this.imgPathList) {
    // Establecemos la creación del Post.
    creationDate = DateTime.now();
  }

/* -------------------- FIN CONSTRUCTOR DE LA CLASE POST. ------------------- */

  // GETTER de los íconos de reacciones, los cuales son estáticos
  // post.reactionIcons
  // 
  // https://dev.to/newtonmunene_yg/dart-getters-and-setters-1c8f
  // https://dart.dev/guides/language/language-tour#getters-and-setters
  //
  // STATIC para que pueda ser accedida desde fuera sin instanciar la clase.
  //
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

  // Número de reacciones de cada tipo en un arreglo mapeado.
  // Es una variable PRIVADA, por eso el guión bajo (_).
  // https://www.tutorialspoint.com/dart_programming/dart_programming_map.htm
  Map<String, int> get reactionNumber => {
    "like": 0,
    "love": 0,
    "care": 0,
    "haha": 0,
    "wow": 0,
    "sad": 0,
    "angry": 0,
  };

  // FUNCIÓN PARA MODIFICAR EL NÚMERO DE REACCIONES.
  void modifyReactionNumber(String reaction, int number) {
    reactionNumber[reaction] = number;
  }
}