import 'dart:io';

import 'package:akarbook/Data/PropertyData.dart';
import 'package:akarbook/Models/HomePageModel.dart';
import 'package:akarbook/Models/ProprtyDetailsModel.dart';
import 'package:akarbook/Models/ProviderGeneralState.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';
class PropertyProvider extends ChangeNotifier{
  late ProviderGeneralState<List<Property>> getPropertyListHome;
  late ProviderGeneralState<List<Property>> getListPropertyState;
  late ProviderGeneralState<PropertyDetailsModel> getPropertyDetailsState;
  PropertyData propertyData=new PropertyData();
  String define="";
  String title="";
  bool loadMore=false;
  late List<Property>onLoadMore=[];
  getPropertyStatus({index}) async {
    List<Property> property;
    setWaiting(0);
    switch(index){
     case 1:
       property=await propertyData.getPropertyStatusData(limit: 10,paged: 1,propertyStatus: "للبيع");
       getPropertyListHome=ProviderGeneralState(data: property, hasData: true);
       notifyListeners();
       break;
     case 2:
      property=await propertyData.getPropertyStatusData(limit: 10,paged: 1,propertyStatus: "للإستثمار");
      getPropertyListHome=ProviderGeneralState(data: property, hasData: true);
      notifyListeners();
      break;
     case 0:
       property=await propertyData.getPropertyStatusData(limit: 10,paged: 1,propertyStatus: "للإيجار");
       getPropertyListHome=ProviderGeneralState(data: property, hasData: true);
       notifyListeners();
       break;
   }
    //notifyListeners();
  }

   int paged=1;
   int indexButton=1;
   changeIndexButton(index){
     indexButton=index;
     notifyListeners();
   }



  Future<void> openMap(address) async {
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=${address}';
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }

  getPropertyListMap({required define}) async{
    List<Property> property;
    property=await propertyData.getPropertyList(limit: 10,paged: paged,define: define);


}


  getPropertyList() async {
    if (paged == 1) {
      setWaiting(3);
    }
    if (paged > 1) {
      if (getListPropertyState.data!.length == 0) {
        loadMore = false;
     notifyListeners();
      } else {
        loadMore = true;
notifyListeners();
      } //changeProgress(progress);
    }
    List<Property> property;
    property =
    await propertyData.getPropertyList(limit: 10, paged: paged, define: define);
    getListPropertyState = ProviderGeneralState(data: property, hasData: true);
    if (paged > 1) {
      loadMore = false;
      notifyListeners();
      //  changeProgress(progress);
    }
    if (getListPropertyState.data!.length != 0) {
      paged++;
      onLoadMore.addAll(getListPropertyState.data!);
      print(onLoadMore.length);
      notifyListeners();
    }
  }

  late bool progress=false;

  changeProgress(val) {
    if (val == false) {
      progress = true;
      notifyListeners();
    } else {
      progress = false;
      notifyListeners();
    }
  }



    getPropertyDetails({required id}) async {
    setWaiting(4);
    PropertyDetailsModel propertyDetailsModel=await propertyData.getPropertyDetails(id: id);
    getPropertyDetailsState=ProviderGeneralState(data: propertyDetailsModel, hasData: true);
   getPropertyDetailsState.data!.gallery.add(  getPropertyDetailsState.data!.mainImage);
    notifyListeners();
    }

  void setWaiting(index) {
    switch (index) {
      case 0:
        getPropertyListHome= ProviderGeneralState(waiting: true);
        break;
      case 3:
        getListPropertyState=ProviderGeneralState(waiting: true);
        break;
      case 4:
        getPropertyDetailsState=ProviderGeneralState(waiting: true);
        break;
    }
    }
getDefine({type,status,orderByDate,orderByPrice,typeId,stateId,countryId,cityId,startPrice,endPrice,text,required agency }){
define=  "&property_status=${status}&property_type=${typeId}&"
      "property_state=${stateId}&country=${countryId}&property_city=${cityId}&start_price=${startPrice}&end_price=${endPrice}&keywords=${text.toString()}&agency=${agency.toString()}".replaceAll("\\s","");

  return define;
  }
}



