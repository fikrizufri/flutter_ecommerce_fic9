import 'package:dartz/dartz.dart';
import 'package:flutter_ecommerce_fic9/common/constants/variables.dart';
import 'package:flutter_ecommerce_fic9/data/models/requests/login_request_model.dart';
import 'package:flutter_ecommerce_fic9/data/models/requests/register_request_model.dart';
import 'package:flutter_ecommerce_fic9/data/models/responses/auth_responses_model.dart';
import 'package:http/http.dart' as http;

class AuthLocalDataSource {
  Future<Either<String, AuthResponseModel>> register(
      RegisterRequestModel data) async {
    final headers = {'Content-Type': 'application/json'};
    final response = await http.post(
        Uri.parse('${Variables.baseUrl}/api/auth/local/register'),
        body: data.toJson(),
        headers: headers);
    if (response.statusCode == 200) {
      return right(AuthResponseModel.fromJson(response.body));
    } else {
      return left("server Error");
    }
  }

  Future<Either<String, AuthResponseModel>> login(
      LoginRequestModel data) async {
    final headers = {'Content-Type': 'application/json'};
    final response = await http.post(
        Uri.parse('${Variables.baseUrl}/api/auth/local'),
        body: data.toJson(),
        headers: headers);
    if (response.statusCode == 200) {
      return right(AuthResponseModel.fromJson(response.body));
    } else {
      return left("server Error");
    }
  }
}
