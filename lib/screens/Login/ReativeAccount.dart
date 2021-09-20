import 'package:akarbook/Components/displaysnackBar.dart';
import 'package:akarbook/WidgetGlobel/sizedBoxGlobal.dart';
import 'package:akarbook/WidgetGlobel/textField.dart';
import 'package:akarbook/WidgetGlobel/textGlobal.dart';
import 'package:akarbook/provider/UserProvider.dart';
import 'package:akarbook/screens/userServices/userServices.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import '../../assets.dart';
import '../../color.dart';
import 'Regiseter.dart';
class ReactiveAccount extends StatefulWidget {
  @override
  ReactiveAccountState createState() =>ReactiveAccountState ();
}

class ReactiveAccountState extends State<ReactiveAccount> {
  TextEditingController controllerEmail=new TextEditingController();

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
          title:    textGlobalWhiteBold14(context: context,text:"تغيير كلمه المرور"),
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
                textField(icon: Icons.email,controller: controllerEmail,hintText: "الايميل"),

                RaisedButton(
                    onPressed: () async {
                      final validationService = Provider.of<UserProvider>(context,listen: false);
                      var res=await validationService.reActivePassword(controllerEmail.text);
                      if(res==200) {
                        displaySnackBar(context,"يراجعه مراجعه الايميل لتغيير الباسورد");
                      }else{
                        displaySnackBar(context,"يرجي محاوله مره اخري");
                      }

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
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}