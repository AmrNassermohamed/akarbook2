import 'package:akarbook/Components/navgaite.dart';
import 'package:akarbook/Data/FavData.dart';
import 'package:akarbook/Models/HomePageModel.dart';
import 'package:akarbook/WidgetGlobel/ImageNetwork.dart';
import 'package:akarbook/WidgetGlobel/globalButton.dart';
import 'package:akarbook/WidgetGlobel/iconButton.dart';
import 'package:akarbook/WidgetGlobel/progress.dart';
import 'package:akarbook/WidgetGlobel/sizedBoxGlobal.dart';
import 'package:akarbook/WidgetGlobel/textGlobal.dart';
import 'package:akarbook/color.dart';
import 'package:akarbook/provider/PropretyProvider.dart';
import 'package:akarbook/provider/UserProvider.dart';
import 'package:akarbook/screens/HomePage/textfieldSearch.dart';
import 'package:akarbook/screens/HomePage/typescomponents.dart';
import 'package:akarbook/screens/PropertyList/index.dart';
import 'package:akarbook/screens/RealEstateServices/RealEstateServices.dart';
import 'package:akarbook/screens/propertyDetails/index.dart';
import 'package:akarbook/screens/sharedprefence.dart';
import 'package:akarbook/services/services_handler.dart';
import 'package:basic_utils/basic_utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:provider/provider.dart';
import '../../navgationDrawer.dart';
import '../bottomNagationBar.dart';
class MainPage extends StatefulWidget {
  @override
MainPageState createState() => MainPageState();
}
class MainPageState extends State<MainPage>with SingleTickerProviderStateMixin {
  @override
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

TextEditingController controller=TextEditingController();
  int x=0;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
init();
  }


  Future<void> setupInteractedMessage() async {
    // Get any messages which caused the application to open from
    // a terminated state.
    RemoteMessage? initialMessage =
    await FirebaseMessaging.instance.getInitialMessage();

    // If the message also contains a data property with a "type" of "chat",
    // navigate to a chat screen

    if (initialMessage != null) {
      handleMessage(initialMessage);
    }


    // Also handle any interaction when the app is in the background via a
    // Stream listener
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  }


  void handleMessage(RemoteMessage message) {
   print(message.data["property_id"]);
   if(message.data["property_id"]!=null){
     Navigator.of(context).push(
         MaterialPageRoute(builder: (context) =>
             PropertyDetails(
               id:int.parse( message.data["property_id"]),name: "تفاصيل العقار",)));
   }
  }


  @override
  void dispose(){
    controller.dispose();
  }
init() async {



 //FavData().getAndUpdateFavData("0b6f4a26533c2103495b4220c5d6bb82810e3881");
  /*final validationService = Provider.of<PropertyProvider>(context,listen: false);
  final validationServiceUser = Provider.of<UserProvider>(context,listen: false);
  await validationService.getPropertyStatus(index: 1);
  String? token=await SharedPreferenceHandler.getToken();
  if(token!=null){
await    validationServiceUser.getUserDetails(token: token);
  }*/
  setupInteractedMessage();
}


  Widget build(BuildContext context) {
    final validationService = Provider.of<PropertyProvider>(context,listen: false);
    // TODO: implement build
    final TextTheme textTheme = Theme.of(context).textTheme;
    List<String> x= ["للإيجار","للبيع","للإستثمار"];
    return new Scaffold(
      bottomNavigationBar: bottomNavigationBar(context,0),
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        appBar: new AppBar(
          elevation: 0.0,
          bottomOpacity: 0.0,
      backgroundColor: blueDark,
          centerTitle: true,
          title: new Image.asset("assets/logoFinal.png",width: 100,height: 50,),
          leading:      iconButtonWhite((){
            _scaffoldKey.currentState!.openDrawer();
          }),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(top: 10),
              color: blueDark,
              child: Column(
                children :[
              Consumer<PropertyProvider>(
              builder: (context, provider, child) {
             return   new Row
               (mainAxisAlignment: MainAxisAlignment.center,children: [

                  for(int i=0;i<3;i++)
                    RaisedButton(
                        onPressed: () {

                          validationService.changeIndexButton(i);
                        validationService.getPropertyStatus(index: i);
                          },
                        color:validationService.indexButton==i?Colors.white: Colors.deepOrange,
                        shape: RoundedRectangleBorder(

                            borderRadius: BorderRadius.circular(0)),
                        child:Padding(padding: EdgeInsets.only(left: 5,right: 5),child:
                        textGlobalBlackNormal13(context:context,text:x[i]),
                        )),
                ],);
              }),

              Consumer<PropertyProvider>(
                  builder: (context, provider, child) {
                  return  SizedBox(height: 290, child: Container(
                      color: Colors.white,
                      child: loadPage()
                    ));

                  }),
                  centerTitle(),
                  typeComponents(context:context),

              ]),


              ),
          ),
          ),

drawer:  Theme(
          data: Theme.of(context).copyWith(
        // Set the transparency here
        canvasColor: blueDark.withOpacity(.5), //or any other color you want. e.g Colors.blue.withOpacity(0.5)
      ),
        child: NavigationDrawer()
    ),

    );
  }

Widget centerTitle(){
  final validationService = Provider.of<PropertyProvider>(
  context, listen: false);

    return Container(
    color: Colors.grey[100],
    padding: EdgeInsets.only(left: 10,right: 10,top: 10),
    child:   new Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
      Padding(padding: EdgeInsets.only(right: 10),child:
  buttonTextWithRadiusOffWhite(context: context,onClick: (){
    validationService.getDefine(agency: "",typeId:"",text: "",status: "",type: "",cityId: "",countryId: "",endPrice: "",orderByDate: "",orderByPrice: "",startPrice: "",stateId: "");
  validationService.title="عرض الكل";
    gotoListProperty(context: context,searchOrNot: false);
  },type: "عرض الكل")),
      buttonTextWithRadiusOrange(context: context,onClick: (){
  navPackage(context);
  },type: "ميز عقارك"),
      textGlobalBlackBold13(context: context,text:"أهم الاقسام"),
    ],),
  );
}



  Widget loadPage(){
    return Consumer<PropertyProvider>(
        builder: (context, provider, child) {
          if (provider.getPropertyListHome.hasData) {
            return bodyScreen(property:  provider.getPropertyListHome.data!,index: provider.indexButton);
          }
          else{
           return progress();
          }
        });
  }
Widget bodyScreen({required List <Property> property,index}){
  return Container(
    child: Column(
      children: [
        SingleChildScrollView(
          child: new Container(color: blueDark,
              child: Column(children: [
                new SizedBox(height: 10,),
           textFieldSearch(controller, index,context),
                SizedBox(height: 50,),
              ]
              )

          ),
        ),

        Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            height: 100,
            child: Padding(
                padding: const EdgeInsets.only(left: 10.0, bottom: 10.0),
                child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        top: -40,
                        left: 0,
                        child: Container(

                          width: MediaQuery.of(context).size.width,
                          height: 200,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            physics: BouncingScrollPhysics(),
                            children: property.map((category) => GestureDetector(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                                  PropertyDetails(id:category.id,name: category.title,)));
                            }
                            ,  child: Container(
                                decoration: new BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                margin: const EdgeInsets.only(right: 20.0),
                                width: 200,
                                child: Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: Column(
                                    children: [
                                //      new SizedBox(height: 100,width: 200,child: new Image.network(category.attachmentUrl,width: 200,fit: BoxFit.fill,)),
                                      new SizedBox(height: 100,width: 200,child:CachedNetworkImage(
                                        imageUrl:category.attachmentUrl,
                                    imageBuilder: (context,image)=>Container(width: 200,  decoration: BoxDecoration(

                                      image: DecorationImage(
                                          image: image, fit: BoxFit.fitWidth),
                                    ),
                                        child: new Column(children: [
                                            sizedBoxGlobalHeight20(),
                                      category.avaiable_featured_property.toString()==1.toString()?            Row(
                                            textDirection: TextDirection.rtl,
                                            children:[new Container(decoration: BoxDecoration(color:
                                            Colors.deepOrange,borderRadius: BorderRadius.all(Radius.circular(5.0)) ),
                                                child:Padding(padding: EdgeInsets.only(left: 30,right:30,)
  ,child:textGlobalWhiteBold14(context: context,text: "مميز",),)),
                                            ]):SizedBox(),
                                            ])),
                                      placeholder: (context, url) => CircleAvatar(
                                          backgroundColor: Colors.white,
                                          child: CircularProgressIndicator(
                                            color: Colors.orange,
                                            strokeWidth: 10,
                                          ),
                                        ),
                                        errorWidget: (context, url, error) => Icon(Icons.home,color: Colors.deepOrange,size: 45,),
                                        fit: BoxFit.fill,
                                        height:100 ,
                                        width: 200,
                                      )),
                                      Expanded(
                                        child: new Container(decoration: BoxDecoration(
                                            color: Colors.white
                                        ),
                                          child: Column(children: [
                                            new Row(
                                              children: [
                                                new SizedBox(height: 30,),
                                                new Center(child:   SizedBox(width: 200,child:Center(child:
                                                textGlobalGreyNormal13(context: context,text: category.title)))),

                                              ],
                                            ),
                                            new Row(children: [
                                              new Padding(padding: EdgeInsets.only(left: 10.0),
                                                  child:textGlobalBlackBold16(context: context,text:
                                                  category.price)),
                                              new Padding(padding: EdgeInsets.only(left: 3.0),child:textGlobalOrangeBold14(context: context,text:"JD"))
                                            ],),

                                            InkWell(
                                             onTap: (){
                                               navAgentDetails(context: context,id:category.realEstatePropertyAgent,name:category.agent);
                                             },
                                              child: new Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  textGlobalGreyNormal13(context: context,text: category.agent
                                                  ),
                                                  new Icon(Icons.person,color: Colors.orange.shade700,),


                                                ],),
                                            )
                                          ],),
                                        ),
                                      ),
                                      new SizedBox(height: 10,)
                                    ],
                                  ),
                                ),
                              ),
                            ))
                                .toList(),
                          ),
                        ),
                      ),
                    ]))),
        new SizedBox(height: 50,),


      ],
    ),
  );
}
}

