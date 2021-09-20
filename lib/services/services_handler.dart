import 'dart:async';
import 'package:akarbook/screens/sharedprefence.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:shared_preferences/shared_preferences.dart';
import '../constants.dart';

class ServicesHandler {
  Future<dynamic> getService(
      {String? urlSuffix,
        Map<String, String>? headers,
        String? externalUrl,required bool ex,statusCode}) async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        String userToken;
        if (headers == null) {
          headers = {
            "Content-Type": "application/json",
          };

        }
        /*if (userToken != null) {
          headers.addAll(
              {"sessionToken": userToken, "Content-Type": "application/json"});
        }*/
        String fullUrl = "";
        if (externalUrl != null) {
          fullUrl = externalUrl;
        } else {
          fullUrl = baseUrl + urlSuffix!;
        }

        print("Service URL");
        print(fullUrl);
        print("Full headers");
        print(headers.toString());
        final response = await http.get(Uri.parse(fullUrl),headers: headers);
        print("Get service response");
        print(json.decode(response.body.toString()));
        print("Status code ${response.statusCode}");
        if (response.statusCode == 200) {
          if(statusCode==true) {
            return 200;
          }else{
            return json.decode(utf8.decode(response.bodyBytes));
          }
          }else if(response.statusCode==202){
          if(ex==true){
           throw  json.decode(utf8.decode(response.bodyBytes));
          }else {
            return json.decode(utf8.decode(response.bodyBytes));
          }
        }
        else if (response.statusCode >= 400 && response.statusCode < 500) {
          // If that call was not successful, throw an error.
          throw Exception(response.body);
        } else {
          throw Exception(["Failed to connect to server!"]);
        }
      }
    } on SocketException catch (error) {
      throw Exception(["Please check your internet connection"]);
    } catch (error) {
      print(error.toString() + 'llllllllllllllllllllllllllll');
      throw Exception(["oops! Something wrong happened!"]);
    }
  }



  Future<dynamic> postService(
      {required String urlSuffix,
        required dynamic requestBody,
        Map<String, String>? headers,
        bool sendBodyAsMap = false,returnBody}) async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
     //   String userToken = await SharedPreferenceHandler.getToken();
        if (headers == null) {
          headers = {
            "Content-Type": "application/json",
          };
        }

       /* if (userToken != null) {
          print(userToken);
          headers.addAll({
            "sessionToken": userToken,
            "Content-Type": "application/json;charset=UTF-8"
          });
        }*/

        print("Request body");
        print(requestBody);
        var finalUrl = baseUrl + urlSuffix;
        print("Request URL");
        print(finalUrl);
        final response = await http.post(Uri.parse(finalUrl),
            headers: headers,
            body:  requestBody );
        print("Response status conde ${response.statusCode}");
        print("Raw response");
        print(response.body);

        if (response.statusCode == 200) {
        if(returnBody==true){
          return json.decode(utf8.decode(response.bodyBytes));
        }else {
          return 200;
        }

        } else if (response.statusCode >= 200 && response.statusCode < 500) {
          // If that call was not successful, throw an error.

          // return json.decode(response.body);
          throw Exception(json.decode(response.body));
        } else {

          throw ({
            "errorCode": 500,
            "errorMessage": "Failed to connect to server",
            "status": "Error"
          });

//return jsonDecode(response.body);
          throw Exception(["Failed to connect to server!"]);
        }
      }
    } on SocketException catch (error) {

      //  print("llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll");
      throw Exception({"errorCode": 500,
        "errorMessage": "Please check your internet connection",
        "status": "Error"});
      //  print("");

      /*    return {
        "errorCode": 600,
        "errorMessage": "Please check your internet connection",
        "status": "Error"
      };*/

    }
  }

  Future multipartRequest(
      {required String url,
        required String method,
        dynamic requestBody,
        required File file,
        required String fileKey}) async {
    try {
      var uri = Uri.parse(baseUrl + url);
      print("Url ${uri.toString()}");
      var request = new http.MultipartRequest(method, uri);
      String userToken = await SharedPreferenceHandler.getToken();
      print("Token: ");
      print(userToken);
      request.headers['Authorization'] ='bearer $userToken';
      request.fields['title'] ="title";
   final f   =request.files.add(await http.MultipartFile.fromPath(
          'file',
          file.path
      )
      );
      String imageName;
      if (file != null) {
 imageName= path.basename(file.path);
      }
      FormData formData = new FormData.fromMap({
        "name": "wendux",
        "featured":http.MultipartFile.fromPath(path.basename(file.path), file.path),
      });


      http.StreamedResponse r = await request.send();


      print(r.statusCode);
      // print(responseBodyString);
      if (r.statusCode == 200) {
        print(r.statusCode);
        //return json.decode(r);
      } else {
        print(r.statusCode);

        // throw Exception("Failed to upload your files");
      }
    } catch (error) {
      print(error.toString());
      throw Exception("Failed to upload your files");
    }
  }

  Future<void> uploadFileAsFormData({required File ? file,url,map}) async {
    try {
      final dio = Dio();
      String userToken = await SharedPreferenceHandler.getToken();
      dio.options.headers = {
        'Authorization': 'Bearer $userToken'
      };






     //final formData = FormData.fromMap({'featured': filee,"title":"tkgkkgkg"}); // 'file' - this is an api key, can be different
      final formData = FormData.fromMap(map);
     print(map);
      String uri = baseUrl + url;
      final response = await dio.post( // or dio.post
      //  uploadFileUrlAsString,
        uri,
        data: formData,
      );
print(response.extra);
      print(",ggggggggggggggggggggggggggggggggggggggggggggggggggggggg");
      print(response.statusCode);
      print(response.data);
      return response.data["message"];
    } catch (err) {
      print('uploading error: $err');
    }
  }
}
