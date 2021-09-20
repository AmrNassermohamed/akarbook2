import 'dart:io';

import 'package:akarbook/Data/UserData.dart';
import 'package:akarbook/Models/AgentMoadels.dart';
import 'package:akarbook/Models/BillsModel.dart';
import 'package:akarbook/Models/HomePageModel.dart';
import 'package:akarbook/Models/ProprtyDetailsModel.dart';
import 'package:akarbook/Models/ProviderGeneralState.dart';
import 'package:akarbook/Models/userModels.dart';
import 'package:akarbook/screens/propertyDetails/index.dart';
import 'package:akarbook/screens/sharedprefence.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import '../utils.dart';

class UserProvider extends ChangeNotifier {
  late ProviderGeneralState<UserModels> userProviderGeneralState=new ProviderGeneralState();
  late ProviderGeneralState<List <BillsModel>> listBillsGeneralState;
  late ProviderGeneralState<List <Property>> listMyProsGeneralState;
  late ProviderGeneralState <bool> isAccepted=new ProviderGeneralState(hasData: true,data: false);
  late ProviderGeneralState <bool> isAcceptedAgent=new ProviderGeneralState(hasData: true,data: false);
  late ProviderGeneralState <bool> isAcceptedBanking=new ProviderGeneralState(hasData: true,data: false);
   int counterAlert=0;
   UserData userData = new UserData();
   bool progress = false;



   getUserDetails({token}) async {
     setWaiting(0);
     notifyListeners();
     UserModels userModels = await userData.getUserData(
         token: token);
     userProviderGeneralState =
         ProviderGeneralState(data: userModels, hasData: true);
     notifyListeners();
     print(userProviderGeneralState.hasData);
     notifyListeners();
  }


  flagAcceptedAgent() async {
    if (isAcceptedAgent.data == false) {
      await SharedPreferenceHandler.setPrivacyAndPolicyAgent(true);
      isAcceptedAgent.data = true;
      notifyListeners();
    } else {
      isAcceptedAgent.data = false;
      await SharedPreferenceHandler.setPrivacyAndPolicyAgent(false);
    notifyListeners();
    }
  }
  flagAcceptedBanking() async {
    if (isAcceptedBanking.data == false) {
      await SharedPreferenceHandler.setPrivacyAndPolicyAgent(true);
      isAcceptedBanking.data = true;
      notifyListeners();
    } else {
      isAcceptedBanking.data = false;
      await SharedPreferenceHandler.setPrivacyAndPolicyAgent(false);
      notifyListeners();
    }
  }


  deleteMyProperty(idProperty) async {
  try {
    String ?token = await SharedPreferenceHandler.getToken();
    if (token == null) {
      return "يرجي تسجيل الحساب";
    } else {
      progress = true;
      notifyListeners();
      var response = await userData.deleteProperty(
          idProperty); //getAndUpdateFavData("d71fc44e01b99e2a67c59e107a2bd30aeb1bb2c2");
      print(response);
      notifyListeners();
      progress = false;
      listMyProsGeneralState.data!.clear();
      await getMyPro();
      notifyListeners();
      return response;
    }
  }catch(ex){
    progress = false;
    notifyListeners();
    throw ex;
  }
  }


  getIsAccepted() async {
     late var privacyAndPolicy;
      setWaiting(3);
      privacyAndPolicy = await SharedPreferenceHandler.getPrivacyAndPolicy();
    if(privacyAndPolicy!=null){
      isAccepted = ProviderGeneralState(data: privacyAndPolicy, hasData: true);
    }else{
      isAccepted = ProviderGeneralState(data: false, hasData: true);
    }
      notifyListeners();

    }
  getIsAcceptedAgent() async {
    late var privacyAndPolicy;
    setWaiting(3);
    privacyAndPolicy = await SharedPreferenceHandler.getPrivacyAndPolicyAgent();
    if(privacyAndPolicy!=null){
      isAcceptedAgent = ProviderGeneralState(data: privacyAndPolicy, hasData: true);
    }else{
      isAcceptedAgent= ProviderGeneralState(data: false, hasData: true);
    }
    notifyListeners();
  }
  getIsAcceptedBanking() async {
    late var privacyAndPolicy;
    setWaiting(3);
    privacyAndPolicy = await SharedPreferenceHandler.getPrivacyAndPolicyBanking();
    if(privacyAndPolicy!=null){
      isAcceptedAgent = ProviderGeneralState(data: privacyAndPolicy, hasData: true);
    }else{
      isAcceptedAgent= ProviderGeneralState(data: false, hasData: true);
    }
    notifyListeners();
  }


 late Position position;
  Future determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print("///////////////////");
       return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
        return Future.error(
          'Location permissions are permantly denied, we cannot request permissions.');
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {

//        geoPoint=new GeoPoint(30.0544292, 31.3993412);
        //return geoPoint;
        return Future.error(
            'Location permissions are denied (actual value: $permission).');
      }
    }
    position= await Geolocator.getCurrentPosition();
    print("//////////////////////////////////////////////////////////////////////////");
    print(position.altitude);
    print(position.longitude);
    return position;
  }

updateUserProvider({mobile,faxNumber,sky,address,twitter,firstName,lastName}) async {
 try {
   progress = changeProgress(progress);
   notifyListeners();
   var response = await userData.updateUserProfile(mobile: mobile,
       faxNumber: faxNumber,
       sky: sky,
       address: address,
       twitter: twitter,
   firstName: firstName,lastName: lastName);
   progress = changeProgress(progress);
   notifyListeners();
   return response;
 }catch(ex){
   progress = changeProgress(progress);
   notifyListeners();
   throw ex;
 }
 }
 makeAgent() async {
  try {
    progress = changeProgress(progress);
    notifyListeners();
    var response = await userData.makeAgent();
    progress = changeProgress(progress);
    notifyListeners();
    return response;
  }catch(Ex){
    progress = false;
    notifyListeners();
    throw Ex;
  }
 }

  var token;
  getMobileToken()
  async{
    try {
      String? token = await FirebaseMessaging.instance.getToken();

      return token;
    }catch(ex){

    }

    notifyListeners();
  }


  getMyPro() async {
    setWaiting(2);
    List<Property> agentList;
    //String  token=await SharedPreferenceHandler.getToken();
    //print(token);
    agentList = await userData.getMyProperty();
    listMyProsGeneralState= ProviderGeneralState(data: agentList, hasData: true);
    notifyListeners();
  }

  reActivePassword(email) async {
    try {
      progress = changeProgress(progress);
      notifyListeners();
      var response = await userData.reActivePassword(email);
      progress = changeProgress(progress);
      notifyListeners();
      return response;
    }catch(Ex){
      progress = false;
      notifyListeners();
      throw Ex;
    }
  }


  getLogin({define,index}) async {


  progress = changeProgress(progress);
  notifyListeners();
  var response = await userData.getLogin(
      define: define, index: 0);
  String? token = await SharedPreferenceHandler.getToken();
  if (token != null) {
    await getUserDetails(token: token);
  }
  progress = changeProgress(progress);
  notifyListeners();

  return response;

  }

  getSignUpProvider({username,email,password,company,mobile,firstName,lastName}) async {
  try {
  progress=true;
  notifyListeners();
  var response = await userData.getSignUp(company: company,
      email: email,
firstName: firstName,
      lastName: lastName,
      mobile: mobile,
      password: password,
      username: username);
  progress=false;
  notifyListeners();
  print(response);
  return response;
}catch(ex){
  progress=false;
  notifyListeners();
  throw ex;
}
  }
  getListBills() async {
    setWaiting(1);
    List <BillsModel > getListBills  = await UserData().getBills();
    listBillsGeneralState =
        ProviderGeneralState(data: getListBills, hasData: true);
    notifyListeners();
  }
  void setWaiting(index) {
    switch (index) {
      case 0:
        userProviderGeneralState = ProviderGeneralState(waiting: true);
        break;
      case 1:
       listBillsGeneralState = ProviderGeneralState(waiting: true);
        break;
      case 2:
        listMyProsGeneralState = ProviderGeneralState(waiting: true);
        break;
      case 3:
        isAccepted=ProviderGeneralState(waiting: true);
    break;
    }
  }
}