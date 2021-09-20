class LooksUps{
  late String
  idTerms;
  late String name;
  LooksUps({required this.name,required this.idTerms});
  factory LooksUps.fromJson(Map<String, dynamic> json){
    return LooksUps(name:json["name"] , idTerms: json["term__id"].toString());
  }
}