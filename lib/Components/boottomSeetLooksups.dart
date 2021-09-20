import 'package:akarbook/Components/navgaite.dart';
import 'package:akarbook/Models/searchModels.dart';
import 'package:akarbook/WidgetGlobel/globalButton.dart';
import 'package:akarbook/WidgetGlobel/textGlobal.dart';
import 'package:akarbook/color.dart';
import 'package:akarbook/provider/FavProvider.dart';
import 'package:akarbook/provider/PropretyProvider.dart';
import 'package:akarbook/provider/SearchProvider.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
void bottomSheetLooksUpFilter({
required BuildContext context,required String title,required int pos,searchOrNot})
{
  showModalBottomSheet(
    //   barrierColor: Colors.grey.withOpacity(0.7),
       backgroundColor: Colors.transparent,
    context: context,
    barrierColor: Colors.grey.withOpacity(0.2),
    builder: (BuildContext context) {
      final validationService = Provider.of<SearchProvider>(
          context, listen: false);
      return StatefulBuilder(
          builder: (context, setState) {
            if(validationService.searchState.hasData==true) {
              return Directionality(
                  textDirection: TextDirection.ltr,
                  child: Container(
                      height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25)),
                    //height: 500,
                    child: Column(
                        children: [
                          new SizedBox(height: 20,),
                          textGlobalGreyBold13(context: context,text: title ),
                          new SizedBox(height: 10,),
                          Expanded(
                            child: new ListView.builder(
                                shrinkWrap: true,
                                itemCount: validationService.searchState.data!.length,
                                itemBuilder: (context, i) {
                                return globalButtonBLueDark(title:
                                validationService.searchState.data![i].name,callback:(){
                                  final validationService2 = Provider.of<PropertyProvider>(
                                      context, listen: false);
                                  switch( pos){
                                    case 0:
                                      SearchModel.status=validationService.searchState.data![i].name;
                                      SearchModel.typeId=validationService.searchState.data![i].idTerms;
                                      SearchModel.statusTitle=validationService.searchState.data![i].name;
                                      break;
                                    case 1:
                                      SearchModel.country=validationService.searchState.data![i].name;
                                      SearchModel.countryTitle=validationService.searchState.data![i].name;
                                      SearchModel.countryId=validationService.searchState.data![i].idTerms;
                                      break;
                                    case 2:
                                      SearchModel.state=validationService.searchState.data![i].name;
                                      SearchModel.stateTitle=validationService.searchState.data![i].name;
                                      SearchModel.stateId=validationService.searchState.data![i].idTerms;
                                      break;
                                    case 3:
                                      SearchModel.city= validationService.searchState.data![i].name;
                                      SearchModel.cityTitle= validationService.searchState.data![i].name;
                                      print(validationService.searchState.data![i].idTerms);
                                      SearchModel.cityId= validationService.searchState.data![i].idTerms;
                                      break;
                                    case 4:
                                      SearchModel.numberOfRooms=validationService.searchState.data![i].name;
                                      break;
                                    case 5:
                                      SearchModel.typeId=validationService.searchState.data![i].idTerms;                                     validationService2.paged=1;
                                      validationService2.onLoadMore.clear();
                                      validationService2.title=validationService.searchState.data![i].name;
                                     if(searchOrNot==false){
                                      validationService2.getDefine(agency: "",typeId:SearchModel.typeId,text: "",status: "",type: "",cityId: "",countryId: "",endPrice: "",orderByDate: "",orderByPrice: "",startPrice: "",stateId: "");
                                      }else{
                                       validationService2.getDefine(agency: "",typeId:SearchModel.typeId,text: SearchModel.keyWord,status: SearchModel.type,type: SearchModel.typeId,cityId: SearchModel.cityId,countryId: SearchModel.countryId,endPrice: SearchModel.rangEnd,orderByDate: "",orderByPrice: "",startPrice: SearchModel.rangStart,stateId: SearchModel.stateId);
                                     }
                                      validationService2.getPropertyList();
                                     break;
                                    case 7:
                                      validationService2.onLoadMore.clear();
                                     switch(validationService.searchState.data![i].idTerms){
                                       case "1":

                                         if(SearchModel.typeOrderDate==desc){
                                           SearchModel.orderByDate=asc;
                                           SearchModel.typeOrderDate=asc;
                                         }else {
                                           SearchModel.orderByDate = desc;
                                           SearchModel.typeOrderDate=desc;
                                         }
                                         SearchModel.orderByPrice="";
                                         SearchModel.orderByFeature="";
                                         break;
                                       case "2":
                                         if(SearchModel.typeOrderPrice==desc){
                                           SearchModel.orderByPrice=asc;
                                           SearchModel.typeOrderPrice=asc;
                                         }else {
                                           SearchModel.orderByPrice = desc;
                                           SearchModel.typeOrderPrice=desc;
                                         }
                                         SearchModel.orderByDate="";
                                         SearchModel.orderByFeature="";
                                         break;
                                       case "3":
                                         if(SearchModel.orderByFeature==desc) {
                                           SearchModel.orderByFeature = asc;
                                           SearchModel.typeOrderFeature = asc;
                                         }else{
                                           SearchModel.orderByFeature = desc;
                                           SearchModel.typeOrderFeature = desc;
                                         }
                                         SearchModel.orderByDate="";
                                         SearchModel.orderByPrice="";
                                         break;

                                     }
                                      validationService2.paged=1;
                                      validationService2.onLoadMore.clear();
                                      validationService2.getPropertyList();
                                  }

                                  validationService.notifyListeners();
                                  validationService2.notifyListeners();
                                  Navigator.of(context).pop();
                                });
                                }),
                          )

                        ]),


                  )
              );
            }   else{
              return Text("data");
            }
          });
    },
  );
}