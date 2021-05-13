// Clase en donde se guardarán todos los elementos de un usuario.

// Posts.
import 'post.dart';

class User {
  String name;
  String profilePicturePath;
  DateTime creationDate;

  // Lista de amigos.
  List<User> friends;

  // Lista de todos los post.
  List<Post> postList;

  User(this.name, this.profilePicturePath) {
    // Obtención del momento en que se creó la cuenta.
    creationDate = DateTime.now();
    // Inicialización de listas vacías.
    friends = [];
    postList = [];
  }

/* ---------------------- GETTERS, SETTERS y FUNCIONES ---------------------- */

  // Obtener número de amigos.
  Set<int> get friendsNumber => {friends.length};

  // Método para agregar a un amigo.
  void addFriend(User friend) {
    friends.add(friend);
  }

  // Método para agregar un post ya creado.
  void addPost(Post post) {
    postList.add(post);
  }
}
