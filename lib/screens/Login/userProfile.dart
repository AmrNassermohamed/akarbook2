import 'package:akarbook/Components/displaysnackBar.dart';
import 'package:akarbook/Models/userModels.dart';
import 'package:akarbook/WidgetGlobel/AppBarGlobal.dart';
import 'package:akarbook/WidgetGlobel/ImageNetwork.dart';
import 'package:akarbook/WidgetGlobel/globalButton.dart';
import 'package:akarbook/WidgetGlobel/progress.dart';
import 'package:akarbook/WidgetGlobel/sizedBoxGlobal.dart';
import 'package:akarbook/WidgetGlobel/textField.dart';
import 'package:akarbook/WidgetGlobel/textGlobal.dart';
import 'package:akarbook/provider/UserProvider.dart';
import 'package:akarbook/screens/sharedprefence.dart';
import 'package:akarbook/screens/userServices/userServices.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import '../../assets.dart';
import '../../color.dart';
import 'login.dart';
class UserProfile extends StatefulWidget {
  @override
  UserProfileState createState() => UserProfileState ();
}

class UserProfileState extends State<UserProfile> {
  TextEditingController controllerName=new TextEditingController();
  TextEditingController controllerSkype=new TextEditingController();
  TextEditingController controllerTwitter=new TextEditingController();
  TextEditingController controllerEmail=new TextEditingController();
  TextEditingController controllerPhone=new TextEditingController();
  TextEditingController controllerCompany=new TextEditingController();
  TextEditingController controllerAddress=new TextEditingController();
  TextEditingController controllerFax=new TextEditingController();
  TextEditingController controllerFirstName=new TextEditingController();
  TextEditingController controllerLastName=new TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    controllerCompany.dispose();
    controllerPhone.dispose();
    controllerSkype.dispose();
    controllerTwitter.dispose();
    controllerName.dispose();
    controllerEmail.dispose();
    controllerFax.dispose();
    controllerFirstName.dispose();
    controllerLastName.dispose();

    super.dispose();
  }
  late  UserModels userModels;
  @override
  void initState() {
    init();
    // TODO: implement initState
    super.initState();
  }
  
  
  init() async {
    final validationService = Provider.of<UserProvider>(
        context, listen: false);
    String ?token=await SharedPreferenceHandler.getToken();
   await validationService.getUserDetails(token: token);
if(validationService.userProviderGeneralState.hasData==true){
  controllerAddress.text=validationService.userProviderGeneralState.data!.userOfficeAddress;
  controllerPhone.text=validationService.userProviderGeneralState.data!.realEstateAuthorMobileNumber;
  controllerSkype.text=validationService.userProviderGeneralState.data!.realEstateAuthorSkype;
  controllerTwitter.text=validationService.userProviderGeneralState.data!.real_estate_author_twitter_url;
  controllerFax.text=validationService.userProviderGeneralState.data!.realEstateAuthorFaxNumber;
  controllerFirstName.text=validationService.userProviderGeneralState.data!.firstName;
  controllerLastName.text=validationService.userProviderGeneralState.data!.lastName;
//  controllerFirstName.text=validationService.userProviderGeneralState.data!.
}
  }
  
  callBack() async {
    final validationService = Provider.of<UserProvider>(
        context, listen: false);
    var response = await validationService
        .updateUserProvider
      (mobile: controllerPhone.text,address: controllerAddress.text,faxNumber: controllerFax.text,
        sky: controllerSkype.text,twitter: controllerTwitter.text,
        firstName: controllerFirstName.text,
        lastName: controllerLastName.text);
    
    if (response.toString() == 200.toString()) {
      displaySnackBar(context,
          "تم تاكيد البيانات");
    }
    else {
      displaySnackBar(context,
          "يرجي المحاوله مره الاخري مع التاكد من البيانات");
    }
    
  }
  
  

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final validationService = Provider.of<UserProvider>(
        context, listen: false);

    return Consumer<UserProvider>(
        builder: (context, provider, child) {
      if (provider.userProviderGeneralState.hasData) {
        return ModalProgressHUD(
          inAsyncCall: Provider
              .of<UserProvider>(context)
              .progress,
          child: Scaffold(
            appBar: appBarGlobal2(context, "حسابك الشخصي"),
            body: SingleChildScrollView(
              padding: EdgeInsets.all(10),
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center, children: [
                    sizedBoxGlobalHeight10(),
                    imageProfile(context: context,width: 100.0,height: 100.0,path: validationService.userProviderGeneralState.data!.avatarUrl),

                    sizedBoxGlobalHeight20(),


                  textFieldReg(
                        controller: controllerName, text: validationService
                        .userProviderGeneralState.data!.name, icon: Icons
                        .person,enable: false),
                    sizedBoxGlobalHeight10(),
                     textFieldReg(controller: controllerEmail,enable: false,
                         text: validationService.userProviderGeneralState.data!.email,icon:Icons.email),
                    new Row(mainAxisAlignment: MainAxisAlignment.end,children: [
                      textGlobalGreyNormal13(context: context,text: "المويايل")
                    ],),

                    textFieldReg(controller: controllerPhone, text: validationService.userProviderGeneralState.data!.realEstateAuthorMobileNumber, icon: Icons.phone),
                    new Row(mainAxisAlignment: MainAxisAlignment.end,children: [
                      textGlobalGreyNormal13(context: context,text: "الاسم")
                    ],),
                    textFieldReg(controller: controllerFirstName, text:
                    "", icon: Icons.person),

                    new Row(mainAxisAlignment: MainAxisAlignment.end,children: [
                      textGlobalGreyNormal13(context: context,text: "اسم العائله")
                    ],),
                    textFieldReg(controller: controllerLastName, text:
                    "", icon: Icons.person),
    /*                new Row(mainAxisAlignment: MainAxisAlignment.end,children: [
                      textGlobalGreyNormal13(context: context,text: "اسم الشركه")
                    ],),
                    textFieldReg(controller: controllerCompany, text:
                    validationService.userProviderGeneralState.data!.realEstateAuthorMobileNumber, icon: Icons.home)*/
                    new Row(mainAxisAlignment: MainAxisAlignment.end,children: [
                      textGlobalGreyNormal13(context: context,text: "العنوان")
                    ],),
                    textFieldReg(controller: controllerAddress,
                        text: validationService.userProviderGeneralState.data!.userOfficeAddress, icon: Icons.location_on),
                 new Row(mainAxisAlignment: MainAxisAlignment.end,children: [
                      textGlobalGreyNormal13(context: context,text: "فاكس")
                    ],),
                    textFieldReg(controller: controllerFax,icon:Icons.email ,
                      text: validationService.userProviderGeneralState.data!.realEstateAuthorFaxNumber,),
                    new Row(mainAxisAlignment: MainAxisAlignment.end,children: [
                      textGlobalGreyNormal13(context: context,text: " حساب سكايب")
                    ],),
                    textFieldReg(controller: controllerSkype,icon:Icons.email ,
                      text: validationService.userProviderGeneralState.data!.realEstateAuthorSkype,),
                   /* new Row(mainAxisAlignment: MainAxisAlignment.end,children: [
                      textGlobalGreyNormal13(context: context,text: " حساب فيسبوك")
                    ],),
                    textFieldReg(controller: controller,icon:Icons.email ,
                      text: validationService.userProviderGeneralState.data!.realEstateAuthorSkype,),*/
                    new Row(mainAxisAlignment: MainAxisAlignment.end,children: [
                      textGlobalGreyNormal13(context: context,text: " حساب تويتر")
                    ],),
                    textFieldReg(controller: controllerTwitter, icon:Icons.email,text: validationService.userProviderGeneralState.data!.real_estate_author_twitter_url),
                    sizedBoxGlobalHeight10(),
                    globalButtonOrange(title: "تسجيل", callback: () async {
                    callBack();
                         
                        }

                    ),

                  ],),
                ),
              ),
            ),

          ),
        );
      }else{

      return Scaffold(appBar: appBarGlobal2(context, "حسابك الشخصي"),body: Container(child: progress()));
      }
    });
  }



}