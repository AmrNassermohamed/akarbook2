import 'package:akarbook/Components/imageAgentGlobal.dart';
import 'package:akarbook/WidgetGlobel/AppBarGlobal.dart';
import 'package:akarbook/WidgetGlobel/textGlobal.dart';
import 'package:akarbook/provider/AgentProvider.dart';
import 'package:akarbook/screens/agentDetails/agentDetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../color.dart';

class AgentList extends StatefulWidget {

  @override
  AgentListState createState() => AgentListState ();
}
class AgentListState extends State<AgentList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }
  init() {
    final validationService = Provider.of<AgentProvider>(
        context, listen: false);

 validationService.getAgentState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: listProperty(context),
        backgroundColor: Colors.white,
        appBar: appBarGlobal(context: context,text:"وكلاء عقارات"),
    );
  }
  Widget listProperty(BuildContext context){
    return Consumer<AgentProvider>(
        builder: (context, provider, child) {
          if (provider.getAgentsState.hasData) {

            return  ListView.builder(
                padding: EdgeInsets.all(10),
                itemCount: provider.getAgentsState.data!.length,
                itemBuilder: (BuildContext context, int index){

                  return   GestureDetector(
                    onTap: (){
                     Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                        AgentDetails(idAgent:provider.getAgentsState.data![index].agentId ,nameAgent: provider.getAgentsState.data![index].name )));
                    },
                    child:  imageAgent(context: context,
                        text:provider.getAgentsState.data![index].name ,
                        image: provider.getAgentsState.data![index].imageUrl),

                  );

                });



          }else{

            return Center(
              child: CircularProgressIndicator(
                backgroundColor: blueDark,
                color: blueDark,


              ),
            );

          }


        });

  }

}








