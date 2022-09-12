import 'package:assing/listofusers.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
// import 'dart:ffi';


class Login extends StatefulWidget{
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController nameController = TextEditingController();
  TextEditingController jobController = TextEditingController();
  
  void login(String name , job)async{
    
    try{
       Response response = await post(
        Uri.parse('https://reqres.in/api/users'),
        body: {
          'name': name,
          'job': job,
        }
        );


        if(response.statusCode == 201){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => listofuser()));
        }else{
          print('faild');
        }
      

    }catch(e){
      print(e.toString());
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                    hintText: "Name"
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  controller: jobController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Job',
                    hintText: "Job"
                  ),
                ),
              ),

              GestureDetector(
                onTap: () {
                  login(nameController.text.toString(),jobController.text.toString());
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(child: Text('login'),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}