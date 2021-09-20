import 'package:akarbook/Components/navgaite.dart';
import 'package:akarbook/provider/PropretyProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

textFieldSearch(TextEditingController controller,index,BuildContext context){


return  Padding(
    padding: EdgeInsets.only(left: 20,right: 20,bottom: 10),
    child: Container(
      decoration: new BoxDecoration(
          color: Colors.white, //new Color.fromRGBO(255, 0, 0, 0.0),
          borderRadius: BorderRadius.circular(10.0)
      ),

      child: TextField(
        autofocus: false,
        controller: controller,
        textAlign: TextAlign.center,
        textDirection: TextDirection.rtl,
        onSubmitted: (value){
          callBackSearch( index,value,context);
        }




        ,
        decoration: InputDecoration(


          suffixIcon: IconButton(
            padding: EdgeInsets.only(left: 10),
            icon: Icon(Icons.search,size: 18,),
            onPressed: () {

              callBackSearch(index, controller.text,context);
controller.clear();
            }
            ,
          ),

          //prefixIcon:Icon( Icons.search),
          hintText: "موضوع البحث",
          fillColor: Colors.white,
          hintStyle:GoogleFonts.tajawal(
            color: Colors.grey[500],
            fontSize: 12.0,
          ),
          focusedBorder:OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white, width: 2.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    ),
  );




}
callBackSearch(index,value,BuildContext context) {
  final validationService2 = Provider.of<PropertyProvider>(
      context, listen: false);

  switch (index) {

    case 0:
      validationService2.title="للإيجار";
      validationService2.getDefine(agency: "",typeId:"",text: value.toString(),status: "للإيجار",type: "",cityId: "",countryId: "",endPrice: "",orderByDate: "",orderByPrice: "",startPrice: "",stateId: "");
      gotoListProperty(context: context,searchOrNot: false);
      break;
    case 2:
      validationService2.title="للإستثمار";
      validationService2.getDefine(agency: "",typeId:"",text: value.toString(),status: "للإستثمار",type: "",cityId: "",countryId: "",endPrice: "",orderByDate: "",orderByPrice: "",startPrice: "",stateId: "");
      gotoListProperty(context: context,searchOrNot: false);
      break;
    case 1:
      validationService2.title="للبيع";
      validationService2.getDefine(agency: "",typeId:"",text: value.toString(),status: "للبيع",type: "",cityId: "",countryId: "",endPrice: "",orderByDate: "",orderByPrice: "",startPrice: "",stateId: "");
      gotoListProperty(context: context,searchOrNot: false);
      break;
  }
}