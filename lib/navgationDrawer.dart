import 'dart:io';
import 'package:akarbook/Models/userModels.dart';
import 'package:akarbook/WidgetGlobel/sizedBoxGlobal.dart';
import 'package:akarbook/color.dart';
import 'package:akarbook/provider/PropretyProvider.dart';
import 'package:akarbook/provider/UserProvider.dart';
import 'package:akarbook/screens/Login/login.dart';
import 'package:akarbook/screens/RealEstateServices/NavgaitetoPage.dart';
import 'package:akarbook/screens/RealEstateServices/RealEstateServices.dart';
import 'package:akarbook/screens/RealEstateServices/page.dart';
import 'package:akarbook/screens/agentList/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'Components/navgaite.dart';
import 'WidgetGlobel/alertDialoug.dart';
import 'WidgetGlobel/globalButton.dart';
import 'WidgetGlobel/textGlobal.dart';
import 'assets.dart';
class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final validationService = Provider.of<UserProvider>(
        context, listen: false);
    final validationService2 = Provider.of<PropertyProvider>(
        context, listen: false);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[

      Consumer<UserProvider>(
      builder: (context, provider, child) {
        if(provider.userProviderGeneralState.hasData){
  return  createDrawerHeader(context: context,userModels:  provider.userProviderGeneralState.data!);
        }else{
 return   unLogOut(context);
    }
      }
      )
,
          new Container(color: Colors.white,
            child: Column(children: [
              Consumer<UserProvider>(
                  builder: (context, provider, child) {
                    if(provider.userProviderGeneralState.hasData){
return Column(children: [
 provider.userProviderGeneralState.data!.package==0? globalButtonOrange(callback: (){
 navPackage(context);
 },title: "اشترك باحدي الباقات"):SizedBox(),
  provider.userProviderGeneralState.data!.realEstateAuthorAgentId.toString()==0.toString()?  globalButtonBLueDark(callback: (){
    navVipEstateServices(context);
  },title: "كن وكيل العقاري"):SizedBox(),
],);
                    }else{
                      return   SizedBox();
                    }
                  }
              ),
              createDrawerBodyItem(
                  icon: Icons.home,text: 'الرئيسيه',context: context,onTap: (){
                    Navigator.of(context).pop();
              }),
              createDrawerBodyItem(
                  icon: Icons.note,text: 'للإيجار',context: context,onTap: (){
                    validationService2.getDefine(agency: "",typeId:"",text: "",status: "للإيجار",type: "",cityId: "",countryId: "",endPrice: "",orderByDate: "",orderByPrice: "",startPrice: "",stateId: "");
                    validationService2.title="للإيجار";
                    gotoListProperty(context: context,searchOrNot: false);
              }),
              createDrawerBodyItem(
                  icon: Icons.money,text: 'للبيع',context: context,onTap: (){
                validationService2.getDefine(agency: "",typeId:"",text: "",status: "للبيع",type: "",cityId: "",countryId: "",endPrice: "",orderByDate: "",orderByPrice: "",startPrice: "",stateId: "");
                validationService2.title="للبيع";
                gotoListProperty(context:context,searchOrNot: false);
              }),

              createDrawerBodyItem(
                  icon: Icons.search,text: "للإستثمار",context: context,onTap: (){
                validationService2.getDefine(agency: "",typeId:"",text: "",status: "للإستثمار",type: "",cityId: "",countryId: "",endPrice: "",orderByDate: "",orderByPrice: "",startPrice: "",stateId: "");
                validationService2.title="للإستثمار";
                gotoListProperty(context: context,searchOrNot: false);
              }),
              GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                      RealEStateSerVices()));
                },
                child: createDrawerBodyItem(
                    icon: Icons.person_add,text: "خدمات عقاريه",context: context),
              ),
              createDrawerBodyItem(
                  icon: Icons.person_add_alt,text: "وكلاء عقارات",context: context,onTap: (){

                Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                    AgentList()));
              }),
              createDrawerBodyItem(
                  icon: Icons.warning_amber_outlined,text: "من نحن",context: context,onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                PageEStateSerVices(id:6549,title: "من نحن",)   ));

              }),
              createDrawerBodyItem(
                  icon: Icons.phone,text: "اتصل بنا",context: context,onTap: (){
                navPageEstate(context: context,name: "اتصل بنا",id: 12606);

              }),
             /* createDrawerBodyItem(
                  icon: Icons.phone,text: "المدونه العقاريه",context: context),*/
            ],),
            ),

           new Container(
              color: blueDark,
              child: Column(children: [
new SizedBox(height: 80,),
                new Image.asset("assets/logoFinal.png",width: 70,height: 70,),
                new SizedBox(height: 5,),
                new Row(mainAxisAlignment: MainAxisAlignment.center,children: [


                   GestureDetector(onTap:() async {
                     var url = 'https://www.facebook.com/AKARBOOKJO';

                     if (await canLaunch(url)) {
                       await launch(
                         url,
                         universalLinksOnly: true,
                       );
                     } else {
                       throw 'There was a problem to open the url: $url';
                     }
    } ,child: iconSocMedia("assets/instagram.png",false)),
                  GestureDetector(onTap: () async {


                  },child: GestureDetector(onTap: () async {
                    var url = 'https://www.instagram.com/akarbookjo/';

                    if (await canLaunch(url)) {
                      await launch(
                        url,
                        universalLinksOnly: true,
                      );
                    } else {
                      throw 'There was a problem to open the url: $url';
                    }


                  },child: iconSocMedia("assets/instagram.png",true))),
                  GestureDetector(onTap: () async {
                    var url = 'skype: akarbookjo';

                    if (await canLaunch(url)) {
                    await launch(
                    url,
                    universalLinksOnly: true,
                    );
                    } else {
                    throw 'There was a problem to open the url: $url';
                    }


                  },child: iconSocMedia("assets/skype.png",true)),
                  GestureDetector(onTap: () async {
                    var url = 'https://twitter.com/akarbookjo';

                    if (await canLaunch(url)) {
                    await launch(
                    url,
                    universalLinksOnly: true,
                    );
                    } else {
                    throw 'There was a problem to open the url: $url';
                    }

                  },child: iconSocMedia("assets/twitter.png",true)),



                ],),
                new SizedBox(height: 10,),
                new Row(mainAxisAlignment: MainAxisAlignment.center,children: [
          GestureDetector(child:textGlobalNormal14(context:context,text: "الشروط والاحكام"),onTap: (){
            nav(context,5877,"الشروط والاحكام" );
          },),
                  SizedBox(width: 3,),
                  Container(decoration:BoxDecoration( border: Border.all(color: Colors.orange.shade700),
                      color: Colors.orange.shade700),child:
                  SizedBox(height: 5,width: 1,),),
                  SizedBox(width: 3,),
          GestureDetector(onTap: (){
            nav(context,5875,"سياسيه الخصوصيه" );
          },child:     textGlobalNormal14(context:context,text: "سياسيه الخصوصيه")),
                ],)
              ],),
            ),

        ],
      ),
    );
  }
}
Widget createDrawerHeader({required BuildContext context,required UserModels userModels}) {
  final validationService = Provider.of<UserProvider>(
      context, listen: false);
  return Directionality(
   textDirection: TextDirection.ltr
   , child: Container(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          color: blueDark.withOpacity(.8)
        ),
        child:Column(children: <Widget>[
          new SizedBox(height: 30,),

          CircleAvatar(
            backgroundColor: df,
            radius: 30.0,
            child: CircleAvatar(
              backgroundImage: NetworkImage(userModels.avatarUrl),
              radius: 25.0,
            ),
          ),
          new SizedBox(height: 5,),
          textGlobalOrangeBold14(context: context,text: userModels.name)
   , new Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
            Directionality(
             textDirection: TextDirection.rtl
             , child: TextButton.icon(onPressed: (){
              navUserServices(context,0);

            }, icon:new Container(color: Colors.white,child:  Icon(Icons.settings_applications,color: Colors.black,)),
                  label: textGlobalWhiteBold14(context:context ,text: "لوحه التحكم")),
            ),
            Directionality(
            textDirection: TextDirection.rtl
            , child: TextButton.icon(onPressed: () async {
              final pref = await SharedPreferences.getInstance();
              await pref.clear();
  validationService.userProviderGeneralState.hasData=false;
  validationService.notifyListeners();

            },
                  icon:new Container(color: Colors.white,child:  Icon(Icons.exit_to_app,color: Colors.black,)),
                  label: textGlobalWhiteBold14(context:context ,text: "الخروج")),
            )

    ],)
      ,
          // .icon(onPressed: null, icon: null, label: null),

        ])),
  );
}
Widget createDrawerBodyItem(
    {required IconData icon, required String text,  GestureTapCallback? onTap,required BuildContext context}) {
  return GestureDetector(
  onTap: onTap,
    child: Directionality(
     textDirection: TextDirection.rtl,
 child: Padding(
     padding: EdgeInsets.all(5),
     child: Row(
       children: <Widget>[
              Icon(icon,color: Colors.black,),
              Padding(
                padding: EdgeInsets.only(right: 30.0),
                child:textGlobalBlackBold14(context: context,text: text
                ),
              )

       ] ),
 ),
    ),
  );
}
Widget unLogOut(BuildContext context){
  return Directionality(
    textDirection: TextDirection.ltr
    , child: Container(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
          color: blueDark.withOpacity(.8)
      ),
      child:Column(children: <Widget>[
        new SizedBox(height: 30,),
        new Image.asset(logo,height: 100,width: 100,),
        sizedBoxGlobalHeight10(),
        globalButtonOrange(callback: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
            Login()));},title: "تسجيل الدخول"),
      sizedBoxGlobalHeight10(),
       /* RaisedButton(
            onPressed: () {

              Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                  Login()));
            },
            color: Colors.deepOrange,
            padding: EdgeInsets.all(0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0)),
            child:Padding(padding: EdgeInsets.only(left: 10,right: 10),child:
            textGlobalWhiteBold14(context:context,text: "  تسجيل الدخول"),
            )),

        // .icon(onPressed: null, icon: null, label: null),*/

      ])),
  );
  
  
}

Widget iconSocMedia(image,bool ic){
  return  Padding(
  padding: EdgeInsets.only(left: 10,right: 10),
    child: CircleAvatar(
      radius: 15,
    backgroundColor: Colors.indigo,
      child:ic==true ?Image.asset(image,color: Colors.white,width: 15,height: 15,):Icon(Icons.facebook,color: Colors.white,),
    ),
  );
}
