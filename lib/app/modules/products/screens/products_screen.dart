import 'package:e_commerce_blog/app/modules/products/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../services/e_bloc.dart';
import '../services/e_bloc_events.dart';
import '../services/e_bloc_state.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  void initState() {
    context.read<BlocProducts>().add(GetAllProducts());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BlocProducts, BlocInitializeState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ProductError) {
            return Center(child: Text(state.errorMeg.toString()));
          } else if (state is ProductLoaded) {
            return ListView.builder(
              itemCount: state.productsModel.products?.length ?? 0,
              itemBuilder: (context, index) {
                Products? product = state.productsModel.products?[index];
                return Row(
                  children: [
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: Image.network(product?.images?.firstOrNull ?? ""),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text(product?.title ?? ""),
                        trailing: Text(product?.id.toString() ?? ""),

                        subtitle: Text(product?.price.toString() ?? ""),
                      ),
                    ),
                  ],
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
