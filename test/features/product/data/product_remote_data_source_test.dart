import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:test_app/features/product/data/datasources/product_remote_data_source.dart';
import 'package:test_app/features/product/data/models/product_model.dart';

void main() {
  late Dio dio;
  late DioAdapter dioAdapter;
  late ProductRemoteDataSourceImpl dataSource;

  setUp(() {
    dio = Dio();
    dioAdapter = DioAdapter(dio: dio);
    dataSource = ProductRemoteDataSourceImpl(dio: dio);
  });

  group('getProducts', () {
    final tProductModelList = [
      ProductModel(id: 1, name: 'Test Product 1', description: 'Description 1', price: 29.99, imageUrl: 'https://via.placeholder.com/150'),
      ProductModel(id: 2, name: 'Test Product 2', description: 'Description 2', price: 19.99, imageUrl: 'https://via.placeholder.com/150'),
    ];

    final jsonResponse = [
      {
        'id': 1,
        'name': 'Test Product 1',
        'description': 'Description 1',
        'price': 29.99,
        'imageUrl': 'https://via.placeholder.com/150'
      },
      {
        'id': 2,
        'name': 'Test Product 2',
        'description': 'Description 2',
        'price': 19.99,
        'imageUrl': 'https://via.placeholder.com/150'
      }
    ];

    test('should return list of ProductModels when the response code is 200', () async {
      // arrange
      dioAdapter.onGet(
        'https://api.example.com/products',
        (server) => server.reply(200, jsonResponse),
      );

      // act
      final result = await dataSource.getProducts();

      // assert
      expect(result, tProductModelList);
    });

    test('should throw an exception when the response code is not 200', () async {
      // arrange
      dioAdapter.onGet(
        'https://api.example.com/products',
        (server) => server.reply(404, 'Not Found'),
      );

      // act
      final call = dataSource.getProducts();

      // assert
      expect(() => call, throwsA(isA<Exception>()));
    });
  });
}
