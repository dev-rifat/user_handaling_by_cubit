import 'package:equatable/equatable.dart';

abstract class ProductsEvents extends Equatable {}

class GetAllProducts extends ProductsEvents {
  @override
  List<Object?> get props => [];
}
