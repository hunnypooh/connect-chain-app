import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import '../../models/post.dart';
import '../../providers/post/post_list_provider.dart';
import '../../providers/post/post_list_state.dart';
import '../../utils/error_dialog.dart';
import '../product_detail_screen.dart';

import '../../models/goods.dart';

class SellListScreen extends StatefulWidget {
  static const routeName = '/sell-list';

  @override
  State<SellListScreen> createState() => _SellListScreenState();
}

class _SellListScreenState extends State<SellListScreen> {
  late final PostListProvider postListProv;
  List<String> postThumbnailImageList = [];

  @override
  void initState() {
    super.initState();
    postListProv = context.read<PostListProvider>();
    postListProv.addListener(errorDialogListener);
    _getAllPost();
  }

  void _getAllPost() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PostListProvider>().getAllPost();
    });
  }

  void errorDialogListener() {
    if (postListProv.state.postListStatus == PostListStatus.error) {
      errorDialog(context, postListProv.state.error);
    }
  }

  @override
  void dispose() {
    postListProv.removeListener(errorDialogListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final postState = context.watch<PostListProvider>().state;
    if (postState.postListStatus == PostListStatus.initial) {
      return Container();
    } else if (postState.postListStatus == PostListStatus.loading) {
      //로딩중이면
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if (postState.postListStatus == PostListStatus.error) {
      //에러면 당연히 dialog를 표시하지만, empty 위젯이라도 리턴하지 않으면, 이 정보를 리턴하는 다음 단계로 넘어감
      return Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/error.png',
              width: 75,
              height: 75,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 20.0),
            Text(
              'Ooops!\nTry again',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.red,
              ),
            ),
          ],
        ),
      );
    }

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
          shape: Border(
            bottom: BorderSide(
              color: Colors.black26,
            ),
          ),
          title: Text(
            '판매글 목록',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
          ),
          bottom: TabBar(
            labelColor: Colors.black,
            unselectedLabelColor: Colors.black26,
            labelStyle: TextStyle(fontWeight: FontWeight.w900),
            indicatorColor: Theme.of(context).primaryColor,
            tabs: [
              Tab(
                text: '판매중',
              ),
              Tab(
                text: '거래완료',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            buildSell(context),
            buildSell(context),
          ],
        ),
      ),
    );
  }

  Widget buildSell(BuildContext context) {
    final postState = context.watch<PostListProvider>().state;
    //판매중
    return Container(
      child: ListView.builder(
        itemCount: postState.postList.length,
        itemBuilder: (BuildContext context, int i) {
          return buildBuyItemContainer(context, postState.postList[i]);
        },
      ),
    );
  }

  // Widget buildFinish(BuildContext context) {
  //   //거래완료
  //   return SingleChildScrollView(
  //     child: Column(
  //       children: [
  //         buildBuyItemContainer(context, sellitems[0]),
  //         buildBuyItemContainer(context, sellitems[0]),
  //         buildBuyItemContainer(context, sellitems[0]),
  //         buildBuyItemContainer(context, sellitems[0]),
  //       ],
  //     ),
  //   );
  // }

  Widget buildBuyItemContainer(BuildContext context, Post post) {
    return Container(
      height: 140,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black12,
          ),
        ),
      ),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            child: Image.network(
              post.thumbnailImagePath,
              height: 110,
              width: 110,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 18),
                Text(
                  post.title,
                  style: TextStyle(fontSize: 15),
                ),
                Row(
                  children: [
                    Text(
                      post.time,
                      style: TextStyle(color: Colors.black38, fontSize: 12),
                    ),
                  ],
                ),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Icon(
                      Icons.favorite_border,
                      color: Colors.black26,
                      size: 20,
                    ),
                    SizedBox(width: 2),
                    SizedBox(width: 10),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
