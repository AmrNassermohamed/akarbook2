import 'package:flutter/cupertino.dart';
class Property{
 late  String title;
 late  String price;
 late  String agent;
 late String  attachmentUrl;
 late int id;
 late String propertyState;
 late String propertyType;
 late String propertyCity;
 late String long;
 late String country;
 late List gallery;
 late String lat;
 late String distance;
 late String avaiable_featured_property;
 late String realEstatePropertyAgent;

  Property({required this.avaiable_featured_property,required this.gallery,required this.country,required this.propertyState,required this.propertyType,required this.propertyCity,required this.realEstatePropertyAgent,required this.lat,required this.distance,required this.long,required this.id,required this.title,required this.price,required this.agent,required  this.attachmentUrl});
 factory Property.fromJson(Map<String, dynamic> json){
    return Property( long:json["long"],
        lat: json["lat"],
        gallery: json["gallery"],
        avaiable_featured_property: json["avaiable_featured_property"].toString(),
        country: json["country"],
        propertyCity: json["property_city"],
        propertyType: json["property_type"],
        propertyState: json["property_state"],
        realEstatePropertyAgent: json["real_estate_property_agent"],
        distance:json["distance"].toString() ,id: json["property_id"],title: json["title"], price: json["price"].toString(), agent:json[ "agent"],attachmentUrl:json["attachment_url"]);
 }


}
