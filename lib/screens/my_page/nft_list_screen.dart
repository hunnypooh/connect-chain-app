import 'package:demo_app/providers/goods/goods_list_provider.dart';
import 'package:demo_app/providers/goods/goods_list_state.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as fbAuth;
import 'package:provider/provider.dart';

import '../../utils/error_dialog.dart';

class NftListScreen extends StatefulWidget {
  static const routeName = '/nft-list';

  @override
  State<NftListScreen> createState() => _NftListScreenState();
}

class _NftListScreenState extends State<NftListScreen> {
  late final GoodsListProvider goodsProv;

  @override
  void initState() {
    super.initState();
    goodsProv = context.read<GoodsListProvider>();
    goodsProv.addListener(errorDialogListener);
    _getAllGoods();
  }

  void _getAllGoods() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final String uid = context.read<fbAuth.User?>()!.uid;
      context.read<GoodsListProvider>().getAllGoods(signin_user_id: uid);
    });
  }

  void errorDialogListener() {
    if (goodsProv.state.goodsListStatus == GoodsListStatus.error) {
      errorDialog(context, goodsProv.state.error);
    }
  }

  @override
  void dispose() {
    goodsProv.removeListener(errorDialogListener);
    super.dispose();
  }

  Widget build(BuildContext context) {
    final goodsState = context.watch<GoodsListProvider>().state;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '보유한 상품 목록',
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w900),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: goodsState.goodsList.length,
        itemBuilder: (context, index) {
          return Card(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    child: Row(
                      children: [
                        Image.network(
                          goodsState.goodsList[index].imagePath[0],
                          height: 110,
                          width: 110,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 100,
                      padding: const EdgeInsets.only(left: 20, top: 2),
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 5),
                          Text(
                            goodsState.goodsList[index].goods_name,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 10),
                          goodsState.goodsList[index].goods_status == "새상품"
                              ? Text(
                                  "구입 날짜 : ${goodsState.goodsList[index].time}",
                                  style: TextStyle(fontSize: 15),
                                )
                              : Text(
                                  "등록 날짜 ${goodsState.goodsList[index].time}",
                                  style: TextStyle(fontSize: 15),
                                ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Chip(
                                  labelPadding: EdgeInsets.all(2.0),
                                  label: Text(
                                    goodsState.goodsList[index].goods_status,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  backgroundColor: goodsState
                                              .goodsList[index].goods_status ==
                                          "새상품"
                                      ? Colors.amber
                                      : Colors.green,
                                  elevation: 3.0,
                                  shadowColor: Colors.grey[60],
                                  padding: EdgeInsets.all(8.0),
                                ),
                                SizedBox(width: 10),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
