import 'package:dio/dio.dart';
import '../models/user.dart';
import 'api_service.dart';

class GetAPI{
  static Future<List<GitUser>> fetchUsers({String baseUrl = ""}) async{
    final client = APIClient(
        Dio(
          BaseOptions(contentType: "application/json"),
        ),
        baseUrl:"https://api.github.com/users$baseUrl"
    );
    try {
      final response = await client.getUsers();
      return response;
    } catch (e) {
      throw Exception("Fail to load APi");
    }
  }

  static Future<GitUser> fetchUser(String userName) async{
    final client = APIClient(
        Dio(
          BaseOptions(contentType: "application/json"),
        ),
        baseUrl: "https://api.github.com/users/$userName"
    );
    try {
      final response = await client.getUser();
      return response;
    } catch (e) {
      throw Exception("Fail to load APi");
    }
  }
}