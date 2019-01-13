import 'dart:convert';
import 'package:scoped_model/scoped_model.dart';
import '../models/product.dart';
import '../models/user.dart';
import 'package:http/http.dart' as http;

mixin ConnectedProductsModel on Model {
  List<Product> _products = [];
  int _selProductIndex;
  User _authenticatedUser;

  void addProduct(
      String title, String description, String image, double price) {
    final Map<String, dynamic> productData = {
      'title': title,
      'description': description,
      'image':
          'https://www.google.com/imgres?imgurl=https%3A%2F%2Famp.businessinsider.com%2Fimages%2F5a4422b2b0bcd5e3178b70a3-2732-1366.jpg&imgrefurl=https%3A%2F%2Fwww.businessinsider.com%2Fwhen-chocolate-extinct-2017-12&docid=y7T0FjYMcbl5FM&tbnid=6cz1fKtbrOsaAM%3A&vet=10ahUKEwitqJGI0enfAhUPh-AKHemZBxMQMwh-KBMwEw..i&w=2732&h=1366&client=firefox-b-1-d&bih=886&biw=792&q=chocolate&ved=0ahUKEwitqJGI0enfAhUPh-AKHemZBxMQMwh-KBMwEw&iact=mrc&uact=8',
      'price': price,
      'userEmail': _authenticatedUser.email,
      'userId': _authenticatedUser.id
    };

    http
        .post('https://flutter-products-606d1.firebaseio.com/products.json',
            body: json.encode(productData))
        .then((http.Response response) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      // if (responseData['error']) {
      //   throw Exception(responseData['error']);
      // }
      print('Post was successful with response $responseData');
      final Product newProduct = Product(
          id: responseData['name'],
          title: title,
          description: description,
          image: image,
          price: price,
          userEmail: _authenticatedUser.email,
          userId: _authenticatedUser.id);
      _products.add(newProduct);
      notifyListeners();
    }).catchError((error) {
      print('Post failed with error $error');
    });
  }
}

mixin ProductsModel on ConnectedProductsModel {
  bool _showFavorites = false;

  List<Product> get allProducts {
    return List.from(_products);
  }

  List<Product> get displayedProducts {
    if (_showFavorites) {
      return List.from(
          _products.where((Product product) => product.isFavorite).toList());
    } else {
      return List.from(_products);
    }
  }

  int get selectedProductIndex {
    return _selProductIndex;
  }

  Product get selectedProduct {
    if (selectedProductIndex == null) {
      return null;
    } else {
      return _products[selectedProductIndex];
    }
  }

  bool get displayFavoritesOnly {
    return _showFavorites;
  }

  void updateProduct(
      String title, String description, String image, double price) {
    final Product updatedProduct = Product(
        title: title,
        description: description,
        image: image,
        price: price,
        userEmail: selectedProduct.userEmail,
        userId: selectedProduct.userId);

    _products[selectedProductIndex] = updatedProduct;
    notifyListeners();
  }

  void deleteProduct() {
    _products.removeAt(selectedProductIndex);
    notifyListeners();
  }

  void fetchProducts() {
    http
        .get('https://flutter-products-606d1.firebaseio.com/products.json')
        .then((http.Response response) {
      print(json.decode(response.body));

      final List<Product> fechedProductList = [];

      final Map<String, dynamic> productListData = json.decode(response.body);

      productListData.forEach((String productId, dynamic productData) {
        final Product product = Product(
            id: productId,
            title: productData['title'],
            description: productData['description'],
            image: productData['image'],
            price: productData['price'],
            userEmail: productData['userEmail'],
            userId: productData['userId']);
        fechedProductList.add(product);
      });

      _products = fechedProductList;
      notifyListeners();
    });
  }

  void toggleProductFavoriteStatus() {
    final bool isCurrentlyFavorite = selectedProduct.isFavorite;
    final bool newFavoriteStatus = !isCurrentlyFavorite;
    final Product updateProduct = Product(
        title: selectedProduct.title,
        description: selectedProduct.description,
        price: selectedProduct.price,
        image: selectedProduct.image,
        userEmail: selectedProduct.userEmail,
        userId: selectedProduct.userId,
        isFavorite: newFavoriteStatus);

    _products[selectedProductIndex] = updateProduct;

    notifyListeners();
  }

  void selectProduct(int index) {
    _selProductIndex = index;
    if (index != null) {
      notifyListeners();
    }
  }

  void toggleDisplayMode() {
    _showFavorites = !_showFavorites;
    notifyListeners();
  }
}

mixin UserModel on ConnectedProductsModel {
  void login(String email, String password) {
    _authenticatedUser =
        User(id: 'fdalsdfasf', email: email, password: password);
  }
}
