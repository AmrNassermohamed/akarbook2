import 'package:akarbook/Components/displaysnackBar.dart';
import 'package:akarbook/Components/navgaite.dart';
import 'package:akarbook/Models/searchModels.dart';
import 'package:akarbook/WidgetGlobel/AppBarGlobal.dart';
import 'package:akarbook/WidgetGlobel/globalButton.dart';
import 'package:akarbook/WidgetGlobel/progress.dart';
import 'package:akarbook/WidgetGlobel/textGlobal.dart';
import 'package:akarbook/color.dart';
import 'package:akarbook/provider/FavProvider.dart';
import 'package:akarbook/provider/PropretyProvider.dart';
import 'package:akarbook/provider/UserProvider.dart';
import 'package:akarbook/screens/Bills/index.dart';
import 'package:akarbook/screens/Login/Regiseter.dart';
import 'package:akarbook/screens/Login/userProfile.dart';
import 'package:akarbook/screens/RealEstateServices/NavgaitetoPage.dart';
import 'package:akarbook/screens/favouriteList/favList.dart';
import 'package:akarbook/screens/getpackage/index.dart';
import 'package:akarbook/screens/myproprety/myPropertyList.dart';
import 'package:akarbook/screens/propertyDetails/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import 'bottomNagationBar.dart';





class  Notification1 extends StatefulWidget {
  @override
  NotificationState createState() => NotificationState ();
}
class  NotificationState extends State< Notification1> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  init() {
    final validationService = Provider.of<PropertyProvider>(
        context, listen: false);
    SearchModel.orderByFeature=desc;
    SearchModel.orderByPrice="";
    validationService.getDefine(agency: "",typeId:"",text: "",status: "",type: "",cityId: "",countryId: "",endPrice: "",
        orderByDate: desc,orderByPrice: "",startPrice: "",stateId: "",);
  validationService.paged=1;

    validationService.getPropertyList();
  }

  onPop() {
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listProperty(context),
      backgroundColor: Colors.white,
      bottomNavigationBar: bottomNavigationBar(context,4),
      appBar: appBarGlobal(context: context,text:"التنبيهات"),
    );    // TODO: implement build

  }
}


/*class Notification extends StatefulWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(bottomNavigationBar:  bottomNavigationBar(context,4),appBar: appBarGlobal(text: "التنبيهات", context:context),body: Container(child: new Center(child: textGlobalOrangeBold14(context: context,text: "لايوجد تنبيهات حاليا"),),),);
  }

}*/




Widget Con(index,BuildContext context,text){
  return  new Container(decoration:
  BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),color: Colors.deepOrangeAccent),
    child: new Center(child:Column(children: [ new Image.asset("assets/UserServices${index.toString()}.png",width: 150,height: 100,),
      textGlobalWhiteBold14(context:context,text: text)
      ,new SizedBox(height: 10,)
    ])),);
}


Widget listProperty(BuildContext context){
  return Consumer<PropertyProvider>(
      builder: (context, provider, child) {
        if (provider.getListPropertyState.hasData) {

          return  ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: provider.getListPropertyState.data!.length,
              itemBuilder: (BuildContext context, int index){

                return   Column(
                  children:[

                    new Divider(),
                    GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) =>
                              PropertyDetails(
                                id: provider.getListPropertyState.data![index].id,
                                    name: provider.getListPropertyState.data![index].title
                                  )));
                    },
                    child: new ListTile(
                      title: textGlobalGreyBold16(text: provider.getListPropertyState.data![index].title,context: context),
                    trailing: new Icon(Icons.notifications_active,color: Colors.deepOrange,),
                    ),

                  ),
                    new Divider()
                ]);

              });



        }else{

          return progress();


        }


      });

}