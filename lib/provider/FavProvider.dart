

import 'package:akarbook/Data/FavData.dart';
import 'package:akarbook/Models/FavModels.dart';
import 'package:akarbook/Models/ProviderGeneralState.dart';
import 'package:akarbook/screens/sharedprefence.dart';
import 'package:akarbook/services/services_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class Fav extends ChangeNotifier {
  late ProviderGeneralState<List<FavModels>> getFavState=new ProviderGeneralState();
  FavData favData = new FavData();
  late bool progress=false;
  getFavList() async {
    setWaiting(0);
    List<FavModels> agentList;
    //String  token=await SharedPreferenceHandler.getToken();
    //print(token);
    agentList = await favData.getAndUpdateFavData();
    getFavState= ProviderGeneralState(data: agentList, hasData: true);
    notifyListeners();
  }

  addAndDeleteFav(idProperty,loadOrNot) async {

     String ?token = await SharedPreferenceHandler.getToken();
     if (token == null) {
       return "يرجي تسجيل الحساب";
     }else {
       progress = true;
       notifyListeners();
       var response = await favData.addFavData(
           idProperty); //getAndUpdateFavData("d71fc44e01b99e2a67c59e107a2bd30aeb1bb2c2");
       print(response);
       notifyListeners();
       progress = false;
       getFavState.data!.clear();
       await getFavList();
       notifyListeners();

       return response;
     }

  }

  void setWaiting(index) {
    switch (index) {
      case 0:
        getFavState = ProviderGeneralState(waiting: true);
        break;
    }
  }


}