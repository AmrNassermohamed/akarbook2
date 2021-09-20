 import 'package:akarbook/Components/navgaite.dart';
import 'package:akarbook/WidgetGlobel/alertDialoug.dart';
import 'package:akarbook/color.dart';
import 'package:akarbook/provider/UserProvider.dart';
import 'package:akarbook/screens/HomePage/index.dart';
import 'package:akarbook/screens/search/search.dart';
import 'package:akarbook/screens/userServices/userServices.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'favouriteList/favList.dart';
import 'notification.dart';
bottomNavigationBar( context,index){
  return Directionality(
   textDirection: TextDirection.rtl,
    child: BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white.withOpacity(.60),
      selectedFontSize: 14,
      unselectedFontSize: 14,
       onTap: (value) {

        print(value);
        if(index!=value){
           switch(value){
             case 0:
               Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                  MainPage ()));
               break;
             case 1:
               navUserServices(context,0);
               break;
             case 2:
               /*Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                   FavList ()));*/
               navUserServices(context,1);
               break;
             case 3:
               Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                   Search ()));
               break;
             case 4:
               Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                   Notification1  ()));
               break;

           }
         }else{

           }

         // Respond to item press.
       },
      currentIndex:index ,
       items: [
         //bottomNavagtionBar(Icons.home),
         BottomNavigationBarItem(
           title: Text(''),
           activeIcon: CircleAvatar(child:  Icon(Icons.home,color: Colors.white),backgroundColor: Colors.orangeAccent),
           icon:CircleAvatar(child:  Icon(Icons.home,color: Colors.grey),backgroundColor: Colors.white)),
         BottomNavigationBarItem(
             title: Text(''),
             activeIcon: CircleAvatar(child:  Icon(Icons.person,color: Colors.white),backgroundColor: Colors.orangeAccent),
             icon:CircleAvatar(child:  Icon(Icons.person,color: Colors.grey),backgroundColor: Colors.white)),
         BottomNavigationBarItem(
             title: Text(''),
             activeIcon: CircleAvatar(child:  Icon(Icons.favorite,color: Colors.white),backgroundColor: Colors.orangeAccent),
             icon:CircleAvatar(child:  Icon(Icons.favorite,color: Colors.grey),backgroundColor: Colors.white)),
         BottomNavigationBarItem(
             title: Text(''),
             activeIcon: CircleAvatar(child:  Icon(Icons.search,color: Colors.white),backgroundColor: Colors.orangeAccent),
             icon:CircleAvatar(child:  Icon(Icons.search,color: Colors.grey),backgroundColor: Colors.white)),
         BottomNavigationBarItem(
             title: Text(''),
             activeIcon: CircleAvatar(child:  Icon(Icons.notification_important,color: Colors.white),backgroundColor: Colors.orangeAccent),
             icon:CircleAvatar(child:  Icon(Icons.notification_important,color: Colors.grey),backgroundColor: Colors.white)),

       ],
     ),
  );

}
BottomNavigationBarItem  bottomNavigationBarItem(icon){
 return BottomNavigationBarItem(
   title:    Text(''),
    activeIcon: CircleAvatar(child:  Icon(icon,color: deepOrange,)),
    icon:CircleAvatar(child:  Icon(icon,color: Colors.white,)),
  );
}
