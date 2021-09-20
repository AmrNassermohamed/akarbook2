

import 'package:akarbook/Models/FavModels.dart';
import 'package:akarbook/screens/sharedprefence.dart';
import 'package:akarbook/services/services_handler.dart';
import 'package:http/http.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';
class FavData{
  getAndUpdateFavData() async {
    List <FavModels>listFavData=[];
    SharedPreferences prefs = await SharedPreferences.getInstance();
  String?
  token=await SharedPreferenceHandler.getToken();
    var response= await ServicesHandler().getService(urlSuffix:"get_favourite.php",
        headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    },ex: true);
    response["property"].forEach((v) {
      FavModels favModels=FavModels.fromJson(v);
    listFavData.add(favModels);
    });
    return listFavData;
  }

  addFavData(idProperty) async {
    String token = await SharedPreferenceHandler.getToken();
    var response = await ServicesHandler().getService(urlSuffix: "add_favourite.php?property_id=${idProperty}",
     headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    }, ex: true);
    if (response["status"].toString() == 200.toString()) {
      return response["message"];
    } else {
      return response["status"];
    }
  }
}