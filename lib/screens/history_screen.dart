import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../models/history.dart';

class HistoryScreen extends StatelessWidget {
  static const routename = '/history-list';
  final historyItems = DUMMY_HISTORY;
  // final infos = [
  //   PageInfo('assets/images/macbook.jpg', '1번째 판매자', '거래쿨', '신뢰도 보통',
  //       '거래일시 : 19.8.3'),
  //   PageInfo('assets/images/macbook2.jpg', '2번째 판매자', '쿨쿨', '신뢰도 높음',
  //       '거래일시 : 20.3.6'),
  //   PageInfo('assets/images/macbook.jpg', '3번째 판매자', '쿨거래해요', '신뢰도 낮음',
  //       '거래일시 : 22.1.3'),
  // ];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('거래 기록'),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: ListView.builder(
          itemCount: historyItems.length,
          itemBuilder: (context, index) {
            return makeRowItem(context, historyItems[index], index);
          },
        ),
      ),
    );
  }

  Widget makeRowItem(BuildContext context, History history, int index) {
    return Center(
      child: Column(
        children: [
          Container(
            color: Theme.of(context).primaryColor.withOpacity(0.2),
            child: ListTile(
              leading: Image.asset(
                history.goods_image_path,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: Image.asset(history.user_image_path).image,
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        history.who,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text(
                        history.level.toString(),
                        style: TextStyle(fontSize: 13),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    child: Text(
                      history.when,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    padding: EdgeInsets.only(left: 12.0, right: 12.0),
                  )
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => Detail(history: history),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          index < historyItems.length - 1
              ? Image(
                  image: AssetImage("assets/images/arrow.png"),
                  width: 30,
                  color: Theme.of(context).primaryColor,
                )
              : SizedBox(),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

// class PageInfo {
//   PageInfo(this.image, this.num, this.who, this.trust, this.when);

//   String image;
//   String num;
//   String who;
//   String trust;
//   String when;
// }

class Detail extends StatelessWidget {
  Detail({Key? key, required this.history}) : super(key: key);
  final History history;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("상세 페이지")),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Container(
            child: Center(
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      width: 50,
                      height: 50,
                      child: Image.asset(history.user_image_path),
                    ),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        history.who,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text(history.level.toString())
                    ],
                  ),
                ],
              ),
            ),
            padding: EdgeInsets.all(20.0),
          ),
          Container(
            child: Image.asset(
              history.goods_image_path,
              fit: BoxFit.contain,
            ),
            padding: EdgeInsets.all(10.0),
          ),
        ]),
      ),
    );
  }
}
