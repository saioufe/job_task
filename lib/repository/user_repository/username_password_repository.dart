import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:job_task/models/work_card_model.dart';
import 'package:job_task/repository/user_repository.dart';

class UsernamePasswordUserRepository extends UserRepository {
  const UsernamePasswordUserRepository();

  @override
  Future<String> authenticate(String username, String phone) async {
    try {
      var body = FormData.fromMap({
        'username': username,
        'password': phone,
      });
      var response = await Dio()
          .post('https://mgm1.dishtele.com/api/v1/users/login', data: body);
      // var data = json.decode(response.data.toString());
      // List<CardWorkModel> cards = [];
      // data.forEach((card) {
      //   cards.add(card);
      // });

      return "logedIn";
    } catch (e) {
      return "Error";
    }
  }

  Future<String> fakeLogIn(String username, String password) async {
    await Future.delayed(Duration(seconds: 2), () {
      return "loggedIn";
    });
  }

  @override
  Future<String> logout() async {
    await Future.delayed(Duration(seconds: 2), () {
      return "loggedOut";
    });
  }

  @override
  String get password => throw UnimplementedError();

  @override
  String get username => throw UnimplementedError();
}
