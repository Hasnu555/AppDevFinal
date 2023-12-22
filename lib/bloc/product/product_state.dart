import 'package:practice/model/product.dart';

abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<Product> products;

  ProductLoaded(this.products);
}

class ProductOperationSuccess extends ProductState {
  final String message;

  ProductOperationSuccess(this.message);
}

class ProductError extends ProductState {
  final String errorMessage;

  ProductError(this.errorMessage);
}
