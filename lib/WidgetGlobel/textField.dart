import 'package:akarbook/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget textField({hintText,icon,controller}){

  return  TextField(
    controller: controller,
    textAlign: TextAlign.right,
    textDirection: TextDirection.rtl,
    decoration: InputDecoration(
      border: new OutlineInputBorder(
        borderRadius: new BorderRadius.circular(10.0),
        borderSide: new BorderSide(color: Colors.grey),
      ),
      //prefixIcon:Icon( Icons.search),
      hintText: hintText,
      hintTextDirection: TextDirection.rtl,
      fillColor: Colors.white,
      hintStyle:GoogleFonts.tajawal(
        color: Colors.grey[500],
        fontSize: 12.0,
      ),

      prefixIcon:IconButton(
        padding: EdgeInsets.only(left: 10),
        icon: Icon(icon,size: 18,),
        onPressed: () => print("clear"),
      ),
      contentPadding: EdgeInsets.all(20),
      focusedBorder:OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black, width: 2.0),
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
  );
}

Widget textFieldReg({text,controller,icon, enable}){
  return Padding(
    padding:EdgeInsets.all(5.0),
    child: TextField(
    enabled: enable,
      textAlign: TextAlign.right,
      autocorrect: true,
      cursorColor: offWhite,
      autofocus: false,
      controller: controller,
      decoration: new InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: offWhite, width: 2.0),
        ),
        border:  UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 2.0),
        ),
        hintStyle:GoogleFonts.tajawal(
          color: Colors.grey[500],
          fontSize: 12.0,
        ),

        prefixIcon:IconButton(
          padding: EdgeInsets.only(left: 10),
          icon: Icon(icon,size: 18,),
          onPressed: () => print("clear"),
        ),


        disabledBorder: InputBorder.none,
        hoverColor: offWhite,
        fillColor: offWhite,
        focusColor: offWhite,
        hintText: text,
      ),

    ),
  );



}