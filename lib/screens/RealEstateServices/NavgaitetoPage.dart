
import 'package:akarbook/screens/RealEstateServices/page.dart';
import 'package:flutter/material.dart';

nav(BuildContext context,id,title){

  Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
      PageEStateSerVices (id: id,title: title,)));
}