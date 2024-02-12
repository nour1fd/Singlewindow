import 'package:flutter/material.dart';
import 'package:untitled1/business/mytran_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/const.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:untitled1/view/inside/DetailsforMttran.dart';

class MyTran extends StatefulWidget {
  const MyTran({Key? key}) : super(key: key);

  @override
  _MyTranState createState() => _MyTranState();
}

class _MyTranState extends State<MyTran> {


  void initState() {
    super.initState();
    BlocProvider.of<MytranCubit>(context).mytran();
  }


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MytranCubit, MytranState>(
      listener: (context, state) {
        if (state is MytranSuccess) {
          print("________________");
        }
      },
      builder: (context, state) {
        MytranCubit cubit = MytranCubit.get(context);
    late var transictionModel=cubit.mytranModel;

  return Scaffold(
          appBar: AppBar(
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
            title: Center(
              child: Text(
                " معاملاتك  ",
                style: TextStyle(
                    fontSize: 29.0,
                    fontFamily: "Amiri-Bold",
                    color: Colors.orange),
              ),
            ),
          ),
          body:
          Column(
            children: [
              ConditionalBuilder(
                condition: state is! MytranLoading && transictionModel!.data!.length!=null,
                fallback: (context) {
                  return Center(
                      child: CircularProgressIndicator(
                        color: Colors.amber,
                      ));
                },
                builder:(context) {
                  return Expanded(
                      child: ListView.builder(
                        itemCount: transictionModel!.data!.length!=null?transictionModel!.data!.length:0,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Card(
                              color: Colors.white12,
                              elevation: 0.0,
                              shape: Border(
                                left: BorderSide(color: Colors.orange, width: 3),
                                top: BorderSide(color: Colors.black12, width: 1.5),
                                bottom: BorderSide(color: Colors.black12, width: 1.5),
                                right: BorderSide(color: Colors.black12, width: 1.5),
                              ),
                              child: ListTile(
                                onTap: () {
                                  idforindex=index;
                                  print(
                                      "___________________________________________");
                                  Navigator.push
                                    (context, MaterialPageRoute(
                                      builder: (BuildContext context)=>DetailsForMyTran(transictionModel: transictionModel,)));                                },
                                leading: Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.orange)),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: Text(
                                      "$index",
                                      style: TextStyle(color: Colors.black87),
                                    ),
                                  ),
                                ),
                                title: Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Text(
                                    transictionModel!.data![index].tranName.toString(),
                                    style: (TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600)),
                                  ),
                                ),
                                subtitle: Text(
                                  transictionModel!.data![index].state.toString(),

                                ),
                              ),
                            ),
                          );
                        },
                      ));
                },
              )
            ],
          ),
        );
      },
    );
    // return Scaffold(
    //   appBar: AppBar( foregroundColor: Colors.black,
    //     backgroundColor: Colors.white,
    //     title: Center(
    //       child: Text(
    //         " معاملاتك  ",
    //         style: TextStyle(
    //             fontSize: 29.0, fontFamily: "Amiri-Bold", color: Colors.orange),
    //       ),
    //     ),
    //   ),
    //   body: ,
    // );
  }
}
