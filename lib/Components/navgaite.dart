import 'package:akarbook/WidgetGlobel/alertDialoug.dart';
import 'package:akarbook/provider/PropretyProvider.dart';
import 'package:akarbook/provider/UserProvider.dart';
import 'package:akarbook/screens/Bills/index.dart';
import 'package:akarbook/screens/Login/Regiseter.dart';
import 'package:akarbook/screens/Login/login.dart';
import 'package:akarbook/screens/PropertyList/index.dart';
import 'package:akarbook/screens/RealEstateServices/page.dart';
import 'package:akarbook/screens/agentDetails/agentDetails.dart';
import 'package:akarbook/screens/favouriteList/favList.dart';
import 'package:akarbook/screens/getpackage/index.dart';
import 'package:akarbook/screens/propertyDetails/index.dart';
import 'package:akarbook/screens/userServices/userServices.dart';
import 'package:akarbook/screens/vipAccount.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


 gotoListProperty({ required BuildContext context,required bool searchOrNot}){
  final validationService = Provider.of<PropertyProvider>(
      context, listen: false);
  validationService.paged=1;
  validationService.onLoadMore.clear();
  Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
      PropertyList(searchOrNot: searchOrNot
       ,)));
}

navPropertyDetails({required BuildContext context,id,required name}){
 Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
     PropertyDetails(id: id,name: name,)));
}
navAgentDetails({required BuildContext context,id,name}){
 Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
     AgentDetails(nameAgent: name,idAgent: id,)));
}

navPageEstate({required BuildContext context,id,name}){
 Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
     PageEStateSerVices(id:id,title: name,)   ));
}
navVipEstate({required BuildContext context,id,name}){
 Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
     navVipEstate(context: context)   ));
}
navSignUp({required BuildContext context}){

 Navigator.of(context).push(
     MaterialPageRoute(builder: (context) =>
         SignUp()        ));
}
navLogin({required BuildContext context}){

 Navigator.of(context).push(
     MaterialPageRoute(builder: (context) =>
         Login()        ));
}

navPackage(BuildContext context){
 Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
     PackageList()));
}

navUserServices(BuildContext context,index){
 final validationService = Provider.of<UserProvider>(
     context, listen: false);
 if(validationService.userProviderGeneralState.hasData==true) {
  switch(index) {
   case 0:
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) =>
            UserServices()));
    break;
   case 1:
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) =>
            FavList()));
    break;

  }

 }else{
  Navigator.of(context).push(
      MaterialPageRoute(builder: (context) =>
          Login()));
 }
}
navVipEstateServices(BuildContext context){
 Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
     VipEstateServices()));
}

navWithConditionAndPolices(BuildContext context){
 final validationService = Provider.of<UserProvider>(
     context, listen: false);
  if(validationService.counterAlert==0) {
showAlertDialog(context);
 }else{
navVipEstateServices(context);
 }
}
