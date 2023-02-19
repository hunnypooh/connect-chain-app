import 'package:flutter/material.dart';

class ShowCategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('카테고리 선택'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('생활가전'),
          ),
          ListTile(
            title: Text('디지털기기'),
          ),
          ListTile(
            title: Text('여성의류'),
          ),
          ListTile(
            title: Text('여성잡화'),
          ),
          ListTile(
            title: Text('남성의류'),
          ),
          ListTile(
            title: Text('남성잡화'),
          ),
        ],
      ),
    );
  }
}
