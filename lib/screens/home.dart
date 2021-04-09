// Copyright 2020 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart.dart';
import '../models/product.dart';
import '../screens/product_page.dart';
import 'cart_page.dart';

class HomePage extends StatefulWidget {
  static String routeName = '/';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _crossAxisSpacing = 8, _mainAxisSpacing = 12, _aspectRatio = 5;

  int _crossAxisCount = 1;
  List<Product> _filteredProducts = products;
  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    var width = (screenWidth - ((_crossAxisCount - 1) * _crossAxisSpacing)) /
        _crossAxisCount;
    var height = width / _aspectRatio;

    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping App'),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: TextButton.icon(
              style: TextButton.styleFrom(primary: Colors.white),
              onPressed: () {
                Navigator.pushNamed(context, CartPage.routeName);
              },
              icon: Icon(Icons.shopping_cart),
              label: Text('Cart'),
              key: Key('cart'),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          FractionallySizedBox(
            widthFactor: 0.9,
            child: ClipRect(
                child: Padding(
              padding: const EdgeInsets.only(top: 16),
              child: CupertinoSearchTextField(
                controller: _controller,
                onChanged: (value) {
                  _updateProductList(value);
                },
                onSubmitted: (value) {
                  _updateProductList(value);
                },
                onSuffixTap: () {
                  _updateProductList('');
                },
              ),
            )),
          ),
          Expanded(
            child: LayoutBuilder(builder: (context, constraints) {
              return GridView.builder(
                itemCount: _filteredProducts.length,
                itemBuilder: (context, index) =>
                    ProductTile(_filteredProducts[index]),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: constraints.maxWidth > 700 ? 4 : 1,
                  childAspectRatio: 5,
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  void _updateProductList(String value) {
    debugPrint('$value');

    if (value.length > 0) {
      _filteredProducts = _filteredProducts
          .where((element) =>
              element.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
    } else {
      _controller.text = '';
      _filteredProducts = products;
    }

    setState(() {});
  }
}

class ProductTile extends StatelessWidget {
  final Product _product;

  const ProductTile(
    this._product,
  );

  @override
  Widget build(BuildContext context) {
    var cartList = Provider.of<Cart>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        onTap: () {
          Navigator.pushNamed(
            context,
            ProductPage.routeName,
            arguments: _product,
          );
        },
        leading: Container(
          width: 50,
          height: 30,
          child: Placeholder(
            color: _product.color,
          ),
        ),
        title: Text(
          _product.name,
          key: Key('text_${_product.name}'),
        ),
        trailing: IconButton(
          key: Key('icon_${_product.name}'),
          icon: Icon(Icons.shopping_cart_outlined),
        ),
      ),
    );
  }
}

const List<Product> products = const <Product>[
  const Product('Samsung S5', Colors.greenAccent),
  const Product('Nokia M3', Colors.green),
  const Product('Samsung S8', Colors.white),
  const Product('iPhone X', Colors.blue),
  const Product('iPhone Xr', Colors.amberAccent),
  const Product('Samsung S9', Colors.purple),
  const Product('iPhone 11', Colors.pink),
  const Product('iPhone 11 pro', Colors.yellowAccent),
  const Product('iPhone 12', Colors.red),
  const Product('iPhone 12 mini', Colors.blueAccent),
  const Product('Nokia M2', Colors.deepOrange),
  const Product('iPhone 11 pro max', Colors.cyan),
  const Product('Motorola X1', Colors.lightBlue),
  const Product('Motorola X2', Colors.deepPurpleAccent),
  const Product('Motorola X5', Colors.indigoAccent),
];
