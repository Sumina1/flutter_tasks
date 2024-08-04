import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/product_bloc.dart';
import '../bloc/product_event.dart';
import '../bloc/product_state.dart';
import '../../domain/entities/product.dart';

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search products',
                border: OutlineInputBorder(),
              ),
              onChanged: (query) {
                context.read<ProductBloc>().add(SearchProductsEvent(query));
              },
            ),
            const SizedBox(height: 10),
            DropdownButton<String>(
              hint: const Text('Select category'),
              items: const [
                DropdownMenuItem(value: 'all', child: Text('All')),
                DropdownMenuItem(value: 'category1', child: Text('Category 1')),
                DropdownMenuItem(value: 'category2', child: Text('Category 2')),
              ],
              onChanged: (value) {
                context.read<ProductBloc>().add(FilterProductsEvent(value!));
              },
            ),
            SizedBox(height: 10),
            Expanded(
              child: BlocBuilder<ProductBloc, ProductState>(
                builder: (context, state) {
                  if (state is ProductLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is ProductLoaded) {
                    return ListView.builder(
                      itemCount: state.products.length,
                      itemBuilder: (context, index) {
                        final product = state.products[index];
                        return ProductCard(product: product);
                      },
                    );
                  } else if (state is ProductError) {
                    return Center(child: Text('Error: ${state.message}'));
                  }
                  return Center(child: Text('No products available.'));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;

  ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(
          product.imageUrl,
          semanticLabel: 'Product image of ${product.name}',
        ),
        title: Text(
          product.name,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '\$${product.price}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black54,
              ),
            ),
            Text(
              product.description,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
