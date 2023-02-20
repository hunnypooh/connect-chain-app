import '../../providers/profile/profile_provider.dart';
import '../../providers/profile/profile_state.dart';
import '../../utils/error_dialog.dart';
import 'nft_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart' as fbAuth;
import '../../providers/auth/auth_provider.dart';
import 'sell_list_screen.dart';

class MyPageScreen extends StatefulWidget {
  @override
  State<MyPageScreen> createState() => _MyPageScreenState();
}

class _MyPageScreenState extends State<MyPageScreen> {
  late final ProfileProvider profileProv;

  @override
  void initState() {
    super.initState();
    profileProv = context.read<ProfileProvider>();
    profileProv.addListener(errorDialogListener);
    _getProfile();
  }

  void _getProfile() {
    final String uid = context.read<fbAuth.User?>()!.uid;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProfileProvider>().getProfile(uid: uid);
    });
  }

  void errorDialogListener() {
    if (profileProv.state.profileStatus == ProfileStatus.error) {
      errorDialog(context, profileProv.state.error);
    }
  }

  @override
  void dispose() {
    profileProv.removeListener(errorDialogListener);
    super.dispose();
  }

  Widget _buildProfile() {
    final profileState = context.watch<ProfileProvider>().state;

    if (profileState.profileStatus == ProfileStatus.initial) {
      return Container();
    } else if (profileState.profileStatus == ProfileStatus.loading) {
      //로딩중이면
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if (profileState.profileStatus == ProfileStatus.error) {
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
    //모든게 정상일 경우 profile 표시
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(13),
      child: Column(
        children: <Widget>[
          Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/images/profile1.png'),
              ),
              SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${profileState.user.name}",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Eco level : ${profileState.user.level}",
                    style: TextStyle(color: Colors.black38, fontSize: 12),
                  ),
                ],
              ),
              Spacer(),
            ],
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                children: [
                  Listener(
                    onPointerUp: (PointerUpEvent event) {
                      Navigator.of(context).pushNamed(
                        NftListScreen.routeName,
                      );
                    },
                    child: CircleAvatar(
                      radius: 28,
                      backgroundColor:
                          Theme.of(context).focusColor.withOpacity(0.2),
                      child: IconButton(
                        icon: Icon(Icons.receipt_sharp),
                        color: Theme.of(context).focusColor,
                        onPressed: () {},
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text('판매 상품 목록'),
                  SizedBox(height: 10),
                ],
              ),
              Column(
                children: [
                  Listener(
                    onPointerUp: (PointerUpEvent event) {
                      Navigator.of(context).pushNamed(
                        SellListScreen.routeName,
                      );
                    },
                    child: CircleAvatar(
                      radius: 28,
                      backgroundColor:
                          Theme.of(context).focusColor.withOpacity(0.2),
                      child: IconButton(
                        icon: Icon(Icons.shopping_bag),
                        color: Theme.of(context).focusColor,
                        onPressed: () {},
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text('판매 목록'),
                  SizedBox(height: 10),
                ],
              ),
              Column(
                children: [
                  Listener(
                    onPointerUp: (PointerUpEvent event) {
                      // Navigator.of(context).pushNamed(
                      //   WatchListScreen.routeName,
                      // );
                    },
                    child: CircleAvatar(
                      radius: 28,
                      backgroundColor:
                          Theme.of(context).focusColor.withOpacity(0.2),
                      child: IconButton(
                        icon: Icon(Icons.favorite),
                        color: Theme.of(context).focusColor,
                        onPressed: () {},
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text('희망 목록'),
                  SizedBox(height: 10),
                ],
              ),
              Column(
                children: [
                  Listener(
                    onPointerUp: (PointerUpEvent event) {
                      // Navigator.of(context).pushNamed(
                      //   WatchListScreen.routeName,
                      // );
                    },
                    child: CircleAvatar(
                      radius: 28,
                      backgroundColor:
                          Theme.of(context).focusColor.withOpacity(0.2),
                      child: IconButton(
                        onPressed: () {
                          context.read<AuthProvider>().signout(); //sign out 구현
                        },
                        icon: Icon(Icons.exit_to_app),
                        color: Theme.of(context).focusColor,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text('로그아웃'),
                  SizedBox(height: 10),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        _buildProfile(),
        Padding(
          padding: EdgeInsets.only(bottom: 10),
        ),
        Padding(padding: EdgeInsets.only(bottom: 10)),
      ],
    );
  }
}

class _MenuRow extends StatelessWidget {
  final IconData? icon;
  final String text;

  _MenuRow(this.icon, this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          if (icon != null) Icon(icon),
          SizedBox(width: 10),
          icon != null
              ? Text(text)
              : Text(
                  text,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ],
      ),
    );
  }
}
