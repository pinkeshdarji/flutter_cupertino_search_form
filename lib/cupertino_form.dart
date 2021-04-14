import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertionFormDemo extends StatefulWidget {
  @override
  _CupertionFormDemoState createState() => _CupertionFormDemoState();
}

class _CupertionFormDemoState extends State<CupertionFormDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User'),
      ),
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CupertinoFormSection(
                  header: Text('Account Details'),
                  children: [
                    CupertinoFormRow(
                      prefix: Text('Name'),
                      child: CupertinoTextFormFieldRow(
                        placeholder: "Enter name",
                      ),
                    ),
                    CupertinoFormRow(
                      prefix: Text("Email"),
                      child: Text('pinkesh.earth@gmail.com'),
                    ),
                    CupertinoFormRow(
                      prefix: Text('Mobile'),
                      child: CupertinoTextFormFieldRow(
                        placeholder: "Enter contact",
                        keyboardType: TextInputType.phone,
                      ),
                      helper: Text('Without country code'),
                    ),
                    CupertinoFormRow(
                      child: CupertinoTextFormFieldRow(
                        obscureText: true,
                      ),
                      prefix: Text("Password"),
                      error: Text('Must be 8 digit long'),
                    ),
                  ],
                  footer: Text('Last updated 1 month ago'),
                ),
                CupertinoFormSection(
                  header: Text('Social accounts'),
                  children: [
                    CupertinoFormRow(
                      prefix: Icon(Icons.wifi),
                      child: CupertinoSwitch(
                        value: true,
                        onChanged: (value) {},
                      ),
                    ),
                    CupertinoFormRow(
                      prefix: Text('Google'),
                      child: CupertinoSwitch(
                        value: true,
                        onChanged: (value) {},
                      ),
                    ),
                    CupertinoFormRow(
                      prefix: Text("Github"),
                      child: CupertinoSwitch(
                        value: false,
                        onChanged: (value) {},
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
