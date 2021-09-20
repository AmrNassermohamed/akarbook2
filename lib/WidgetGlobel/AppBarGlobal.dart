import 'package:akarbook/WidgetGlobel/textGlobal.dart';
import 'package:flutter/material.dart';

import '../color.dart';

 appBarGlobal({required BuildContext context,text}){
  return AppBar(
    backgroundColor: blueDark,
    leading: GestureDetector(onTap: (){
      Navigator.of(context).pop();
    },child: new Icon(Icons.arrow_back)),
    actions: [
      new Padding(padding: EdgeInsets.only(left: 10,right: 20,top: 10,bottom: 10),child:
      textGlobalWhiteBold14(context: context,text: text)),

    ],
  );

}


appBarGlobal2(BuildContext context,text){
  return AppBar(
    centerTitle: true,
    backgroundColor: blueDark,
    leading: GestureDetector(onTap: (){
      Navigator.of(context).pop();
    },child: new Icon(Icons.arrow_back)),
    title:    textGlobalWhiteBold14(context: context,text:text),
  );
}
