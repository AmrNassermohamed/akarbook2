class FavModels {
  late String name;
  late int id;
  late String image;
  late String price;

  late String agentName;
  FavModels({required this.image,required this.name,required this.id,required this.agentName,required this.price});

  factory FavModels.fromJson(Map<String, dynamic> json){

    return FavModels(image: json["attachment_url"].toString() ,
        name: json["title"]
        , id: json["property_id"], agentName: json["agent"], price:json["price"].toString());
  }

}