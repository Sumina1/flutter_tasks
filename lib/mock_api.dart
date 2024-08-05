import 'package:dio/dio.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

final dio = Dio(BaseOptions(baseUrl: 'https://api.example.com'));
final dioAdapter = DioAdapter(dio: dio);

void setupMockApi() {
  final jsonResponse = [
    {
      'id': 1,
      'name': 'Test Product 1',
      'description': 'Description 1',
      'price': 29.99,
      'imageUrl': 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.shutterstock.com%2Fsearch%2Fapple&psig=AOvVaw2S6SGJ4m-MwFPIAi7lYpjx&ust=1722859607923000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCIi8paWm24cDFQAAAAAdAAAAABAE'
    },
    {
      'id': 2,
      'name': 'Apple',
      'description': 'Description 2',
      'price': 19.99,
      'imageUrl': 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.shutterstock.com%2Fsearch%2Fapple&psig=AOvVaw2S6SGJ4m-MwFPIAi7lYpjx&ust=1722859607923000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCIi8paWm24cDFQAAAAAdAAAAABAE'
    },
    {
      'id': 3,
      'name': 'Ball',
      'description': 'Description 2',
      'price': 19.99,
      'imageUrl': 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.shutterstock.com%2Fsearch%2Fapple&psig=AOvVaw2S6SGJ4m-MwFPIAi7lYpjx&ust=1722859607923000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCIi8paWm24cDFQAAAAAdAAAAABAE'
    },
    {
      'id': 4,
      'name': 'Bisuit',
      'description': 'Description 2',
      'price': 19.99,
      'imageUrl': 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.shutterstock.com%2Fsearch%2Fapple&psig=AOvVaw2S6SGJ4m-MwFPIAi7lYpjx&ust=1722859607923000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCIi8paWm24cDFQAAAAAdAAAAABAE'
    },
    {
      'id': 5,
      'name': 'Shirt',
      'description': 'Description 2',
      'price': 19.99,
      'imageUrl': 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.shutterstock.com%2Fsearch%2Fapple&psig=AOvVaw2S6SGJ4m-MwFPIAi7lYpjx&ust=1722859607923000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCIi8paWm24cDFQAAAAAdAAAAABAE'
    },
    {
      'id': 6,
      'name': 'Pant',
      'description': 'Description 2',
      'price': 19.99,
      'imageUrl': 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.shutterstock.com%2Fsearch%2Fapple&psig=AOvVaw2S6SGJ4m-MwFPIAi7lYpjx&ust=1722859607923000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCIi8paWm24cDFQAAAAAdAAAAABAE'
    },
    {
      'id': 7,
      'name': 'Shoes',
      'description': 'Description 2',
      'price': 19.99,
      'imageUrl': 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.shutterstock.com%2Fsearch%2Fapple&psig=AOvVaw2S6SGJ4m-MwFPIAi7lYpjx&ust=1722859607923000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCIi8paWm24cDFQAAAAAdAAAAABAE'
    }
  ];

  dioAdapter.onGet(
    '/products',
    (server) => server.reply(200, jsonResponse),
  );

  dioAdapter.onGet(
    '/products',
    (server) => server.reply(200, (request) {
      final query = request.queryParameters['search'];
      if (query != null && query.isNotEmpty) {
        final filtered = jsonResponse.where((product) =>
          (product as Map<String, dynamic>)['name'].toLowerCase().contains(query.toLowerCase())).toList();
        return filtered;
      }
      return jsonResponse;
    }),
  );

  dioAdapter.onGet(
    '/products',
    (server) => server.reply(200, (request) {
      final category = request.queryParameters['category'];
      if (category != null && category != 'all') {
        final filtered = jsonResponse.where((product) =>
          (product as Map<String, dynamic>)['name'].toLowerCase().contains(category.toLowerCase())).toList();
        return filtered;
      }
      return jsonResponse;
    }),
  );

}
