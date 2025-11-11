import 'package:e_commerce_blog/app/modules/users/models/user_list_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../services/user_service.dart';
import '../services/user_state.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  @override
  void initState() {
    context.read<UserListService>().getUserData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UserListService, UserCubitState>(
        builder: (context, state) {
          if (state is UserLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is UserError) {
            return Text(state.errorMeg.toString());
          } else if (state is UserListLoaded) {
            return ListView.builder(
              itemCount: state.userlist.length,
              itemBuilder: (context, index) {
                UserListModel user = state.userlist[index];
                return ListTile(
                  title: Text(user.username ?? ""),
                  trailing: Text(user.id.toString()),


                  subtitle: Text(user.email ?? ""),
                );
              },
            );
          }

          return Text("No data found!");
        },
      ),
    );
  }
}
