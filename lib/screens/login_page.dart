import 'package:http/http.dart';

import 'package:flutter/material.dart';
import 'package:flutter_catalog/utils/routes.dart';

class LoginPage extends StatefulWidget {
const LoginPage({Key? key}) : super(key: key);

@override
State<LoginPage> createState() => _LoginPageState();
  }

  class _LoginPageState extends State<LoginPage> {
    String name="";
    bool changeButton=false;
    final _formkey=GlobalKey<FormState>();
      moveToHome(BuildContext context) async{
        final form = _formkey.currentState;
        if (form!=null && form.validate()) {
      setState(() {
      changeButton=true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
      changeButton=false;
      });

    }
      }
      @override
      Widget build(BuildContext context) {

      return Material(
      color: Colors.white,
      child: SingleChildScrollView(
      child: Form(
      key: _formkey,
      child: Column(
      children: [
      Image.asset("assets/images/hey.png", fit: BoxFit.cover),
      SizedBox(
      height: 20.0,
      ),
      Text(
      "Welcome $name ",
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
      SizedBox(
      height: 20.0,
      ),
      Padding(
      padding:
      const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
      child: Column(
      children: [
      TextFormField(
      decoration: InputDecoration(
      hintText: "Enter username",
      labelText: "Username",

      ),
      validator: (String ? value) {
          if(value!=null && value.isEmpty){
            return "Username cant be empty";
          }

      return null;
      },
      onChanged: (value){
      name=value;
      setState(() {

      });
      },

      ),
      TextFormField(
      obscureText: true,
      decoration: InputDecoration(
      hintText: "Enter password",
      labelText: "Password",
      ),
      validator: (String ? value){
        if(value!=null && value.isEmpty){
          return "Password cant be empty";

        }
        else if(value!=null && value.length <8){
          return " Minimum length of password must be 8 ";
        }
        return null;

      },
      ),
      SizedBox(
      height: 40.0,
      ),
      Material(
      color: Colors.deepPurple,
      borderRadius: BorderRadius.circular(changeButton?50:8),
      child: InkWell(
      onTap: () =>moveToHome(context),
      child: AnimatedContainer(
      duration: Duration(seconds:1),
      alignment: Alignment.center,
      height: 50,
      width: changeButton?50:150,
      child: changeButton ? Icon(Icons.done,
      color: Colors.white,) :Text("Login",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize:
      19),),

      ),
      ),
      ),
      //ElevatedButton(
      //onPressed: () {
      //Navigator.pushNamed(context, MyRoutes.homeRoute);
      //},
      //child: Text("Login"),
      //style: TextButton.styleFrom(minimumSize: Size(150, 45)),
      //)
      ],
      ),
      ),
      ],
      ),
      ),
      ),
      );
      }
      }