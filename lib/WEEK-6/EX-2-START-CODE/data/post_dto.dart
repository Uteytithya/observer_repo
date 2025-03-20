import 'package:observer_repo/WEEK-6/EX-2-START-CODE/model/post.dart';

class PostDto{
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
}