import 'dart:convert';

import 'package:contacts_with_bloc/models/contact_model.dart';
import 'package:http/http.dart';

class Network{

  //static String BASE = "https://61c6ec2b9031850017547287.mockapi.io/apis";
  //static Map<String, String> headers = {'Content-Type':'application/json; charset=UTF-8'};

  // http APIs //

  // static String API_List = "/contacts";
  // static String API_Create = "/contacts";
  // static String API_Update = "/contacts/"; //{id}
  static String API_Delete = "/contacts/";  //{id}

  // http requests //

  static Future<String> GET( Map<String, String> params) async {
    var uri = Uri.parse("https://61c6ec2b9031850017547287.mockapi.io/apis/contacts");
    var response = await get(uri, );
    if(response.statusCode == 200){
      return response.body;
    }
    return 'Request failed with status: ${response.statusCode}.';
  }

  // static Future<String> POST(String api, Map<String, String> params) async {
  //   var uri = Uri.https(BASE, api);
  //   var response = await post(uri, body: jsonEncode(params) );
  //   if(response.statusCode == 200 || response.statusCode == 201){
  //     return response.body;
  //   }
  //   return 'Request failed with status: ${response.statusCode}.';
  // }
  //
  // static Future<String> PUT(String api, Map<String, String> params) async {
  //   var uri = Uri.https(BASE, api);
  //   var response = await put(uri, body: jsonEncode(params));
  //   if(response.statusCode == 200){
  //     return response.body;
  //   }
  //   return 'Request failed with status: ${response.statusCode}.';
  // }
  //
  static Future<String> Del(String api, Map<String, String> params) async {
    var uri = Uri.parse("https://61c6ec2b9031850017547287.mockapi.io/apis/$api");
    var response = await delete(uri );
    if(response.statusCode == 200){
      return response.body;
    }
    return 'Request failed with status: ${response.statusCode}.';
  }

  // http Params //

  static Map<String, String>  paramsEmpty(){
    Map<String, String> params = new Map();
    return params;
  }

  static Map<String,String> paramsCreate(Contact contact){
    Map<String, String> params = new Map();
    params.addAll({
      "fullname": contact.fullname,
      "number": contact.number,
    });
    return params;
  }

  static Map<String,String> paramsUpdate(Contact contact){
    Map<String, String> params = new Map();
    params.addAll({
      "id" : contact.id.toString(),
      "fullname": contact.fullname,
      "number": contact.number,
    });
    return params;
  }

  static List<Contact> parseContactList(String response){
    dynamic json = jsonDecode(response);
    var data = List<Contact>.from(json.map((x) => Contact.fromJson(x)));
    return data;
  }
}