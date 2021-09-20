import 'package:akarbook/Components/imageAgentGlobal.dart';
import 'package:akarbook/WidgetGlobel/AppBarGlobal.dart';
import 'package:akarbook/WidgetGlobel/globalButton.dart';
import 'package:akarbook/WidgetGlobel/progress.dart';
import 'package:akarbook/WidgetGlobel/sizedBoxGlobal.dart';
import 'package:akarbook/WidgetGlobel/textGlobal.dart';
import 'package:akarbook/provider/AgentProvider.dart';
import 'package:akarbook/provider/UserProvider.dart';
import 'package:akarbook/screens/agentDetails/agentDetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../color.dart';

class BillList extends StatefulWidget {

  @override
  BillListState createState() => BillListState ();
}
class BillListState extends State<BillList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }
  init() {
    final validationService = Provider.of<UserProvider>(
        context, listen: false);

    validationService.getListBills();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      body: listProperty(context),
      backgroundColor: Colors.white,
      appBar: appBarGlobal(context: context,text:"فواتير"),
    );
  }
  Widget listProperty(BuildContext context){
    return Consumer<UserProvider>(
        builder: (context, provider, child) {
          if (provider.listBillsGeneralState.hasData) {

            return  ListView.builder(
                padding: EdgeInsets.all(10),
                itemCount: provider.listBillsGeneralState.data!.length,
                itemBuilder: (BuildContext context, int index){
                  return   Padding(
                    padding: EdgeInsets.all(10.0),
                    child: GestureDetector(
                        onTap: (){
                         /* Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                              AgentDetails(idAgent:provider.getAgentsState.data![index].agentId ,nameAgent: provider.getAgentsState.data![index].name )));*/
                        },
                        child:  new Container(

                          decoration: BoxDecoration
                            (boxShadow: [
                          BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        )] ,color:Colors.white ,border: Border.all(width: 10,color: offWhite)),
                          child: new Column(
                            children: [

                              element(value:provider.listBillsGeneralState.data![index].title ,key: "رقم الطلبيه :"),
                              new Divider(),
                              element(value:provider.listBillsGeneralState.data![index].realEstateInvoiceDate ,
                                  key: " تاريخ الشراء :"),
                              new Divider(),
                              element(value:provider.listBillsGeneralState.data![index].
                              realEstateInvoicePaymentType ,key: "النوع:"),
                              new Divider(),
                              element(
                                  value:provider.listBillsGeneralState.data![index].title ,key: "اسم العنصر:"),
                              new Divider(),
                              element(value:provider.listBillsGeneralState.data![index].invoiceStatus=="1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   "
                                  ""?"مدفوع":
                              "غير مدفوع" ,key: "الحاله :"),
                              new Divider(),
                              element(value:provider.listBillsGeneralState.data![index].price,key: "المجموع :"),
                              new Divider(),
                            sizedBoxGlobalWidth10(),
                              new Row(mainAxisAlignment: MainAxisAlignment.start,children: [
                              new Icon(Icons.print,color: Colors.grey,size: 30,)
                            ],)


                            ],

                          ),

                        )

                    ),
                  );

                });



          }else{

return progress();

          }


        });

  }



  Widget element({key,value}){
    return Container(
      color: white,
      padding: EdgeInsets.only(left: 10,right: 10,top: 10),
      child:   new Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
        //
        textGlobalGreyNormal13(context: context,text:value),
        Directionality(textDirection: TextDirection.rtl, child:
        textGlobalBlack12Bold16(context: context,text:key)),


      ],),
    );
  }
}







