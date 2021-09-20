import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../color.dart';
Widget textGlobal({text,required BuildContext context,double? fontSize,required Color color,required bool bold ,lines }){
  return  new AutoSizeText(text
      , style: GoogleFonts.cairo(
        color: color,
        fontWeight: bold==true? FontWeight.bold:FontWeight.normal,
        fontSize: fontSize,


      ),maxLines:lines==null? 1:lines
    ,
  );
}







textGlobalWhiteBold20({required BuildContext context,text}){
  return textGlobal(text:text ,context: context,fontSize: 20.0,color:Colors.white,bold: true);
}
textGlobalWhiteBold24({required BuildContext context,text}){
  return textGlobal(text:text ,context: context,fontSize: 20.0,color:Colors.yellow,bold: true);
}
textGlobalDarkBlueBold20({required BuildContext context,text}){
  return textGlobal(text:text ,context: context,fontSize: 20.0,color:blueDark,bold: true);
}

textGlobalOrangeBold14({required BuildContext context,text}){
  return textGlobal(text:text ,context: context,fontSize: 14.0,color:Colors.orange.shade700,bold: true);
}
textGlobalNormal14({required BuildContext context,text}){
  return textGlobal(text:text ,context: context,fontSize: 14.0,color:Colors.orange.shade700,bold: false);
}
textGlobalWhiteBold14({required BuildContext context,text}){
  return textGlobal(text:text ,context: context,fontSize: 14.0,color:Colors.white,bold: true);
}
textGlobalBlackBold14({required BuildContext context,text}){
  return textGlobal(text:text ,context: context,fontSize: 14.0,color:Colors.black,bold: true);
}
textGlobalWhiteBold12({required BuildContext context,text}){
  return textGlobal(text:text ,context: context,fontSize: 12.0,color:Colors.white,bold: true);
}
textGlobalOrangeBold17({required BuildContext context,text}){
  return textGlobal(text:text ,context: context,fontSize: 17.0,color:Colors.deepOrange,bold: true);
}
textGlobalOrangeBold20({required BuildContext context,text}){
  return textGlobal(text:text ,context: context,fontSize: 20.0,color:Colors.deepOrange,bold: true);
}

textGlobalBlackBold25({required BuildContext context,text}){
  return textGlobal(text:text ,context: context,fontSize: 25.0,color:blueDark,bold: true);
}
textGlobalBlackBold16({required BuildContext context,text}){
  return textGlobal(text:text ,context: context,fontSize: 16.0,color:blueDark,bold: true);
}
textGlobalGreyBold16({required BuildContext context,text}){
  return textGlobal(text:text ,context: context,fontSize: 16.0,color:Colors.grey,bold: true);
}
textGlobalBlack12Bold16({required BuildContext context,text}){
  return textGlobal(text:text ,context: context,fontSize: 16.0,color:Colors.black45,bold: true);
}

textGlobalGreyBold13({required BuildContext context,text}){
  return textGlobal(text:text ,context: context,fontSize: 13.0,color:Colors.grey,bold: true);
}
textGlobalGreyBold8({required BuildContext context,text}){
  return textGlobal(text:text ,context: context,fontSize: 7.0,color:Colors.grey,bold: true);
}
textGlobalGreyBold13Lines({required BuildContext context,text}){
  return textGlobal(text:text ,context: context,fontSize: 13.0,color:Colors.grey,bold: true,lines: 2);
}
textGlobalBlackBold13Lines({required BuildContext context,text}){
  return textGlobal(text:text ,context: context,fontSize: 13.0,color:Colors.black,bold: true,lines: 4);
}
textGlobalGreyNormal13({required BuildContext context,text}){
  return textGlobal(text:text ,context: context,fontSize: 13.0,color:Colors.grey,bold: false);
}
textGlobalGreyNormal13Lines({required BuildContext context,text}){
  return textGlobal(text:text ,context: context,fontSize: 13.0,color:Colors.grey,bold: false,lines: 35);
}

textGlobalGreyNormalLines13({required BuildContext context,text}){
  return textGlobal(text:text ,context: context,fontSize: 13.0,color:Colors.grey,bold: false,lines: 3);
}
textGlobalBlackBold13({required BuildContext context,text}){
  return textGlobal(text:text ,context: context,fontSize: 13.0,color:Colors.black,bold: true);
}
textGlobalBlackBold10({required BuildContext context,text}){
  return textGlobal(text:text ,context: context,fontSize: 10.0,color:blueDark,bold: true);
}
textGlobalBlackNormal16({required BuildContext context,text}){
  return textGlobal(text:text ,context: context,fontSize: 16.0,color:blueDark,bold: false);
}
textGlobalBlackNormal13({required BuildContext context,text}){
  return textGlobal(text:text ,context: context,fontSize: 13.0,color:blueDark,bold: false);
}
textGlobalWhiteNormal16({required BuildContext context,text}){
  return textGlobal(text:text ,context: context,fontSize: 16.0,color:Colors.white,bold: false);
}

textGlobalBlackBold35({required BuildContext context,text}){
  return textGlobal(text:text ,context: context,fontSize: 35.0,color:blueDark,bold: true);
}


