import 'package:flutter/material.dart';
Widget iconButton({required Function callBack,required Icon icon}){
 return new IconButton(onPressed: (){
   callBack();
 }, icon: icon);
}

iconButtonWhite(Function callBack){

  return iconButton(callBack:(){
    callBack();
  },icon: Icon(Icons.menu,color: Colors.white,));
}


iconButtonFavourite(Function callBack){

  return iconButton(callBack:(){
    callBack();
  },icon: Icon(Icons.favorite_border,color: Colors.orange,));
}


