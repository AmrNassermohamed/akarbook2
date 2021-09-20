class GetPackage{
  late int packageId;
  late String title;
  late String realEstatePackageVisible;
  late String  realEstatePackageOrderDisplay;
  late String  realEstatePackageNumberFeatured;
  late String  realEstatePackageUnlimitedListing;
  late String  realEstatePackageNumberListings;
  late String realEstatePackageTimeUnit;
  late String  realEstatePackagePeriod;
  late String  realEstatePackageUnlimitedTime;
  late String  realEstatePackageFree;
  late String realEstatePackagePrice;
  GetPackage({required this.packageId,required this.title,required this.realEstatePackageFree,required this.realEstatePackageNumberFeatured,required this.realEstatePackageNumberListings,required this.realEstatePackageOrderDisplay,required this.realEstatePackagePeriod,required this.realEstatePackagePrice,required this.realEstatePackageTimeUnit,required this.realEstatePackageUnlimitedListing,required this.realEstatePackageUnlimitedTime,required this.realEstatePackageVisible});
  factory GetPackage.fromJson(Map<String, dynamic> json){

    return GetPackage(packageId: json["package_id"],title: json["title"],
        realEstatePackageFree: json["real_estate_package_free"],
        realEstatePackageNumberFeatured:json["real_estate_package_number_featured"] ,
        realEstatePackageNumberListings: json["real_estate_package_number_listings"],
        realEstatePackageOrderDisplay: json["real_estate_package_order_display"],
        realEstatePackagePeriod: json["real_estate_package_period"],
        realEstatePackagePrice: json["real_estate_package_price"],
        realEstatePackageTimeUnit: json["real_estate_package_time_unit"],
        realEstatePackageUnlimitedListing: json["real_estate_package_unlimited_listing"],
        realEstatePackageUnlimitedTime: json["real_estate_package_unlimited_time"],
        realEstatePackageVisible: json["real_estate_package_visible"]);
  }

}