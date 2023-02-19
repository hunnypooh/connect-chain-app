import 'dart:io';

import 'package:demo_app/models/goods.dart';
import 'package:demo_app/providers/post/post_register_state.dart';
import 'package:demo_app/screens/register/select_nft_register_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart' as fbAuth;

import '../../models/custom_error.dart';
import '../../providers/post/post_list_provider.dart';
import '../../providers/post/post_register_provider.dart';
import '../../utils/error_dialog.dart';
import '../../utils/input_image.dart';
import '../show_category_screen.dart';

class PostRegisterScreen extends StatefulWidget {
  static const routeName = '/post-register';
  const PostRegisterScreen({Key? key}) : super(key: key);

  @override
  State<PostRegisterScreen> createState() => _PostRegisterScreenState();
}

class _PostRegisterScreenState extends State<PostRegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  String? _title, _category, _price, _desc;

  late Goods selectedGoods;
  bool isSelected = false;
  late File? _pickedImage;

  void _submit() async {
    setState(() {
      _autovalidateMode = AutovalidateMode.always;
    });
    final String uid = context.read<fbAuth.User?>()!.uid;

    final form = _formKey.currentState;

    print('title: $_title, category: $_category, price: $_price, desc: $_desc');
    if (form == null || !form.validate()) return;

    form.save();

    print('title: $_title, category: $_category, price: $_price, desc: $_desc');
    try {
      await context.read<PostRegisterProvider>().registerPost(
            goods_id: selectedGoods.goods_id,
            thumbnailImagePath: selectedGoods.imagePath[0],
            imagePath: ["", ""],
            title: _title!,
            category: _category!,
            price: _price!,
            desc: _desc!,
            time: "",
            user_id: uid,
          );
      context.read<PostListProvider>().getAllPost();
      Navigator.pop(context);
    } on CustomError catch (e) {
      errorDialog(context, e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final postRegisterState = context.watch<PostRegisterProvider>().state;
    print(postRegisterState.postRegisterStatus);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('판매글 등록하기'),
        titleTextStyle: TextStyle(fontSize: 20, color: Colors.black),
        centerTitle: true,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.cancel,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      child: Text("판매글로 등록할 nft 선택하기"),
                      style: ElevatedButton.styleFrom(
                        textStyle: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                        ),
                        primary:
                            Theme.of(context).primaryColor.withOpacity(0.7),
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        elevation: 0,
                      ),
                      onPressed: () async {
                        final result = await Navigator.of(context)
                            .pushNamed(SelectNftRegisterScreen.routeName);
                        if (result != null) {
                          setState(() {
                            selectedGoods = result as Goods;
                            isSelected = true;
                          });
                        }
                      },
                    ),
                  ),
                ],
              ),
              isSelected == false
                  ? Expanded(
                      child: Row(
                        children: [
                          SizedBox(
                            height: 100,
                          ),
                        ],
                      ),
                    )
                  : _buildCard(selectedGoods),
              SizedBox(
                height: 10,
              ),

              TextFormField(
                decoration: InputDecoration(labelText: '글 제목'),
                onSaved: (String? value) {
                  _title = value;
                },
              ),

              //TODO 카테고리 화면으로 이동해서 선택하도록 변경

              // ListTile(
              //   title: Text('카테고리 선택'),
              //   trailing: const Icon(Icons.chevron_right),
              //   onTap: () {
              //     Navigator.of(context).push(
              //       MaterialPageRoute(
              //         builder: ((_) => ShowCategoryScreen()),
              //       ),
              //     );
              //   },
              // ),
              TextFormField(
                decoration: InputDecoration(labelText: '카테고리 입력'),
                validator: (String? value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Name required';
                  }
                  return null;
                },
                onSaved: (String? value) {
                  _category = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: '가격(원)'),
                validator: (String? value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Name required';
                  }
                  return null;
                },
                onSaved: (String? value) {
                  _price = value;
                },
              ),
              TextFormField(
                maxLines: 10,
                decoration: InputDecoration(labelText: '게시글 내용'),
                validator: (String? value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Name required';
                  }
                  return null;
                },
                onSaved: (String? value) {
                  _desc = value;
                },
              ),

              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: postRegisterState.postRegisterStatus ==
                              PostRegisterStatus.submitting
                          ? null
                          : _submit,
                      child: Text(
                        postRegisterState.postRegisterStatus ==
                                PostRegisterStatus.submitting
                            ? '로딩중...'
                            : '등록하기',
                      ),
                      style: ElevatedButton.styleFrom(
                        textStyle: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                        ),
                        primary: Theme.of(context).primaryColor,
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildImageAddIcon(String text) {
    return Container(
      width: 100,
      height: 100,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        onTap: () async {
          _pickedImage = await inputImage(1); //갤러리
          if (_pickedImage != null) {
            _pickedImage = null;
          }
        },
        child: Text(
          text,
          style: TextStyle(color: Colors.grey[400]),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildCard(Goods goods) {
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
                    goods.imagePath[0],
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
                      goods.goods_name,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 10),
                    goods.goods_status == "새상품"
                        ? Text(
                            "구입 날짜 : ${goods.time}",
                            style: TextStyle(fontSize: 15),
                          )
                        : Text(
                            "등록 날짜 ${goods.time}",
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
                              goods.goods_status,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            backgroundColor: goods.goods_status == "새상품"
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
  }
}
