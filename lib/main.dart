import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/modules/counters/servies/cubit_services.dart';
import 'app/modules/counters/view/screens/counter_screen.dart';
import 'app/modules/users/services/user_service.dart';
import 'app/modules/users/view/user_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterServiceCubit()),
        BlocProvider(create: (context) => UserListService()),
      ],
      child: MaterialApp(home: UserListScreen()),
    );
  }
}
