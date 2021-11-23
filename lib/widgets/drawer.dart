import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          padding: EdgeInsets.zero,
          
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(margin: EdgeInsets.zero,
            accountName: Text("Yashaswi Garg"),
            accountEmail: Text("yashugarg23@gmail.com"),
            currentAccountPicture: Image.asset("assets/images/profile.jpeg"),
            //currentAccountPicture: CircleAvatar(
            //backgroundImage: AssetImage("assets/images/profile.jpeg"),),
            ),
          
          ),
          ListTile(
      leading: Icon(
        CupertinoIcons.home,
        color: Colors.white,),
        title: Text(
          "Home",
        textScaleFactor: 1.2,
        style:TextStyle(color: Colors.white)) ,
      ),
      ListTile(
      leading: Icon(
        CupertinoIcons.profile_circled,
        color: Colors.white,),
        title: Text(
          "Profile",
        textScaleFactor: 1.2,
        style:TextStyle(color: Colors.white)) ,
      ),
      ListTile(
      leading: Icon(
        CupertinoIcons.mail,
        color: Colors.white,),
        title: Text(
          "Email me",
        textScaleFactor: 1.2,
        style:TextStyle(color: Colors.white)) ,
      ),
          ],
        ),
        
      ),
      
    );
    
  }
}