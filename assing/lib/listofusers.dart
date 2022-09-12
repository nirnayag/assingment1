//  import 'dart:ffi';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class listofuser extends StatefulWidget {
  const listofuser({Key? key}) : super(key: key);

  @override
  State<listofuser> createState() => _listofuserState();
}

class _listofuserState extends State<listofuser> {
  var data;
  Future<void> getUserApi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    print(response);
    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
      print(data);
      print('object');
      print(data['data'](['email']));
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
            child: FutureBuilder(
          future: getUserApi(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text('loading');
            } else {
             
              return ListView.builder(
                    itemCount: data.length,
                      itemBuilder: (context, index){
                    return ListTile(
                  leading:CircleAvatar(
                    backgroundColor: Colors.black,
                    // backgroundImage:  NetworkImage(snapshot.data![index]..toString()),
                  ),
                  subtitle: Text(data[index]['username'].toString(),),
                          
                  title: Text(data[index]['email'].toString(),),
                );
                  });

            }
          },
        ))
      ],
    ));
  }
}



class ReusbaleRow extends StatelessWidget {
  String title , email ;
  ReusbaleRow({Key? key , required this.title , required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(email ),

        ],
      ),
    );
  }
}