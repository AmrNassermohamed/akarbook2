import 'package:akarbook/WidgetGlobel/textGlobal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget iconWithText({required BuildContext context,text,icon}){

 return new Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      textGlobalGreyBold13(context: context,text: text
      ),
      new SizedBox(width: 10,),
      new Icon(icon,color: Colors.orange.shade700,size: 25,),
    ],);
}

Widget iconWithTextOwner({required BuildContext context,text}){
  return iconWithText(icon: Icons.person,context:context,text: text );
}