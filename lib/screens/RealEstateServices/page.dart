import 'package:akarbook/Components/displaysnackBar.dart';
import 'package:akarbook/WidgetGlobel/AppBarGlobal.dart';
import 'package:akarbook/WidgetGlobel/ImageNetwork.dart';
import 'package:akarbook/WidgetGlobel/globalButton.dart';
import 'package:akarbook/WidgetGlobel/progress.dart';
import 'package:akarbook/WidgetGlobel/sizedBoxGlobal.dart';
import 'package:akarbook/WidgetGlobel/textGlobal.dart';
import 'package:akarbook/provider/ServiceAndPackage.dart';
import 'package:akarbook/provider/UserProvider.dart';
import 'package:akarbook/screens/RealEstateServices/NavgaitetoPage.dart';
import 'package:akarbook/screens/userServices/bottomSheetAgent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:provider/provider.dart';

class PageEStateSerVices extends StatefulWidget{
  late int id;
  late String title;

  PageEStateSerVices({required this.id,required this.title});
  // TODO: implement createState
  @override
  PageEStateSerVicesState createState() => PageEStateSerVicesState ();


}



class PageEStateSerVicesState extends State<PageEStateSerVices> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  init() {
    final validationService = Provider.of<PageAndVipProvider>(
        context, listen: false);
    final validationService2 = Provider.of<UserProvider>(
        context, listen: false);
    validationService.getPageProvider(define:widget.id);
  validationService2.getIsAcceptedAgent();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
     return SafeArea(child: Scaffold(appBar: appBarGlobal(context: context,text:widget.title),body: SingleChildScrollView(
              child:
              Consumer<PageAndVipProvider>(
              builder: (context, provider, child) {
            if (provider.providerGeneralStatePage.hasData) {
            return Container(
                padding: EdgeInsets.all(10),
                child: Column(children: [



                  Directionality(textDirection: TextDirection.rtl, child:


                  new Row(children: [
                    textGlobalDarkBlueBold20(
                        text: provider.providerGeneralStatePage.data!.title, context: context)
                  ],),
                  ),
                  sizedBoxGlobalHeight10(),
                  imageNetwork(context: context,width: MediaQuery.of(context).size.width-20,height: 300,path:provider.providerGeneralStatePage.data!.image ),
                  //new Image.network(provider.providerGeneralStatePageModel.data!.image),
                  new SizedBox(height: 10,),

widget.id==12611?
    Consumer<UserProvider>(
    builder: (context, provider, child) {
    if (provider.isAcceptedBanking.hasData) {
return Column(
  children: [

      Directionality(
      textDirection: TextDirection.rtl
      , child: new CheckboxListTile(
      value: provider.isAcceptedBanking.data,
      onChanged: (v) {
      setState(() {
      provider.flagAcceptedBanking();
      });

      },

      title:


      Directionality(textDirection: TextDirection.rtl,
      child: new Row(children: [
    Expanded(flex: 2,child:   textGlobalGreyBold16(
      context: context, text: "أوافق على"),)
     , Expanded(flex: 4,
       child: GestureDetector(onTap:(){
        nav(context,12734,"الشروط والأحكام  " );
        },child: textGlobalOrangeBold17(
        context: context, text: "الشروط والأحكام  ")
        ),
     ),


      ])),
      controlAffinity: ListTileControlAffinity.leading,
      activeColor: Colors.deepOrange,

      ),
      ),
    provider.isAcceptedBanking.data==true?                  globalButtonBLueDark(callback: () {
      buttonBeAgent();
    }, title: "كن وكيل عقاري"): globalButtonGray(callback: () {

    }, title: "كن وكيل عقاري"),
  ]

);

  }else{
      return SizedBox();
    }}):SizedBox(),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Html(
                      data: provider.providerGeneralStatePage.data!.content,
                      style: {
                        "table": Style(
                          backgroundColor: Color.fromARGB(0x50, 0xee, 0xee, 0xee),
                        ),
                        "tr": Style(
                          border: Border(bottom: BorderSide(color: Colors.grey)),
                        ),
                        "th": Style(
                          padding: EdgeInsets.all(6),
                          backgroundColor: Colors.grey,
                        ),
                        "td": Style(
                          padding: EdgeInsets.all(6),
                          alignment: Alignment.topLeft,
                        ),
                        'h5': Style(maxLines: 2, textOverflow: TextOverflow.ellipsis),
                      },

                      onLinkTap: (url, _, __, ___) {
                        print("Opening $url...");
                      },
                      onImageTap: (src, _, __, ___) {
                        print(src);
                      },
                      onImageError: (exception, stackTrace) {
                        print(exception);
                      },
                      onCssParseError: (css, messages) {
                        print("css that errored: $css");
                        print("error messages:");
                        messages.forEach((element) {
                          print(element);
                        });
                      },
                    ),
                  ),

                    /* SizedBox(child: textGlobalGreyNormal13Lines(
                      text: provider.providerGeneralStatePage.data!.content,
                      context: context),)),*/
                ],
                ),
              );


          } else {
            return Container(child:SizedBox(height:300 ,child:Center(child:  progress())));
          }
        }))));
  }
  buttonBeAgent() async {
    final validationService = Provider.of<UserProvider>(context,listen: false);
    var res=await validationService.makeAgent();
    if(res==200) {
      bottomSheetAgent(context);
    }else{
      displaySnackBar(context,"يرجي محاوله مره اخري");
    }
  }
}