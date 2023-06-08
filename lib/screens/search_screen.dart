import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>{
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(children: [
          TextField(
            decoration: InputDecoration(
              labelText: 'SEARCH', suffix: Icon(Icons.search)
            ),
          )
        ],),
      ),
    );
  }
}