import 'package:akarbook/Models/BillsModel.dart';
import 'package:akarbook/Models/HomePageModel.dart';
import 'package:akarbook/Models/ProprtyDetailsModel.dart';
import 'package:akarbook/Models/userModels.dart';
import 'package:akarbook/screens/propertyDetails/index.dart';
import 'package:akarbook/screens/sharedprefence.dart';
import 'package:akarbook/services/services_handler.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class UserData{

  getLogin({define,index}) async {

    String? token = await FirebaseMessaging.instance.getToken();
      UserModels userModels;



       var response = await ServicesHandler().getService(
         headers: {
           'Content-Type': 'application/json',
           'Accept': 'application/json',
           'device_token':'${token.toString()}',
           'device_type':'A',
         }
       ,
         ex: index==0?false:true,
           urlSuffix: "login.php?${define.toString()}");
       if (response["status"].toString() == 200.toString()) {
       //  userModels = UserModels.fromJson(response["user"]);

         if (index == 0) {
           await SharedPreferenceHandler.setToken(response["user"]["token"]);
           return response["status"];
         } else {
           return ;
         }
       } else if (response != 200) {
         return response["status"];
       }

  }
  getUserData({token}) async {
    UserModels userModels;
    var response= await ServicesHandler().
    getService(ex: true,urlSuffix:"get_profile.php",
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });

 userModels =UserModels.fromJson(response);
    return userModels;
  }

  getMyProperty() async {
    List <Property>listMyProPerty=[];
    String?
    token=await SharedPreferenceHandler.getToken();
    var response= await ServicesHandler().getService(urlSuffix:"get_my_property.php",
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },ex: true);
    response["data"].forEach((v) {
      Property propertyDetailsModel=Property.fromJson(v);
      listMyProPerty.add(propertyDetailsModel);
    });
    return listMyProPerty;
  }

updateUserProfile({sky,mobile,faxNumber,address,twitter,firstName,lastName}) async {
  print(sky);
  print(mobile);
  print(firstName);
  print(lastName);

    String token = await SharedPreferenceHandler.getToken();
    try {
print(address);
      var response = await ServicesHandler().getService(ex: true,statusCode: true,
          urlSuffix: "update_profile.php?real_estate_author_skype=${sky
              .toString()}&real_estate_author_mobile_number=${mobile
              .toString()}"

              "&real_estate_author_fax_number=${faxNumber}36&user_office_address=${address}"
              "&user_vimeo_ur&user_pinterest_url&first_name=${firstName.toString()}&last_name=${lastName}&real_estate_author_twitter_url=${twitter}".replaceAll("\\s", ""),  headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
          },);
      print("///////////////////////////////////////");
print(response);
      return response;
    }catch(Ex){
      throw Ex;
    }
}

makeAgent() async {
  try{
  String? token = await SharedPreferenceHandler.getToken();
  var response = await ServicesHandler().getService(
    ex: true, statusCode: true, headers: { 'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $token'}, urlSuffix: "user_as_agent.php",);
  return response;
}catch(Ex){
    throw Ex;
  }
  }

  reActivePassword(email) async {
    try{
      var response = await ServicesHandler().getService(
        ex: true, statusCode: true, urlSuffix: "forgot_password.php?user_login=${email.toString()}",);
      return response;
    }catch(Ex){
      throw Ex;
    }
  }

  deleteProperty(idProperty) async {
    try {
      String token = await SharedPreferenceHandler.getToken();
       await ServicesHandler().postService(
          urlSuffix: "delete_property.php", requestBody: {
        "property_id": idProperty.toString()
      }, headers: {
        'Authorization': 'Bearer $token'
      });

    }catch(ex){
      throw ex;
    }
  }




  getSignUp({username,email,password,company,mobile,firstName,lastName}) async {
    try {
      String? token = await FirebaseMessaging.instance.getToken();
      var response = await ServicesHandler().getService(    headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'device_token':'${token.toString()}',
        'device_type':'A',
      },ex: false,
          urlSuffix: "registration.php?username=${username.toString()}&email=${email.toString()}&company=${company.toString()}"
              "&password=${password.toString()}&mobile=${mobile.toString()}&first_name=${firstName.toString()}&lastName=${lastName.toString()}");

      return response["status"];
    }catch(Ex){
      throw Ex;
    }
  }







  getBills() async {
  // String token="ef2cdd5e8511fa8f7e4ec2ca93b0e020449a4114";
    String token = await SharedPreferenceHandler.getToken();
    List <BillsModel> listBills=[];
   var response= await ServicesHandler().
   getService(ex: true,urlSuffix:"get_invoice.php",
       headers: {
         'Content-Type': 'application/json',
         'Accept': 'application/json',
         'Authorization': 'Bearer $token',
       });
   response["data"].forEach((v) {
     BillsModel billsModel = BillsModel.fromJson(v);
     listBills.add(billsModel);
   });
   return listBills;
  }

}