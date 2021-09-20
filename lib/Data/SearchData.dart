import 'dart:io';

import 'package:akarbook/Models/Looksups.dart';
import 'package:akarbook/screens/sharedprefence.dart';
import 'package:akarbook/services/services_handler.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class SearchData{
  getLooksUpsData({urlSuffix}) async {
    try {
      List <LooksUps> listLookUps = [];
      var response = await ServicesHandler().getService(
          ex: true,
          urlSuffix: urlSuffix);
      response["data"].forEach((v) {
        LooksUps looksUpsModel = LooksUps.fromJson(v);
        listLookUps.add(looksUpsModel);
      });
      return listLookUps;
    }catch(Ex){
      throw Ex;
    }
  }

  getCountry() async {
    try {
      List<LooksUps> country = [];
      var response = await ServicesHandler().getService(ex: true,
          urlSuffix: "get_country.php");
      response.forEach((k, v) =>
          country.add(new LooksUps(name: v, idTerms: k)));
      return country;
    }catch(Ex){
      throw Ex;
    }
  }

  addProperty({required title,price,propertyType,propertyState,propertyStatus,featured,required List<File> gallery,
    propertyAddress,propertyFeatures,propertyCity,realEstatePropertyCountry,real_estate_property_identity}) async {
    String?
    token=await SharedPreferenceHandler.getToken();
    print("///////////////////////////////////////");
    print(propertyFeatures);
    /*var response = await ServicesHandler().postService(
        urlSuffix: "add_edit_property.php",requestBody: {

      "title": title,
      "property_type":propertyType,
      "real_estate_property_price":price,
      "property_status": propertyStatus.toString(),
      "real_estate_property_address": propertyAddress.toString(),
      "real_estate_property_featured": propertyFeatures.toString(),
      "property_city": propertyCity.toString(),
      "property_state": propertyState.toString(),
    //  "gallery[]": gallery,
      "featured": featured,
      "real_estate_property_country": realEstatePropertyCountry,
    } ,headers: {
      'Authorization': 'Bearer $token'
    });*/

    print(12);

    List fileList=[];
    for(int i=0;i<gallery.length;i++){
      final file =
      await MultipartFile.fromFile(gallery[i].path);
      fileList.add(file);
    }

    print("///////////type//////////////////////////////");
print(propertyType);
print("///////////////////state/////////////////////////////");
    print(propertyState);
    print("////////////////////city///////////////////////");
    print(propertyCity);


if(featured!=null) {
  final file =
  await MultipartFile.fromFile(featured.path);
  final response = await ServicesHandler().uploadFileAsFormData(
      file: featured, url: "add_edit_property.php", map: {
    "title": title,
    "real_estate_property_identity": real_estate_property_identity,
    "real_estate_property_price": price,
    "property_type": propertyType,
    "property_status": propertyStatus.toString(),
    "real_estate_property_address": propertyAddress.toString(),
    "real_estate_property_featured": propertyFeatures.toString(),
    "property_city": propertyCity.toString(),
    "property_state": propertyState.toString(),
    "gallery[]": fileList,
    "featured": file,
    "real_estate_property_country": realEstatePropertyCountry,
  });
  return response;
}else{
  final response = await ServicesHandler().uploadFileAsFormData(
      file: featured, url: "add_edit_property.php", map: {
      "title": title,
      "real_estate_property_identity": real_estate_property_identity,
      "real_estate_property_price": price,
      "property_type": propertyType,
      "property_status": propertyStatus.toString(),
      "real_estate_property_address": propertyAddress.toString(),
      "real_estate_property_featured": propertyFeatures.toString(),
      "property_city": propertyCity.toString(),
      "property_state": propertyState.toString(),
      "gallery[]": fileList,
      "real_estate_property_country": realEstatePropertyCountry,
      });
  return response;
}

  }


  editProperty({required title,price,real_estate_property_identity,required idProperty,propertyType,propertyState,propertyStatus,required File featured,gallery,propertyAddress,propertyFeatures,propertyCity,realEstatePropertyCountry}) async {
    String?
    token=await SharedPreferenceHandler.getToken();

  /*  var response = await ServicesHandler().postService(
        urlSuffix: "add_edit_property.php",requestBody: {
      "property_id":idProperty.toString(),
      "title": title,
      "real_estate_property_price":price,
      "property_type":propertyType,
      "property_status": propertyStatus.toString(),
      "real_estate_property_address": propertyAddress.toString(),
      "real_estate_property_featured": propertyFeatures.toString(),
      "property_city": propertyCity.toString(),
      "property_state": propertyState.toString(),
  //    "gallery": gallery,
      "featured": featured,
      "real_estate_property_country": realEstatePropertyCountry,

    },headers: {
      'Authorization': 'Bearer $token'
    });*/

   //await ServicesHandler().multipartRequest(url: "add_edit_property.php", method: "POST", fileKey: "featured",file: featured);

    List fileList=[];
    for(int i=0;i<gallery.length;i++){
      final file =
      await MultipartFile.fromFile(gallery[i].path);
      fileList.add(file);
    }

    final file =
    await MultipartFile.fromFile( featured.path);
final response=    await ServicesHandler().uploadFileAsFormData(file: featured,url: "add_edit_property.php",map:{
      "property_id":idProperty.toString(),
      "title": title,
      "real_estate_property_price":price,
      "property_type":propertyType,
      "real_estate_property_identity":real_estate_property_identity,
      "property_status": propertyStatus.toString(),
      "real_estate_property_address": propertyAddress.toString(),
      "real_estate_property_featured": propertyFeatures.toString(),
      "property_city": propertyCity.toString(),
      "property_state": propertyState.toString(),
      "gallery[]": fileList,
      //    "gallery": gallery,
      "featured": file,
      "real_estate_property_country": realEstatePropertyCountry,
    } );
return response;
  }

}