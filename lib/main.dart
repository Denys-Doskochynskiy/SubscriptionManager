import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:subscription_manager/components/fetch_data/item_bloc.dart';
import 'package:subscription_manager/components/navigation/app_bar_main.dart';
import 'package:subscription_manager/data/data_model.dart';
import 'package:subscription_manager/services/firestore_db.dart';

import 'components/fetch_data/data_list.dart';
import 'components/navigation/floating_button.dart';

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
      home: BlocProvider(
          create: (context) => ShowMoreBloc(true),
          child: const MyHomePage(title: 'Subscription Manager')),
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
              backgroundColor: Colors.deepPurple.shade900,
              title: AppBarNavigation(
                title: title,
              )),
          body: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              DataList(),
            ],
          ),
          floatingActionButton: const CustomFloatingButton()),
    );
  }
}
