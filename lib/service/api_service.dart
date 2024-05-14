import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import '../models/user.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: "")
abstract class APIClient{
  factory APIClient(Dio dio, {String baseUrl}) = _APIClient;

  @GET("")
  Future<GitUser> getUser();

  @GET("")
  Future<List<GitUser>> getUsers();
}