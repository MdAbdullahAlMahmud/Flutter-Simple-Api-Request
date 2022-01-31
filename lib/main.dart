import 'dart:convert';

import 'package:apiresponse/models/User.dart';
import 'package:apiresponse/repo/ApiResponse.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;




void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
        title: Text("API"),
      ),
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<List<User>> _future_cap ;

  List<User> users = [];

  bool isFalse = false;
  @override
  void initState() {

    _future_cap = ApiResponse().getApiCall();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {

    return Container(
      child: Center(

        child:Container(
         child: FutureBuilder<List<User>>(
           future: _future_cap,
           builder: (ctx, snapshot){
             users.clear();
             if(snapshot.hasData){
               users.addAll(snapshot.data);
               print(users.length);

               return ListView.builder(
                   itemCount:  snapshot.data.length - 190,
                   itemBuilder: (context, position){
                    var user = users.elementAt(position);
                     return Card(
                       child: Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text("${user.title}",
                               style: TextStyle(
                                 fontSize: 20,
                               ),
                             ),
                           SizedBox(height: 10),


                             Text("${user.completed == true ? "${user.completed}":"${user.completed}"}",
                               style: TextStyle(
                                 fontSize: 16,
                                 color: user.completed == true ? Colors.green : Colors.red
                               ),
                             )



                           ],
                         ),
                       ),
                     );
               });

             }else
               {
                 return CircularProgressIndicator();
               }

           },
         ),
        )
      ),
    );
  }
}






