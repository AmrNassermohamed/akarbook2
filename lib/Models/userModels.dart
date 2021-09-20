class UserModels{
  late String message;
 // late String realEstateAuthorTwitterUrl;
  late String userPinterestUrl;
  late String userVimeoUrl;
  late String   userOfficeAddress;
  late String userLicenses;
  late int id;
  late  String availableProperty;
  late String realEstateAuthorAgentId;
  late String agencyStatus;
  late String real_property_added;
  late String totalFeaturedProperty;
  late String realEstateAuthorSkype;
  late String realEstateAuthorMobileNumber;
  late String realEstateAuthorFaxNumber;
  late String avatarUrl;
  late int package;
  late String email;
  late String  realEstatePackageNumberListings;
  late String name;
  late String totalFeaturedAdded;
  late String role;
  late String token;
  late String firstName;
  late String lastName;
  late String  real_estate_author_twitter_url;
  late String? availableFaeturedProperty;
  UserModels({required this.real_property_added,required this.availableFaeturedProperty,required this.availableProperty,required this.realEstatePackageNumberListings,required this.lastName,required this.firstName,required,required this.totalFeaturedAdded,required this.totalFeaturedProperty,required this.real_estate_author_twitter_url,required this.id,required this.name,required this.token,required this.email
  ,required this.avatarUrl,required this.package,required this.realEstateAuthorAgentId,
    required this.realEstateAuthorFaxNumber,

    required this.realEstateAuthorMobileNumber,
    required this.realEstateAuthorSkype,required this.role,required this.userLicenses,required this.userOfficeAddress,required this.userPinterestUrl,required this.userVimeoUrl
  });

  factory UserModels.fromJson(Map<String, dynamic> json){

    return UserModels(real_property_added:json["total_property_added"].toString(),
availableFaeturedProperty: json["avaiable_faetured_property"].toString(),
availableProperty: json["avaiable_property"],firstName: json["first_name"],lastName: json["last_name"],realEstatePackageNumberListings:json["real_estate_package_number_listings"].toString() ,
        totalFeaturedAdded: json["real_faetured_property_added"].toString(),
        totalFeaturedProperty: json["real_faetured_property_added"].toString(),

        real_estate_author_twitter_url: json["real_estate_author_twitter_url"],
        id: json["ID"],
        name: json["name"],
        token: json["token"],
        email: json["email"],
         avatarUrl: json["avatar_url"],
        package: json["package"],
        realEstateAuthorAgentId: json["real_estate_author_agent_id"].toString(),
        realEstateAuthorFaxNumber: json["real_estate_author_fax_number"],
        realEstateAuthorMobileNumber: json["real_estate_author_mobile_number"],
        realEstateAuthorSkype: json["real_estate_author_skype"],
        role: json["role"], userLicenses: json["user_licenses"],
        userOfficeAddress: json["user_office_address"], userPinterestUrl: json["user_pinterest_url"],
        userVimeoUrl: json["user_vimeo_url"]);
  }
}