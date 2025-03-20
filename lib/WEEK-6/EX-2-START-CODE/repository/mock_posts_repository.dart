import '../model/post.dart';

import 'post_repository.dart';

class MockPostRepository extends PostRepository {

  Post post1 = Post(id: 1, userId: 1, title: "Flutter", description: "Body");
  Post post2 = Post(id: 2, userId: 1, title: "Cool", description: "Hello");

  
  @override
  Future<List<Post>> getPost() async {
    List<Post> posts = [post1,post2];
    return Future.delayed(Duration(seconds: 5), () {
      return posts;
    });
  }
}
