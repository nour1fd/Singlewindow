import 'package:flutter/material.dart';
import 'package:untitled1/business/auth/approve/approveaccount_cubit.dart';
import 'package:untitled1/const.dart';
import 'package:untitled1/model/sharedprefrence/cachhelper.dart';
import 'package:untitled1/model/user/user.dart';
import 'package:untitled1/view/auth/loginscreen.dart';
import 'package:untitled1/view/auth/registerscreen.dart';
import 'package:untitled1/view/auth/welcomescreen.dart';
import 'package:untitled1/view/inside/mytranscreen.dart';
import 'package:untitled1/view/tran/Mark_detection.dart';
import 'package:untitled1/view/tran/Objection%20to%20the%20practical%20mark.dart';
import 'package:untitled1/view/tran/Permanence%20document.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final tran = <String>[
    "وثيقة دوام",
    "اعتراض عملي",
    "كشف علامات",
    "طلب ترقين في المرحلة الجامعية الاولى",
    "بدل ضائع",
    "إشعار تخرج",
    "تقسيط رسوم",
    "مصدقة تأجيل دراسي",
    ' تنزيل مواد',
    "مصدقة تخرج"
  ];
  final tran_widget = <Widget>[Permanence_document(),Objection_to_the_practical_mark(),Mark_detection(),
    Permanence_document(),Objection_to_the_practical_mark(),Mark_detection()];

  @override
  Widget build(BuildContext context) {
  late  UserModel approvemodel;
    return BlocProvider(
      create: (context) => ApproveaccountCubit(),
      child: BlocConsumer<ApproveaccountCubit, ApproveaccountState>(
        listener: (context, state) {
        },
        builder: (context, state) {
          ApproveaccountCubit cubit = ApproveaccountCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.white,
            drawer: Drawer(
              child: Column(
                children: [
                  SizedBox(
                    height: 43,
                  ),
                  MaterialButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.black12,
                          child: Icon(Icons.person, color: Colors.black),
                        ),
                        Text(
                          " حسابي",
                          style: TextStyle(
                            fontSize: 19.0,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  //   child: Divider(
                  //     color: Colors.black26,
                  //     thickness: 3,
                  //   ),
                  // ),
                  SizedBox(
                    height: 23,
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                              MyTran()));

                    },
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.black12,
                          child: Icon(Icons.description, color: Colors.black),
                        ),
                        Text(
                          " معاملاتي ",
                          style: TextStyle(
                            fontSize: 19.0,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 23,
                  ),
                  MaterialButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute( builder: (BuildContext context)=>WelcomeScreen()));
                  } ,
                      child: Text("تسجيل الخروج",style:TextStyle(
                        fontSize:20.0,
                        fontWeight: FontWeight.bold,
                      ),
                      )
                  ),

                  //             Center(child: Text("my transactions.",style: TextStyle(fontFamily: "Kalam-Regular", fontSize: 48,
                  // fontWeight: FontWeight.w700,)))
                ],
              ),
            ),
            appBar: AppBar(
              title: Center(
                  child: Text("النافذة الواحدة ",
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87))),
              elevation: 0.3,
              foregroundColor: Colors.black,
              backgroundColor: Colors.white,
              actions: [
                IconButton(
                    onPressed: () {
                      showSearch(
                          context: context,
                          // delegate to customize the search bar
                          delegate: CustomSearchDelegate());
                    },
                    icon: Icon(
                      size: 40,
                      Icons.zoom_in,
                      color: Colors.orange,
                    ))
              ],
            ),
            body: Column(
              children: [

                const SizedBox(height: 20.0),
                Expanded(
                    child: ListView.builder(
                  itemCount: tran.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Card(
                        color: Colors.white12,
                        elevation: 0.0,
                        shape: Border(left: BorderSide(color: Colors.orange, width: 3),
                          top:  BorderSide(color: Colors.black12, width: 1.5),
                          bottom: BorderSide(color: Colors.black12, width: 1.5),
                          right: BorderSide(color: Colors.black12, width: 1.5),
                        ),

                        child: ListTile(
                          onTap: () {
                            print("___________________________________________");
                            print(token);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        tran_widget[index]));
                          },
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
                              tran[index],
                              style: (TextStyle(
                                  color: Colors.black, fontWeight: FontWeight.w600)),
                            ),
                          ),
                          subtitle: Text(
                            "التكلفة : 5000 ",
                          ),
                        ),
                      ),
                    );
                  },
                ))
              ],
            ),
          );
        },
      ),
    );

  }
}

class CustomSearchDelegate extends SearchDelegate {
  final tran = <String>[
    "وثيقة دوام",
    "اعتراض على علامة العملي",
    "كشف علامات",
    "طلب ترقين في المرحلة الجامعية الاولى",
    "بدل ضائع",
    "إشعار تخرج",
    "تقسيط رسوم",
    "مصدقة تأجيل دراسي",
    ' تنزيل مواد',
    "مصدقة تخرج"
  ];
  final tran_widget = <Widget>[Permanence_document(),Objection_to_the_practical_mark(),Mark_detection()];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = 'لا يوجد نتائج';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in tran) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return  ListTile(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                    tran_widget[index]));
          },
          title: Text(result),
          // title: Padding(
          //   padding: const EdgeInsets.only(top: 20),
          //   child: Text(
          //     tran[index],
          //     style: (TextStyle(
          //         color: Colors.black, fontWeight: FontWeight.w600)),
          //   ),
          // ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in tran) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                    tran_widget[index]));
          },
          title: Text(result),
        );
      },
    );
  }
}
