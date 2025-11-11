import 'package:e_commerce_blog/app/modules/counters/servies/cubit_services.dart';
import 'package:e_commerce_blog/app/modules/counters/servies/cubit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CounterServiceCubit, CounterCubitState>(
        builder: (context, state) {
          int currentValue = 0; // Default value

          if (state is CounterUpdatedValue) {
            currentValue = state.counter;
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  FloatingActionButton(
                    onPressed: () {
                      context.read<CounterServiceCubit>().counterIncrement();
                    },
                    child: Icon(Icons.add),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(children: [Text(currentValue.toString())]),
                  ),

                  FloatingActionButton(
                    onPressed: () {
                      context.read<CounterServiceCubit>().counterDecrement();
                    },
                    child: Icon(Icons.remove),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
