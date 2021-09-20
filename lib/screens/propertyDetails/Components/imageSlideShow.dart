import 'package:akarbook/WidgetGlobel/sizedBoxGlobal.dart';
import 'package:akarbook/WidgetGlobel/textGlobal.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

import 'package:provider/provider.dart';

import '../../../color.dart';

Widget imageShow({required List image,required bool network,required feature}){
          var amber;
          return  ImageSlideshow
            (
            width: double.infinity,
            height: 200,
            initialPage: 0,
            indicatorColor: amber,
            indicatorBackgroundColor: Colors.white,
            onPageChanged: (value) {
              debugPrint('Page changed: $value');
            },

            isLoop: true,
            children: [
              for(int i=0;i<image.length;i++)
             network==true?  CachedNetworkImage(
               imageUrl: image[i].toString(),
               imageBuilder: (context,image)=>Container(width: 200,  decoration: BoxDecoration(

                 image: DecorationImage(
                     image: image, fit: BoxFit.fitWidth),
               ),
                 child: new Column(children: [
                   sizedBoxGlobalHeight20(),
                   feature==1.toString()?            Row(
                       textDirection: TextDirection.rtl,
                       children:[ new Container(decoration: BoxDecoration(color: Colors.deepOrange,borderRadius: BorderRadius.all(Radius.circular(5.0)) ),child:Padding(padding: EdgeInsets.only(right: 30,left: 30)
                         ,child:textGlobalWhiteBold14(context: context,text: "مميز",),)),
                       ]):SizedBox()

                 ],),)


               ,
               placeholder: (context, url) => CircleAvatar(
                 backgroundColor: Colors.white,
                 child: CircularProgressIndicator(
                   color: Colors.orange,
                   strokeWidth: 10,
                 ),
               ),
               errorWidget: (context, url, error) => Icon(Icons.error),
               fit: BoxFit.fill,
               width: 200,
             ):Image.file(image[i],fit: BoxFit.cover,),
            ],
          );






}