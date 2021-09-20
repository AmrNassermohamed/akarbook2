
import 'package:akarbook/WidgetGlobel/textGlobal.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:flutter/material.dart';

  bottomSheetAgent(BuildContext context) {
    showModalBottomSheet(

        isScrollControlled: true,
        context: context,
        elevation: 0,
        barrierColor: Colors.black.withAlpha(1),
        backgroundColor: Colors.transparent,
        builder: (context) =>
            Container(
                height: MediaQuery.of(context).size.height*.45,

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:BorderRadius.all(Radius.circular(25.0)) ,
                ),
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                        children: [

                          new Padding(padding: EdgeInsets.all(10)),
                          // new SizedBox(height: 10,),
                          new Image.asset("assets/UserServices${1.toString()}.png"),
                          new SizedBox(height: 20,),
                         textGlobalBlackBold13(context: context,text: " لقد تم ارسال طلبك بالنجاج بانتظارالموافقه "),

                        ]),
                  ),
                )
            ));

  }




