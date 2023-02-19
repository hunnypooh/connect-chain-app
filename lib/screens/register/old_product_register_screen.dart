import 'dart:io';

import 'package:demo_app/providers/goods/goods_register_provider.dart';
import 'package:demo_app/providers/goods/goods_register_state.dart';
import 'package:demo_app/providers/post/post_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart' as fbAuth;
import 'package:uuid/uuid.dart';

import '../../constants/db_constants.dart';
import '../../models/custom_error.dart';
import '../../utils/error_dialog.dart';
import '../../utils/input_image.dart';

class OldProductRegisterScreen extends StatefulWidget {
  static const routeName = '/old-product-register';
  const OldProductRegisterScreen({Key? key}) : super(key: key);

  @override
  State<OldProductRegisterScreen> createState() =>
      _OldProductRegisterScreenState();
}

class _OldProductRegisterScreenState extends State<OldProductRegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  String? _goods_name, _time;
  late File? _pickedImage;
  //TODO 일단 이미지 순서대로 넣고 나중에 Map으로 front, side, behind..로 키 지정해서 하기
  List<File>? imagesFileList = [];
  List<String> imagesUrlList = [];
  List<bool> hasImageList = [false, false, false, false];

  void pickImage(int imageIndex) async {
    try {
      _pickedImage = await inputImage(1); //갤러리

      if (_pickedImage != null) {
        setState(() {
          imagesFileList!.add(_pickedImage!);
          hasImageList[imageIndex] = true;
        });
      }
    } on CustomError catch (e) {
      errorDialog(context, e);
    }
  }

  void _submit() async {
    validateForm();

    //이미지 모두 입력하도록
    if (imagesFileList!.length < 3) {
      errorDialog(
        context,
        CustomError(
          code: "",
          message: "이미지를 다 입력해주세요\n",
          plugin: "",
        ),
      );
      return;
    }

    final goodsId = const Uuid().v4();
    await registerGoods(goodsId).whenComplete(() {
      //조건에 따라서 pop이 안되서 일단 딜레이로 줌.
      Future.delayed(Duration(seconds: 3), () {
        Navigator.of(context).pop();
      });
    });
  }

  void validateForm() {
    setState(() {
      _autovalidateMode = AutovalidateMode.always;
    });

    final form = _formKey.currentState;

    print('title: $_goods_name, category: $_time\n');
    if (form == null || !form.validate()) return;

    form.save();
  }

  // Future<void> uploadImages(String goodsId) async {
  //   try {
  //     int i = 0;
  //     for (var image in imagesFileList!) {
  //       final tmpRef = storageRef.child("images/goods/${goodsId}/${i}");
  //       await tmpRef.putFile(image).whenComplete(() async {
  //         await tmpRef.getDownloadURL().then((value) {
  //           imagesUrlList.add(value);
  //           i++;
  //           print('$imagesUrlList\n');
  //         });
  //       });
  //     }
  //   } on CustomError catch (e) {
  //     errorDialog(context, e);
  //   }
  // }

  Future<void> registerGoods(String goodsId) async {
    final String uid = context.read<fbAuth.User?>()!.uid;
    try {
      await context.read<GoodsRegisterProvider>().registerGoods(
            goods_id: goodsId,
            imagesFileList: imagesFileList,
            imagesUrlList: imagesUrlList,
            goods_name: _goods_name!,
            imagePath: imagesUrlList,
            time: _time!,
            goods_status: "중고 상품",
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
    final goodsRegisterState = context.watch<GoodsRegisterProvider>().state;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('사용하고 있는 상품 NFT 등록하기'),
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
              SizedBox(
                height: 120,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildImageAddIcon("정면", 0),
                    SizedBox(width: 10),
                    _buildImageAddIcon("측면", 1),
                    SizedBox(width: 10),
                    _buildImageAddIcon("후면", 2),
                    SizedBox(width: 10),
                    Container(
                      //추가적인 사진 넣고 싶을 때
                      width: 100,
                      height: 100,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(Icons.add_a_photo_outlined),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: '상품명'),
                onSaved: (String? value) {
                  _goods_name = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: '오늘 날짜'),
                validator: (String? value) {
                  if (value == null || value.trim().isEmpty) {
                    return '날짜를 입력해주세요.';
                  }
                  return null;
                },
                onSaved: (String? value) {
                  _time = value;
                },
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: goodsRegisterState.goodsRegisterStatus ==
                              GoodsRegisterStatus.submitting
                          ? null
                          : _submit,
                      child: Text(
                        goodsRegisterState.goodsRegisterStatus ==
                                GoodsRegisterStatus.submitting
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

  Container _buildImageAddIcon(String text, int imageIndex) {
    return Container(
      width: 100,
      height: 100,
      padding: EdgeInsets.all(0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: hasImageList[imageIndex] == false
          ? InkWell(
              onTap: () => pickImage(imageIndex),
              child: Text(
                text,
                style: TextStyle(color: Colors.grey[400]),
                textAlign: TextAlign.center,
              ),
            )
          : ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.file(
                imagesFileList![imageIndex],
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
    );
  }
}
