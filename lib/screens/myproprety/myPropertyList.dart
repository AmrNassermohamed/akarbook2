import 'dart:io';
import 'package:akarbook/Components/bottomSheetCamera.dart';
import 'package:akarbook/Components/iconWithtextGlobal.dart';
import 'package:akarbook/Components/imageAgentGlobal.dart';
import 'package:akarbook/Components/navgaite.dart';
import 'package:akarbook/Components/textPiceGlobal.dart';
import 'package:akarbook/Models/HomePageModel.dart';
import 'package:akarbook/Models/searchModels.dart';
import 'package:akarbook/WidgetGlobel/AppBarGlobal.dart';
import 'package:akarbook/WidgetGlobel/globalButton.dart';
import 'package:akarbook/WidgetGlobel/progress.dart';
import 'package:akarbook/WidgetGlobel/textGlobal.dart';
import 'package:akarbook/provider/SearchProvider.dart';
import 'package:akarbook/provider/UserProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import '../../color.dart';
import '../../navigationbar.dart';
import 'addproprety.dart';
class MyPropertyList extends StatefulWidget {
  @override
  MyPropertyListState createState() => MyPropertyListState ();
}
class MyPropertyListState extends State<MyPropertyList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  init() {
    final validationService = Provider.of<UserProvider>(
        context, listen: false);
    validationService.getMyPro();
  }
  onPop(){
    return;

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build


    return WillPopScope(
      onWillPop: onPop(),
      child: ModalProgressHUD(
          progressIndicator: progress(),
        inAsyncCall:Provider.of<UserProvider>(context).progress,
        child: Scaffold(
          floatingActionButton: new CircleAvatar(backgroundColor: Colors.deepOrange,
            child: new IconButton(onPressed:(){

           buttonAdd();

            }, icon:Icon ( Icons.add,color: Colors.white,)),),
          body: listFav(context),
          backgroundColor: Colors.white,
          appBar: appBarGlobal(context: context,text:"عقاراتي"),
        ),
      ),
    );
  }
  Future<Null> _refreshLocalGallery() async{
    init();
    print('refreshing stocks...');

  }


Widget listFav(BuildContext context){
    final validationServiceSearch = Provider.of<SearchProvider>(
        context, listen: false);
    return Consumer<UserProvider>(
        builder: (context, provider, child) {
          if (provider.listMyProsGeneralState.hasData) {
            return   RefreshIndicator(
              onRefresh:_refreshLocalGallery,
              child: ListView.builder(
                  padding: EdgeInsets.all(10),
                  itemCount: provider.listMyProsGeneralState.data!.length,
                  itemBuilder: (BuildContext context, int index){
                    return GestureDetector(
                      onTap: () async {
   //
// SearchModel.rangStart=provider.listMyProsGeneralState.data![index].price;
                        navPropertyDetails( context:context,id: provider.listMyProsGeneralState.data![index].id,name:provider.listMyProsGeneralState.data![index].title  );
                      },
                      child: new Padding(padding: EdgeInsets.only(left:10,bottom: 10,right: 10,),
                          child:  new Container(

                            padding: EdgeInsets.only(top: 0,left: 0,right: 0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10)
                                ),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(0, 3)
                                  ),
                                ]),
                            child:   Padding(
                              padding: EdgeInsets.all(0)
                              ,child:
                            new Row(
                              children: [
                                //returnImage2(context,"assets/images/group12_2020-12-22/group122.png","",30.0,-20.0,20.0),
                                Expanded(
                                  child: new Column(

                                      children: [


                                        new Row(children: [
                                          Expanded(child:Directionality(textDirection: TextDirection.rtl,
                                              child: textGlobalGreyBold13Lines(context: context,text:provider.listMyProsGeneralState.data![index].title)) ),
                                        ],),


                                        iconWithTextOwner(context: context,text:provider.listMyProsGeneralState.data![index].agent ),
                                        textPriceGlobal14(context: context,text: provider.listMyProsGeneralState.data![index].price),
                                     SizedBox(height: 10,),
                         Padding(
                           padding: EdgeInsets.all(5),
                           child: new Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                             CircleAvatar(backgroundColor: Colors.deepOrangeAccent,child: new IconButton(onPressed: (){
                               buttonEdit(provider.listMyProsGeneralState.data![index]);
                             }, icon: Icon(Icons.edit,size: 25,color: Colors.white,))),
                             CircleAvatar(backgroundColor: Colors.deepOrangeAccent,child: new IconButton(onPressed: (){
                               //buttonEdit(provider.listMyProsGeneralState.data![index]);
                               provider.deleteMyProperty(provider.listMyProsGeneralState.data![index].id);

                             }, icon: Icon(Icons.delete,size: 25,color: Colors.white,))),

                           ],),
                         ),

                                      SizedBox(height: 10,)
                                      ]
                                  ),


                                ),

                                new SizedBox(width: 10,),
                                GestureDetector(
                                  onTap: (){

                                  },
                                  child: new Container(
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(provider.listMyProsGeneralState.data![index].attachmentUrl),
                                            fit: BoxFit.cover),

                                        borderRadius: BorderRadius.only( topRight:Radius.circular(15.0),
                                            bottomRight: Radius.circular(10.0)

                                        )              ),
                                    child: SizedBox(height: 180,width: 140),
                                  ),
                                ),
                              ],
                            ),



                              //  new Image.asset(image);
                            ),


                          )),
                    );

                  }),
            );
          }else{

            return progress();

          }
        });

  }


  sheetGlobalNotHavePackage(){

    return bottomSheetGlobal(context: context, height: MediaQuery.of(context).size.height*.55,body:

    Container(


        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:BorderRadius.all(Radius.circular(25.0)) ,
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
                children: [
                  new Padding(padding: EdgeInsets.all(10)),
                  // new SizedBox(height: 10,),
                  new Image.asset("assets/UserServices${1.toString()}.png"),
                  new SizedBox(height: 20,),
                  textGlobalBlackBold13(context: context,text: "يمكنك الاشتراك في احدي الباقات لاضافه عقار  "),
                  globalButtonOrange(callback: (){
                    navPackage(context);
                  },title: "اشترك باحدي الباقات"),
                ]),
          ),
        )
    ));
  }
buttonAdd(){
  final validationServiceUserProvider = Provider.of<UserProvider>(context, listen: false);
      if(validationServiceUserProvider.userProviderGeneralState.hasData){
       if(validationServiceUserProvider.userProviderGeneralState.data!.package==0) {
sheetGlobalNotHavePackage();

       }else {
       String total=validationServiceUserProvider.userProviderGeneralState.data!.availableProperty.toString();

       if(total!=0.toString()){
         Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
             Add(add: true,)));
       }else{
         sheetGlobalNotHavePackage();
       }
       }
      }
}


  buttonEdit(Property property) async {
  final validationServiceSearch = Provider.of<SearchProvider>(
      context, listen: false);
    try {


validationServiceSearch.progress=true;
validationServiceSearch.notifyListeners();
     /* if (property.attachmentUrl.length > 0) {
        validationServiceSearch.mainImage =
        await validationServiceSearch.fileFromImageUrl(
            Uri.parse(property.attachmentUrl));
      }
      if (property.gallery.length > 0) {
        for (int i = 0; i <
            property.gallery.length; i++) {
          var x = await validationServiceSearch.fileFromImageUrl(Uri.parse(
              property.gallery[i]));
          validationServiceSearch.gallery.add(x);
        }
      } else {
        validationServiceSearch.gallery.clear();
      }*/

      SearchModel.country = property.country;
      SearchModel.city = property.propertyCity;
      SearchModel.state = property.propertyState;
      SearchModel.price = property.price;
      SearchModel.title = property.title;
      SearchModel.propertyId=property.id;
      SearchModel.address = "";

      validationServiceSearch.progress=false;
      validationServiceSearch.notifyListeners();
      Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
          Add(add: false,)));
    }catch(ex){
      validationServiceSearch.progress=false;
      validationServiceSearch.notifyListeners();
      throw ex;
    }
    }


}








