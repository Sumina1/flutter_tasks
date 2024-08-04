import 'package:dio/dio.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

final dio = Dio();
final dioAdapter = DioAdapter(dio: dio);

void setupMockApi() {
  final jsonResponse = [
    {
      'id': 1,
      'name': 'Apple',
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

  dioAdapter.onGet(
    'https://api.example.com/products',
    (server) => server.reply(200, jsonResponse),
  );

  dioAdapter.onGet(
    'https://api.example.com/products',
    (server) => server.reply(200, (request) {
      final query = request.queryParameters['search'];
      if (query != null) {
        final filtered = jsonResponse
            .where((product) => (product as Map<String, dynamic>)['name']
                .toLowerCase()
                .contains(query.toLowerCase()))
            .toList();
        return filtered;
      }
      return jsonResponse;
    }),
  );

  dioAdapter.onGet(
    'https://api.example.com/products',
    (server) => server.reply(200, (request) {
      final category = request.queryParameters['category'];
      if (category != null && category != 'all') {
        // Simulate category filter logic
        final filtered = jsonResponse
            .where((product) => (product as Map<String, dynamic>)['name']
                .toLowerCase()
                .contains(category.toLowerCase()))
            .toList();
        return filtered;
      }
      return jsonResponse;
    }),
  );
}
