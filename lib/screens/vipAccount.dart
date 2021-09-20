import 'package:akarbook/Components/displaysnackBar.dart';
import 'package:akarbook/Components/navgaite.dart';
import 'package:akarbook/WidgetGlobel/AppBarGlobal.dart';
import 'package:akarbook/WidgetGlobel/globalButton.dart';
import 'package:akarbook/WidgetGlobel/progress.dart';
import 'package:akarbook/WidgetGlobel/sizedBoxGlobal.dart';
import 'package:akarbook/WidgetGlobel/textGlobal.dart';
import 'package:akarbook/provider/UserProvider.dart';
import 'package:akarbook/screens/sharedprefence.dart';
import 'package:akarbook/screens/userServices/bottomSheetAgent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import 'getpackage/index.dart';



class  VipEstateServices  extends StatefulWidget{

  // TODO: implement createState
  @override
  VipEstateSerVicesState  createState() => VipEstateSerVicesState ();


}


class VipEstateSerVicesState extends State<VipEstateServices>{

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
init();
  }

  init(){
    final validationService = Provider.of<UserProvider>(context,listen: false);
    validationService.getIsAccepted();

  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final validationService = Provider.of<UserProvider>(context,listen: false);
    return Consumer<UserProvider>(
        builder: (context, provider, child) {
      if (provider.isAccepted.hasData) {
        return ModalProgressHUD(
          inAsyncCall: Provider
              .of<UserProvider>(context)
              .progress,
          child: SafeArea(child: Scaffold(
            appBar: appBarGlobal(context: context, text: "كن وكيل عقاري"),
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(children: [

                  Directionality(textDirection: TextDirection.rtl, child:

                  new Row(children: [
                    textGlobalDarkBlueBold20(
                        text: "شركات الاسكان والمكاتب العقاريه",
                        context: context)
                  ],),

                  ),
Image.asset("assets/241819399_606926663641980_8187780270190220540_n.png"),

                  new SizedBox(height: 10,),
                  Directionality(textDirection: TextDirection.rtl,
                      child: SizedBox(child:
                      textGlobalGreyNormal13Lines(
                          text: "نقدم لكم مجموعة متكاملة من الخدمات الخاصة بكم والتي تستطيعون من خلالها"
                              " إدارة عقاراتكم من حيث إضافة عقار جديد ، حذف العقارات المباعة"
                             " ، وتستطيعون ايضا ان تكونوا وكلاء لهذه العقارات برسوم سنوية مشجعة  "

                       "   ولتحقيق هذا الهدف نتمنى عليكم أن تكونوا وكلاء من خلال النقر على الزر كن وكيل عقارات",
                          context: context),)),

                  sizedBoxGlobalHeight10(),
                  Directionality(
                    textDirection: TextDirection.rtl
                    , child: new CheckboxListTile(
                    value: provider.isAccepted.data,
                    onChanged: (v) {
                      if (provider.isAccepted.data== false) {
                        setState(() {
                          flag();
                        });
                      } else {
                        setState(() {
                          flag();
                        });
                      }
                    },
                    title: Directionality(textDirection: TextDirection.rtl,
                        child: new Row(children: [
                          textGlobalGreyBold16(
                              context: context, text: "أوافق على "),
                   GestureDetector(onTap:(){
                     navPageEstate(context: context,name:"الشروط والاحكام لشركات الاسكان والمكاتب العقاريه",id:12737 );
                   },child:       textGlobalOrangeBold17(
                              context: context, text: " الشروط والأحكام")
                        )
                    ])),
                    controlAffinity: ListTileControlAffinity.leading,
                    activeColor: Colors.deepOrange,

                  ),
                  ),
provider.isAccepted.data==true?                  globalButtonBLueDark(callback: () {
                    buttonBeAgent();
                  }, title: "كن وكيل عقاري"): globalButtonGray(callback: () {

}, title: "كن وكيل عقاري"),
                ],
                ),
              ),
            ),
          ),),
        );
      }else{

      return progress();
      }});
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


flag() async {
  final validationService = Provider.of<UserProvider>(
      context, listen: false);
    if(validationService.isAccepted.data==false) {
      await SharedPreferenceHandler.setPrivacyAndPolicy(true);
      validationService.isAccepted.data = true;
    }else{
      validationService.isAccepted.data=false;
      await SharedPreferenceHandler.setPrivacyAndPolicy(false);


    }
}

}




