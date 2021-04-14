import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertionSearchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        padding: EdgeInsets.all(16),
        child: CupertinoSearchTextField(
          onChanged: (value) {
            print("The changed text is " + value);
          },
          onSubmitted: (value) {
            print("Submitted text is " + value);
          },
        ),
      ),
    ));
  }
}
