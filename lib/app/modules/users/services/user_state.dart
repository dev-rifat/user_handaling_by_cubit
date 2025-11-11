import 'package:equatable/equatable.dart';
import '../models/user_list_model.dart';

abstract class UserCubitState extends Equatable {
  const UserCubitState();
}

class UserInitCubitState extends UserCubitState {
  @override
  List<Object?> get props => [];
}

class UserLoading extends UserCubitState {
  @override
  List<Object?> get props => [];
}

class UserListLoaded extends UserCubitState {
  final List<UserListModel> userlist;

  const UserListLoaded({required this.userlist});

  @override
  List<Object?> get props => [userlist];
}

class UserError extends UserCubitState {
  final String errorMeg;

  const UserError({required this.errorMeg});
  @override
  List<Object?> get props => [errorMeg];
}
