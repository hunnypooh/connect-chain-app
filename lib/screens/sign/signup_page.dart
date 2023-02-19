import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:validators/validators.dart';

import '../../models/custom_error.dart';
import '../../providers/signup/signup_provider.dart';
import '../../providers/signup/signup_state.dart';
import '../../utils/error_dialog.dart';

class SignupPage extends StatefulWidget {
  SignupPage({Key? key}) : super(key: key);
  static const String routeName = '/signup';

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  String? _name, _email, _password;
  final _passwordController = TextEditingController();

  List<FocusNode> _focusNodes = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
  ]; //textformfield를 focus에 따라서 스타일 다르게 하려고

  @override
  void initState() {
    _focusNodes.forEach((node) {
      node.addListener(() {
        setState(() {});
      });
    });
    super.initState();
  }

  void _submit() async {
    setState(() {
      _autovalidateMode = AutovalidateMode.always;
    });

    final form = _formKey.currentState;

    if (form == null || !form.validate()) return;

    form.save();

    print('name: $_name, email: $_email, password: $_password');

    try {
      await context
          .read<SignupProvider>()
          .signup(name: _name!, email: _email!, password: _password!);
    } on CustomError catch (e) {
      errorDialog(context, e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final signupState = context.watch<SignupProvider>().state;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Form(
              key: _formKey,
              autovalidateMode: _autovalidateMode,
              child: ListView(
                reverse: true,
                shrinkWrap: true,
                children: [
                  Image.asset(
                    'assets/images/galaxy.png',
                    width: 250,
                    height: 250,
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    autocorrect: false,
                    focusNode: _focusNodes[0],
                    cursorColor: Theme.of(context).primaryColor,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).primaryColor, width: 2.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      filled: true,
                      labelText: 'Name',
                      labelStyle: TextStyle(
                        color: _focusNodes[0].hasFocus
                            ? Theme.of(context).primaryColor
                            : Colors.grey,
                      ),
                      prefixIcon: Icon(
                        Icons.account_box,
                        color: _focusNodes[0].hasFocus
                            ? Theme.of(context).primaryColor
                            : Colors.grey,
                      ),
                    ),
                    validator: (String? value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Name required';
                      }
                      if (value.trim().length < 2) {
                        return 'Name must be at least 2 characters long';
                      }
                      return null;
                    },
                    onSaved: (String? value) {
                      _name = value;
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false,
                    focusNode: _focusNodes[1],
                    cursorColor: Theme.of(context).primaryColor,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).primaryColor, width: 2.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      filled: true,
                      labelText: 'Email',
                      labelStyle: TextStyle(
                        color: _focusNodes[1].hasFocus
                            ? Theme.of(context).primaryColor
                            : Colors.grey,
                      ),
                      prefixIcon: Icon(
                        Icons.email,
                        color: _focusNodes[1].hasFocus
                            ? Theme.of(context).primaryColor
                            : Colors.grey,
                      ),
                    ),
                    validator: (String? value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Email required';
                      }
                      if (!isEmail(value.trim())) {
                        return 'Enter a valid email';
                      }
                      return null;
                    },
                    onSaved: (String? value) {
                      _email = value;
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    focusNode: _focusNodes[2],
                    cursorColor: Theme.of(context).primaryColor,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).primaryColor, width: 2.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      filled: true,
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        color: _focusNodes[2].hasFocus
                            ? Theme.of(context).primaryColor
                            : Colors.grey,
                      ),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: _focusNodes[2].hasFocus
                            ? Theme.of(context).primaryColor
                            : Colors.grey,
                      ),
                    ),
                    validator: (String? value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Password required';
                      }
                      if (value.trim().length < 6) {
                        return 'Password must be at least 6 characters long';
                      }
                      return null;
                    },
                    onSaved: (String? value) {
                      _password = value;
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    obscureText: true,
                    focusNode: _focusNodes[3],
                    cursorColor: Theme.of(context).primaryColor,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).primaryColor, width: 2.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      filled: true,
                      labelText: 'Confirm Password',
                      labelStyle: TextStyle(
                        color: _focusNodes[3].hasFocus
                            ? Theme.of(context).primaryColor
                            : Colors.grey,
                      ),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: _focusNodes[3].hasFocus
                            ? Theme.of(context).primaryColor
                            : Colors.grey,
                      ),
                    ),
                    validator: (String? value) {
                      if (_passwordController.text != value) {
                        return 'Password not match';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed:
                        signupState.signupStatus == SignupStatus.submitting
                            ? null
                            : _submit,
                    child: Text(
                        signupState.signupStatus == SignupStatus.submitting
                            ? 'Loading...'
                            : 'Sign Up'),
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).primaryColor,
                      textStyle: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  TextButton(
                    onPressed:
                        signupState.signupStatus == SignupStatus.submitting
                            ? null
                            : () {
                                Navigator.pop(context);
                              },
                    child: Text('Already a member? Sign in!'),
                    style: TextButton.styleFrom(
                      primary: Theme.of(context).primaryColor,
                      textStyle: TextStyle(
                        fontSize: 20.0,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ].reversed.toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
