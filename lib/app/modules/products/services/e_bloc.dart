import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/products_model.dart';
import 'e_bloc_events.dart';
import 'e_bloc_state.dart';
import 'package:http/http.dart' as http;

class BlocProducts extends Bloc<ProductsEvents, BlocInitializeState> {

  BlocProducts() : super(ProductInitializeState()) {

    ProductsModel productsModel;

    String url = "https://dummyjson.com/products";

    on<GetAllProducts>((event, emit) async {

     try{

       emit(ProductLoading());

       var response = await http.get(Uri.parse(url));

       if (response.statusCode == 200) {
         final data = jsonDecode(response.body);
         productsModel = ProductsModel.fromJson(data);
         emit(ProductLoaded(productsModel: productsModel));


       }

     }catch(e){
       emit(ProductError(errorMeg: e.toString()));
     }

    });
  }
}
