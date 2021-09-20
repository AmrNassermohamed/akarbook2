import 'package:akarbook/Components/navgaite.dart';
import 'package:akarbook/provider/PropretyProvider.dart';
import 'package:akarbook/screens/RealEstateServices/RealEstateServices.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

typeComponents({required BuildContext context}){
  List <Map> categories = [
    {"image": "assets/2.png", "name": "عقارات سكنيه","define":"83"},
    {"image": "assets/1.png", "name": "عقارات تجاريه","define":"84"},
    {"image": "assets/3.png", "name": "بحث عن اراضي","define":"85"},
    {"image": "assets/4.png", "name": "خدمات عقاريه","define":"property_status=للإيجار"},
    {"image": "assets/10.png", "name": "خدمات عقاريه","define":""},
    {"image": "assets/11.jpg", "name": "خدمات عقاريه","define":""},


  ];
  return  Container(
    color: Colors.grey[100],
    child: GridView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: ScrollPhysics(),
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 3.0
          ,childAspectRatio: 1.5),
      itemBuilder: (_, index) =>

          GestureDetector(
            onTap: (){
              if(index==3){

                Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                    RealEStateSerVices()));

              }else if(index==4){
                navPageEstate(context: context,id: 12611,name:"خدمات البنوك" );}
             else if(index==5){
                navVipEstateServices(context);
            //    navWithConditionAndPolices(context);
              } else {
                final validationService2 = Provider.of<PropertyProvider>(
                    context, listen: false);
                validationService2.title=categories[index]["name"];
              validationService2.getDefine(agency: "",typeId:categories[index]["define"],text: "",status: "",type: "",cityId: "",countryId: "",endPrice: "",orderByDate: "",orderByPrice: "",startPrice: "",stateId: "");
                gotoListProperty(context: context,searchOrNot: false);

              }},
            child: Padding(
                padding: EdgeInsets.only(right: 3,left: 3,top: 3,bottom: 3),
                child: Container(height: 0,decoration: BoxDecoration(
                  image: DecorationImage(

                    image: AssetImage(categories[index]["image"]),
                    fit: BoxFit.cover,
                  ),

                ))),
          ),

      itemCount: categories.length,
    ),
  );
}