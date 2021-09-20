import 'package:akarbook/WidgetGlobel/ImageNetwork.dart';
import 'package:akarbook/WidgetGlobel/textGlobal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget imageAgent({image,text,required BuildContext context}){
  return Container(
    margin: EdgeInsets.all(10.0),
    height: 300,
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10)
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],
    ),
  child: Column(
    children: [
      new SizedBox(height: 250,width: MediaQuery.of(context).size.width,child:

      imageNetwork(context: context,path: image,height: 200.0,width: 200.0)
        /*new Image.network(
        "https://akarbook.com/portal/wp-content/uploads/2021/08/Bold_SOGNI_il-significato-dei_nero_01-Copy.jpg",
        width: 200,fit: BoxFit.fill,)*/),
      new Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          textGlobalBlackBold16(context: context,text: text
          ),
          new SizedBox(width: 10,),
          new Icon(Icons.person,color: Colors.orange.shade700,),
        ],)
    ],),);


  return Padding(
   padding: EdgeInsets.all(25),
   child: Container(
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
        boxShadow: [
          BoxShadow(
            
            color: Colors.grey.withOpacity(0.8),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),


      height: 250,
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          children: [
            new SizedBox(height: 200,width: MediaQuery.of(context).size.width,child: new Image.network(
              image,width: 200,fit: BoxFit.fill,)),
            new Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                textGlobalGreyNormal13(context: context,text: text
                ),
                new Icon(Icons.person,color: Colors.orange.shade700,),
              ],)
          ],),
      ),
    ),
 );

}