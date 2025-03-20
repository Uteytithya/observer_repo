import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:observer_repo/WEEK-6/EX-2-START-CODE/data/post_dto.dart';
import 'package:observer_repo/WEEK-6/EX-2-START-CODE/model/post.dart';
import 'package:observer_repo/WEEK-6/EX-2-START-CODE/repository/post_repository.dart';

class HttpPostsRepository extends PostRepository {
  PostDto dto = PostDto();
  final String _baseUrl = "https://jsonplaceholder.typicode.com/posts";

  @override
  Future<List<Post>> getPost() async {
    final response = await http.get(Uri.parse('$_baseUrl/'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      print(jsonData);
      return jsonData.map((json) => dto.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load posts");
    }
  }
}
