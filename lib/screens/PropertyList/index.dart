import 'package:akarbook/Components/boottomSeetLooksups.dart';
import 'package:akarbook/Components/navgaite.dart';
import 'package:akarbook/WidgetGlobel/AppBarGlobal.dart';
import 'package:akarbook/WidgetGlobel/progress.dart';
import 'package:akarbook/WidgetGlobel/sizedBoxGlobal.dart';
import 'package:akarbook/WidgetGlobel/textGlobal.dart';
import 'package:akarbook/provider/PropretyProvider.dart';
import 'package:akarbook/provider/SearchProvider.dart';
import 'package:akarbook/screens/propertyDetails/index.dart';
import 'package:basic_utils/basic_utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:money2/money2.dart';
import 'package:provider/provider.dart';
import '../../color.dart';
import '../../constants.dart';

class PropertyList extends StatefulWidget {
 bool searchOrNot;
  PropertyList({required this.searchOrNot});
  @override
  PropertyListState createState() => PropertyListState();
}
class PropertyListState extends State<PropertyList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }



  init() {
    final validationService = Provider.of<PropertyProvider>(
        context, listen: false);
    validationService.getPropertyList();
  }
  onWillPopPage(){
    final validationService = Provider.of<PropertyProvider>(
        context, listen: false);
   // validationService.onLoadMore.clear();

  }




  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final validationService = Provider.of<PropertyProvider>(
        context, listen: false);
    return WillPopScope(
      onWillPop: onWillPopPage(),
      child: ModalProgressHUD(
        inAsyncCall:Provider.of<PropertyProvider>(context).progress ,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: appBarGlobal(context: context,text: validationService.title ),
          body: Column(
            children: <Widget>[
              Expanded(child: listProperty(context)),
              new Divider(),
              new SizedBox(height: 10,),
              Consumer<PropertyProvider>(
    builder: (context, provider, child) {
    if (provider.loadMore==true) {
      return progress();
    }else{
      return SizedBox();
    }
    }),

              new Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [


                GestureDetector(
                onTap: () async {
                  final validationService = Provider.of<SearchProvider>(
                      context, listen: false);
                  final validationService2 = Provider.of<PropertyProvider>(
                      context, listen: false);
                  validationService2.progress=true;
                  validationService2.notifyListeners();
                  await validationService.getLooksUps(urlSuffix: "property_type.php", index: 0,);

                  if (validationService.searchState.hasData == true) {
                    validationService2.progress=false;
                    validationService2.notifyListeners();
                    bottomSheetLooksUpFilter(context: context, title: "جميع الانواع", pos: 5,searchOrNot: widget.searchOrNot);
                  }else{
                    validationService2.progress=false;
                    validationService2.notifyListeners();
                  }
                }
                ,child: new Row(children: [
                    SizedBox(width: 10,),
                    Icon(Icons.filter_alt_outlined, color: offWhite,),
                    textGlobalBlackBold13(context: context, text: "تصفيه حسب"),
                  ],),
                ),
                GestureDetector(
                  onTap: () async {
                    final validationService = Provider.of<SearchProvider>(
                        context, listen: false);
                    final validationService2 = Provider.of<PropertyProvider>(
                        context, listen: false);
                    validationService2.progress=true;
                    validationService2.notifyListeners();
                    await validationService.getLooksUps(urlSuffix: "", index: 5);

                    if (validationService.searchState.hasData == true) {
                      validationService2.progress=false;
                      validationService2.notifyListeners();
                      bottomSheetLooksUpFilter(context: context, title: "الترتيب حسب", pos: 7,searchOrNot: widget.searchOrNot);
                    }else{
                      validationService2.progress=false;
                      validationService2.notifyListeners();
                    }
                  },
                  child: new Row(children: [
                    Icon(Icons.sort_outlined, color: offWhite,),
                    textGlobalBlackBold13(context: context, text: "فرز من خلال"),
                    SizedBox(width: 10,)
                  ],),
                ),
              ],)
            ],
          ),


        ),
      ),
    );
  }
  final _controller = ScrollController();
  var pos;
  Future<bool> _loadMore() async {
    print("onLoadMore");
   // await Future.delayed(Duration(seconds: 0, milliseconds: 2000));
    final validationService = Provider.of<PropertyProvider>(context,listen: false);
   await validationService.getPropertyList();


   return true;
  }

  Widget listProperty(BuildContext context) {
    return Consumer<PropertyProvider>(
        builder: (context, provider, child) {
          if (provider.getListPropertyState.hasData) {

            return LazyLoadScrollView(
              isLoading: provider.loadMore,
              onEndOfPage: () {
                if(provider.getListPropertyState.data!.length!=0) {
                  _loadMore();
                }else{

                }
              },
              child: ListView.builder(
                  padding: EdgeInsets.all(10),
                  itemCount: provider.onLoadMore.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) =>
                                PropertyDetails(
                                  id: provider.onLoadMore[index]
                                      .id,name: provider.onLoadMore[index]
                                    .title,)));
                      },
                      child: Container(
                        decoration: new BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        height: 300,
                        child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Column(
                            children: [
                              new SizedBox(height: 200,
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width,
                                  child: CachedNetworkImage(
                                    imageUrl: provider.onLoadMore[index].attachmentUrl,
                                    imageBuilder: (context,image)=>Container(width: 200,  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: image, fit: BoxFit.fitWidth),
                                    ),
                                    child: new Column(children: [
sizedBoxGlobalHeight20(),
                                              provider.onLoadMore[index].avaiable_featured_property.toString()==1.toString()?            Row(
                                       textDirection: TextDirection.rtl,
                                       children:[ new Container(decoration: BoxDecoration(color: Colors.deepOrange,
                                           borderRadius: BorderRadius.all(Radius.circular(5.0)) ),
                                           child:Padding(padding: EdgeInsets.only(left: 30,right: 30)
  ,child:textGlobalWhiteBold14(context: context,text: "مميز",),)),
                                     ]):SizedBox()

                                      ],),)
                                      

                                    ,
                                    placeholder: (context, url) => CircleAvatar(
                                      backgroundColor: Colors.white,
                                      child: CircularProgressIndicator(
                                        color: Colors.orange,
                                        strokeWidth: 10,
                                      ),
                                    ),
                                    errorWidget: (context, url, error) => Icon(Icons.error),
                                    fit: BoxFit.fill,
                                    width: 200,
                                  ),/*new Image.network(
                                    provider.onLoadMore[index]
                                        .attachmentUrl, width: 200,
                                    fit: BoxFit.fill,)*/),
                              Expanded(
                                child: new Container(decoration: BoxDecoration(
                                    color: Colors.white
                                ),
                                  child: Column(children: [
                                    new Row(
                                      children: [
                                        new SizedBox(height: 30,),
                                        new Center(
                                            child: SizedBox(width: MediaQuery
                                                .of(context)
                                                .size
                                                .width - 40,
                                                child: Center(child:
                                                textGlobalGreyNormal13(
                                                    context: context,
                                                    text: provider
                                                        .onLoadMore[index].title)))),

                                      ],
                                    ),
                                    new Row(children: [
                                      new Padding(
                                          padding: EdgeInsets.only(left: 10.0),
                                          child: textGlobalBlackBold16(
                                              context: context,
                                              text:provider.onLoadMore[index].price )),
                                      new Padding(
                                          padding: EdgeInsets.only(left: 3.0),
                                          child: textGlobalOrangeBold14(
                                              context: context, text: "JD"))
                                    ],),

                                    GestureDetector(
                                     onTap: (){
                                       navAgentDetails(context: context,id:provider.
                                       onLoadMore[index].realEstatePropertyAgent ,name:provider.
                                       onLoadMore[index].agent );
                                     },
                                      child: new Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          textGlobalGreyNormal13(context: context,
                                              text: provider.
                                                  onLoadMore[index].agent
                                          ),
                                          new Icon(Icons.person,
                                            color: Colors.orange.shade700,),


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

                    );

                  },controller: _controller,),
            );

          } else {
            return progress();
          }
        });
  }


}