import 'package:akarbook/Data/AgentData.dart';
import 'package:akarbook/Models/AgentMoadels.dart';
import 'package:akarbook/Models/ProviderGeneralState.dart';
import 'package:flutter/cupertino.dart';
class AgentProvider extends ChangeNotifier {
  late ProviderGeneralState<List<AgentModels>> getAgentsState;
  late ProviderGeneralState<AgentModels> getAgentDetailsState;

  getAgentState() async {
    setWaiting(0);
    List<AgentModels> agentList;
    agentList = await AgentData().getListAgentData(paged: 1, limit: 10);
    getAgentsState = ProviderGeneralState(data: agentList, hasData: true);
    notifyListeners();
  }
  getAgentDetails({required id}) async {
    setWaiting(1);
    AgentModels agentModels;
    agentModels = await AgentData().getAgentDetailsData(id: id);
    getAgentDetailsState = ProviderGeneralState(data: agentModels, hasData: true);
    notifyListeners();
  }




  void setWaiting(index) {
    switch (index) {
      case 0:
        getAgentsState = ProviderGeneralState(waiting: true);
        break;
      case 1:
        getAgentDetailsState=ProviderGeneralState(waiting: true);
        break;
    }

  }
}