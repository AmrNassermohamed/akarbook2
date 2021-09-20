import 'package:akarbook/Components/boottomSeetLooksups.dart';
import 'package:akarbook/Components/navgaite.dart';
import 'package:akarbook/Models/searchModels.dart';
import 'package:akarbook/WidgetGlobel/globalButton.dart';
import 'package:akarbook/WidgetGlobel/sizedBoxGlobal.dart';
import 'package:akarbook/WidgetGlobel/textField.dart';
import 'package:akarbook/WidgetGlobel/textGlobal.dart';
import 'package:akarbook/color.dart';
import 'package:akarbook/googlemapcamera.dart';
import 'package:akarbook/provider/PropretyProvider.dart';
import 'package:akarbook/provider/SearchProvider.dart';
import 'package:akarbook/provider/UserProvider.dart';
import 'package:akarbook/screens/PropertyList/index.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import '../bottomNagationBar.dart';

class Search extends StatefulWidget {

  @override
  SearchListState createState() => SearchListState();
}
class SearchListState extends State<Search> {
  TextEditingController controllerName = new TextEditingController();
  RangeLabels labels = RangeLabels(1.toString(), 2.toString());

//  late RangeValues values ;

  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }
  late Position pos;

  init() async {
    final validationService = Provider.of<UserProvider>(
        context, listen: false);
  pos = await validationService.determinePosition();
  }


  RangeValues values = RangeValues(150.toDouble(), 200.toDouble());
  TextEditingController controllerSearch=new TextEditingController();
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
bottomNavigationBar: bottomNavigationBar(context,3),
      appBar: AppBar(
        backgroundColor: blueDark,
        leading: GestureDetector(onTap: () {
          Navigator.of(context).pop();
        }, child: new Icon(Icons.arrow_back)),
        centerTitle: true,
        title: new Padding(padding: EdgeInsets.all(10), child:
        textGlobalWhiteBold14(context: context, text: "بحث عقارات")),
        actions: [
          SizedBox(width: 10,),
          Padding(padding: EdgeInsets.only(right: 10),
              child: new Icon(Icons.search)),
        ],
      ),
      body: ModalProgressHUD(
        inAsyncCall: Provider
            .of<SearchProvider>(context)
            .progress,
        child: SingleChildScrollView(
          child: new Container(color: Colors.white,
            child: Column(children: [
              new Padding(padding: EdgeInsets.all(10),
                  child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: RaisedButton(

                              onPressed: () async {
                                final validationServiceSearch = Provider.of<SearchProvider>(context,listen: false);
                                try {
  final validationService = Provider.of<PropertyProvider>(
      context, listen: false);

  validationServiceSearch.progress=true;
  validationServiceSearch.notifyListeners();
  validationService.paged = 1;
  validationService.onLoadMore.clear();
 validationService.define= "&property_status=${SearchModel.types[SearchModel.type]
     .toString()}&property_type=${SearchModel.typeId}&"
     "property_state=${SearchModel.stateId}&&lat=${pos.latitude}&lng=${pos
     .longitude}&distance=8000&country=${SearchModel
     .countryId}&property_city=${SearchModel
     .cityId}&start_price=${SearchModel.rangStart}&end_price=${SearchModel
     .rangEnd}&keywords=${controllerSearch.text}".replaceAll("\\s", "");

  await validationService.getPropertyList();

  List <Marker> marker = [];
  if (validationService.getListPropertyState.hasData == true) {
    for (int i = 0; i < validationService.getListPropertyState.data!.length; i++) {
      marker.add(new Marker(markerId: MarkerId(
          "${validationService.getListPropertyState.data![i].id.toString()}"),
        position: LatLng(
            double.parse(validationService.getListPropertyState.data![i].lat),
            double.parse(validationService.getListPropertyState.data![i].long)),

        infoWindow: InfoWindow(
         onTap: (){
           navPropertyDetails(context: context,id:validationService.getListPropertyState.data![i].id,name:validationService.getListPropertyState.data![i].title );
         },
          title: "${validationService.getListPropertyState.data![i].title +"    "  + validationService.getListPropertyState.data![i].price + " "+  " jd"}",),));
    }

    validationServiceSearch.progress=false;
    validationServiceSearch.notifyListeners();
    print(marker);
    await Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
        GoogleMapCamera(
          marker: marker, lat: pos.latitude, long: pos.longitude,)));
  }
}catch(ex){

  validationServiceSearch.progress=false;
  validationServiceSearch.notifyListeners();
  throw ex;
}
                              },
                              color: blueDark,
                              padding: EdgeInsets.all(10),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0)),
                              child: Padding(padding: EdgeInsets.only(
                                  left: 10, right: 10),
                                child: textGlobalWhiteBold14(
                                    context: context, text: "البحث بالخريطه"),
                              )),
                        ),

                        SizedBox(width: 10,),
                        Expanded(child:
                        RaisedButton(
                            onPressed: () {},
                            color: Colors.deepOrange,
                            padding: EdgeInsets.all(10),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0)),
                            child: Padding(padding: EdgeInsets.only(
                                left: 10, right: 10), child:
                            textGlobalWhiteBold14(context: context,
                                text: "بحث مخصص"),
                            ))),


                      ])),

              textGlobalDarkBlueBold20(context: context, text: "بحث مخصص"),
              new Padding(padding: EdgeInsets.all(10),
                  child: new Container(
                    color: Colors.black, child: new Column(children: [
                    Center(child: rowButton(context)),

                    option(context: context,
                        title: SearchModel.statusTitle,
                        url: "property_type.php",
                        index: 0),
                    option(context: context,
                        title: SearchModel.countryTitle,
                        index: 1,
                        url: ""),
                    option(context: context,
                        title: SearchModel.stateTitle,
                        index: 2,
                        url: "property_state.php?country=${SearchModel
                            .countryId}"),
                    option(context: context,
                        title: SearchModel.cityTitle,
                        url: "property_city.php?state=${SearchModel.stateId}",
                        index: 3),
                    option(context: context,
                        title: SearchModel.numberOfRoomsTitle,
                        url: "",
                        index: 4),

sizedBoxGlobalHeight10(),
                    textFieldSearch(),
                    sizedBoxGlobalHeight10(),
                    Padding(
  padding: EdgeInsets.only(left: 30,right: 10),
  child:   new Row(mainAxisAlignment: MainAxisAlignment.end,children: [
  Directionality(textDirection: TextDirection.rtl,child:
    textGlobalGreyBold16(context: context,text: "السعر من [0 JD 200000  JD ]"))
  ],),
),


                    Padding(
                      padding: EdgeInsets.all(5),
                      child: RangeSlider(

                        min: 1.toDouble(),
                        max: 200.000.toDouble(),
                        activeColor: deepOrange,
                        values: values,
                        divisions: 60,

                        inactiveColor: Colors.grey.shade100,
                        labels: labels,
                        onChanged: (value) {
                          print(
                              'START: ${value.start}, END: ${value.end}');
                          setState(() {
                            values = value;
                        SearchModel.rangStart=value.start.toInt().toString();
                        SearchModel.rangEnd=value.end.toInt().toString();
                            labels = RangeLabels(
                                '${value.start.toInt().toString()}',
                                '${value.end.toInt().toString()}');
                          });
                        },
                      ),
                    ),



                  searchButton(),
                    SizedBox(height: 10,)
                  ],),)),

            ],),
          ),
        ),
      ),
    );
  }


  Widget option({required BuildContext context, title, url, index}) {
    final validationService = Provider.of<SearchProvider>(
        context, listen: false);
    return GestureDetector(
      onTap: () async {
        await validationService.getLooksUps(urlSuffix: url, index: index);

        if (validationService.searchState.hasData == true) {
          bottomSheetLooksUpFilter(context: context, title: title, pos: index);
        }
      },
      child: Center(
        child:

        Container(

          width: MediaQuery
              .of(context)
              .size
              .width - 100,

          margin: const EdgeInsets.all(5.0),

          padding: const EdgeInsets.all(10.0),

          decoration: BoxDecoration(

              border: Border.all(color: Colors.grey)

          ),

          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [

            new Icon(Icons.keyboard_arrow_down_sharp, color: Colors.grey,),

            textGlobalGreyNormal13(context: context,

                text: title),

          ],),

        ),


      ),
    );
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
});
  }
  searchButton(){
  return  GestureDetector(
    onTap: (){
      searchButtonCallBack();
    },
    child: Padding(padding: EdgeInsets.only(left: 10,right: 10),
          child: Row(children: [
            new Container(width: 70,
              padding: EdgeInsets.all(10),
              color: deepOrange,
              child: new Row(children: [
                textGlobalWhiteBold14(
                    context: context, text: "بحث"),
                SizedBox(width: 2,),
                new Icon(
                  Icons.search, size: 15, color: Colors.white,),
              ],),)
          ],)),
  );
  }
  searchButtonCallBack(){
    final validationService = Provider.of<PropertyProvider>(context,listen: false);
    validationService.paged=1;
    print(SearchModel.keyWord);
    validationService.onLoadMore.clear();
    validationService.getDefine(agency: "",text: controllerSearch.text,status: SearchModel.types[SearchModel.type].toString(),typeId: SearchModel.typeId,stateId:SearchModel.stateId,type: SearchModel.typeId,startPrice: SearchModel.rangStart , countryId:SearchModel.countryId,endPrice: SearchModel.rangEnd,cityId: SearchModel.cityId, );
 validationService.title=SearchModel.types[SearchModel.type].toString();
    gotoListProperty(context: context, searchOrNot: true);

  }

  textFieldSearch(){
  return  Container(
      width: MediaQuery
          .of(context)
          .size
          .width - 100,
        decoration: new BoxDecoration(
            color: Colors.black,
            //new Color.fromRGBO(255, 0, 0, 0.0),

            border: Border.all(color: Colors.grey)
        ),

        child: TextField(
controller: controllerSearch,

          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
          onSubmitted: (value) {
SearchModel.keyWord=value;
          },
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(


            suffixIcon: IconButton(
              padding: EdgeInsets.only(left: 10),
              icon: Icon(
                Icons.search, size: 18, color: Colors.grey,),
              onPressed: () => print("clear"),
            ),

            //prefixIcon:Icon( Icons.search),
            hintText: "موضوع البحث",
            fillColor: Colors.white,
            hintStyle: GoogleFonts.tajawal(
              color: Colors.grey[500],
              fontSize: 12.0,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: Colors.white, width: 2.0),
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),

    );

  }

}