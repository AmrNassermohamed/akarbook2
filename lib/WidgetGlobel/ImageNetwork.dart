import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


imageNetwork({required BuildContext context,path,height,width}){
 return CachedNetworkImage(
   //color: Colors.white,

   imageUrl: path,
    placeholder: (context, url) => CircleAvatar(
      backgroundColor: Colors.white,
      child: CircularProgressIndicator(
color: Colors.orange,
strokeWidth: 10,
      ),
    ),
    errorWidget: (context, url, error) => Icon(Icons.error,size: 20,),
    fit: BoxFit.fill,
    width: width,
  );
 //return new SizedBox(height: 200,width: MediaQuery.of(context).size.width,child: new Image.network
  // (provider.getListPropertyState.data![index].attachmentUrl,width: 200,fit: BoxFit.fill,));
}

imageProfile({required BuildContext context,path,height,width}){
  return CachedNetworkImage(
    //color: Colors.white,

    imageUrl: path,
    placeholder: (context, url) => CircleAvatar(
      backgroundColor: Colors.white,
      child: CircularProgressIndicator(
        color: Colors.orange,
        strokeWidth: 10,
      ),
    ),
    errorWidget: (context, url, error) =>new CircleAvatar(child: new Icon(Icons.person),),
    fit: BoxFit.fill,
    width: width,
  );
}


Widget imageSizedBox200({required BuildContext context,path}){
  return new SizedBox(height: 200,width: MediaQuery.of(context).size.width,child:imageNetwork(context: context,height: 200,width: 200,path: path));
}
