import 'package:akarbook/Models/PageModel.dart';
import 'package:akarbook/Models/getPackageModel.dart';
import 'package:akarbook/services/services_handler.dart';

class PageData {
  getPage({index}) async {
    PageModel pageModel;
    var response = await ServicesHandler().getService(
        ex: true,
        externalUrl:  "https://akarbook.com/portal/wp-json/wp/v2/pages/${index.toString()}");
   pageModel=PageModel.fromJson(response);
    return pageModel;
  }

  getListPackage() async {
    List <GetPackage> getPackageList=[];
    var response = await ServicesHandler().getService(
        ex: true,
        urlSuffix: "get_package.php");

    response["data"].forEach((v) {
      GetPackage getPackage = GetPackage.fromJson(v);
      getPackageList.add(getPackage);
    });
    return getPackageList;
  }

}