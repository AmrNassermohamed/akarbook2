import 'package:akarbook/screens/HomePage/index.dart';
import 'package:akarbook/screens/agentList/index.dart';
import 'package:akarbook/screens/search/search.dart';
import 'package:akarbook/screens/userServices/userServices.dart';
import'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'screens/favouriteList/favList.dart';

class TabNavigationItem {
  final Widget page;
  final Widget title;
  final Widget icon;
  final Widget iconactive;

  TabNavigationItem({
    required this.page,
    required this.title,
    required this.icon,
    required this.iconactive,
  });

  static List<TabNavigationItem> get items => [
    TabNavigationItem(
      page:Container(),

      icon:  Icon(Icons.notification_important,color: Colors.grey),
      title: Text(""),
      iconactive:  CircleAvatar(backgroundColor: Colors.orange,child: Icon(Icons.notification_important,color: Colors.white)),
      //iconactive: Image.asset("assets/images/inactiveCopy2_2021-02-09/inactiveCopy2.png")
    ),

    TabNavigationItem(
      page:Search(),

      icon:  Icon(Icons.search,color: Colors.grey,),
      title: Text(""),
      iconactive:  CircleAvatar(backgroundColor: Colors.orange,child: Icon(Icons.search,color: Colors.white)),
      //iconactive: Image.asset("assets/images/inactiveCopy2_2021-02-09/inactiveCopy2.png")
    ),



        TabNavigationItem(
          page:FavList(),

          icon:  Icon(Icons.favorite,color: Colors.grey),
          title: Text(""),
          iconactive:  CircleAvatar(backgroundColor: Colors.orange,child: Icon(Icons.favorite,color: Colors.white)),
          //iconactive: Image.asset("assets/images/inactiveCopy2_2021-02-09/inactiveCopy2.png")
        ),


    TabNavigationItem(
        page: UserServices(),
        icon: Icon(Icons.person,color: Colors.grey),
        title: Text(""),
        iconactive: CircleAvatar(backgroundColor: Colors.orange,child: Icon(Icons.person,color: Colors.white))),

    TabNavigationItem(
      page:MainPage(),
      icon: Icon(Icons.home,color: Colors.grey),


      title: Text(""),
      iconactive:CircleAvatar(backgroundColor: Colors.orange,child: Icon(Icons.home,color: Colors.white)),
    )
      ];
}
