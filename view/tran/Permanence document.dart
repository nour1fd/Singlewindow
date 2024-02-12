import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:untitled1/business/tran/mark_detection_cubit.dart';
class Permanence_document extends StatefulWidget {
  const Permanence_document({Key? key}) : super(key: key);

  @override
  _Permanence_documentState createState() => _Permanence_documentState();
}

class _Permanence_documentState extends State<Permanence_document> {
  var formkey = GlobalKey<FormState>();
  var transictionnameController = TextEditingController();
  var studentnameController = TextEditingController();
  var fathernameController = TextEditingController();
  var mothernameController = TextEditingController();
  var departmentController = TextEditingController();
  var university_idController = TextEditingController();
  var reg_uniController = TextEditingController();
var seasonnameController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MarkDetectionCubit(),
      child: BlocConsumer<MarkDetectionCubit, MarkDetectionState>(
        listener: (context, state) {
          if (state is MarkDetectionSuccess) {
            if(state.tranModel.success==true){
              print("___________________________________________________________");

              print("________________noniiiiiiiii_________________________________");
            }

          }
        },
        builder: (context, state) {
          MarkDetectionCubit cubit = MarkDetectionCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              minimum: EdgeInsets.symmetric(vertical: 80.0),
              child: SingleChildScrollView(
                child: Form(
                  key: formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                          child: Container(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [Colors.white, Colors.black87]),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black87,
                                      blurRadius: 2.0,
                                      offset: Offset(2.0, 2.0))
                                ]),
                            height: 130,
                            child: Center(
                              child: Text(
                                "معاملة وثيقة دوام ",
                                style: TextStyle(
                                    fontSize: 29.0,
                                    color: Colors.white,
                                    fontFamily: "Amiri-Bold"),
                              ),
                            ),
                          )),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      //   child: Divider(
                      //     color: Colors.black26,
                      //     thickness: 3,
                      //   ),
                      // ),
                      SizedBox(height: 40),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          cursorColor: Colors.redAccent,
                          validator: (value) {
                            if (value!.isEmpty) return "can not be empty";
                            return null;
                          },
                          onFieldSubmitted: (value) {
                            print(value);
                          },
                          controller: transictionnameController..text="وثيقه دوام ",
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.amberAccent)),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20.0,
                              ),
                              label: const Text(
                                'اسم المعاملة',
                              ),
                              hintText: "معاملة كشف علامات",
                              labelStyle: TextStyle(color: Colors.black)),
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          cursorColor: Colors.redAccent,
                          validator: (value) {
                            if (value!.isEmpty) return "can not be empty";
                            return null;
                          },
                          onFieldSubmitted: (value) {
                            print(value);
                          },
                          controller: studentnameController,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.amberAccent)),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20.0,
                              ),
                              label: const Text(
                                'اسم الطالب',
                              ),
                              labelStyle: TextStyle(color: Colors.black)),
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          validator: (value) {
                            if (value.toString().isEmpty) {
                              return 'password not can Empty';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.name,
                          controller: fathernameController,
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.amberAccent)),
                              isDense: false,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20.0,
                              ),
                              label: const Text(
                                'اسم الأب',
                              ),
                              labelStyle: TextStyle(color: Colors.black)),
                          onFieldSubmitted: (value) {},
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          cursorColor: Colors.redAccent,
                          validator: (value) {
                            if (value!.isEmpty) return "can not be empty";
                            return null;
                          },
                          onFieldSubmitted: (value) {
                            print(value);
                          },
                          keyboardType: TextInputType.name,
                          controller: mothernameController,
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.amberAccent)),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20.0,
                              ),
                              label: const Text(
                                'اسم الأم',
                              ),
                              labelStyle: TextStyle(color: Colors.black)),
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          cursorColor: Colors.redAccent,
                          validator: (value) {
                            if (value!.isEmpty) return "can not be empty";
                            return null;
                          },
                          onFieldSubmitted: (value) {
                            print(value);
                          },
                          controller: departmentController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.amberAccent)),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20.0,
                              ),
                              label: const Text(
                                'القسم',
                              ),
                              labelStyle: TextStyle(color: Colors.black)),
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          cursorColor: Colors.redAccent,
                          validator: (value) {
                            if (value!.isEmpty) return "can not be empty";
                            return null;
                          },
                          onFieldSubmitted: (value) {
                            print(value);
                          },
                          controller: university_idController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.amberAccent)),
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
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          cursorColor: Colors.redAccent,
                          validator: (value) {
                            if (value!.isEmpty) return "can not be empty";
                            return null;
                          },
                          onFieldSubmitted: (value) {
                            print(value);
                          },
                          controller: reg_uniController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.amberAccent)),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20.0,
                              ),
                              label: const Text(
                                'التسجيل في الجامعة لأول مرة عام ',
                              ),
                              labelStyle: TextStyle(color: Colors.black)),
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          validator: (value) {
                            if (value.toString().isEmpty) {
                              return ' not can Empty';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.name,
                          controller: seasonnameController,
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.amberAccent)),
                              isDense: false,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20.0,
                              ),
                              label: const Text(
                                ' الفصل',
                              ),
                              labelStyle: TextStyle(color: Colors.black)),
                          onFieldSubmitted: (value) {},
                        ),
                      ),
                      SizedBox(height: 20),
                      SizedBox(height: 20),
                      ConditionalBuilder(
                        condition: true,
                        builder: (context) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: MaterialButton(
                              minWidth: 200,
                              onPressed: () async {
                                if (formkey.currentState!.validate()) {
                                  cubit.makeTran(tran_name: transictionnameController.text,
                                      father: fathernameController.text,
                                      mother: "no",
                                      section: departmentController.text,
                                      reg_uni: reg_uniController.text,
                                      year: 'fifth',
                                      chapter: seasonnameController.text,
                                      course_name: '',
                                      course_year: '',
                                      teach: '',
                                      price: '5000');
                                };
                                showDialog(context: context, builder: (context) {return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                  ),
                                  contentPadding: EdgeInsets.only(top: 10.0),
                                  title: Text(
                                      "تم تسجيل طلبك"
                                  ),
                                  content:ElevatedButton(
                                    onPressed: () async{
                                      Navigator.of(context).pop();
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.black12
                                    ),
                                    child: Text(
                                        "العودة إلى الصفحة السابقة"
                                    ),
                                  ),
                                );

                                },);
                              },

                              child: Text(
                                'ارسال',
                                style: TextStyle(
                                  color: Colors.white70,
                                ),
                              ),
                              color: Colors.black,
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
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );

    // return  Scaffold(
    //   backgroundColor: Colors.white,
    //
    //   body: SafeArea(
    //     minimum: EdgeInsets.symmetric(vertical: 80.0),
    //     child: SingleChildScrollView(
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           Center(child: Text("معاملة وثيقة دوام  ", style: TextStyle(fontSize: 29.0,color:
    //           Colors.orange,fontFamily: "Amiri-Bold"),)),
    //           Padding(
    //             padding: const EdgeInsets.symmetric(horizontal: 20.0),
    //             child: Divider(
    //               color: Colors.black26,
    //               thickness: 3,
    //             ),
    //           ),
    //
    //           SizedBox(height: 40),
    //           Padding(
    //             padding: const EdgeInsets.symmetric(horizontal: 20),
    //             child: TextFormField(
    //               readOnly: true,
    //               cursorColor: Colors.redAccent,
    //               validator: (value) {
    //                 if (value!.isEmpty) return "can not be empty";
    //                 return null;
    //               },
    //               onFieldSubmitted: (value) {
    //                 print(value);
    //               },
    //               controller: transictionnameController,
    //               keyboardType: TextInputType.emailAddress,
    //               decoration: InputDecoration(
    //                   focusedBorder: OutlineInputBorder(
    //                       borderSide: BorderSide(color: Colors.amberAccent)),
    //                   contentPadding: const EdgeInsets.symmetric(
    //                     horizontal: 20.0,
    //                   ),
    //                   label: const Text(
    //                     'اسم المعاملة',
    //                   ),
    //                   hintText: "معاملة وثيقة دوام  ",
    //
    //                   labelStyle: TextStyle(color: Colors.black)),
    //             ),
    //           ),
    //           SizedBox(height: 20),
    //           Padding(
    //             padding: const EdgeInsets.symmetric(horizontal: 20),
    //             child: TextFormField(
    //               cursorColor: Colors.redAccent,
    //               validator: (value) {
    //                 if (value!.isEmpty) return "can not be empty";
    //                 return null;
    //               },
    //               onFieldSubmitted: (value) {
    //                 print(value);
    //               },
    //               controller: studentnameController,
    //               keyboardType: TextInputType.emailAddress,
    //               decoration: InputDecoration(
    //                   focusedBorder: OutlineInputBorder(
    //                       borderSide: BorderSide(color: Colors.amberAccent)),
    //                   contentPadding: const EdgeInsets.symmetric(
    //                     horizontal: 20.0,
    //                   ),
    //                   label: const Text(
    //                     'اسم الطالب',
    //                   ),
    //                   labelStyle: TextStyle(color: Colors.black)),
    //             ),
    //           ),
    //           SizedBox(height: 20),
    //           Padding(
    //             padding: const EdgeInsets.symmetric(horizontal: 20),
    //             child: TextFormField(
    //               validator: (value) {
    //                 if (value.toString().isEmpty) {
    //                   return 'password not can Empty';
    //                 }
    //                 return null;
    //               },
    //               controller: fathernameController,
    //               decoration: InputDecoration(
    //                   focusedBorder: OutlineInputBorder(
    //                       borderSide: BorderSide(color: Colors.amberAccent)),
    //                   isDense: false,
    //                   contentPadding: const EdgeInsets.symmetric(
    //                     horizontal: 20.0,
    //                   ),
    //                   label: const Text(
    //                     'اسم الأب',
    //                   ),
    //                   labelStyle: TextStyle(color: Colors.black)),
    //               onFieldSubmitted: (value) {},
    //               keyboardType: TextInputType.visiblePassword,
    //             ),
    //           ),
    //           SizedBox(height: 20),
    //           Padding(
    //             padding: const EdgeInsets.symmetric(horizontal: 20),
    //             child: TextFormField(
    //               cursorColor: Colors.redAccent,
    //               validator: (value) {
    //                 if (value!.isEmpty) return "can not be empty";
    //                 return null;
    //               },
    //               onFieldSubmitted: (value) {
    //                 print(value);
    //               },
    //               controller: mothernameController,
    //               keyboardType: TextInputType.number,
    //               decoration: InputDecoration(
    //                   focusedBorder: OutlineInputBorder(
    //                       borderSide: BorderSide(color: Colors.amberAccent)),
    //                   contentPadding: const EdgeInsets.symmetric(
    //                     horizontal: 20.0,
    //                   ),
    //                   label: const Text(
    //                     'اسم الأم',
    //                   ),
    //                   labelStyle: TextStyle(color: Colors.black)),
    //             ),
    //           ),
    //           SizedBox(height: 20),
    //           Padding(
    //             padding: const EdgeInsets.symmetric(horizontal: 20),
    //             child: TextFormField(
    //               cursorColor: Colors.redAccent,
    //               validator: (value) {
    //                 if (value!.isEmpty) return "can not be empty";
    //                 return null;
    //               },
    //               onFieldSubmitted: (value) {
    //                 print(value);
    //               },
    //               controller: departmentController,
    //               keyboardType: TextInputType.text,
    //               decoration: InputDecoration(
    //                   focusedBorder: OutlineInputBorder(
    //                       borderSide: BorderSide(color: Colors.amberAccent)),
    //                   contentPadding: const EdgeInsets.symmetric(
    //                     horizontal: 20.0,
    //                   ),
    //                   label: const Text(
    //                     'القسم',
    //                   ),
    //                   labelStyle: TextStyle(color: Colors.black)),
    //             ),
    //           ),
    //           SizedBox(height: 20),
    //           Padding(
    //             padding: const EdgeInsets.symmetric(horizontal: 20),
    //             child: TextFormField(
    //               cursorColor: Colors.redAccent,
    //               validator: (value) {
    //                 if (value!.isEmpty) return "can not be empty";
    //                 return null;
    //               },
    //               onFieldSubmitted: (value) {
    //                 print(value);
    //               },
    //               controller: university_idController,
    //               keyboardType: TextInputType.text,
    //               decoration: InputDecoration(
    //                   focusedBorder: OutlineInputBorder(
    //                       borderSide: BorderSide(color: Colors.amberAccent)),
    //                   contentPadding: const EdgeInsets.symmetric(
    //                     horizontal: 20.0,
    //                   ),
    //                   label: const Text(
    //                     'الرقم الجامعي',
    //                   ),
    //                   labelStyle: TextStyle(color: Colors.black)),
    //             ),
    //           ),
    //           SizedBox(height: 20),
    //           SizedBox(height: 20),
    //           Padding(
    //             padding: const EdgeInsets.symmetric(horizontal: 20),
    //             child: MaterialButton(
    //               onPressed: () async {},
    //               child: Text(
    //                 'ارسال',
    //                 style: TextStyle(
    //                   color: Colors.black87,
    //                 ),
    //               ),
    //               color: Colors.orangeAccent,
    //               splashColor: Colors.redAccent,
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
