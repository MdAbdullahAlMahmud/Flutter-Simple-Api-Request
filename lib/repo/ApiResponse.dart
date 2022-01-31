

import 'dart:convert';

import 'package:apiresponse/models/User.dart';
import 'package:http/http.dart' as http;

class ApiResponse{

  String BASE_URL = "https://jsonplaceholder.typicode.com/todos/";
  Future<List<User>> getApiCall() async {

    var api =await http.Client().get(Uri.parse(BASE_URL));

    if(api.statusCode==200){
      var response = api.body;
      var jsonMap = jsonDecode(response);

      //print(response);
      return User().userFromJson(response);
      /*print(result.length);
      for(int i=0 ; i< result.length; i++){

        var user = result.elementAt(i);
        print("User ${user.id}");

      }
*/
      //print(result);
    }else{
      print("Error ");
    }



  }

}