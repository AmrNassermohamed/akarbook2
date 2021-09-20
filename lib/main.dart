import 'package:akarbook/color.dart';
import 'package:akarbook/provider/AgentProvider.dart';
import 'package:akarbook/provider/FavProvider.dart';
import 'package:akarbook/provider/ServiceAndPackage.dart';
import 'package:akarbook/provider/SearchProvider.dart';
import 'package:akarbook/provider/UserProvider.dart';
import 'package:akarbook/provider/ModalProgressHud.dart';
import 'package:akarbook/provider/PropretyProvider.dart';
import 'package:akarbook/screens/HomePage/index.dart';
import 'package:akarbook/screens/sharedprefence.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'assets.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
  //print(message.data["property_id"]);
  if(message.data["property_id"]!=null){

  }
  print('Handling a background message ${message.messageId}');
}



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();




  await Firebase.initializeApp();

  await Firebase.initializeApp();



  /*await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
      AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);*/

  //InAppPurchaseConnection.enablePendingPurchases();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );


  runApp(MultiProvider(

      providers: [
        ChangeNotifierProvider(create: (_) => PropertyProvider()),
        ChangeNotifierProvider(create: (_) => AgentProvider()),
        ChangeNotifierProvider(create: (_) => ModalProgress()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => Fav()),
        ChangeNotifierProvider(create: (_) => SearchProvider()),
        ChangeNotifierProvider(create: (_) => PageAndVipProvider())

      ],child:MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.





  @override
  Widget build(BuildContext context) {

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);


    return FutureBuilder(
      future: Init.instance.initialize(context),
      builder: (context, AsyncSnapshot snapshot) {
        // Show splash screen while waiting for app resources to load:
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(home: Splash(),      debugShowCheckedModeBanner: false);
        } else {
          // Loading is done, return the app:
          return MaterialApp(
              title: '',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home:MainPage(),

              //  PropertyList(type:"عقارات سكنيه",),
              debugShowCheckedModeBanner: false
          );

        }
      },
    );




  }
}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blueDark,
      body: Center(child: Image.asset(logo,width: 100,height: 100,)),
    );
  }
}

class Init {
  Init._();
  static final instance = Init._();

  Future initialize(BuildContext context) async {

    final validationService = Provider.of<PropertyProvider>(context,listen: false);
    final validationServiceUser = Provider.of<UserProvider>(context,listen: false);
    await validationService.getPropertyStatus(index: 1);
    String? token=await SharedPreferenceHandler.getToken();
    if(token!=null){
      await    validationServiceUser.getUserDetails(token: token);
    }
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!

  }
}

