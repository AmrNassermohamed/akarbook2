import 'package:akarbook/Components/displaysnackBar.dart';
import 'package:akarbook/Components/navgaite.dart';
import 'package:akarbook/WidgetGlobel/AppBarGlobal.dart';
import 'package:akarbook/WidgetGlobel/globalButton.dart';
import 'package:akarbook/WidgetGlobel/progress.dart';
import 'package:akarbook/WidgetGlobel/textGlobal.dart';
import 'package:akarbook/color.dart';
import 'package:akarbook/provider/FavProvider.dart';
import 'package:akarbook/provider/UserProvider.dart';
import 'package:akarbook/screens/Bills/index.dart';
import 'package:akarbook/screens/Login/Regiseter.dart';
import 'package:akarbook/screens/Login/userProfile.dart';
import 'package:akarbook/screens/RealEstateServices/NavgaitetoPage.dart';
import 'package:akarbook/screens/favouriteList/favList.dart';
import 'package:akarbook/screens/getpackage/index.dart';
import 'package:akarbook/screens/myproprety/myPropertyList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import '../bottomNagationBar.dart';
import '../sharedprefence.dart';
import 'bottomSheetAgent.dart';


class UserServices extends StatefulWidget {



  @override
  UserServicesState createState() => UserServicesState ();
}


class UserServicesState extends State<UserServices>{

  Future initialize() async {


    final validationServiceUser = Provider.of<UserProvider>(context,listen: false);

    String? token=await SharedPreferenceHandler.getToken();
    if(token!=null){
      await    validationServiceUser.getUserDetails(token: token);
    }
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!

  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(appBar: appBarGlobal(context: context,text: "لوحه التحكم"),
bottomNavigationBar: bottomNavigationBar(context,1),
      body:  RefreshIndicator(
        onRefresh:initialize,
        child: ModalProgressHUD(
          progressIndicator: progress(),
          inAsyncCall: Provider
                .of<UserProvider>(context)
                .progress,
          child: SingleChildScrollView(
            child: Container(color: Colors.grey[100],child:
    Column(children: [
    new SizedBox(height: 10,),
new Padding(padding: EdgeInsets.all(10),child: new Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [


    Expanded(
            child: RaisedButton(
                    onPressed: () async {
                      navVipEstateServices(context);
                    },
                    color: blueDark,
                    padding: EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0)),
                    child:Padding(padding: EdgeInsets.only(left: 10,right: 10),child:
                    textGlobalWhiteBold14(context:context,text: "كن وكيل عقاري"),
                    )),
    ),

  SizedBox(width: 10,),
  Expanded(child:
  RaisedButton(
               onPressed: () {
                 Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                     PackageList()));

               },
               color: Colors.deepOrange,
               padding: EdgeInsets.all(10),
               shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(0)),
               child:Padding(padding: EdgeInsets.only(left: 10,right: 10),child:
               textGlobalWhiteBold14(context:context,text: "اشترك باحدي الباقات"),
               ))),


])),

             Padding(
                padding: EdgeInsets.all(10),
                child: new Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
 Expanded(child:              GestureDetector(onTap: (){
             Navigator.of(context).push(
             MaterialPageRoute(builder: (context) =>
             MyPropertyList()        ));

             },child: Con(1,context,"عقاراتي"))),
                 SizedBox(width: 10,),

                    Expanded(child:             GestureDetector(
                onTap: (){

        Navigator.of(context).push(
        MaterialPageRoute(builder: (context) =>
        UserProfile()        ));
        },child:  Con(2,context,"الملف الشخصي"),
                   ),
                 )
                ],),
              ),


            Padding(
              padding: EdgeInsets.all(10),
              child: new Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Expanded(child: GestureDetector(onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                      FavList()));
                },child: Con(4,context,"المفضله"))),
                SizedBox(width: 10,),
                 Expanded(child: GestureDetector(onTap: (){
                   Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                       BillList()));
                   // vavWidget( context: context,T: BillList());
                 },child: Con(3,context,"فواتير"))),
              ],),
            ),

        Padding(
            padding: EdgeInsets.all(10),
            child: Consumer<UserProvider>(
                builder: (context, provider, child) {
                  if (provider.userProviderGeneralState.hasData) {
                    return Column(children: [
                      title(key: "  مجموع العقارات متوفرة ",
                          value: provider.userProviderGeneralState.data!.availableProperty.toString(),context: context),
                      title(key: "  لديك  عقارات  مضافة",
                          value: provider.userProviderGeneralState.data!.real_property_added.toString(), context: context),
                      title(key: "  لديك  عقارات مميزه مضافة",
                          value: provider.userProviderGeneralState.data!.totalFeaturedProperty.toString(), context: context),
                      title(key: "    العقارات المميزه  المتوفرة",
                          value: provider.userProviderGeneralState.data!.availableFaeturedProperty.toString(),context: context),

                    ],);

                  }else{
                    return SizedBox();

                  }
                }),
        ),



    ])),
          ),
        ),
      ));
      }

}
Widget Con(index,BuildContext context,text){
return  new Container(decoration:
BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),color: Colors.deepOrangeAccent),
  child: new Center(child:Column(children: [ new Image.asset("assets/UserServices${index.toString()}.png",width: 150,height: 100,),
  textGlobalWhiteBold14(context:context,text: text)
  ,new SizedBox(height: 10,)
])),);
}
Widget title({key,value,required BuildContext context}){
  return Container(
    color: white,
    padding: EdgeInsets.only(left: 10,right: 10,top: 10),
    child:   new Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
      //
      Padding(padding: EdgeInsets.only(right: 10),child:

      new CircleAvatar(child: textGlobalWhiteBold14(context: context,text: value,),backgroundColor: Colors.deepOrange,),

      ),     textGlobalBlackBold13(context: context,text:key),


    ],),
  );
}
