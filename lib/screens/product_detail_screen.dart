// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/post.dart';
import '../models/user.dart';
import '../providers/post/post_provider.dart';
import '../providers/post/post_state.dart';

class ProductDetailScreen extends StatefulWidget {
  final Post post;

  const ProductDetailScreen({super.key, required this.post});
  @override
  ProductDetailScreenState createState() => ProductDetailScreenState();
}

class ProductDetailScreenState extends State<ProductDetailScreen> {
  late final PostProvider postProv;
  late final User user;

  @override
  void initState() {
    super.initState();
    postProv = context.read<PostProvider>();
    _getPost(widget.post.post_id);
  }

  void _getPost(String postId) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PostProvider>().getPost(postId: postId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final postState = context.watch<PostProvider>().state;
    //
    if (postState.postStatus == PostStatus.initial) {
      return Container();
    } else if (postState.postStatus == PostStatus.loading) {
      //로딩중이면
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else if (postState.postStatus == PostStatus.error) {
      //에러면 당연히 dialog를 표시하지만, empty 위젯이라도 리턴하지 않으면, userprofile 정보를 리턴하는 다음 단계로 넘어감
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

    //모든게 정상일 경우 표시
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _appbarWidget(),
      body: _bodyWidget(postState),
      bottomNavigationBar: _bottomBarWidget(postState.post),
    );
  }

  PreferredSizeWidget _appbarWidget() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          )),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.more_vert,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _bodyWidget(PostState postState) {
    return SingleChildScrollView(
      child: Column(
        children: [
          sliderWidget(postState.imagePaths),
          sellerinfo(postState.user),
          line(),
          contentdetail(postState.post),
        ],
      ),
    );
  }

  Widget sliderWidget(List<String> imagePaths) {
    return Container(
        child: Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: MediaQuery.of(context).size.width,
            initialPage: 0,
            enableInfiniteScroll: false,
            viewportFraction: 1.0,
            enlargeCenterPage: false,
          ),
          items: imagePaths.map((img) {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image.network(
                img,
                fit: BoxFit.cover,
              ),
            );
          }).toList(),
        ),
      ],
    ));
  }

  Widget sellerinfo(User userInfo) {
    late String userLevel;
    if (userInfo.level == 1 || userInfo.level == 2)
      userLevel = "신뢰도 보통";
    else if (userInfo.level == 3 || userInfo.level == 4)
      userLevel = "신뢰도 좋음";
    else if (userInfo.level >= 5) userLevel = "신뢰도 짱짱";

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Container(
              width: 50,
              height: 50,
              child: Image.network(userInfo.profileImage),
            ),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userInfo.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(userLevel),
            ],
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  // onTap: () => Navigator.of(context).pushNamed(
                  //   HistoryScreen.routename,
                  // ),
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Theme.of(context).primaryColor,
                    ),
                    child: Row(
                      children: [
                        const Text(
                          "거래 기록",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Image(
                          image: AssetImage("assets/images/trade.png"),
                          width: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget line() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      height: 1,
      color: Theme.of(context).dividerColor,
    );
  }

  Widget contentdetail(Post post) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 20),
          Text(
            post.title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(height: 15),
          Text(
            // "${post.category} . ${post.time}",

            "${post.category}",
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
          SizedBox(height: 15),
          Text(
            post.desc,
            style: TextStyle(
              fontSize: 15,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _bottomBarWidget(Post post) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        padding: const EdgeInsets.only(top: 3),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              width: 1,
              color: Theme.of(context).dividerColor,
            ),
          ),
        ),
        width: MediaQuery.of(context).size.width,
        height: 55,
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                // ScaffoldMessenger.of(context).showSnackBar(
                //   SnackBar(
                //     duration: Duration(seconds: 1),
                //     content: Text(
                //       post.like ? "관심목록에 제거되었습니다." : "관심목록에서 추가되었습니다.",
                //     ),
                //   ),
                // );
                // context.read<PostListProvider>().toggleGoods(post._id);
              },
              child: Image.asset(
                // post.like
                //     ? 'assets/images/cart-fill.png'
                //     : 'assets/images/cart-empty.png',
                'assets/images/cart-empty.png',
                width: 25,
                height: 25,
                color: Theme.of(context).primaryColor,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 15, right: 10),
              width: 1.5,
              height: 40,
              color: Theme.of(context).dividerColor,
            ),
            Column(
              children: [
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  post.price,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Theme.of(context).focusColor,
                  ),
                  child: Text(
                    "거래희망",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
