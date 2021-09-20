import 'package:akarbook/WidgetGlobel/textGlobal.dart';
import 'package:flutter/material.dart';

Widget textPriceGlobal2514({required BuildContext context,text}){
  return Row(children: [
    new Padding(padding: EdgeInsets.only(left: 10.0),child:textGlobalBlackBold25(context: context,text:text)),
    new Padding(padding: EdgeInsets.only(left: 3.0),child:textGlobalOrangeBold14(context: context,text:"JD"))
  ],);
}

Widget textPriceGlobal14({required BuildContext context,text}){
  return Row(children: [
    new Padding(padding: EdgeInsets.only(left: 10.0),child:textGlobalGreyBold13(context: context,text:text.toString())),
    new Padding(padding: EdgeInsets.only(left: 3.0),child:textGlobalOrangeBold14(context: context,text:"JD"))
  ],);
}
