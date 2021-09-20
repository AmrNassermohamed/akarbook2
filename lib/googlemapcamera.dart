import 'dart:typed_data';
import 'package:akarbook/WidgetGlobel/AppBarGlobal.dart';
import 'package:akarbook/provider/AgentProvider.dart';
import 'package:akarbook/provider/PropretyProvider.dart';
import 'package:akarbook/provider/UserProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:ui' as ui;
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
class GoogleMapCamera extends StatefulWidget {
  List <Marker> marker=[];
late  double lat;
 late double long;
  GoogleMapCamera({required this.marker,required this.lat ,required this.long});
  @override
  GoogleMapCameraState createState() => GoogleMapCameraState ();
}
class GoogleMapCameraState  extends State<GoogleMapCamera> {

//late BitmapDescriptor customMarker;
  @override
  void initState() {

   // final validationService = Provider.of<PropertyProvider>(context,listen: false);


    // TODO: implement initState

    super.initState();
  }


getCustomMarker() async {
  //customMarker= await BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, "assets/UserServices1.png");
    final validationService = Provider.of<UserProvider>(
      context, listen: false);

 await  validationService.determinePosition();

}

  late GoogleMapController googleMapController;
  late Marker origin;
  late Marker des;

  @override
  void dispose() {
    // TODO: implement dispose
    googleMapController.dispose();

    super.dispose();
  }
  _onWillPop(){
    Navigator.of(context,rootNavigator: true).pop();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(appBar: appBarGlobal(context: context,text: "البحث بالخريطه"),
      body: Container(child: GoogleMap(initialCameraPosition:
      CameraPosition(target: LatLng(widget.lat, widget.long),zoom: 14),
        onMapCreated: (c)=>googleMapController=c,
      markers: widget.marker.map((e) => e).toSet(),

      ),

      ),
    );
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
  }

}