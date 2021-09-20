import 'package:akarbook/Components/iconWithtextGlobal.dart';
import 'package:akarbook/Components/imageAgentGlobal.dart';
import 'package:akarbook/Components/navgaite.dart';
import 'package:akarbook/Components/textPiceGlobal.dart';
import 'package:akarbook/WidgetGlobel/AppBarGlobal.dart';
import 'package:akarbook/WidgetGlobel/iconButton.dart';
import 'package:akarbook/WidgetGlobel/progress.dart';
import 'package:akarbook/WidgetGlobel/textGlobal.dart';
import 'package:akarbook/provider/AgentProvider.dart';
import 'package:akarbook/provider/FavProvider.dart';
import 'package:akarbook/screens/agentDetails/agentDetails.dart';
import 'package:akarbook/screens/bottomNagationBar.dart';
import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:money2/money2.dart';
import 'package:provider/provider.dart';
import '../../color.dart';
import '../../constants.dart';
import '../../navigationbar.dart';

class FavList extends StatefulWidget {
  @override
  FavListState createState() => FavListState ();
}
class FavListState extends State<FavList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  init() {
    final validationService = Provider.of<Fav>(
        context, listen: false);
    validationService.getFavList();
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
        
        inAsyncCall:Provider.of<Fav>(context).progress,
        child: Scaffold(
          bottomNavigationBar: bottomNavigationBar(context,2),
          body: listFav(context),
          backgroundColor: Colors.white,
          appBar: appBarGlobal(context: context,text:"المفضله"),
        ),
      ),
    );
  }
  Widget listFav(BuildContext context){
    return Consumer<Fav>(
        builder: (context, provider, child) {
          if (provider.getFavState.hasData) {
            return  ListView.builder(
                padding: EdgeInsets.all(10),
                itemCount: provider.getFavState.data!.length,
                itemBuilder: (BuildContext context, int index){
                  return GestureDetector(
                    onTap: (){
                      navPropertyDetails( context:context,id: provider.getFavState.data![index].id,
                          name: provider.getFavState.data![index].name );
                    },
                    child: new Padding(padding: EdgeInsets.only(left:10,bottom: 10,right: 10,),
                        child:  new Container(

                            padding: EdgeInsets.only(top: 0,left: 10,right: 0),
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
Expanded(child:Directionality(textDirection: TextDirection.rtl, child: textGlobalGreyBold13Lines(context: context,text:provider.getFavState.data![index].name )) ),
],),


          iconWithTextOwner(context: context,
              text:provider.getFavState.data![index].agentName ),
                                        textPriceGlobal14(context:
                                        context,text: provider.getFavState.data![index].price .toString()),

                                        iconButton(callBack: () async {
var re=                                 await  provider.addAndDeleteFav(provider.getFavState.data![index].id,true);



                                        },icon: Icon(Icons.delete,color: Colors.deepOrange,)),


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
                                            image: NetworkImage(provider.getFavState.data![index].image.toString()),
                                            fit: BoxFit.cover),

                                        borderRadius: BorderRadius.only( topRight:Radius.circular(15.0),
                                            bottomRight: Radius.circular(15.0)

                                        )              ),
                                    child: SizedBox(height: 143,width: 134),
                                  ),
                                ),

                              ],
                            ),



                              //  new Image.asset(image);
                            ),


                        )),
                  );

                });
          }else{

        return progress();

          }
        });

  }
}








