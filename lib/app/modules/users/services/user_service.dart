import 'dart:convert';
import 'package:e_commerce_blog/app/modules/users/services/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/user_list_model.dart';
import 'package:http/http.dart' as http;

class UserListService extends Cubit<UserCubitState> {
  List<UserListModel> userList = [];
  UserListModel userListModel = UserListModel();

  UserListService() : super(UserInitCubitState());

  String url = "https://jsonplaceholder.typicode.com/users";

  getUserData() async {
    emit(UserLoading());

    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List;
      userList = data.map((e) => UserListModel.fromJson(e)).toList();
    }
    emit(UserListLoaded(userlist: userList));
  }
}
