
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

displaySnackBar(BuildContext context,text) {
  final snackBar = SnackBar(content: Text(text));
// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}