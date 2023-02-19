import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/post.dart';
import '../providers/post/post_list_provider.dart';
import '../providers/post/post_list_state.dart';
import '../utils/error_dialog.dart';
import 'product_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
    //모든게 정상일 경우 profile 표시
    return Container(
      child: ListView.builder(
        itemCount: postState.postList.length,
        itemBuilder: (BuildContext context, int i) {
          return buildGoodsContainer(context, postState.postList[i]);
        },
      ),
    );
  }

  Widget buildGoodsContainer(BuildContext context, Post post) {
    return InkWell(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) {
            return ProductDetailScreen(post: post);
          },
        ),
      ),
      child: Container(
        height: 140,
        // decoration: BoxDecoration(
        //   border: Border(
        //     bottom: BorderSide(
        //       color: Colors.black12,
        //       // color: Theme.of(context).dividerColor,
        //     ),
        //   ),
        // ),
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: ClipRRect(
                child: Image.network(
                  post.thumbnailImagePath,
                  height: 110,
                  width: 110,
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10)),
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
                  Text(
                    post.price,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Icon(
                        // post.like ? Icons.favorite : Icons.favorite_border,
                        Icons.favorite_border,
                        color: Colors.black26,
                        size: 20,
                      ),
                      SizedBox(width: 2),
                      // Text(post.like_ids.length.toString()),
                      SizedBox(width: 10),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
