
import 'package:akarbook/Components/navgaite.dart';
import 'package:akarbook/WidgetGlobel/textGlobal.dart';
import 'package:akarbook/color.dart';
import 'package:akarbook/provider/UserProvider.dart';
import 'package:akarbook/screens/RealEstateServices/NavgaitetoPage.dart';
import 'package:akarbook/screens/vipAccount.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

dalert({required BuildContext context}){

  Alert(
    
    context: context,
    type: AlertType.warning,
    title: " هل انت متاكد؟",

    content:new GestureDetector(onTap: (){},child: new Column(children: [

      textGlobalGreyBold8(context: context,text: "حتى تتمكن من المتباعة يجب الموافقة على"),
  GestureDetector( onTap: (){

    nav(context,5877,"الشروط والاحكام" );
  } ,child:textGlobalOrangeBold14(context: context,text: "الشروط والاحكام")),
    ],),) ,
    buttons: [
      DialogButton(
        child: textGlobalWhiteBold14(context: context, text:  " لا اوافق"),
        onPressed: () => Navigator.pop(context),
        color: offWhite,
      ),
      DialogButton(
        child: textGlobalWhiteBold14(context: context, text:  " اوافق"),
        color: deepOrange,
        onPressed: () {
          final validationService = Provider.of<UserProvider>(
              context, listen: false);
          validationService.counterAlert++;
          Navigator.pop(context);
          navVipEstateServices(context);
        },
      ),
    ],
  ).show();

}

alertLogin5({required BuildContext context}){

  Alert(

    context: context,
    type: AlertType.warning,
    title: " يجب عليك تسجيل الدخول",

   /* content:new GestureDetector(onTap: (){},child: new Column(children: [

      textGlobalGreyBold8(context: context,text: "حتى تتمكن من المتباعة يجب الموافقة على"),
      textGlobalOrangeBold14(context: context,text: "الشروط والاحكام"),
    ],),) ,*/
    buttons: [
      DialogButton(
        child: textGlobalWhiteBold14(context: context, text:  "تسجيل الدخول"),
        onPressed: () {
          Navigator.of(context).pop();
          navLogin(context: context);},
        color: blueDark,
      ),
      DialogButton(
        child: textGlobalWhiteBold14(context: context, text:  "عمل حساب"),
        color: deepOrange,
        onPressed: () {        Navigator.of(context).pop();   navSignUp(context: context);}
      ),
    ],
  ).show();

}
showAlertDialog(BuildContext context) {

  // set up the buttons


  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title:Center(child: textGlobalGreyBold16(context:context,text: "هل انت متاكد؟")),


    content: Container(height: 120,child:Column(children: [
      new Icon(Icons.error,color: Colors.red,size: 50,),
      new GestureDetector(onTap: (){},child:
        textGlobalGreyBold8(context: context,text: "حتى تتمكن من المتباعة يجب الموافقة على")),
        GestureDetector( onTap: (){

          nav(context,5877,"الشروط والاحكام" );
        } ,child:textGlobalOrangeBold14(context: context,text: "الشروط والاحكام")),


    ],)),
    actions: [

      new Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [



        FlatButton(
         padding: EdgeInsets.all(10),
          child: textGlobalWhiteBold14(context: context, text:  " لا اوافق"),
          onPressed: () => Navigator.pop(context),
          color: offWhite,
        ),

        FlatButton(
          padding: EdgeInsets.all(10),
          child: textGlobalWhiteBold14(context: context, text:  " اوافق    "),
          color: deepOrange,
          onPressed: () {
            final validationService = Provider.of<UserProvider>(
                context, listen: false);
            validationService.counterAlert++;
            Navigator.pop(context);
            navVipEstateServices(context);
          },
        )
      ],)



      ,


    ],
  );

  // show the dialog
  showDialog(

    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
showAlertDialogLogin(BuildContext context) {

  // set up the buttons


  // set up the AlertDialog
  AlertDialog alert = AlertDialog(

    title:Center(child: textGlobalGreyBold16(context:context,text: " يجب عليك تسجيل الدخول")),


    content: Container(height: 50,child:Column(children: [
      new Icon(Icons.error,color: Colors.red,size: 50,),
    ],)),
    actions: [

      new Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [

        FlatButton(
          child: textGlobalWhiteBold14(context: context, text:  "تسجيل الدخول"),
          onPressed: () {
            Navigator.of(context).pop();
            navLogin(context: context);},
          color: blueDark,
        ),
        FlatButton(
            child: textGlobalWhiteBold14(context: context, text:  "عمل حساب"),
            color: deepOrange,
            onPressed: () {        Navigator.of(context).pop();   navSignUp(context: context);}
        )
      ],)



      ,


    ],
  );

  // show the dialog
  showDialog(

    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
