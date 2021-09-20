class PropertyDetailsModel {
  late String price;
  late List gallery;
  late String ?bedrooms;
  late String title;
  late String ?bathrooms;
  late String ?identity;
  late String id;
  late String ?agent;
  late String propertyType;
  late String propertyCity;
  late String propertyState;
  late String propertyStatus;
  late String country;
  late String ? address;
  late var mainImage;
  late String realEstatePropertyAgent;
  late String long;
  late String real_estate_property_land;
  late String lat;
  late String real_estate_property_size;
 /// late String realEstateAdditionalFeature;
  late String avaiable_featured_property;

  late String ?distance;
  PropertyDetailsModel(
      {required this.real_estate_property_size,required this.real_estate_property_land,required this.avaiable_featured_property,required this.realEstatePropertyAgent,required this.lat,required this.distance,required this.long,required this.address,required this.mainImage,required this.propertyStatus,required this.agent, required this.price, required this.title, required this.propertyType, required this.id, required this.country, required this.bathrooms, required this.bedrooms, required this.gallery, required this.identity, required this.propertyCity, required this.propertyState});

  factory PropertyDetailsModel.fromJson(Map<String, dynamic> json){
    return PropertyDetailsModel(title: json ["title"],
        real_estate_property_size: json["real_estate_property_size"],
        real_estate_property_land: json["real_estate_property_land"],
      //  realEstateAdditionalFeature:json["real_estate_additional_feature"]["للتواصل:"],
        realEstatePropertyAgent: json["real_estate_property_agent"],
        propertyStatus: json["property_status"],
        id: json["real_estate_property_identity"],
        agent: json["agent"],
        long:json["long"],
        avaiable_featured_property: json["avaiable_featured_property"].toString(),
        lat: json["lat"],
        distance:json["distance"].toString() ,
        price: json["price"]!=null?json["price"]:"",
        address:json["real_estate_property_address"],
        bathrooms: json["real_estate_property_bathrooms"],
        bedrooms: json["real_estate_property_bedrooms"],
        country: json["country"],
        mainImage:json["attachment_url"],
        gallery: json["gallery"],
        identity: json["property_id"].toString(),
        propertyCity: json["property_city"],
        propertyState: json["property_state"],
        propertyType: json["property_type"]
    );
  }
}
