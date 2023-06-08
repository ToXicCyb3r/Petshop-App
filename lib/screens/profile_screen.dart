import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:petshop/screens/theme.dart';
import 'package:petshop/widgets/petshop_card.dart';
import 'package:petshop/models/menu.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfilScreenState createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfileScreen>{
  final double coverHeight = 280;
  final double profileHeight = 144;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          buildTop(),
          buildContent(),
        ],
      ),
    );
  }
  Widget buildTop() {
    final top = coverHeight - profileHeight / 2;
    final bottom = profileHeight /2;
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: bottom),
          child: buildCoverImage(),
        ),

        Positioned(
          top: top,
          child: buildProfileImage(),)

      ],
    );
  }

 Widget buildCoverImage() => Container(
   color: Colors.grey,
   child: Image.network('https://images.unsplash.com/photo-1585937250791-efc81fc76e43?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cHVycGxlJTIwY2F0fGVufDB8fDB8fHww&w=1000&q=80',
   width: double.infinity,
   height: coverHeight,
   fit: BoxFit.cover,
   ),
 );

  Widget buildProfileImage() => CircleAvatar(
    radius: profileHeight / 2,
    backgroundColor: Colors.grey.shade800,
    backgroundImage: const NetworkImage('https://e1.pxfuel.com/desktop-wallpaper/940/647/desktop-wallpaper-the-best-16-default-pfp-aesthetic-kidcore-pfp-icon-thumbnail.jpg',

    ),
  );

 Widget buildContent() => Container(
   child: const Column(
     children: [
       Text('USER ONE',
       style: TextStyle(
         fontSize: 28,
         fontWeight: FontWeight.bold,
       ),
       ),
       SizedBox(height: 16,),
       Text('Jakarta, Indonesia',
         style: TextStyle(
           fontSize: 20,
         ),
       ),
       SizedBox(height: 16,),
     ],
   ),
 );


}