// import 'package:flutter/material.dart';
//
// import 'cupertino_search_widget.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         primarySwatch: Colors.teal,
//         brightness: Brightness.dark,
//       ),
//       debugShowCheckedModeBanner: false,
//       home: CupertionSearchWidget(),
//     );
//   }
// }

import 'package:cupertino_search_form/screens/cart_page.dart';
import 'package:cupertino_search_form/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/cart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Cart>(
        create: (context) => Cart(),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.teal,
            brightness: Brightness.dark,
            // textButtonTheme: TextButtonThemeData(
            //     style: TextButton.styleFrom(primary: Colors.red)),
          ),
          routes: {
            HomePage.routeName: (context) => HomePage(),
            CartPage.routeName: (context) => CartPage(),
          },
          initialRoute: HomePage.routeName,
          //home: MyBookings(),
          debugShowCheckedModeBanner: false,
        ));
  }
}
