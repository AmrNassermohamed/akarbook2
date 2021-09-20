import 'package:akarbook/Components/displaysnackBar.dart';
import 'package:akarbook/Components/navgaite.dart';
import 'package:akarbook/Models/userModels.dart';
import 'package:akarbook/WidgetGlobel/globalButton.dart';
import 'package:akarbook/WidgetGlobel/progress.dart';
import 'package:akarbook/WidgetGlobel/sizedBoxGlobal.dart';
import 'package:akarbook/WidgetGlobel/textField.dart';
import 'package:akarbook/WidgetGlobel/textGlobal.dart';
import 'package:akarbook/provider/UserProvider.dart';
import 'package:akarbook/screens/RealEstateServices/NavgaitetoPage.dart';
import 'package:akarbook/screens/userServices/userServices.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import '../../assets.dart';
import '../../color.dart';
import '../sharedprefence.dart';
import 'login.dart';
class SignUp extends StatefulWidget {
  @override
  SignUpState createState() => SignUpState ();
}

class SignUpState extends State<SignUp> {
  TextEditingController controllerLastName=new TextEditingController();
  TextEditingController controllerFirstName=new TextEditingController();
  TextEditingController controllerName=new TextEditingController();
  TextEditingController controllerPassword=new TextEditingController();
  TextEditingController controllerRePassword=new TextEditingController();
  TextEditingController controllerEmail=new TextEditingController();
  TextEditingController controllerPhone=new TextEditingController();
  TextEditingController controllerCompany=new TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    controllerCompany.dispose();
    controllerPhone.dispose();
    controllerPassword.dispose();
    controllerRePassword.dispose();
    controllerName.dispose();

    controllerEmail.dispose();
    super.dispose();
  }
late  UserModels userModels;
  @override
  void initState() {
    // TODO: implement initState
  final validationService = Provider.of<UserProvider>(
      context, listen: false);
init();
  super.initState();
  }

signUp() async {
  final validationService = Provider.of<UserProvider>(
      context, listen: false);
  if (controllerName.text.length == 0 || controllerEmail.text.length == 0 ||
      controllerPhone.text.length == 0 || controllerPhone.text.length == 0 ||
      controllerPassword.text.length == 0 ||
      controllerRePassword.text.length == 0||controllerFirstName.text.length==0||controllerLastName.text.length==0) {
    displaySnackBar(context, "    يرجي  تسجيل البيانات صحيحه");
  } else {
    if (controllerPassword.text != controllerRePassword.text) {
      displaySnackBar(context, "    يرجي  تسجيل كلمه المرور صحيحه ");
    } else {
      var response = await validationService.getSignUpProvider(
          username: controllerName.text,
          firstName: controllerFirstName.text,
          lastName: controllerLastName.text,
          password: controllerPassword.text,
          mobile: controllerPhone.text,
          email: controllerEmail.text,
          company: controllerCompany.text);
      print(response);

      if (response == 200) {
        // Navigator.of(context).push(MaterialPageRoute(builder: (context) =>Login()));
        displaySnackBar(context, "تم تسجيل");
      }
      else {
        displaySnackBar(
            context, "يرجي المحاوله مره الاخري مع التاكد من البيانات");
      }
    }
  }
}

init(){
  final validationService = Provider.of<UserProvider>(context,listen: false);
  validationService.getIsAccepted();

}

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
          title:    textGlobalWhiteBold14(context: context,text:"نموذج التسجيل"),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child:   Center(
            child: Container(
              padding: EdgeInsets.all(20),
              child:
 Consumer<UserProvider>(
    builder: (context, provider, child) {
    if (provider.isAccepted.hasData) {

    return Column(mainAxisAlignment: MainAxisAlignment.center,children: [
    sizedBoxGlobalHeight10(),
    new Image.asset(logo,height: 100,width: 100,),
    textGlobalGreyNormal13(context: context,text: "مرحبا بكم في عقار بوك"),
    sizedBoxGlobalHeight20(),
     textFieldReg(controller: controllerName,text: "اسم المستخدم ",icon: Icons.person),
    sizedBoxGlobalHeight10(),
      textFieldReg(controller: controllerFirstName,text: "اسمك  ",icon: Icons.person),
      sizedBoxGlobalHeight10(),
      textFieldReg(controller: controllerLastName,text: "اسم  العائله ",icon: Icons.person),
      sizedBoxGlobalHeight10(),
    textFieldReg(controller: controllerEmail,text: "الايميل"),
 //   ,sizedBoxGlobalHeight10(),
   //
      //textFieldReg(controller: controllerCompany,text: "الشركه"),
    sizedBoxGlobalHeight10(),
    textFieldReg(controller: controllerPhone,text: "الموبايل",icon: Icons.phone),
    sizedBoxGlobalHeight10(),

    textFieldReg(controller: controllerPassword,text: "كلمه المرور",icon: Icons.password),
    sizedBoxGlobalHeight10(),
    textFieldReg(controller: controllerRePassword,text: " اعد ادخال كلمه المرور ",icon: Icons.password),
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
    nav(context,5877," الشروط والأحكام" );
    },child: textGlobalOrangeBold17(
    context: context, text: " الشروط والأحكام")
    )
    ])),
    controlAffinity: ListTileControlAffinity.leading,
    activeColor: Colors.deepOrange,

    ),
    ),

provider.isAccepted.data==true?    globalButtonOrange(title: "تسجيل",callback: () async {

  signUp();
    }

    ):globalButtonGray(title: "تسجيل",callback: (){}),

    ],);
    }else{
    return progress();
    }
    }),
          )),
        ),

      ),
    );
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