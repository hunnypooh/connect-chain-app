import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  static const routename = '/history-list';

  final infos = [
    PageInfo('assets/images/macbook.jpg', '1번째 판매자', '거래쿨', '신뢰도 보통',
        '거래일시 : 19.8.3'),
    PageInfo('assets/images/macbook2.jpg', '2번째 판매자', '쿨쿨', '신뢰도 높음',
        '거래일시 : 20.3.6'),
    PageInfo('assets/images/macbook.jpg', '3번째 판매자', '쿨거래해요', '신뢰도 낮음',
        '거래일시 : 22.1.3'),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('거래 기록'),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      body: ListView(
        itemExtent: 120,
        children: infos.map((info) => makeRowItem(context, info)).toList(),
      ),
    );
  }

  Widget makeRowItem(BuildContext context, PageInfo info) {
    return Center(
      child: Column(
        children: [
          Container(
            color: Theme.of(context).primaryColor.withOpacity(0.2),
            child: ListTile(
              leading: Image.asset(
                info.image,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    radius: 25,
                    backgroundImage:
                        Image.asset("assets/images/user.png").image,
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        info.who,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text(
                        info.trust,
                        style: TextStyle(fontSize: 13),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    child: Text(
                      info.when,
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
                        builder: (BuildContext context) => Detail(info: info)));
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Image(
            image: AssetImage("assets/images/arrow.png"),
            width: 30,
            color: Theme.of(context).primaryColor,
          ),
        ],
      ),
    );
  }
}

class PageInfo {
  PageInfo(this.image, this.num, this.who, this.trust, this.when);

  String image;
  String num;
  String who;
  String trust;
  String when;
}

class Detail extends StatelessWidget {
  Detail({Key? key, required this.info}) : super(key: key);
  final PageInfo info;

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
                      child: Image.asset("assets/images/user.png"),
                    ),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        info.who,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text(info.trust)
                    ],
                  ),
                ],
              ),
            ),
            padding: EdgeInsets.all(20.0),
          ),
          Container(
            child: Image.asset(
              info.image,
              fit: BoxFit.contain,
            ),
            padding: EdgeInsets.all(10.0),
          ),
        ]),
      ),
    );
  }
}
