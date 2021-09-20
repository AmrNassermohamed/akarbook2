
import 'dart:io';
import 'package:akarbook/Components/boottomSeetLooksups.dart';
import 'package:akarbook/Components/bottomSheetCamera.dart';
import 'package:akarbook/Components/displaysnackBar.dart';
import 'package:akarbook/Components/navgaite.dart';
import 'package:akarbook/Models/searchModels.dart';
import 'package:akarbook/Models/userModels.dart';
import 'package:akarbook/WidgetGlobel/globalButton.dart';
import 'package:akarbook/WidgetGlobel/sizedBoxGlobal.dart';
import 'package:akarbook/WidgetGlobel/textField.dart';
import 'package:akarbook/WidgetGlobel/textGlobal.dart';
import 'package:akarbook/constants.dart';
import 'package:akarbook/provider/PropretyProvider.dart';
import 'package:akarbook/provider/SearchProvider.dart';
import 'package:akarbook/provider/UserProvider.dart';
import 'package:akarbook/screens/myproprety/myPropertyList.dart';
import 'package:akarbook/screens/propertyDetails/Components/imageSlideShow.dart';
import 'package:akarbook/screens/userServices/userServices.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import '../../assets.dart';
import '../../color.dart';

class Add extends StatefulWidget {
late bool add;

  Add({required this.add});
  @override
  AddState createState() => AddState ();
}

class AddState extends State<Add> {
  TextEditingController controllerName=new TextEditingController();
  TextEditingController controllerMoney=new TextEditingController();
  TextEditingController controllerPhone=new TextEditingController();
  TextEditingController controllerAddress=new TextEditingController();
  TextEditingController controllerNumberHome=new TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose

    controllerPhone.dispose();
    controllerAddress.dispose();
    controllerName.dispose();
    controllerMoney.dispose();
    controllerNumberHome.dispose();
    super.dispose();
  }
  late  UserModels userModels;
  @override
  void initState() {
    // TODO: implement initState
    final validationService = Provider.of<PropertyProvider>(
        context, listen: false);
    final validationServiceSearch = Provider.of<SearchProvider>(
        context, listen: false);
  if(widget.add==true){
    validationServiceSearch.gallery.clear();
    validationServiceSearch.mainImage=null;
    controllerName.clear();
    controllerAddress.clear();
    controllerPhone.clear();
    controllerMoney.clear();
    SearchModel.title="";
    SearchModel.state="";
    SearchModel.city="";
    SearchModel.address="";
    SearchModel.orderByDate="";
  }else{
    controllerName.text=SearchModel.title;
    controllerNumberHome.text=SearchModel.realStateIdenitiy;
   controllerMoney.text=SearchModel.price;
   controllerAddress.text=SearchModel.address;
  }

    super.initState();
  }
  Future<bool> _willPopCallback() async {
    // await showDialog or Show add banners or whatever
    // then
    return true; // return true if the route to be popped
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    List x=[];
    final validationService = Provider.of<SearchProvider>(
        context, listen: false);
    return WillPopScope(
      onWillPop: _willPopCallback,
      child: ModalProgressHUD(
        inAsyncCall:Provider.of<SearchProvider>(context).progress ,
        child:   Scaffold(
          appBar:AppBar(
            centerTitle: true,
            backgroundColor: blueDark,
            leading: GestureDetector(onTap: (){
              Navigator.of(context).pop();
            },child: new Icon(Icons.arrow_back)),
            title:    textGlobalWhiteBold14(context: context,text:"اضافه عقار"),
          ),

          body: SingleChildScrollView(
            padding: EdgeInsets.all(10),
            child:   Center(
              child: Container(
                padding: EdgeInsets.all(20),
                child:   Column(mainAxisAlignment: MainAxisAlignment.center,children: [
                  sizedBoxGlobalHeight10(),
                  rowButton(context),
                  textFieldReg(controller: controllerName,text: "اسم العقار ",icon: Icons.home)               ,
                  textFieldReg(controller: controllerMoney,text: "السعر",icon: Icons.money),
                  textFieldReg(controller: controllerNumberHome,text: "رقم العقار",icon: Icons.analytics),
                  sizedBoxGlobalHeight10(),
                  textFieldReg(controller: controllerAddress,text: "العنوان",icon: Icons.add_location),
                  sizedBoxGlobalHeight10(),
                  new Row(mainAxisAlignment: MainAxisAlignment.end,children: [
                    textGlobalGreyBold13(context: context,text: "الصوره الرئيسيه")
                  ],),
                  sizedBoxGlobalHeight10(),
                  validationService.mainImage==null?dottedBorder(false):GestureDetector(onTap: (){
                    bottomSheetGlobal(context: context,body: addCamera(context: context,mainImage: false),height: MediaQuery.of(context).size.height*.25);
                  },child: SizedBox(height: 200,child: Image.file(validationService.mainImage!),)),
                  sizedBoxGlobalHeight10(),
                  new Row(mainAxisAlignment: MainAxisAlignment.end,children: [
                    textGlobalGreyBold13(context: context,text: "معرض الصور")
                  ]),

                  sizedBoxGlobalHeight10(),

               validationService.gallery.length>  0?  GestureDetector(onTap: (){
                 bottomSheetGlobal(context: context,body: addCamera(context: context,mainImage: false),height: MediaQuery.of(context).size.height*.25);
               },child: imageShow(image: validationService.gallery,network: false,feature: "")):dottedBorder(true),
                 new SizedBox(height: 10,),
                  sizedBoxGlobalHeight10(),
                 option(title: "نوع العقار",index: 0,url: urlType,reslut: SearchModel.status),
                  sizedBoxGlobalHeight10(),
                  option(title: "الدوله",index: 1,url: "",reslut: SearchModel.country),
                  sizedBoxGlobalHeight10(),
                  option(title: "المحافظه",index: 2,url: "property_state.php?country=${SearchModel.countryId}",reslut:
                  SearchModel.state),
                  sizedBoxGlobalHeight10(),
                  option(title: "المدينه", url: "property_city.php?state=${SearchModel.stateId}", index: 3,reslut: SearchModel.city),
                    Consumer<UserProvider>(
                        builder: (context, provider, child) {
                          if (provider.userProviderGeneralState.hasData) {
                          return  new Row(mainAxisAlignment: MainAxisAlignment.end,children: [
                            provider.userProviderGeneralState.data!.availableFaeturedProperty!=0.toString()?
                            textGlobalGreyBold16(context: context,text: "عقارك مميز"):
                    textGlobalGreyBold13Lines(context: context,text: "انت غير مشترك في باقه عقار مميز",),

                              Switch(

                              value:provider.userProviderGeneralState.data!.availableFaeturedProperty!=0.toString()?
                              validationService.realEstateFeatured==1?true:false:false,
                              onChanged: (value) async {
                                setState(() {

                                  validationService.changeFeatured(
                                      provider.userProviderGeneralState.data!.availableFaeturedProperty);
                                });

                              },
                              activeTrackColor: offWhite,
                              activeColor: Colors.amber,
                            )
]);
                          }else{
                            return SizedBox();

                          }
                        }),




                  globalButtonOrange(title: "حفظ",callback: () async {


try {
  if (widget.add == true) {
    print(validationService.realEstateFeatured);

    var response = await validationService.addProperty(
      title: controllerName.text,
      realStateIdentiy: controllerNumberHome.text,
      propertyCity: SearchModel.city,
      gallery: validationService.gallery,
      realEstatePropertyCountry: SearchModel.country,
      propertyAddress: controllerAddress.text,
      featured: validationService.mainImage,
      propertyFeatures: validationService
          .realEstateFeatured,
      propertyStatus: SearchModel.statusId,
      propertyState: SearchModel.state,
      price: controllerMoney.text,
      propertyType: SearchModel.typeId,);

    displaySnackBar(context, response.toString());
  } else {
    var response = await validationService.editProperty(

      title: controllerName.text,
      propertyCity: SearchModel.city,
      gallery: validationService.gallery,
      price: controllerMoney.text,
      featured: validationService.mainImage,
      realStateIdentiy: controllerNumberHome.text,
      propertyId: SearchModel.propertyId,
      realEstatePropertyCountry: SearchModel.country,
      propertyAddress: controllerAddress.text,
      propertyFeatures: validationService.realEstateFeatured,
      propertyStatus: SearchModel.statusId,
      propertyState: SearchModel.state,
      propertyType: SearchModel.typeId,);
    displaySnackBar(context, response.toString());
  }
}catch(Ex){
  validationService.progress=false;
  throw Ex;
}




                  }),

                ],),
              ),
            ),
          ),

        ),
      ),
    );
  }

Widget dottedBorder(bool mainImage){
 return GestureDetector(
    onTap: (){
      bottomSheetGlobal(context: context,body: addCamera(context: context,mainImage: mainImage,),height: MediaQuery.of(context).size.height*.25);
    },
    child: DottedBorder(
      // PathBuilder
      color: Colors.black12,
      dashPattern: [8, 4],
      strokeWidth: 1,
      child: Container(
        // width: 100,
        child: new Padding(
            padding: EdgeInsets.all(35),
            child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  new Icon(Icons.add,color: Colors.grey,),
                ])),

        color: white,
      ),
    ),
  );
}

Widget option({title,url,index,reslut}){
 return Column(children: [
   GestureDetector(onTap: () async{
     final validationService = Provider.of<SearchProvider>(
         context, listen: false);
     await validationService.getLooksUps(urlSuffix: url, index: index);

     if (validationService.searchState.hasData == true) {
       bottomSheetLooksUpFilter(context: context, title: title, pos: index);
     }
   },child: new Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
     new Icon(Icons.arrow_back_ios,color: Colors.grey,size: 15,),
     textGlobalGreyNormal13(context: context,text:title ),
   ],)),
   new Row(children: [
     textGlobalGreyNormal13(context: context,text: reslut),
   ],),
 ],);

}

  Widget rowButton(BuildContext context) {
    return new Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      for(int i = 0; i < 3; i++)
        SearchModel.type == i ? globalButtonWhiteRaised(
            context: context, callBack: () {
          callBackRowButton(i);
        }, text: SearchModel.types[i]) :
        globalButtonOrangeRaised(
            text: SearchModel.types[i], context: context, callBack: () {
          callBackRowButton(i);
        })
    ],);
  }

  callBackRowButton(index) {
    setState(() {

      SearchModel.type=index;
   switch(index){
     case 0:
       SearchModel.statusId=37;
       break;
     case 1:
       SearchModel.statusId=38;
       break;
     case 2:
       SearchModel.statusId=90;
       break;
   }
    print(SearchModel.type);
    });
  }

}