import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subscription_manager/components/create/create_item.dart';
import 'package:subscription_manager/data/data_model.dart';
import 'package:subscription_manager/services/firestore_db.dart';

import 'components/data_list.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<SubscriptionData>>.value(
      value: DatabaseServices(documentId: "").data,
      initialData: const [],
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              DataList(),
            ],
          ),
        ),
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              Icons.home_filled,
              size: 40,
            ),
            InkWell(
              child: const Icon(
                Icons.create,
                size: 40,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CreateItem()),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
