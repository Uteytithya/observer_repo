import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:observer_repo/WEEK-6/EX-2-START-CODE/model/post.dart';
import 'package:observer_repo/WEEK-6/EX-2-START-CODE/repository/post_repository.dart';

class HttpPostsRepository extends PostRepository {
  final String _baseUrl = "https://jsonplaceholder.typicode.com/posts";

  Post fromJson(Map<String, dynamic> json) {
    assert(json.containsKey('id'), "Missing 'id' field in JSON");
    assert(json.containsKey('userId'), "Missing 'userId' field in JSON");
    assert(json.containsKey('title'), "Missing 'title' field in JSON");
    assert(json.containsKey('body'), "Missing 'body' field in JSON");
    // assert(json.containsKey('description'), "Missing 'Description' field in JSON");

    try {
      return Post(
        id: json['id'] as int,
        userId: json['userId'] as int,
        title: json['title'] as String,
        description: json['body'] as String,
      );
    } catch (e) {
      throw Exception("Error parsing Post JSON: $e");
    }
  }

  @override
  Future<Post> getPost(int postId) async {
    final response = await http.get(Uri.parse('$_baseUrl/$postId'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      print(jsonData);
      return fromJson(jsonData);
    } else {
      throw Exception("Failed to load post with ID $postId");
    }
  }
}
