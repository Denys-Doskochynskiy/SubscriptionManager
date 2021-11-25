import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subscription_manager/bloc/api_bloc.dart';
import 'package:subscription_manager/components/create/create_item_field.dart';
import 'package:subscription_manager/data/data_model.dart';

class CreateItem extends StatelessWidget {
  const CreateItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ApiFirestoreBloc(SubscriptionData()),
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.deepPurple.shade900,
            title: const Text("Add subscription")),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [CreateField()],
          ),
        ),
      ),
    );
  }
}
