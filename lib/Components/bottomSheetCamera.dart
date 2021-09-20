
import 'package:akarbook/WidgetGlobel/textGlobal.dart';
import 'package:akarbook/color.dart';
import 'package:akarbook/provider/PropretyProvider.dart';
import 'package:akarbook/provider/SearchProvider.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

bottomSheetGlobal({required BuildContext context,required Widget body,required height}) {
  showModalBottomSheet(

      isScrollControlled: true,
      context: context,
      elevation: 0,
      barrierColor: Colors.black.withAlpha(1),
      backgroundColor: Colors.transparent,
      builder: (context) =>
          Container(
              height:height,

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:BorderRadius.all(Radius.circular(25.0)) ,
              ),
              child: Center(
                child: SingleChildScrollView(
                  child:body
                ),
              )
          ));

}


buttonAddImage(BuildContext context,icon,text){

return  Padding(
    padding: EdgeInsets.all(10),
    child: Container(color: blueDark,child: Padding(
      padding: EdgeInsets.all(10),
      child: new Row(mainAxisAlignment: MainAxisAlignment.center,children: [
        new Icon(icon,size: 24,color: Colors.white,),
        textGlobalWhiteBold14(context: context,text: text),
      ],),
    ),),
  );
}

Widget addCamera( {required BuildContext context,required bool mainImage}){

  final validationService = Provider.of<SearchProvider>(
      context, listen: false);
 return Column(
      children: [
        GestureDetector( onTap: (){
          validationService.uploadImage(true, mainImage);
        },child:  buttonAddImage(context,Icons.camera,"اضافه عبر الكاميرا"), ),
        GestureDetector(onTap: (){
          validationService.uploadImage(false, mainImage);
        },child:buttonAddImage(context,Icons.filter,"اضافه من الاستديو")),
      ]);
}
Widget editImageOrDelete({required BuildContext context,required index}){
final validationService = Provider.of<SearchProvider>(
context, listen: false);
return Column(
children: [
GestureDetector( onTap: (){

},child:  buttonAddImage(context,Icons.menu,"جعل هذه صوره رئيسيه"), ),
GestureDetector(onTap: (){

},child:buttonAddImage(context,Icons.delete,"مسح الصوره")),
]);

}


