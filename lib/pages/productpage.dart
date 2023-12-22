import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice/bloc/product/product_bloc.dart';
import 'package:practice/bloc/product/product_event.dart';
import 'package:practice/bloc/product/product_state.dart';
import 'package:practice/pages/addnewproduct.dart';
import 'package:practice/pages/profilepage.dart';

class ProductView extends StatefulWidget {
  const ProductView({Key? key}) : super(key: key);

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  bool _isGridView = true;
  int _currentIndex = 0;

  @override
  void initState() {
    BlocProvider.of<ProductBloc>(context).add(LoadProduct());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ProductBloc _productBloc = BlocProvider.of<ProductBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Page'),
        leading: IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => (AddNewProductPage()),
              ),
            );
          },
        ),
      ),
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state is ProductLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is ProductLoaded) {
                  final products = state.products;
                  return _isGridView
                      ? GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 0.95,
                          ),
                          itemCount: products.length,
                          itemBuilder: (context, index) {
                            final product = products[index];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center( // Center horizontally and vertically
                                      child: Text(
                                        product.name,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Center( // Center horizontally and vertically
                                      child: Text(
                                        'Price: \$${product.price.toStringAsFixed(2)}',
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Spacer(),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.center, // Center horizontally
                                      children: [
                                        IconButton(
                                          icon: const Icon(Icons.edit),
                                          onPressed: () {
                                            // ...
                                          },
                                        ),
                                        IconButton(
                                          icon: const Icon(Icons.delete),
                                          onPressed: () {
                                            _productBloc.add(DeleteProduct(product.id));
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        )
                      : ListView.builder(
                          itemCount: products.length,
                          itemBuilder: (context, index) {
                            final product = products[index];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: ListTile(
                                  title: Text(product.name),
                                  subtitle: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Price: \$${product.price.toStringAsFixed(2)}',
                                      ),
                                    ],
                                  ),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.edit),
                                        onPressed: () {
                                          // Navigator.push(
                                          //   context,
                                          //   MaterialPageRoute(
                                          //     builder: (context) => EditProductPage(product: product)),
                                          // );
                                        },
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.delete),
                                        onPressed: () {
                                          _productBloc.add(DeleteProduct(product.id));
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                } else if (state is ProductOperationSuccess) {
                  _productBloc.add(LoadProduct());
                  return Container();
                } else if (state is ProductError) {
                  return Center(child: Text(state.errorMessage));
                } else {
                  return Container();
                }
              },
            ),
          ),
          SizedBox(
            width: 80, // Set the desired width here
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1),
                        color: _isGridView ? Colors.grey[200] : Colors.white,
                      ),
                      child: IconButton(
                        icon: Icon(Icons.list),
                        onPressed: () {
                          setState(() {
                            _isGridView = false;
                          });
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1),
                        color: _isGridView ? Colors.white : Colors.grey[200],
                      ),
                      child: IconButton(
                        icon: Icon(Icons.grid_view),
                        onPressed: () {
                          setState(() {
                            _isGridView = true;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            if (_currentIndex == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            }
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
