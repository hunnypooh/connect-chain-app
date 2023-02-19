// import 'package:flutter/material.dart';

// import '../models/goods.dart';

// class GoodsContainer extends StatelessWidget {
//   final Goods goods;
//   GoodsContainer(this.goods);
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 140,
//       decoration: BoxDecoration(
//         border: Border(
//           bottom: BorderSide(
//             color: Colors.black12,
//           ),
//         ),
//       ),
//       child: Row(
//         children: <Widget>[
//           // Container(
//           //   margin: EdgeInsets.all(15),
//           //   decoration: BoxDecoration(
//           //     borderRadius: BorderRadius.all(Radius.circular(10.0)),
//           //   ),
//           //   child: Image.asset(
//           //     goods.imagePath[0],
//           //     height: 110,
//           //     width: 110,
//           //     fit: BoxFit.cover,
//           //   ),
//           // ),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(height: 18),
//                 Text(
//                   goods.title,
//                   style: TextStyle(fontSize: 15),
//                 ),
//                 Row(
//                   children: [
//                     Text(
//                       ' · ',
//                       style: TextStyle(color: Colors.black38, fontSize: 12),
//                     ),
//                     Text(
//                       goods.time,
//                       style: TextStyle(color: Colors.black38, fontSize: 12),
//                     ),
//                   ],
//                 ),
//                 Text(
//                   goods.price,
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 25),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: <Widget>[
//                     Icon(
//                       Icons.favorite_border,
//                       color: Colors.black26,
//                       size: 20,
//                     ),
//                     SizedBox(width: 2),
//                     // Text(goods.like_ids.length.toString()),
//                     SizedBox(width: 10),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
