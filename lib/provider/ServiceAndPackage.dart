import 'package:akarbook/Data/PageAndPackageData.dart';
import 'package:akarbook/Models/PageModel.dart';
import 'package:akarbook/Models/ProviderGeneralState.dart';
import 'package:akarbook/Models/getPackageModel.dart';
import 'package:flutter/cupertino.dart';

class PageAndVipProvider extends ChangeNotifier{
  late ProviderGeneralState<PageModel> providerGeneralStatePage;
  late ProviderGeneralState<List <GetPackage>> providerGeneralStatePackage;

  PageData  pageData=new PageData();
  getPageProvider({define}) async {

      setWaiting(0);
      PageModel pageModel = await pageData.getPage(index: define);
      providerGeneralStatePage =
          ProviderGeneralState(data: pageModel, hasData: true);
      notifyListeners();

  }

  getPackage() async {
    setWaiting(1);
  List <GetPackage > getListPackage  = await pageData.getListPackage();
    providerGeneralStatePackage =
        ProviderGeneralState(data: getListPackage, hasData: true);
    notifyListeners();

  }


  void setWaiting(index) {
    switch (index) {
      case 0:
        providerGeneralStatePage = ProviderGeneralState(waiting: true);
        break;
      case 1:
        providerGeneralStatePackage = ProviderGeneralState(waiting: true);
        break;
    }
  }

}
