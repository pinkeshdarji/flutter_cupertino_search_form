import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertionSearchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      //padding: EdgeInsets.all(16),
      child: Center(
        child: CupertinoSearchTextField(
          // backgroundColor: Colors.teal,
          // placeholder: 'Find your product',
          // placeholderStyle: TextStyle(color: Colors.white.withOpacity(0.8)),
          // style: TextStyle(color: Colors.white),
          // borderRadius: BorderRadius.all(Radius.circular(16)),
          // itemColor: Colors.white,
          // itemSize: 25,
          // prefixInsets: EdgeInsets.all(16),
          // suffixInsets: EdgeInsets.all(16),
          // //padding: EdgeInsets.all(16),
          // suffixIcon: Icon(Icons.cancel_presentation),
          // suffixMode: OverlayVisibilityMode.always,
          // decoration: BoxDecoration(
          //   gradient: LinearGradient(
          //     begin: FractionalOffset.topCenter,
          //     end: FractionalOffset.bottomCenter,
          //     colors: [
          //       Colors.teal.withOpacity(0.0),
          //       Colors.teal.withOpacity(0.8),
          //     ],
          //   ),
          // ),
          onChanged: (value) {
            print("The changed text is " + value);
          },
          onSubmitted: (value) {
            print("Submitted text is " + value);
          },
          onSuffixTap: () {
            print("Clear icon pressed ");
          },
        ),
      ),
    ));
  }
}
