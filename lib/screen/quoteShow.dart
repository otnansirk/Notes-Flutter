import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gson/gson.dart';
import 'package:notes/screen/quoteList.dart';
import 'package:notes/utils/shared_prefs.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuoteShow extends StatefulWidget {
  // String dataIndex = index;
  @override
  _QuoteShowState createState() => _QuoteShowState();
}

class _QuoteShowState extends State<QuoteShow> {
  final _formKey = GlobalKey<FormState>();
  String quator = '';
  String quote = '';

  getCurrentQuote() async {
    if (sharedPrefs.data != 'null') {
      quator = jsonDecode(sharedPrefs.currentData)['quator'];
      quote = jsonDecode(sharedPrefs.currentData)['quote'];
    }
  }

  @override
  Widget build(BuildContext context) {
    getCurrentQuote();
    return Scaffold(
      appBar: AppBar(
        title: Text("Show quote"),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 5),
                child: Text("Oleh: " + quator,
                    style: new TextStyle(fontWeight: FontWeight.bold)),
              ),
              Container(
                child: Text(quote),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
