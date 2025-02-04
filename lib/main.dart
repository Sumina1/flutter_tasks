import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/features/product/presentation/bloc/product_event.dart';
import 'injection_container.dart' as di;
import 'features/product/presentation/bloc/product_bloc.dart';
import 'features/product/presentation/pages/screen/product_page.dart';
import 'mock_api.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupMockApi();  // Set up the mock API
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductBloc>(
          create: (context) => di.sl<ProductBloc>()..add(LoadProductsEvent()),
        ),
      ],
      child: MaterialApp(
        title: 'Product App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ProductPage(),
      ),
    );
  }
}
