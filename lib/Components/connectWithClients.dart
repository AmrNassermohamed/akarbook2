import 'package:akarbook/WidgetGlobel/textGlobal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Widget connectWithClients({phone,required BuildContext context}){
 return  GestureDetector(
    onTap: (){
      launch('tel: ${phone}');
    },
    child: new Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        textGlobalOrangeBold17(context: context, text: "تواصل مع العميل"),
        new SizedBox(width: 10,),
        new Icon(Icons.phone, color: Colors.orange.shade700,),
      ],),
  );


}