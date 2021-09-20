import 'package:flutter/foundation.dart';

class PageModel{
late String title;
late String image;
late String content;
PageModel({required this.title, required this.image,required this.content});

factory PageModel.fromJson(Map<String, dynamic> json){
  return PageModel(title: json["title"]["rendered"], image:json["better_featured_image"]["source_url"].toString(),
      content: json["content"]["rendered"]);
}




}