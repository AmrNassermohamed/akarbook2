import 'package:akarbook/WidgetGlobel/AppBarGlobal.dart';
import 'package:akarbook/WidgetGlobel/sizedBoxGlobal.dart';
import 'package:akarbook/WidgetGlobel/textGlobal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'NavgaitetoPage.dart';

class RealEStateSerVices extends StatefulWidget{

    // TODO: implement createState
    @override
    RealEStateSerVicesState createState() => RealEStateSerVicesState ();


}


class RealEStateSerVicesState extends State<RealEStateSerVices>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return  SafeArea (child: Scaffold(appBar: appBarGlobal(context: context,text:"خدمات عقاريه"),body: SingleChildScrollView(
     child: Container(
       padding: EdgeInsets.all(10),
       child: Column(children: [

Directionality(textDirection: TextDirection.rtl,child:

               new Row(children: [
                 textGlobalDarkBlueBold20(text:"الخدمات العقارية" ,context: context)
               ],),

),
         new SizedBox(height: 10,),
         Directionality(textDirection: TextDirection.rtl,child: SizedBox(child:
         textGlobalGreyNormal13Lines(text:"في عقار بوك نقدم مجموعة متكاملة من الخدمات  العقارية ، نقدمها لعملائنا الكرام خدمات إضافية مثل خدمات التقييم العقاري ، خدمات التصميم الداخلي وخدمات التصوير" ,context: context),)),
         sizedBoxGlobalHeight10(),
  navImage(context, 5179, 5, "خدمات تقييم عقاري"),
         sizedBoxGlobalHeight10(),
         navImage(context, 5190, 7,"خدمات التصميم الداخلي والديكور"),
         sizedBoxGlobalHeight10(),
         navImage(context, 5184, 8,"خدمات التصوير العقاري"),
           ],
         ),
       ),
   ),
   ),);
  }



}

navImage(BuildContext context,id,number ,title){
 return  GestureDetector(onTap: (){
   nav(context,id,title);
 },child: new Image.asset("assets/${number.toString()}.jpg"));
}
