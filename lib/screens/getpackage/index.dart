import 'package:akarbook/Components/imageAgentGlobal.dart';
import 'package:akarbook/WidgetGlobel/AppBarGlobal.dart';
import 'package:akarbook/WidgetGlobel/globalButton.dart';
import 'package:akarbook/WidgetGlobel/progress.dart';
import 'package:akarbook/WidgetGlobel/sizedBoxGlobal.dart';
import 'package:akarbook/WidgetGlobel/textGlobal.dart';
import 'package:akarbook/provider/AgentProvider.dart';
import 'package:akarbook/provider/ServiceAndPackage.dart';
import 'package:akarbook/provider/UserProvider.dart';
import 'package:akarbook/screens/RealEstateServices/NavgaitetoPage.dart';
import 'package:akarbook/screens/agentDetails/agentDetails.dart';
import 'package:akarbook/screens/webview/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../color.dart';

class PackageList extends StatefulWidget {
  @override
  PackageListState createState() =>  PackageListState ();
}
class  PackageListState extends State<PackageList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }
  init() {
    final validationService = Provider.of<PageAndVipProvider>(
        context, listen: false);

    validationService.getPackage();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      body:SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: new Container(padding: EdgeInsets.all(10)
                ,alignment: Alignment.center, color: offWhite,child:
                textGlobalBlackBold13Lines(context: context,text:" عزيزي العميل "
                "عند اشتراكك في واحدة من الباقات التالية ، تستطيع تمييز عقارك وجعله يظهرفي اولى نتائج البحث وفي الصفحات الرئيسية للتطبيق ",)),
            ),
          ),

           listProperty(context)]),
      ),
      backgroundColor: Colors.white,
      appBar: appBarGlobal(context: context,text:"باقات الاشتراك"),
    );
  }
  Widget listProperty(BuildContext context){
    return Consumer<PageAndVipProvider>(
        builder: (context, provider, child) {
          if (provider.providerGeneralStatePackage.hasData) {

            return  ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                padding: EdgeInsets.all(10),
                itemCount: provider.providerGeneralStatePackage.data!.length,
                itemBuilder: (BuildContext context, int index){
                  return   Padding(
                   padding: EdgeInsets.all(10.0),
                    child: GestureDetector(
                      onTap: (){

                      },
                      child:  new Container(

                        decoration: BoxDecoration
                          (color:Colors.white ,border: Border.all(width: 1,color: offWhite)),
                      child: new Column(
children: [
  new Container(padding: EdgeInsets.all(10)
    ,alignment: Alignment.center, color: offWhite,child:
    textGlobalBlackBold13(context: context,text: provider.providerGeneralStatePackage.data![index].title),),



  new Container(child:
  new Row(mainAxisAlignment: MainAxisAlignment.center,children:
      [textGlobalBlackBold13(context: context,text: provider.providerGeneralStatePackage.data![index].realEstatePackagePrice.toString()),
      textGlobalOrangeBold14(context: context,text: "JD"),
      ]),),
sizedBoxGlobalHeight10(),
  new Divider(),
 centerTitle(key: "تاريخ الانتهاء",value: "${provider.providerGeneralStatePackage.data![index].realEstatePackagePeriod} ايام" ),
  sizedBoxGlobalHeight10(),
  new Divider(),
  centerTitle(key: "عدد العقارات",value: provider.providerGeneralStatePackage.data![index].realEstatePackageNumberListings)
,  sizedBoxGlobalHeight10(),
  title(key: "   عدد العقارات المميزه",value: provider.providerGeneralStatePackage.data![index].realEstatePackageNumberFeatured),
  new Divider(),
  Consumer<UserProvider>(
      builder: (context, provider2, child) {
        if (provider2.isAcceptedAgent.hasData) {
       return Column(children: [
         Directionality(
           textDirection: TextDirection.rtl
           , child: new CheckboxListTile(
           value: provider2.isAcceptedAgent.data,
           onChanged: (v) {
             setState(() {
               provider2.flagAcceptedAgent();
             });

           },

           title: Directionality(textDirection: TextDirection.rtl,
               child: new Row(children: [
                 textGlobalGreyBold16(
                     context: context, text: "أوافق على "),
                 GestureDetector(onTap:(){
                   nav(context,5877,"الشروط والأحكام" );
                 },child: textGlobalOrangeBold17(
                     context: context, text: " الشروط والأحكام")
                 ),


               ])),
           controlAffinity: ListTileControlAffinity.leading,
           activeColor: Colors.deepOrange,

         ),
         ),
         provider2.isAcceptedAgent.data==true?    new Container(width: 100,child: globalButtonOrange(title: "اختر",callback: () async {
           final validationServiceUser = Provider.of<UserProvider>(context,listen: false);
           if(validationServiceUser.userProviderGeneralState.hasData==true) {
             Navigator.of(context).push(
                 MaterialPageRoute(builder: (context) =>
                     WebViewExample(id: validationServiceUser.userProviderGeneralState.data!.id.toString(),
                       packageId: provider.providerGeneralStatePackage.data![index].packageId.toString(),)));
           }


         })):new Container(width: 100,child: globalButtonGray(title: "اختر",callback: (){}),),
       ],);

          }else{
          return SizedBox();
        }}),

sizedBoxGlobalHeight10(),

],

                      ),

                      )

                    ),
                  );

                });



          }else{

           return progress();
          }


        });

  }

Widget centerTitle({key,value}){
  return Container(
    color: white,
    padding: EdgeInsets.only(left: 10,right: 10,top: 10),
    child:   new Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
      //
      Padding(padding: EdgeInsets.only(right: 10),child:

      Container(

        decoration: BoxDecoration(
            color: Colors.deepOrange,

            border: Border.all(color:deepOrange),
            borderRadius: BorderRadius.all(
                Radius.circular(10)
            )
        ),
        child:new Padding(padding:EdgeInsets.only(left: 10,right: 20),child:
     Directionality(textDirection: TextDirection.rtl, child:  textGlobalWhiteBold14(context: context,text:value==null||value.length==0?"غير محدد":value))) ,
      )),

      textGlobalBlackBold13(context: context,text:key),


    ],),
  );
}

Widget title({key,value}){
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
}







