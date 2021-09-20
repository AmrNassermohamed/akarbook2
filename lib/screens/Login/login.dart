import 'package:akarbook/Components/navgaite.dart';
import 'package:akarbook/WidgetGlobel/sizedBoxGlobal.dart';
import 'package:akarbook/WidgetGlobel/textField.dart';
import 'package:akarbook/WidgetGlobel/textGlobal.dart';
import 'package:akarbook/provider/UserProvider.dart';
import 'package:akarbook/screens/HomePage/index.dart';
import 'package:akarbook/screens/userServices/userServices.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import '../../assets.dart';
import '../../color.dart';
import 'ReativeAccount.dart';
import 'Regiseter.dart';
class Login extends StatefulWidget {
  @override
  LoginState createState() => LoginState ();
}

class LoginState extends State<Login> {
  TextEditingController controllerName=new TextEditingController();
  TextEditingController controllerPassword=new TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final validationService = Provider.of<UserProvider>(
        context, listen: false);
    return ModalProgressHUD(

  inAsyncCall:Provider.of<UserProvider>(context).progress ,
  child:   Scaffold(
    appBar:AppBar(
      centerTitle: true,
      backgroundColor: blueDark,
      leading: GestureDetector(onTap: (){
        Navigator.of(context).pop();
      },child: new Icon(Icons.arrow_back)),
      title:    textGlobalWhiteBold14(context: context,text:"تسجيل الدخول"),
    ),
  body: SingleChildScrollView(
    padding: EdgeInsets.all(10),
    child:   Center(
      child: Container(
        padding: EdgeInsets.all(20),
        child:   Column(mainAxisAlignment: MainAxisAlignment.center,children: [
         sizedBoxGlobalHeight10(),
          new Image.asset(logo,height: 100,width: 100,),
         sizedBoxGlobalHeight20(),
          textField(icon: Icons.person,controller: controllerName,hintText: "اسم المستخدم"),
          sizedBoxGlobalHeight20(),
          textField(icon: Icons.password,controller: controllerPassword,hintText: "كلمه المرور"),
          sizedBoxGlobalHeight20(),
          new Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [

       GestureDetector(child:     textGlobalGreyBold13(context: context,text: "نسيت كلمه المرور ؟"),onTap: (){
         Navigator.of(context).push(
             MaterialPageRoute(builder: (context) =>
                 ReactiveAccount ()        ));
       },),
              RaisedButton(
              onPressed: () async {
               var response  =  await validationService.getLogin(define:"username=${controllerName.text}&password=${controllerPassword.text}");

                if(response.toString()==200.toString()){
//_displaySnackBar(context,"تم تسجيل الدخول");
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) =>
                          MainPage()        ));

                }else if(response.toString()==202.toString()){
                  _displaySnackBar(context,"يرجي مراجعه كلمه المرور واسم المستخدم");
                }else{
                  _displaySnackBar(context,"حدث خطا ما");
                }
              },
          color: blueDark,
          padding: EdgeInsets.all(10),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0)),
          child:
          textGlobalWhiteBold14(context:context,text: "دخول"),


          ),


          ],),
          sizedBoxGlobalHeight20(),
          textGlobalGreyBold13(context: context,text: "ليس لديك حساب ؟"),
          RaisedButton(
              onPressed: () {
                navSignUp(context: context);

              },
              color: Colors.deepOrange,
              padding: EdgeInsets.all(0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0)),
              child:Padding(padding: EdgeInsets.only(left: 70,right: 70),child:
              textGlobalWhiteBold14(context:context,text: "تسجيل"),
              )),
        ],),
      ),
    ),
  ),

  ),
);
  }


_displaySnackBar(BuildContext context,text) {
  final snackBar = SnackBar(content: Text(text));
// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
}