import 'package:akarbook/Components/connectWithClients.dart';
import 'package:akarbook/Components/navgaite.dart';
import 'package:akarbook/Components/textPiceGlobal.dart';
import 'package:akarbook/WidgetGlobel/AppBarGlobal.dart';
import 'package:akarbook/WidgetGlobel/iconButton.dart';
import 'package:akarbook/WidgetGlobel/progress.dart';
import 'package:akarbook/WidgetGlobel/sizedBoxGlobal.dart';
import 'package:akarbook/WidgetGlobel/textGlobal.dart';
import 'package:akarbook/provider/FavProvider.dart';
import 'package:akarbook/provider/PropretyProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:money2/money2.dart';
import 'package:provider/provider.dart';
import '../../assets.dart';
import '../../color.dart';
import '../../constants.dart';
import 'Components/imageSlideShow.dart';
import '../../Components/displaysnackBar.dart';
import 'package:basic_utils/basic_utils.dart';
class PropertyDetails extends StatefulWidget {
late int id;
late String name;
PropertyDetails({required this.id,required this.name});
  @override
  PropertyDetailsState createState() => PropertyDetailsState();
}


class PropertyDetailsState extends State<PropertyDetails> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }
  init(){
    final validationService = Provider.of<PropertyProvider>(context,listen: false);
    validationService.getPropertyDetails(id: widget.id);

  }
  f(id) async {
    final validationService = Provider.of<Fav>(
        context, listen: false);
    var response =await validationService.addAndDeleteFav(id,false);

    final snackBar = SnackBar(content: Text(response));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  onWillPopPage(){
    final validationService = Provider.of<Fav>(
        context, listen: false);
    // validationService.onLoadMore.clear();
//validationService.progress=false;

  }


  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return WillPopScope(
      onWillPop: onWillPopPage(),
      child: ModalProgressHUD(
        progressIndicator: progress(),
          inAsyncCall:Provider.of<Fav>(context).progress ,
          child: SafeArea(
          child: Scaffold(
            appBar: appBarGlobal(context: context,text: widget.name),
            body: Consumer<PropertyProvider>(
                builder: (context, provider, child) {
                  if (provider.getPropertyDetailsState.hasData) {
                    return    RefreshIndicator(
                      onRefresh: _refreshLocalGallery,
                      child: Container(color: Colors.white,child: SingleChildScrollView(
                        padding: EdgeInsets.only(left: 10,right: 10),
                        child: Column(textDirection: TextDirection.ltr,children: [
                          sizedBoxGlobalHeight10(),
                          provider.getPropertyDetailsState.data!.gallery.length!=0?
                          imageShow(image: provider.getPropertyDetailsState.data!.gallery,network: true,feature:provider.getPropertyDetailsState.data!.avaiable_featured_property):new Icon(Icons.home,size: 50,color: Colors.deepOrange,),
                          sizedBoxGlobalHeight10(),
                          textPriceGlobal2514(context: context,text:  provider.getPropertyDetailsState.data!.price.toString() ) ,
                          Directionality(
                            textDirection: TextDirection.rtl
                            ,child: new Row(textDirection: TextDirection.rtl,children: [
                            sizedBoxGlobalWidth10(),
                            SizedBox(width:MediaQuery.of(context).size.width-30 ,child:   textGlobalGreyNormal13(context: context,text: provider.getPropertyDetailsState.data!.title)),
                          ],),
                          ),
                          new Divider(),
                          new Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                            connectWithClients(context:context,phone:"00962795768244"),
                            iconButtonFavourite(() async {
f(widget.id);

                          //    displaySnackBar(context,response.toString());
                            }),
                          ],),
                          new Divider(),
                          new Row(textDirection: TextDirection.rtl,children: [
                            new Image.asset(logo,width: 50,height: 50,),
                            sizedBoxGlobalWidth10(),
                        GestureDetector(onTap:(){
                          navAgentDetails(name:provider.getPropertyDetailsState.data!.agent ,context: context,id: provider.getPropertyDetailsState.data!.realEstatePropertyAgent);
                        } ,child:   textGlobalGreyNormal13(context: context,text:
                            provider.getPropertyDetailsState.data!.agent)),
                          ],),
                          sizedBoxGlobalHeight10(),
                          new Row(textDirection: TextDirection.rtl,children: [
                            new Expanded(flex: 1,child:
                            Container(color: Colors.deepOrange,child: new Center(child: textGlobalWhiteNormal16(context: context,text: "نظره عامه")))),
                            new Expanded(flex: 3,child: Container(color: Colors.black,child: new Center(child:
                            textGlobalWhiteNormal16(context: context,text: ""
                                "")))),
                          ],),
                          sizedBoxGlobalHeight10(),
                          rowGrey(context: context,title: ":رقم العقار",value: provider.getPropertyDetailsState.data!.id),
                          rowWhite(context: context,title: " :الحمامات",value: provider.getPropertyDetailsState.data!.bathrooms),
                          rowGrey(context: context,title: ":السعر",value: provider.getPropertyDetailsState.data!.price),
                          rowWhite(context: context,title: " مساحه البناء",value:provider.getPropertyDetailsState.data!.real_estate_property_size ),
                          rowWhite(context: context,title: "مساحه الارض",value: provider.getPropertyDetailsState.data!.real_estate_property_land),
                          rowGrey(context: context,title: "  :نوع العقارات",value: provider.getPropertyDetailsState.data!.propertyType),

                          rowGrey(context: context,title: ":حاله العقار",value: provider.getPropertyDetailsState.data!.propertyStatus),
                          rowWhite(context: context,title: ":الغرف",value: provider.getPropertyDetailsState.data!.bedrooms),
                          rowGrey(context: context,title: ":الحمامات",value: provider.getPropertyDetailsState.data!.bathrooms),
                          GestureDetector(
                           onTap: (){
                             final validationService = Provider.of<PropertyProvider>(
                                 context, listen: false);
                             validationService.openMap(provider.getPropertyDetailsState.data!.address);
                           },
                            child: new Row(children: [
                              new Icon(Icons.location_on,color: Colors.deepOrange,),
                              textGlobalOrangeBold14(context: context,text: " فتح عن طريق خرائط جوجل ")
                            ],),
                          ),
                          rowWhite(context: context,title: "العنوان",value:provider.getPropertyDetailsState.data!.address),
                          rowWhite(context: context,title: "الدوله",value: provider.getPropertyDetailsState.data!.country),
                          rowWhite(context: context,title: "المحافظه",value: provider.getPropertyDetailsState.data!.propertyState),
                          rowWhite(context: context,title: "المدينه",value: provider.getPropertyDetailsState.data!.propertyCity)
                        ],),


                      ),),
                    );


                  }else{
                    return progress();

                  }}) ,
          ),
      ),
        ),
    );
  }

  Future<Null> _refreshLocalGallery() async{
    init();
    print('refreshing stocks...');

  }
}

Widget showIcon({required BuildContext context,text,icon}){
 return new Row(mainAxisAlignment: MainAxisAlignment.center ,children: [new Icon(icon,color:amber,),
    new Column(children: [SizedBox(height: 15,),
      textGlobalGreyBold13(context: context,text: text),
    ],),

  ],);
}
Widget showFasel(){
 return Container(decoration:BoxDecoration( border: Border.all(color: Colors.grey.shade100),
      color: Colors.grey.shade100),child: SizedBox(height: 55,width: .5,),);
}

Widget rowWhite({required BuildContext context,title,value}){
 return Row(textDirection: TextDirection.rtl,children: [
    new Expanded(flex: 1,child:
    Container(color: Colors.white,child: new Center(child:
    textGlobalGreyBold13(context: context,text:title)))),
    new Expanded(flex: 3,child: Container(color: Colors.white,child:
    new Center(child:textGlobalGreyBold13(context: context,text:value)))),
  ],);
}
Widget rowGrey({required BuildContext context,title,value}){
  return Row(textDirection: TextDirection.rtl,children: [
    new Expanded(flex: 1,child:
    Container(color: offWhite,child: new Center(child:
    textGlobalGreyBold13(context: context,text:title)))),
    new Expanded(flex: 3,child: Container(color: offWhite,child:
    new Center(child: textGlobalGreyNormal13(context: context,text:value)))),
  ],);
}



Widget bodyScreen({required BuildContext context}){
  final validationService = Provider.of<Fav>(
      context, listen: false);
  return Consumer<PropertyProvider>(
      builder: (context, provider, child) {
    if (provider.getPropertyDetailsState.hasData) {
      return  Container(color: Colors.white,child: SingleChildScrollView(
        padding: EdgeInsets.only(left: 10,right: 10),
        child: Column(textDirection: TextDirection.ltr,children: [
          sizedBoxGlobalHeight10(),
          provider.getPropertyDetailsState.data!.gallery.length!=0?
          imageShow(image: provider.getPropertyDetailsState.data!.gallery,network: false,feature: provider.getPropertyDetailsState.data!.avaiable_featured_property ):new Icon(Icons.home,size: 50,color: Colors.deepOrange,)
          ,
          sizedBoxGlobalHeight10(),
          textPriceGlobal2514(context: context,text: provider.getPropertyDetailsState.data!.price),
          Directionality(
          textDirection: TextDirection.rtl
          ,child: new Row(textDirection: TextDirection.rtl,children: [
              sizedBoxGlobalWidth10(),
        SizedBox(width:MediaQuery.of(context).size.width-30 ,child:   textGlobalGreyNormal13(context: context,text: provider.getPropertyDetailsState.data!.title)),
            ],),
          ),
          new Divider(),
          new Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
            connectWithClients(context:context,phone:"0120550000000000"),
            iconButtonFavourite(() async {

            var response =await validationService.addAndDeleteFav( provider.getPropertyDetailsState.data!.id,false);
             displaySnackBar(context,response.toString());
            }),
          ],),
          new Divider(),
          new Row(textDirection: TextDirection.rtl,children: [
            new Image.asset(logo,width: 50,height: 50,),
            sizedBoxGlobalWidth10(),
            textGlobalGreyNormal13(context: context,text: provider.getPropertyDetailsState.data!.agent),
          ],),
          sizedBoxGlobalHeight10(),
          new Row(textDirection: TextDirection.rtl,children: [
            new Expanded(flex: 1,child:
            Container(color: Colors.deepOrange,child: new Center(child: textGlobalWhiteNormal16(context: context,text: "نظره عامه")))),
            new Expanded(flex: 3,child: Container(color: Colors.black,child: new Center(child: textGlobalWhiteNormal16(context: context,text: "تواصل مع الوكيل"
                "")))),
          ],),
          sizedBoxGlobalHeight10(),
          rowGrey(context: context,title: ":رقم العقار",value: provider.getPropertyDetailsState.data!.id),
          rowWhite(context: context,title: " :الحمامات",value: provider.getPropertyDetailsState.data!.bathrooms),
          rowGrey(context: context,title: ":السعر",value: provider.getPropertyDetailsState.data!.price),
          rowWhite(context: context,title: " :الحجم",value: ""),
          rowGrey(context: context,title: "  :نوع العقارات",value: provider.getPropertyDetailsState.data!.propertyType),
          rowWhite(context: context,title: ": المساحه",value: ""),
          rowGrey(context: context,title: ":حاله العقار",value: provider.getPropertyDetailsState.data!.propertyStatus),
          rowWhite(context: context,title: ":الغرف",value: provider.getPropertyDetailsState.data!.bedrooms),
          rowGrey(context: context,title: ":الحمامات",value: provider.getPropertyDetailsState.data!.bathrooms),
          new Row(children: [
            new Icon(Icons.location_on,color: Colors.deepOrange,),
            textGlobalOrangeBold14(context: context,text: " فتح عن طريق خرائظ جوجل ")
          ],),
          rowWhite(context: context,title: "العنوان",value:""),
          rowWhite(context: context,title: "الدوله",value: provider.getPropertyDetailsState.data!.country),
          rowWhite(context: context,title: "المحافظه",value: provider.getPropertyDetailsState.data!.propertyState),
          rowWhite(context: context,title: "المدينه",value: provider.getPropertyDetailsState.data!.propertyCity)
        ],),


      ),);    


    }else{
      return Center(
        child: CircularProgressIndicator(
          backgroundColor: blueDark,
          color: blueDark,


        ),
      );
      
    }});


  
}

