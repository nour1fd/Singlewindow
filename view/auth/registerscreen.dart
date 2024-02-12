import 'package:flutter/material.dart';
import 'package:untitled1/business/auth/Register/register_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/const.dart';
import 'package:untitled1/const.dart';
import 'package:untitled1/const.dart';
import 'package:untitled1/model/sharedprefrence/cachhelper.dart';
import 'package:untitled1/view/inside/homescreen.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

import '../../const.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var formkey = GlobalKey<FormState>();
  var full_nameController = TextEditingController();
  var iniversity_idController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccess) {
            if (state.loginModel.success == true) {
              CachHelper?.Savedataa(
                  key: "userid", value: state.loginModel.data!.id);
              CachHelper?.Savedataa(
                      key: "token", value: state.loginModel.data!.token)
                  .then((value) {
                print("Registering Scusses");
                token = CachHelper.getData('token');
                userid=CachHelper.getData("userid");
                print(state.loginModel.data!.token);
                print(
                    "_______________________________________________________________________________________");
                print(state.loginModel.data!.id);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => HomeScreen()));
              });

              print("________________noniiiiiiiii");
            }
          }
        },
        builder: (context, state) {
          RegisterCubit cubit = RegisterCubit.get(context);
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
                              "من فضلك أدخل المعلومات اللازمة",
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
                                controller: full_nameController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.amberAccent)),
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 20.0,
                                    ),
                                    label: const Text(
                                      'الاسم الثلاثي',
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
                                controller: iniversity_idController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.amberAccent)),
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 20.0,
                                    ),
                                    label: const Text(
                                      'الرقم الجامعي',
                                    ),
                                    labelStyle: TextStyle(color: Colors.black)),
                              ),
                            ),
                            SizedBox(height: 20),
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
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.amberAccent)),
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 20.0,
                                    ),
                                    label: const Text(
                                      'الأيميل',
                                    ),
                                    labelStyle: TextStyle(color: Colors.black)),
                              ),
                            ),
                            SizedBox(height: 20),
                            SizedBox(height: 20),
                            ConditionalBuilder(
                              condition: state is! RegisterLoading,
                              builder: (context) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: MaterialButton(
                                    onPressed: () async {
                                      if (formkey.currentState!.validate()) {
                                        cubit.userregister(
                                          name: full_nameController.text,
                                          email: emailController.text,
                                          password: passwordController.text,
                                          id_uni: iniversity_idController.text,
                                        );
                                      }
                                    },
                                    child: Text(
                                      'إنشاء حساب',
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
