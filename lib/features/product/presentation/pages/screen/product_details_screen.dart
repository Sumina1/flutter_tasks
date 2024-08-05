import 'package:flutter/material.dart';
import 'package:test_app/helper/size_config.dart';
import 'package:test_app/injection_container.dart';
import '../../../domain/entities/product.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Product product;

  const ProductDetailsScreen({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
 
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
     final SizeConfig _sizeConfig = SizeConfig();
    _sizeConfig.init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Product Details',
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: Colors.white, fontSize: 20),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              // Add navigation to the cart page here
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: _sizeConfig.blockSizeH * 40,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.product.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(_sizeConfig.blockSizeH * 1.5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.product.name,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 20),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          OutlinedButton(
                            onPressed: () {
                              setState(() {
                                if (_quantity > 1) _quantity--;
                              });
                            },
                            child: const Icon(Icons.remove, size: 24),
                          ),
                          SizedBox(width: _sizeConfig.blockSizeW * 2),
                          Text(
                            '$_quantity',
                            style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 18),
                          ),
                          SizedBox(width: _sizeConfig.blockSizeW * 2),
                          OutlinedButton(
                            onPressed: () {
                              setState(() {
                                _quantity++;
                              });
                            },
                            child: const Icon(Icons.add, size: 24),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: _sizeConfig.blockSizeH * 1),
                  Text(
                    'Rs ${widget.product.price}',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  SizedBox(height: _sizeConfig.blockSizeH * 2),
                  Text(
                    'Description',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: _sizeConfig.blockSizeH * 1),
                  Text(
                    widget.product.description,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: _sizeConfig.blockSizeH * 3),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(_sizeConfig.blockSizeH * 1.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: () {
                // Add Add to Cart action here
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Theme.of(context).primaryColor,
                ),
                padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(
                    vertical: _sizeConfig.blockSizeH * 1.5,
                    horizontal: _sizeConfig.blockSizeW * 10,
                  ),
                ),
              ),
              child: Text(
                'Add to Cart',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Add Buy Now action here
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Colors.blue,
                ),
                padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(
                    vertical: _sizeConfig.blockSizeH * 1.5,
                    horizontal: _sizeConfig.blockSizeW * 10,
                  ),
                ),
              ),
              child: Text(
                'Buy Now',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
