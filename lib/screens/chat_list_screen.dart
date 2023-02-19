// import 'package:flutter/material.dart';

// import '../dummy_data.dart';
// import '../models/chat_item.dart';

// class ChatListScreen extends StatelessWidget {
//   final List<ChatItem> chatItems = DUMMY_CHAT;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: ListView.builder(
//         itemBuilder: (context, index) {
//           return Container(
//             padding: EdgeInsets.all(13),
//             decoration: BoxDecoration(
//               border: Border(
//                 bottom: BorderSide(
//                   color: Colors.black12,
//                 ),
//               ),
//             ),
//             child: Row(
//               children: <Widget>[
//                 CircleAvatar(
//                   backgroundImage:
//                       AssetImage(chatItems[index].profileImagePath),
//                 ),
//                 SizedBox(width: 15),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Row(
//                       children: [
//                         Text(
//                           chatItems[index].name,
//                           style: TextStyle(
//                             fontSize: 15,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         SizedBox(width: 5),
//                         Text(
//                           chatItems[index].location,
//                           style: TextStyle(color: Colors.black38, fontSize: 12),
//                         ),
//                         Text(
//                           ' · ',
//                           style: TextStyle(color: Colors.black38, fontSize: 12),
//                         ),
//                         Text(
//                           chatItems[index].time,
//                           style: TextStyle(color: Colors.black38, fontSize: 12),
//                         ),
//                       ],
//                     ),
//                     // SizedBox(height: 5),
//                     Text(chatItems[index].messageLatest),
//                   ],
//                 ),
//                 Spacer(),
//                 ClipRRect(
//                   child: Image.asset(
//                     chatItems[index].itemImagePath,
//                     height: 40,
//                     width: 40,
//                     fit: BoxFit.cover,
//                   ),
//                   borderRadius: BorderRadius.all(Radius.circular(10)),
//                 ),
//               ],
//             ),
//           );
//         },
//         itemCount: chatItems.length,
//       ),
//     );
//   }
// }
