import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String description;
  final double price;

  ProductPage(this.title, this.imageUrl, this.description, this.price);

  // _showWarningDialog(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text('Are you sure?'),
  //         content: Text('This action cannot be undone!'),
  //         actions: <Widget>[
  //           FlatButton(
  //             child: Text('Discard'),
  //             onPressed: () {
  //               // Close the dialog
  //               Navigator.pop(context);
  //             },
  //           ),
  //           FlatButton(
  //             child: Text('Continue'),
  //             onPressed: () {
  //               // Close the dialog
  //               Navigator.pop(context);
  //               // Do the navigation
  //               Navigator.pop(context, true);
  //             },
  //           )
  //         ],
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        print('Back button pressed!');
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(imageUrl),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 26.0,
                    fontFamily: 'Oswald',
                    fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Union Square, San Francisco',
                  style: TextStyle(fontFamily: 'Oswald', color: Colors.grey),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  child: Text(
                    '|',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                Text(
                  '\$' + price.toString(),
                  style: TextStyle(fontFamily: 'Oswald', color: Colors.grey),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text(
                description,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
  /*
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        print('Back Button pressed!');
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Image.asset(imageUrl),
              Container(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      title,
                      style: TextStyle(
                          fontSize: 26.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Oswald'),
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 6.0,
                        vertical: 2.5,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).accentColor,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Text(
                        '\$${price.toString()}',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                description,
                style: TextStyle(
                    fontSize: 26.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Oswald'),
              ),
              Container(
                height: 12.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 6.0,
                  vertical: 2.5,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Text('Union Square, San Francisco'),
              ),
              ButtonBar(
                alignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.delete),
                        color: Theme.of(context).accentColor,
                        onPressed: () {
                          _showWarningDialog(context);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
    */
}
