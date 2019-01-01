import 'package:flutter/material.dart';
import '../pages/products.dart';

class ProductsAdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            AppBar(
              automaticallyImplyLeading: false,
              title: Text('Choose'),
            ),
            ListTile(
              title: Text('All Products'),
              onTap: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => ProductsPage(),
                    ),
                  ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Manage Products'),
      ),
      body: Center(
        child: Text('Manage Products'),
      ),
    );
  }
}
