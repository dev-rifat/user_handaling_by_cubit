import 'package:equatable/equatable.dart';
import '../models/products_model.dart';

abstract class BlocInitializeState extends Equatable {}


class ProductInitializeState extends BlocInitializeState {
  @override
  List<Object?> get props => [];
}



class ProductLoading extends ProductInitializeState {
  @override
  List<Object?> get props => [];
}



class ProductLoaded extends ProductInitializeState {

 final ProductsModel productsModel;

  ProductLoaded({required this.productsModel});


  @override
  List<Object?> get props => [productsModel];
}



class ProductError extends ProductInitializeState {
  final String errorMeg;
  ProductError({required this.errorMeg});
  @override
  List<Object?> get props => [errorMeg];
}
