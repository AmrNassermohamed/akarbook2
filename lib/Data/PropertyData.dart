import 'package:akarbook/Models/HomePageModel.dart';
import 'package:akarbook/Models/ProprtyDetailsModel.dart';
import 'package:akarbook/Models/searchModels.dart';
import 'package:akarbook/services/services_handler.dart';

import '../constants.dart';
class PropertyData{

  getPropertyStatusData({limit,propertyStatus,paged}) async {
    List <Property>propertyData=[];
    SearchModel.orderByDate="DESC";
    SearchModel.orderByPrice="DESC";
    SearchModel.orderByFeature=desc;
   var response= await ServicesHandler().getService(ex: true,urlSuffix:"get_property.php?limit=${limit.toString()}&"
       "paged=${paged.toString()}&property_status=${propertyStatus.toString()}&orderby_date=${SearchModel.orderByDate}&orderby_price=${SearchModel.orderByPrice}&orderby_feature=${SearchModel.orderByFeature}" );
   response["data"].forEach((v) {
     Property homePageModel=Property.fromJson(v);
     propertyData.add(homePageModel);
   });
   print(propertyData[0].agent);
return propertyData;

  }




  getPropertyList({limit,define,paged}) async {
    List <Property>propertyData=[];
    var response= await ServicesHandler().
    getService(ex: true,urlSuffix:"get_property.php?limit=${limit.toString()}&paged="
        "${paged.toString()}&${define.toString()}&orderby_date=${SearchModel.orderByDate}&orderby_price=${SearchModel.orderByPrice}&orderby_feature=${SearchModel.orderByFeature}" );
    response["data"].forEach((v) {
      Property homePageModel=Property.fromJson(v);
      propertyData.add(homePageModel);
    });
    return propertyData;
  }


  getPropertyDetails({id}) async {
    var response= await ServicesHandler().getService(ex: true,urlSuffix:"property_details.php?property_id=${id.toString()}" );

    PropertyDetailsModel propertyDetailsModel=PropertyDetailsModel.fromJson(response["data"]);
    return propertyDetailsModel;
  }


}