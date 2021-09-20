import 'package:akarbook/Components/connectWithClients.dart';
import 'package:akarbook/Components/imageAgentGlobal.dart';
import 'package:akarbook/Components/navgaite.dart';
import 'package:akarbook/Models/AgentMoadels.dart';
import 'package:akarbook/WidgetGlobel/AppBarGlobal.dart';
import 'package:akarbook/WidgetGlobel/globalButton.dart';
import 'package:akarbook/WidgetGlobel/progress.dart';
import 'package:akarbook/WidgetGlobel/textGlobal.dart';
import 'package:akarbook/provider/AgentProvider.dart';
import 'package:akarbook/provider/PropretyProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../color.dart';
class AgentDetails extends StatefulWidget {
String nameAgent;
String idAgent;
  AgentDetails({required this.nameAgent,required this.idAgent});
  @override
  AgentDetailsState createState() => AgentDetailsState ();
}
class AgentDetailsState extends State<AgentDetails> {
  @override
  void initState() {
    // TODO: implement initState
    init();
    super.initState();
  }
  init(){
    final validationService = Provider.of<AgentProvider>(
        context, listen: false);

    validationService.getAgentDetails(id: widget.idAgent);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      appBar: appBarGlobal(context: context,text: widget.nameAgent),
      body: body(widget.idAgent),
    );
  }
}

Widget con2(BuildContext context,AgentModels agentModels,id){

 return Container(
   padding: EdgeInsets.all(10),
   margin: EdgeInsets.all(10.0),
    height: 300,
    width: double.infinity,
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
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],
    ),
    child: Column(
      textDirection: TextDirection.rtl,
      children: [
        connectWithClients(context: context,phone:agentModels.agentPhone ),
        textGlobalGreyNormalLines13(context: context,text: agentModels.des),
        data(context: context,title: "العنوان:",icon: Icons.add_location,value: agentModels.agentAddress),
        data(context: context,title: "البريد الالكتروني:",icon:Icons.email,value: agentModels.agentEmail),
        data(context: context,title: " الهاتف : ",icon:Icons.phone,value: agentModels.agentPhone),
        new Divider(),
        dataText(context: context,textTitle: "الشركه:",textValue: agentModels.name),
        dataText(context: context,textTitle: "هاتف المكتب:",textValue: agentModels.officePhone),
        dataText(context: context,textTitle: "عنوان المكتب : ",textValue: agentModels.officeAddress),
        globalButtonGray(callback: (){
          final validationService2 = Provider.of<PropertyProvider>(
              context, listen: false);
          validationService2.getDefine(agency:id.toString(),typeId:"",text: "",status: "",type: "",cityId: "",countryId: "",endPrice: "",orderByDate: "",orderByPrice: "",startPrice: "",stateId: "");
          validationService2.title=agentModels.name;
          gotoListProperty(context: context,searchOrNot: false);
          },
        title:  "عرض عقارات الوكيل"
        ),
      ],),);
}
Widget data({required BuildContext context,title ,icon,value}){
 return new Row(


    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Directionality(textDirection: TextDirection.rtl, child:
      textGlobalGreyBold13(context: context, text:  value,)),
      Directionality(textDirection: TextDirection.rtl, child:
      textGlobalGreyBold13(context: context, text:  title,)),

      new SizedBox(width: 10,),
      new Icon(icon, color: Colors.orange.shade700,size: 10,),
    ],);
}
Widget dataText({textTitle,required BuildContext context,textValue}){
return  new Row(mainAxisAlignment: MainAxisAlignment.end,children: [
  Directionality(textDirection: TextDirection.rtl, child:  textGlobalGreyBold13(context: context,text: textValue)),
  Directionality(textDirection: TextDirection.rtl, child:  textGlobalGreyBold13(context: context,text: textTitle)),

],);
}
body(agentid){
return Consumer<AgentProvider>(
builder: (context, provider, child)
{
  if (provider.getAgentDetailsState.hasData) {
    return new Column(children: [
      imageAgent(context: context,
          text:provider.getAgentDetailsState.data!.name ,
          image: provider.getAgentDetailsState.data!.imageUrl),
      con2(context,provider.getAgentDetailsState.data!,agentid),

    ],);
  } else {
 return progress();
  }});
}
