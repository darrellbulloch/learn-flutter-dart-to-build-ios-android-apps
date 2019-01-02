import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import './pages/auth.dart';
import './pages/products_admin.dart';
import './pages/products.dart';
import './pages/product.dart';

void main() {
  // debugPaintSizeEnabled = true;
  // debugPaintBaselinesEnabled = true;
  // debugPaintPointersEnabled = true;

  Widget app = MyApp();

  runApp(app);
}

// void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  List<Map<String, dynamic>> _products = [];

  void _addProduct(Map<String, dynamic> product) {
    // Notify the framework that the internal state of this object
    // has changed.
    // Whenever you change the internal state of a [State] object,
    // make the change in a function that you pass to [setState]:
    // The provided callback is immediately called synchronously.
    // It must not return a future (the callback cannot be async),
    // since then it would be unclear when the state was actually being set.
    setState(() {
      _products.add(product);
    });
  }

  void _deleteProduct(int index) {
    setState(() {
      _products.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowMaterialGrid: true,
      theme: ThemeData(
        // brightness: Brightness.dark,
        primarySwatch: Colors.deepOrange,
        accentColor: Colors.deepPurple,
      ),
      // home: AuthPage(),
      routes: {
        '/': (BuildContext context) => ProductsPage(_products),
        '/admin': (BuildContext context) =>
            ProductsAdminPage(_addProduct, _deleteProduct),
      },
      onGenerateRoute: (RouteSettings settings) {
        // Split the path name on '/'
        // 1. Given "/products/1", the list will contain 3 entries '', 'products' and '1'
        // 2. Given "products/1", the list will contain 2 entries 'products' and '1'
        final List<String> pathElements = settings.name.split('/');

        // Do not route if the path did not begin with a '/'
        // We are assuming that all routes begin with a '/'
        if (pathElements[0] != '') {
          return null; // do not route
        }

        if (pathElements[1] == 'product') {
          final int index = int.parse(pathElements[2]);

          return MaterialPageRoute<bool>(
            builder: (BuildContext context) => ProductPage(
                _products[index]['title'], _products[index]['image']),
          );
        } else {
          return null; // do not route
        }
      },
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            builder: (BuildContext context) => ProductsPage(_products));
      },
    );
  }
}
