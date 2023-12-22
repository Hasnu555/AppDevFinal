import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice/bloc/product/product_event.dart';
import 'package:practice/bloc/product/product_state.dart';
import 'package:practice/firebase/product_firebase.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductFirestoreService _firestoreService;

  ProductBloc(this._firestoreService) : super(ProductInitial()) {
    on<LoadProduct>((event, emit) async {
      try {
        emit(ProductLoading());
        final products = await _firestoreService.getProducts().first;
        emit(ProductLoaded(products));
      } catch (e) {
        emit(ProductError('Failed to load products.'));
      }
    });

    on<AddProduct>((event, emit) async {
      try {
        emit(ProductLoading());
        await _firestoreService.addProduct(event.product);
        emit(ProductOperationSuccess('Product added successfully.'));
      } catch (e) {
        emit(ProductError('Failed to add product.'));
      }
    });

    on<UpdateProduct>((event, emit)  async {
      try {
        emit(ProductLoading());
        await _firestoreService.updateProduct(event.product);
        emit(ProductOperationSuccess('Product updated successfully.'));
      } catch (e) {
        emit(ProductError('Failed to update product.'));
      }
    });

    on<DeleteProduct>((event, emit) async {
      try {
        emit(ProductLoading());
        await _firestoreService.deleteProduct(event.productId);
        emit(ProductOperationSuccess('Product deleted successfully.'));
      } catch (e) {
        emit(ProductError('Failed to delete product.'));
      }
    });

  }
}