// import '../../models/goods.dart';
// import '../product_detail_screen.dart';
// import 'package:flutter/material.dart';
// import '../../dummy_data.dart';

// class BuyListScreen extends StatelessWidget {
//   static const routeName = '/buy-list';
//   final buyitems = DUMMY_GOODS;

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           centerTitle: false,
//           backgroundColor: Colors.white,
//           foregroundColor: Colors.black,
//           elevation: 0,
//           shape: Border(
//             bottom: BorderSide(
//               color: Colors.black26,
//             ),
//           ),
//           title: Text(
//             '구매내역',
//             style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
//           ),
//         ),
//         body: ListView(
//           children: <Widget>[
//             buildBuy(context),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildBuyItemContainer(BuildContext context, Goods goods) {
//     return GestureDetector(
//       onTap: () => Navigator.of(context).pushNamed(
//         ProductDetailScreen.routeName,
//       ),
//       child: Container(
//         height: 140,
//         decoration: BoxDecoration(
//           border: Border(
//             bottom: BorderSide(
//               color: Colors.black12,
//             ),
//           ),
//         ),
//         child: Row(
//           children: <Widget>[
//             Container(
//               margin: EdgeInsets.all(15),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.all(Radius.circular(10.0)),
//               ),
//               child: Image.asset(
//                 goods.imagePath[0],
//                 height: 110,
//                 width: 110,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(height: 18),
//                   Text(
//                     goods.title,
//                     style: TextStyle(fontSize: 15),
//                   ),
//                   Row(
//                     children: [
//                       Text(
//                         goods.time,
//                         style: TextStyle(color: Colors.black38, fontSize: 12),
//                       ),
//                     ],
//                   ),
//                   Text(
//                     goods.price,
//                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(height: 25),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: <Widget>[
//                       Icon(
//                         Icons.favorite_border,
//                         color: Colors.black26,
//                         size: 20,
//                       ),
//                       SizedBox(width: 2),
//                       // Text(goods.like_ids.length.toString()),
//                       SizedBox(width: 10),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildBuy(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           buildBuyItemContainer(context, buyitems[0]),
//           buildBuyItemContainer(context, buyitems[1]),
//           buildBuyItemContainer(context, buyitems[0]),
//           buildBuyItemContainer(context, buyitems[1]),
//         ],
//       ),
//     );
//   }
// }
