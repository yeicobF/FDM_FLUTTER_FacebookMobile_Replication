/// Variables e información de la app inicializada, para así poder probar más
/// fácil la app con valores predefinidos.

import '../models/models.dart' show Post, Story, User;

/// Clase que maneja datos iniciales que se manejarán para probar la app.
///
/// Es una clase abstracta, ya que no se requiere instanciar.
abstract class InitialData {
  /// Variable que guarda el directorio en donde se encuentran las fotos de
  /// perfil.
  static const String profilePicsPath = "assets/user/profile_pictures";

  /// Usuario actual que utilizará la app.
  ///
  /// Toma la variable [profilePicsPath] para acceder de forma variable al
  /// directorio en donde se encuentran las fotos de perfil.
  static final User currentUser = User(
    name: "Jacob Flores",
    imageUrl: "$profilePicsPath/invincible_1.png",
    isProfilePictureFromInternet: false,
  );

  /// Lista de publicaciones.
  static final List<Post> postList = [
    // 0
    Post(
      caption: "Hola",
      comments: 23,
      imageUrl: "assets/user/post_images/german.jpg",
      isPictureFromInternet: false,
      likes: 102,
      shares: 13,
      timeAgo: "5hr",
    ),
    // 1
    Post(
      caption: "Isaac",
      comments: 666,
      imageUrl: "assets/user/post_images/rodrigo.jpg",
      isPictureFromInternet: false,
      likes: 666,
      shares: 666,
      timeAgo: "6s",
    ),
    // 2
    Post(
      /// Concatenamos una RAW String para que no tenga problemas con nuevas líneas ni backslashes o caracteres especiales:
      ///
      /// https://www.educative.io/edpresso/how-to-create-a-raw-string-in-dart
      /// https://github.com/Crissov/unicode-proposals/issues/408
      caption: "  ʌ" +
          r" / \" +
          r"/   \" +
          "| | |" +
          r"\ \/" +
          r"/\  \" +
          "| | |" +
          r"\   /" +
          r" \ /" +
          "  v",
      imageUrl: "assets/user/post_images/sergio_1.jpg",
      isPictureFromInternet: false,
      comments: 2,
      likes: 22,
      shares: 222,
      timeAgo: "2s",
    ),
    // 3
    Post(
      caption: "",
      imageUrl: "assets/user/post_images/eduardo_gambling.jpg",
      isPictureFromInternet: false,
      timeAgo: "",
      likes: 1500,
      comments: 123,
      shares: 5000,
    ),
    // 4
    Post(
      caption: 'Check out these cool puppers',
      timeAgo: '58m',
      isPictureFromInternet: true,
      imageUrl: 'https://images.unsplash.com/photo-1525253086316-d0c936c814f8',
      likes: 1202,
      comments: 184,
      shares: 96,
    ),
    // 5
    Post(
      caption:
          'Please enjoy this placeholder text: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
      timeAgo: '3hr',
      isPictureFromInternet: true,
      imageUrl: null,
      likes: 683,
      comments: 79,
      shares: 18,
    ),
    // 6
    Post(
      caption: 'This is a very good boi.',
      timeAgo: '8hr',
      isPictureFromInternet: true,
      imageUrl:
          'https://images.unsplash.com/photo-1575535468632-345892291673?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
      likes: 894,
      comments: 201,
      shares: 27,
    ),
    // 7
    Post(
      caption: 'Adventure 🏔',
      timeAgo: '15hr',
      isPictureFromInternet: true,
      imageUrl:
          'https://images.unsplash.com/photo-1573331519317-30b24326bb9a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80',
      likes: 722,
      comments: 183,
      shares: 42,
    ),
    // 8
    Post(
      caption:
          'More placeholder text for the soul: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
      timeAgo: '1d',
      isPictureFromInternet: true,
      imageUrl: null,
      likes: 482,
      comments: 37,
      shares: 9,
    ),
    // 9
    Post(
      caption: 'A classic.',
      timeAgo: '1d',
      isPictureFromInternet: true,
      imageUrl:
          'https://images.unsplash.com/reserve/OlxPGKgRUaX0E1hg3b3X_Dumbo.JPG?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
      likes: 1523,
      shares: 129,
      comments: 301,
    ),
  ];

  /// Lista de historias.
  ///
  /// Se le asignará una historia a cada usuario.
  static const List<Story> stories = [
    // 0
    Story(
      imageUrl:
          'https://images.unsplash.com/photo-1498307833015-e7b400441eb8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1400&q=80',
    ),
    // 1
    Story(
      imageUrl:
          'https://images.unsplash.com/photo-1499363536502-87642509e31b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
      isViewed: true,
    ),
    // 2
    Story(
      imageUrl:
          'https://images.unsplash.com/photo-1497262693247-aa258f96c4f5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=624&q=80',
    ),
    // 3
    Story(
      imageUrl:
          'https://images.unsplash.com/photo-1496950866446-3253e1470e8e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80',
      isViewed: true,
    ),
    // 4
    Story(
      imageUrl:
          'https://images.unsplash.com/photo-1475688621402-4257c812d6db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1267&q=80',
    ),
    // 5
    Story(
      imageUrl:
          'https://images.unsplash.com/photo-1498307833015-e7b400441eb8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1400&q=80',
    ),
    // 6
    Story(
      imageUrl:
          'https://images.unsplash.com/photo-1499363536502-87642509e31b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
      isViewed: true,
    ),
    // 7
    Story(
      imageUrl:
          'https://images.unsplash.com/photo-1497262693247-aa258f96c4f5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=624&q=80',
    ),
    // 8
    Story(
      imageUrl:
          'https://images.unsplash.com/photo-1496950866446-3253e1470e8e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80',
      isViewed: true,
    ),
    // 9
    Story(
      imageUrl:
          'https://images.unsplash.com/photo-1475688621402-4257c812d6db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1267&q=80',
    ),
  ];

  /// Lista de amigos.
  ///
  /// - Agregaré algunos amigos solo como prueba.
  ///
  /// ## Otra opción con la anterior implementación era poner los  usuarios en
  /// un mapa con sus nombres para luego agregarlos a la lista de amigos. Esto
  /// solamente para hacerlo más entendible relativamente. Esto se muestra en
  /// el siguiente código:
  ///
  /// ```dart
  ///
  /// // Crear mapa con los usuarios.
  ///  final Map<String, User> usersMap = {
  ///    "german": User("Germán González", "$profilePicsPath/german.jpg"),
  ///    "sergio": User("Sergio", "$profilePicsPath/sergio.jpg"),
  ///    "rodrigo": User("Rodrigo", "$profilePicsPath/rodrigo.jpg"),
  ///    "eduardo": User("Eduardo", "$profilePicsPath/eduardo_roca.jpg"),
  ///  };
  ///
  /// // Crear una lista con cada uno de los usuarios que fueron definidos de
  /// // manera más específica.
  ///  final List<User> friendsList = [
  ///    usersMap["german"],
  ///    usersMap["sergio"],
  ///    usersMap["rodrigo"],
  ///    usersMap["eduardo"],
  ///  ];
  /// ```
  static final List<User> friendsList = [
    User(
      name: "Germán González",
      imageUrl: "$profilePicsPath/german.jpg",
      isProfilePictureFromInternet: false,
      singlePost: postList[0],
      singleStory: stories[0],
    ),
    User(
      name: "Sergio",
      imageUrl: "$profilePicsPath/sergio.jpg",
      isProfilePictureFromInternet: false,
      singlePost: postList[1],
      singleStory: stories[1],
    ),
    User(
      name: "Rodrigo",
      imageUrl: "$profilePicsPath/rodrigo.jpg",
      isProfilePictureFromInternet: false,
      singlePost: postList[2],
      singleStory: stories[0],
    ),
    User(
      name: "Eduardo",
      imageUrl: "$profilePicsPath/eduardo_roca.jpg",
      isProfilePictureFromInternet: false,
      singlePost: postList[3],
      singleStory: stories[3],
    ),
    User(
      name: 'David Brooks',
      imageUrl:
          'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
      isProfilePictureFromInternet: true,
      singlePost: postList[4],
      singleStory: stories[4],
    ),
    User(
      name: 'Jane Doe',
      imageUrl:
          'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
      isProfilePictureFromInternet: true,
      singlePost: postList[5],
      singleStory: stories[5],
    ),
    User(
      name: 'Matthew Hinkle',
      imageUrl:
          'https://images.unsplash.com/photo-1492562080023-ab3db95bfbce?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1331&q=80',
      isProfilePictureFromInternet: true,
      singlePost: postList[6],
      singleStory: stories[6],
    ),
    User(
      name: 'Amy Smith',
      imageUrl:
          'https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=80',
      isProfilePictureFromInternet: true,
      singlePost: postList[7],
      singleStory: stories[7],
    ),
    User(
      name: 'Ed Morris',
      imageUrl:
          'https://images.unsplash.com/photo-1521119989659-a83eee488004?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=664&q=80',
      isProfilePictureFromInternet: true,
      singlePost: postList[8],
      singleStory: stories[8],
    ),
    User(
      name: 'Carolyn Duncan',
      imageUrl:
          'https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
      isProfilePictureFromInternet: true,
      singlePost: postList[9],
      singleStory: stories[9],
    ),
    User(
      name: 'Paul Pinnock',
      imageUrl:
          'https://images.unsplash.com/photo-1519631128182-433895475ffe?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
      isProfilePictureFromInternet: true,
    ),
    User(
      name: 'Elizabeth Wong',
      imageUrl:
          'https://images.unsplash.com/photo-1515077678510-ce3bdf418862?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjF9&auto=format&fit=crop&w=675&q=80',
      isProfilePictureFromInternet: true,
    ),
    User(
      name: 'James Lathrop',
      imageUrl:
          'https://images.unsplash.com/photo-1528892952291-009c663ce843?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=592&q=80',
      isProfilePictureFromInternet: true,
    ),
    User(
      name: 'Jessie Samson',
      imageUrl:
          'https://images.unsplash.com/photo-1517841905240-472988babdf9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
      isProfilePictureFromInternet: true,
    ),
    User(
      name: 'David Brooks',
      imageUrl:
          'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
      isProfilePictureFromInternet: true,
    ),
    User(
      name: 'Jane Doe',
      imageUrl:
          'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
      isProfilePictureFromInternet: true,
    ),
    User(
      name: 'Matthew Hinkle',
      imageUrl:
          'https://images.unsplash.com/photo-1492562080023-ab3db95bfbce?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1331&q=80',
      isProfilePictureFromInternet: true,
    ),
    User(
      name: 'Amy Smith',
      imageUrl:
          'https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=80',
      isProfilePictureFromInternet: true,
    ),
    User(
      name: 'Ed Morris',
      imageUrl:
          'https://images.unsplash.com/photo-1521119989659-a83eee488004?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=664&q=80',
      isProfilePictureFromInternet: true,
    ),
    User(
      name: 'Carolyn Duncan',
      imageUrl:
          'https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
      isProfilePictureFromInternet: true,
    ),
    User(
      name: 'Paul Pinnock',
      imageUrl:
          'https://images.unsplash.com/photo-1519631128182-433895475ffe?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
      isProfilePictureFromInternet: true,
    ),
    User(
      name: 'Elizabeth Wong',
      imageUrl:
          'https://images.unsplash.com/photo-1515077678510-ce3bdf418862?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjF9&auto=format&fit=crop&w=675&q=80',
      isProfilePictureFromInternet: true,
    ),
    User(
      name: 'James Lathrop',
      imageUrl:
          'https://images.unsplash.com/photo-1528892952291-009c663ce843?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=592&q=80',
      isProfilePictureFromInternet: true,
    ),
    User(
      name: 'Jessie Samson',
      imageUrl:
          'https://images.unsplash.com/photo-1517841905240-472988babdf9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
      isProfilePictureFromInternet: true,
    ),
  ];

  // currentUser = friendsList[1];

  /// Agregar a todos los usuarios a la lista de amigos.
  ///
  /// - MÉTODO 1.
  // currentUser.addFriends(friendsList);

  /// Agregar a todos los usuarios a la lista de amigos.
  /// - MÉTODO 2.
  ///
  /// ```dart
  /// for (final User friend in friendsList) {
  ///   currentUser.addFriend(friend);
  /// }
  /// ```
}
