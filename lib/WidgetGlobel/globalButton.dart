import 'package:akarbook/WidgetGlobel/textGlobal.dart';
import 'package:akarbook/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class GlobalButton extends StatelessWidget {
  GlobalButton({required this.title,required this.color,required  this.callback});
  // Fields in a Widget subclass are always marked "final".
  final String title;
  final Function callback;
  final   color;
  @override
  Widget build(BuildContext context) {


    return   Padding(
      padding: EdgeInsets.only(left: 10.0,right: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: color, //
          minimumSize: Size(double.infinity, 20),// background
          onPrimary: Colors.white, // foreground
        ),
        onPressed:
            (){
          callback();
        }

        ,
        child: Padding(padding: EdgeInsets.all(10.0),child: textGlobalWhiteBold14(context: context,text: title)),
      ),
    );
  }


}


Widget globalButtonOrange ({title, callback}){
  return GlobalButton(title: title,color: Colors.deepOrange,callback:(){ callback();},);
}
Widget globalButtonBLueDark ({title, callback}){
  return GlobalButton(title: title,color: blueDark,callback:(){ callback();},);
}
Widget globalButtonGray ({title, callback}){
  return GlobalButton(title: title,color: Colors.grey,callback:(){ callback();},);
}

Widget raisedButton({required BuildContext context,required Function callBack,padding,text,color}){
 return RaisedButton(
      onPressed: () {
callBack();

      },
      color: color,
      shape: RoundedRectangleBorder(

          borderRadius: BorderRadius.circular(0)),
      child:Padding(padding: EdgeInsets.only(left: padding,right:padding),child:
      textGlobalBlackNormal13(context:context,text:text),
      ));
}



globalButtonOrangeRaised({required BuildContext context,required Function callBack,text}){
  return raisedButton(context: context, callBack: (){
    callBack();
  },color:deepOrange,text: text,padding: 0.0 );

}
globalButtonOrangeRaised10({required BuildContext context,required Function callBack,text}){
  return raisedButton(context: context, callBack: (){
    callBack();
  },color:deepOrange,text: text,padding: 10.0 );

}
globalButtonBlueDark10({required BuildContext context,required Function callBack,text}){
  return raisedButton(context: context, callBack: (){
    callBack();
  },color:blueDark,text: text,padding: 10.0 );

}
globalButtonDeepOrange10({required BuildContext context,required Function callBack,text}){
  return raisedButton(context: context, callBack: (){
    callBack();
  },color:deepOrange,text: text,padding: 10.0 );

}
globalButtonWhiteRaised({required BuildContext context,required Function callBack,text}){
  return raisedButton(context: context, callBack: (){
    callBack();
  },color:white,text: text,padding: 0.0 );

}
buttonTextWithRadiusOffWhite({required BuildContext context,type,required Function onClick}){
 return GestureDetector(
    onTap: (){
     onClick();
    },
    child: Container(
      decoration: BoxDecoration(
          color: Colors.white,

          border: Border.all(color:offWhite),
          borderRadius: BorderRadius.all(
              Radius.circular(10)
          )
      ),
      child:new Padding(padding:EdgeInsets.only(left: 10,right: 20),child:
      textGlobalBlackBold13(context: context,text:type)) ,
    ),
  );
}
buttonTextWithRadiusOrange({required BuildContext context,type,required Function onClick}){
  return GestureDetector(
    onTap: (){
      onClick();
    },
    child: Container(
      decoration: BoxDecoration(
          color:  Colors.deepOrange,

          border: Border.all(color:Colors.white,width: 2),
          borderRadius: BorderRadius.all(
              Radius.circular(10)
          )
      ),
      child:new Padding(padding:EdgeInsets.only(left: 10,right: 20),child:
     new Row(children: [
       textGlobalWhiteBold14(context: context,text:type),SizedBox(width: 10,),Image.asset("assets/star.png",width: 20,color: Colors.yellow,)],)

      ) ,
    ),
  );
}

