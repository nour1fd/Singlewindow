import 'package:flutter/material.dart';
import 'package:untitled1/business/deletetran/deletetran_cubit.dart';
import 'package:untitled1/const.dart';
import 'package:untitled1/model/tran/transication.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/view/inside/mytranscreen.dart';

class DetailsForMyTran extends StatefulWidget {
  final TransictionModel transictionModel;
  DetailsForMyTran({
    required this.transictionModel,
  });

  @override
  _DetailsForMyTranState createState() => _DetailsForMyTranState();
}

class _DetailsForMyTranState extends State<DetailsForMyTran> {
  var formkey = GlobalKey<FormState>();
  var transictionnameController = TextEditingController();
  var studentnameController = TextEditingController();
  var fathernameController = TextEditingController();
  var mothernameController = TextEditingController();
  var departmentController = TextEditingController();
  var university_idController = TextEditingController();
  var reg_uniController = TextEditingController();
  var StatesController = TextEditingController();
  var priceController = TextEditingController();
  var nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String status= widget.transictionModel.data![idforindex].state!??"true";
tranid=widget.transictionModel.data![idforindex].id!;
print(status);
    if(status=="عمليه الدفع")
    {
      transictionnameController.text ="true";
          studentnameController.text ="sara";
          fathernameController.text ="ali";
          mothernameController.text ="mona";
          reg_uniController.text ="77";
          StatesController.text ="عمليه الدفع";
      nameController.text="true";

    }
    if(status=="انتظار")
    {
      transictionnameController.text ="true";
      studentnameController.text ="sara";
      fathernameController.text ="ali";
      mothernameController.text ="mona";
      reg_uniController.text ="2007";
      StatesController.text ="انتظار";
      nameController.text="java";

    }
    if(status=="مقبوله و قيد العمل")
    {
      transictionnameController.text ="true";
      studentnameController.text ="sara";
      fathernameController.text ="ali";
      mothernameController.text ="mona";
      reg_uniController.text ="2007";
      StatesController.text ="مقبوله و قيد العمل";
      nameController.text="java";

    }
    if(status=="تم الانجاز")
    {
      transictionnameController.text ="true";
      studentnameController.text ="true";
      fathernameController.text ="true";
      mothernameController.text ="true";
      reg_uniController.text ="true";
      StatesController.text ="تم الانجاز";
      nameController.text="true";

    }
    if(status=="مرفوضه")
    {
      transictionnameController.text ="true";
      studentnameController.text ="true";
      fathernameController.text ="true";
      mothernameController.text ="true";
      reg_uniController.text ="true";
      StatesController.text ="true";
      nameController.text="true";

    }

   // else{
   //    transictionnameController.text =
   //        widget.transictionModel.data![idforindex].tranName!??"true";
   //    studentnameController.text =
   //        widget.transictionModel.data![idforindex].userName!??"true";
   //    fathernameController.text =
   //        widget.transictionModel.data![idforindex].father!;
   //    mothernameController.text =
   //        widget.transictionModel.data![idforindex].mother!??"true";
   //    reg_uniController.text = widget.transictionModel.data![idforindex].regUni!??"true";
   //    StatesController.text = widget.transictionModel.data![idforindex].state!??"true";
   //     nameController.text = widget.transictionModel.data![idforindex].courseName!??"true";
   //
   //  }
    return BlocProvider(
        create: (context) => DeletetranCubit(),
        child: BlocConsumer<DeletetranCubit, DeletetranState>(
        listener: (context, state) {},
    builder: (context, state) {
          print(tranid);
    DeletetranCubit cubit = DeletetranCubit.get(context);


    return Scaffold(

      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 30.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  readOnly: true,
                  cursorColor: Colors.redAccent,
                  validator: (value) {
                    if (value!.isEmpty) return "can not be empty";
                    return null;
                  },
                  onFieldSubmitted: (value) {
                    print(value);
                  },
                  controller: transictionnameController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.amberAccent,
                          )),
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
          Column(
            children: [
              SizedBox(
                height: 30.0,
              ),
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
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.amberAccent,
                          )),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                      ),
                      label: const Text(
                        'اسم الطالب',
                      ),
                      hintText: "معاملة كشف علامات",
                      labelStyle: TextStyle(color: Colors.black)),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
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
                  controller: fathernameController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.amberAccent,
                          )),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                      ),
                      label: const Text(
                        'اسم الأب',
                      ),
                      hintText: "معاملة كشف علامات",
                      labelStyle: TextStyle(color: Colors.black)),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
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
                  controller: mothernameController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.amberAccent,
                          )),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                      ),
                      label: const Text(
                        'اسم الأم',
                      ),
                      hintText: "معاملة كشف علامات",
                      labelStyle: TextStyle(color: Colors.black)),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
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
                  controller: nameController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.amberAccent,
                          )),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                      ),
                      label: const Text(
                        'اسم المادة',
                      ),
                      labelStyle: TextStyle(color: Colors.black)),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
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
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.amberAccent,
                          )),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                      ),
                      label: const Text(
                        'سنة التسجيل',
                      ),
                      labelStyle: TextStyle(color: Colors.black)),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
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
                  controller: StatesController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.amberAccent,
                          )),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                      ),
                      label: const Text(
                        'حالة الطلب  ',
                      ),
                      hintText: "معاملة كشف علامات",
                      labelStyle: TextStyle(color: Colors.black)),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              SizedBox(
                height: 30.0,
              ),

              //     Row(
              //       children: [
              //         SizedBox(
              //           width: 30.0,
              //         ),
              //
              //         MaterialButton(onPressed: () {
              //
              //         },child: Text("تعديل"),
              //           color: Colors.green,
              //         ),
              //         SizedBox(
              //           width: 30.0,
              //         ),
              //
              //         MaterialButton(onPressed: () {
              //           cubit.deleteAddress();
              //           Navigator.pushReplacement(context,MaterialPageRoute(
              //               builder: (BuildContext context) => MyTran()));
              //           }
              // ,child: Text("حذف"),
              //
              // color: Colors.red,),
              //
              //
              //
              //
              //       ],
              //     )
            ],
          ),
              Row(
                children: [
                  SizedBox(
                    width: 30.0,
                  ),

                  ConditionalBuilder(
                    condition:status !="عمليه الدفع" && status !="مقبوله و قيد العمل"  && status !="تم الانجاز" ,
                    builder: (BuildContext context) {
                    return  MaterialButton(onPressed: () {
                        cubit.deleteAddress(tranid);
                        Navigator.pushReplacement(context,MaterialPageRoute(
                            builder: (BuildContext context) => MyTran()));
                      }
                        ,child: Text("حذف"),

                        color: Colors.red,);

                      print(status);
                      // return Row(
                      //   children: [
                      //     SizedBox(
                      //       width: 30.0,
                      //     ),
                      //
                      //     MaterialButton(onPressed: () {
                      //
                      //     },child: Text("تعديل"),
                      //       color: Colors.green,
                      //     ),
                      //     SizedBox(
                      //       width: 30.0,
                      //     ),
                      //
                      //     MaterialButton(onPressed: () {
                      //       cubit.deleteAddress();
                      //       Navigator.pushReplacement(context,MaterialPageRoute(
                      //           builder: (BuildContext context) => MyTran()));
                      //     }
                      //       ,child: Text("حذف"),
                      //
                      //       color: Colors.red,),
                      //
                      //
                      //
                      //
                      //   ],
                      // );
                    },
                    fallback: (BuildContext context) {
                      return  Center(child:
                      CircularProgressIndicator(color:Colors.white ,)
                      );
                    },

                  ),
                  SizedBox(
                          width: 30.0,
                        ),
                     //تعديل
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }));}
}
