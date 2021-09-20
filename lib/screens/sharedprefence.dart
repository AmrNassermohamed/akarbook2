import 'package:shared_preferences/shared_preferences.dart';
class SharedPreferenceHandler {
  static setToken(String token) async {
    try {
      //SharedPreferences.setMockInitialValues({});
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("TOKEN", token);
      print(prefs.getString("TOKEN"));

    } catch (e) {
      print(e.toString());
    }
  }
  static setPrivacyAndPolicy(bool privacyAndPolicy) async {
    try {
      //SharedPreferences.setMockInitialValues({});
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool("privacyAndPolicy", privacyAndPolicy);
      print(prefs.getBool("privacyAndPolicy"));
    } catch (e) {
      print(e.toString());
    }
  }

  static setPrivacyAndPolicyAgent(bool privacyAndPolicy) async {
    try {
      //SharedPreferences.setMockInitialValues({});
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool("privacyAndPolicyAgent", privacyAndPolicy);
      print(prefs.getBool("privacyAndPolicy"));
    } catch (e) {
      print(e.toString());
    }
  }

  static setPrivacyAndPolicyBanking(bool privacyAndPolicy) async {
    try {
      //SharedPreferences.setMockInitialValues({});
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool("privacyAndPolicyBanking", privacyAndPolicy);
      print(prefs.getBool("privacyAndPolicy"));
    } catch (e) {
      print(e.toString());
    }
  }


  static getToken() async {
    try {
      //SharedPreferences.setMockInitialValues({});
      SharedPreferences prefs = await SharedPreferences.getInstance();

   if(prefs!=null){
     return prefs.getString('TOKEN');
   }else{
     return "null";
   }
    } catch (e) {
      print("get token err :$e");
    }
  }
  static getPrivacyAndPolicy() async {
    try {
      //SharedPreferences.setMockInitialValues({});
      SharedPreferences prefs = await SharedPreferences.getInstance();

      if(prefs!=null){
        return prefs.getBool('privacyAndPolicy');
      }else{
        return "null";
      }
    } catch (e) {
      print("get privacyAndPolicy err :$e");
    }
  }

  static getPrivacyAndPolicyBanking() async {
    try {
      //SharedPreferences.setMockInitialValues({});
      SharedPreferences prefs = await SharedPreferences.getInstance();

      if (prefs != null) {
        return prefs.getBool('privacyAndPolicyBanking');
      } else {
        return "null";
      }
    } catch (e) {
      print("get privacyAndPolicy err :$e");
    }
  }
    static getPrivacyAndPolicyAgent() async {
      try {
        //SharedPreferences.setMockInitialValues({});
        SharedPreferences prefs = await SharedPreferences.getInstance();

        if(prefs!=null){
          return prefs.getBool('privacyAndPolicyAgent');
        }else{
          return "null";
        }
      } catch (e) {
        print("get privacyAndPolicy err :$e");
      }
  }
}