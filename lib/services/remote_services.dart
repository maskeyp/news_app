import '../models/post.dart';
import 'package:http/http.dart' as http;

class RemoteService{

  Future<List<Post>?> getPosts() async
  {
      var client = http.Client();

  }
}