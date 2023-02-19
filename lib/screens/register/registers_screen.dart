import 'package:demo_app/screens/register/old_product_register_screen.dart';
import 'package:demo_app/screens/register/post_register_screen.dart';
import 'package:flutter/material.dart';

import 'new_product_register_screen.dart';

class RegistersScreen extends StatelessWidget {
  const RegistersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            child: Text("NFT 등록(새상품)"),
            style: ElevatedButton.styleFrom(
              textStyle: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
              ),
              primary: Theme.of(context).primaryColor,
              padding: const EdgeInsets.symmetric(vertical: 10.0),
            ),
            onPressed: () => Navigator.of(context).pushNamed(
              NewProductRegisterScreen.routeName,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            child: Text("NFT 등록(사용하고 있는 상품)"),
            style: ElevatedButton.styleFrom(
              textStyle: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
              ),
              primary: Theme.of(context).primaryColor,
              padding: const EdgeInsets.symmetric(vertical: 10.0),
            ),
            onPressed: () => Navigator.of(context).pushNamed(
              OldProductRegisterScreen.routeName,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            child: Text("판매글 등록"),
            style: ElevatedButton.styleFrom(
              textStyle: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
              ),
              primary: Theme.of(context).primaryColor,
              padding: const EdgeInsets.symmetric(vertical: 10.0),
            ),
            onPressed: () => Navigator.of(context).pushNamed(
              PostRegisterScreen.routeName,
            ),
          ),
        ),
      ],
    );
  }
}
