import 'package:akarbook/Models/AgentMoadels.dart';
import 'package:akarbook/services/services_handler.dart';

class AgentData{
  getListAgentData({limit,paged}) async {
    List <AgentModels>agentList=[];
    var response= await ServicesHandler().getService(urlSuffix:"get_agent.php?limit=${limit.toString()}&paged=${paged.toString()}",ex: true );
    response["data"].forEach((v) {
      AgentModels agentModels=AgentModels.fromJson(v);
      agentList.add(agentModels);
    });

    return agentList;
  }
  getAgentDetailsData({id}) async {
    AgentModels agentModels;
    var response= await ServicesHandler().getService(urlSuffix:"agent_details.php?agent_id=${id.toString()}" ,ex: true);
     agentModels=AgentModels.fromJson(response["data"][0]);
    return agentModels;
  }

}