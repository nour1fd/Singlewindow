import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/business/auth/Login/login_cubit.dart';
import 'package:untitled1/const.dart';
import 'package:untitled1/model/sharedprefrence/cachhelper.dart';
import 'package:untitled1/view/inside/homescreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formkey = GlobalKey<FormState>();

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            print("________________");

            CachHelper.Savedataa(
                    key: "full_name", value: state.loginModel.data!.name)
                .then((value) {
              print("__________Login Scusess________");
              userid=CachHelper.getData("userid");
              print(state.loginModel.data!.id);
              print(state.loginModel.data!.name);
              token = CachHelper.getData('token');
              print(
                  "_______________________________________________________________________________________");

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => HomeScreen()));
            });
          }
        },
        builder: (context, state) {
          LoginCubit cubit = LoginCubit.get(context);
          return Scaffold(
            body: SafeArea(
              minimum: EdgeInsets.symmetric(vertical: 80.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 130.0),
                        child: Column(
                          children: [
                            Text(
                              "أهلاً بك ",
                              style: TextStyle(
                                  fontSize: 29.0,
                                  fontFamily: "Amiri-Bold",
                                  color: Colors.orange),
                            ),
                            Text(
                              "من فضلك إعد إدخال معلوماتك ",
                              style: TextStyle(
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87),
                            ),
                          ],
                        )),
                    SizedBox(height: 40),
                    Form(
                        key: formkey,
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: TextFormField(
                                cursorColor: Colors.redAccent,
                                validator: (value) {
                                  if (value!.isEmpty) return "can not be empty";
                                  return null;
                                },
                                onFieldSubmitted: (value) {
                                  print(value);
                                },
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.amberAccent)),
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 20.0,
                                    ),
                                    label: const Text(
                                      ' البريد الالكنتروني',
                                    ),
                                    labelStyle: TextStyle(color: Colors.black)),
                              ),
                            ),
                            SizedBox(height: 20),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: TextFormField(
                                validator: (value) {
                                  if (value.toString().isEmpty) {
                                    return 'password not can Empty';
                                  }
                                  return null;
                                },
                                controller: passwordController,
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.amberAccent)),
                                    isDense: false,
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 20.0,
                                    ),
                                    label: const Text(
                                      'كلمة المرور',
                                    ),
                                    labelStyle: TextStyle(color: Colors.black)),
                                onFieldSubmitted: (value) {},
                                keyboardType: TextInputType.visiblePassword,
                              ),
                            ),
                            SizedBox(height: 20),
                            SizedBox(height: 20),
                            ConditionalBuilder(
                              condition: state is! LoginLoading,
                              builder: (context) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: MaterialButton(
                                    onPressed: () async {
                                      if (formkey.currentState!.validate()) {
                                        cubit.userlogin(
                                          email: emailController.text,
                                          password: passwordController.text,
                                        );
                                      }
                                    },
                                    child: Text(
                                      'تسجيل دخول ',
                                      style: TextStyle(
                                        color: Colors.black87,
                                      ),
                                    ),
                                    color: Colors.orangeAccent,
                                    splashColor: Colors.redAccent,
                                  ),
                                );
                              },
                              fallback: (BuildContext context) {
                                return Center(
                                    child: CircularProgressIndicator(
                                  color: Colors.amber,
                                ));
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Image.asset(
                                "assets/imgs/login.jpg",
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
