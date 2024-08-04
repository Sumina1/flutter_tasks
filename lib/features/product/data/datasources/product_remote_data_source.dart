import 'dart:convert';
import 'package:dio/dio.dart';
import '../models/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getProducts();
  Future<List<ProductModel>> searchProducts(String query);
  Future<List<ProductModel>> filterProducts(String category);
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final Dio dio;

  ProductRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<ProductModel>> getProducts() async {
    final response = await dio.get('https://api.example.com/products');
    if (response.statusCode == 200) {
      List<dynamic> jsonList = response.data;
      return jsonList.map((json) => ProductModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  @override
  Future<List<ProductModel>> searchProducts(String query) async {
    final response = await dio.get(
      'https://api.example.com/products',
      queryParameters: {'search': query},
    );
    if (response.statusCode == 200) {
      List<dynamic> jsonList = response.data;
      return jsonList.map((json) => ProductModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to search products');
    }
  }

  @override
  Future<List<ProductModel>> filterProducts(String category) async {
    final response = await dio.get(
      'https://api.example.com/products',
      queryParameters: {'category': category},
    );
    if (response.statusCode == 200) {
      List<dynamic> jsonList = response.data;
      return jsonList.map((json) => ProductModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to filter products');
    }
  }
}
