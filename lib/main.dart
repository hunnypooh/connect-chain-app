import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_app/providers/goods/goods_list_provider.dart';
import 'package:demo_app/providers/goods/goods_register_provider.dart';
import 'package:demo_app/providers/post/post_list_provider.dart';
import 'package:demo_app/providers/post/post_provider.dart';
import 'package:demo_app/providers/post/post_register_provider.dart';
import 'package:demo_app/providers/repositories/goods_repository.dart';
import 'package:demo_app/providers/repositories/post_repository.dart';
import 'package:demo_app/screens/register/select_nft_register_screen.dart';
import 'providers/goods/goods_provider.dart';
import 'providers/profile/profile_provider.dart';
import 'providers/repositories/profile_repository.dart';
import 'screens/history_screen.dart';
import 'screens/my_page/buy_list_screen.dart';
import 'screens/my_page/nft_list_screen.dart';
import 'screens/product_detail_screen.dart';
import 'screens/register/new_product_register_screen.dart';
import 'screens/register/old_product_register_screen.dart';
import 'screens/register/post_register_screen.dart';
import 'screens/sign/splash_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as fbAuth;
import 'package:provider/provider.dart';

import 'screens/tabs_screen.dart';
import 'providers/auth/auth_provider.dart';
import 'providers/repositories/auth_repository.dart';
import 'providers/signin/signin_provider.dart';
import 'providers/signup/signup_provider.dart';
import 'screens/my_page/sell_list_screen.dart';
import 'screens/sign/signin_page.dart';
import 'screens/sign/signup_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(DemoApp());
}

class DemoApp extends StatefulWidget {
  @override
  State<DemoApp> createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthRepository>(
          create: (context) => AuthRepository(
            firebaseFirestore: FirebaseFirestore.instance,
            firebaseAuth: fbAuth.FirebaseAuth.instance,
          ),
        ),
        Provider<ProfileRepository>(
          create: (context) => ProfileRepository(
            firebaseFirestore: FirebaseFirestore.instance,
          ),
        ),
        Provider<GoodsRepository>(
          create: (context) => GoodsRepository(
            firebaseFirestore: FirebaseFirestore.instance,
          ),
        ),
        Provider<PostRepository>(
          create: (context) => PostRepository(
            firebaseFirestore: FirebaseFirestore.instance,
          ),
        ),
        StreamProvider<fbAuth.User?>(
          create: (context) => context.read<AuthRepository>().user,
          initialData: null,
        ),
        ChangeNotifierProxyProvider<fbAuth.User?, AuthProvider>(
          create: (context) => AuthProvider(
            authRepository: context.read<AuthRepository>(),
          ),
          update: (BuildContext context, fbAuth.User? userStream,
                  AuthProvider? authProvider) =>
              authProvider!..update(userStream),
        ),
        ChangeNotifierProvider<SigninProvider>(
          create: (context) => SigninProvider(
            authRepository: context.read<AuthRepository>(),
          ),
        ),
        ChangeNotifierProvider<SignupProvider>(
          create: (context) => SignupProvider(
            authRepository: context.read<AuthRepository>(),
          ),
        ),
        ChangeNotifierProvider<ProfileProvider>(
          create: (context) => ProfileProvider(
            profileRepository: context.read<ProfileRepository>(),
          ),
        ),
        ChangeNotifierProvider<GoodsRegisterProvider>(
          create: (context) => GoodsRegisterProvider(
            goodsRepository: context.read<GoodsRepository>(),
          ),
        ),
        ChangeNotifierProvider<GoodsListProvider>(
          create: (context) => GoodsListProvider(
            goodsRepository: context.read<GoodsRepository>(),
          ),
        ),
        ChangeNotifierProvider<GoodsProvider>(
          create: (context) => GoodsProvider(
            goodsRepository: context.read<GoodsRepository>(),
          ),
        ),
        ChangeNotifierProvider<PostRegisterProvider>(
          create: (context) => PostRegisterProvider(
            postRepository: context.read<PostRepository>(),
          ),
        ),
        ChangeNotifierProvider<PostListProvider>(
          create: (context) => PostListProvider(
            postRepository: context.read<PostRepository>(),
          ),
        ),
        ChangeNotifierProvider<PostProvider>(
          create: (context) => PostProvider(
            postRepository: context.read<PostRepository>(),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Carrot Market Clone',
        home: SplashPage(),
        routes: {
          SignupPage.routeName: (ctx) => SignupPage(),
          SigninPage.routeName: (ctx) => SigninPage(),
          TabsScreen.routeName: (ctx) => TabsScreen(),
          NftListScreen.routeName: (ctx) => NftListScreen(),
          SellListScreen.routeName: (ctx) => SellListScreen(),
          // BuyListScreen.routeName: (ctx) => BuyListScreen(),
          NewProductRegisterScreen.routeName: (ctx) =>
              NewProductRegisterScreen(),
          OldProductRegisterScreen.routeName: (ctx) =>
              OldProductRegisterScreen(),
          PostRegisterScreen.routeName: (ctx) => PostRegisterScreen(),
          SelectNftRegisterScreen.routeName: (ctx) => SelectNftRegisterScreen(),
          HistoryScreen.routename: (ctx) => HistoryScreen(),
        },
        theme: ThemeData(
          primaryColor: Color(0xffd96b5d),
          focusColor: Color(0xffCA4E79),
          secondaryHeaderColor: Color(0xffd96b5d),
          dividerColor: Color(0xff7A4069),
        ),
      ),
    );
  }
}
