import 'package:flutter/material.dart';

class MainNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      padding: const EdgeInsets.all(6),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: <Widget>[
                Icon(Icons.home),
                Text(
                  '홈',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Icon(Icons.home_work_outlined),
                Text(
                  '동네생활',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Icon(Icons.location_on_outlined),
                Text(
                  '내 근처',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Icon(Icons.chat_bubble_outline_rounded),
                Text(
                  '채팅',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Icon(Icons.person_outline_sharp),
                Text(
                  '나의 당근',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
