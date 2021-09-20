
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:akarbook/Data/SearchData.dart';
import 'package:akarbook/Models/Looksups.dart';
import 'package:akarbook/Models/ProviderGeneralState.dart';
import 'package:akarbook/Models/searchModels.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'package:akarbook/screens/sharedprefence.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:shared_preferences/shared_preferences.dart';
import '../constants.dart';
class SearchProvider extends ChangeNotifier
{
  late ProviderGeneralState<List<LooksUps>> searchState;
  SearchData searchData=new SearchData();
  bool progress=false;
  getLooksUps({urlSuffix,index}) async {
    try {
      setWaiting(0);
  progress=true;
  SearchModel.progress=true;
  notifyListeners();
      List <LooksUps> looksUps;
  switch(index) {
    case 1:
     looksUps = await searchData.getCountry();
      break;
    case 4:
      looksUps=[];
      for(int i=0;i<10;i++){
      looksUps.add(new LooksUps(name: i.toString(),idTerms: i.toString()));
      }
      break;
    case 5:
      looksUps=[];
      looksUps.add(new LooksUps(name: "التاريخ", idTerms: 1.toString()));
      looksUps.add(new LooksUps(name: "السعر", idTerms: 2.toString()));
      looksUps.add(new LooksUps(name: "العقارات المميزه", idTerms: 3.toString()));
break;
    default:
       looksUps= await searchData.getLooksUpsData(
          urlSuffix:urlSuffix );
      break;


  }

      searchState =
          ProviderGeneralState(data: looksUps, hasData: true);
      progress=false;
      SearchModel.progress=false;
      notifyListeners();
    } catch (ex) {
      SearchModel.progress=false;
      notifyListeners();
      searchState =
          ProviderGeneralState(hasError: true);
notifyListeners();
      throw ex;
    }
  }
  File? mainImage;
  List <File>   gallery=[];
var imageFile;
  Future  uploadImage(bool cameraORGallery,bool addGallery) async {
    final picker = ImagePicker();
    ImagePicker _picker = ImagePicker();
    final PickedFile? file = await _picker.getImage(
        source: cameraORGallery == true ? ImageSource.camera : ImageSource.gallery,
        imageQuality: 50);

    imageFile=file;
    File tmpFile = File(file!.path);
    print("kmwfemmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm");
    print(path.basename(file.path));
    print(file.path);
    if(tmpFile!=null) {
      if (addGallery == true) {
        gallery.add(tmpFile);
      } else {
        mainImage = tmpFile;
      }

    }
    notifyListeners();
  }

  Future<File> fileFromImageUrl( gallery) async {


    final response = await http.get(gallery);

    final documentDirectory = await getApplicationDocumentsDirectory();

    final file = File(join(documentDirectory.path, 'imagetest.png'));

    file.writeAsBytesSync(response.bodyBytes);
    return file;
  }

  late int realEstateFeatured=0;
  changeFeatured(total) {
    if (total != 0.toString()){
      if (realEstateFeatured == 0) {
        realEstateFeatured = 1;
        notifyListeners();
      } else {
        realEstateFeatured = 0;
        notifyListeners();
      }
  }else{
      realEstateFeatured=0;
      notifyListeners();
    }
  }

  getCountry() async {
    try {
      setWaiting(0);
      progress=true;
      notifyListeners();
      List <LooksUps> looksUps= await searchData.getCountry();
      searchState =
          ProviderGeneralState(data: looksUps, hasData: true);
      progress=false;
      notifyListeners();
    } catch (ex) {
      throw ex;
    }
  }

  void setWaiting(index) {
    switch (index) {
      case 0:
        searchState = ProviderGeneralState(waiting: true);
        break;
    }
  }
  addProperty({required realStateIdentiy,required title,propertyType,price,propertyState,propertyStatus,featured,gallery,propertyAddress,propertyFeatures,propertyCity,realEstatePropertyCountry}) async {

     progress=true;
     notifyListeners();
  final response  = await searchData.addProperty(title: title,
         propertyType: propertyType,
         propertyState: propertyState,
         real_estate_property_identity: realStateIdentiy,
         gallery: gallery,
price:price ,
         propertyStatus: propertyStatus,
         featured: featured,
         propertyAddress: propertyAddress,
         propertyCity: propertyCity,
         propertyFeatures: propertyFeatures,
         realEstatePropertyCountry: realEstatePropertyCountry);
  progress=false;
  notifyListeners();
return response;
   }
   editProperty({required realStateIdentiy,required title,price,propertyId,propertyType,propertyState,propertyStatus,featured,gallery,propertyAddress,propertyFeatures,propertyCity,realEstatePropertyCountry}) async {

       progress=true;
       notifyListeners();
    final response  = await searchData.editProperty(title: title,
           idProperty: propertyId,
           real_estate_property_identity: realStateIdentiy,
           propertyType: propertyType,
           propertyState: propertyState,
           gallery: gallery,
           price:price,
           propertyStatus: propertyStatus,
           featured: featured,
           propertyAddress: propertyAddress,
           propertyCity: propertyCity,
           propertyFeatures: propertyFeatures,
           realEstatePropertyCountry: realEstatePropertyCountry);
       progress=false;
       notifyListeners();
return response;
   }

}