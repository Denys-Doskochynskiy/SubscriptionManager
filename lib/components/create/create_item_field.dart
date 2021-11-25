import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subscription_manager/bloc/actions_bloc.dart';
import 'package:subscription_manager/bloc/api_bloc.dart';
import 'package:subscription_manager/data/data_model.dart';
import 'package:subscription_manager/data/decoration.dart';

TextEditingController emailController = TextEditingController();
TextEditingController deadlineController = TextEditingController();
TextEditingController subscriptionController = TextEditingController();

class CreateField extends StatelessWidget {
  const CreateField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 35),
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.45,
            decoration: shadowBox,
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextField(
                  controller: subscriptionController,
                  decoration: const InputDecoration(
                      hintText: "Enter Subscription name"),
                ),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                      hintText: "Enter Subscription synced email"),
                ),
                TextField(
                  controller: deadlineController,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9 .]')),
                  ],
                  decoration: const InputDecoration(
                      hintText: "Enter Subscription deadline"),
                ),
              ],
            ),
          ),
          Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              height: MediaQuery.of(context).size.height * 0.1,
              decoration: shadowBox,
              child: BlocBuilder<ApiFirestoreBloc, SubscriptionData>(
                  builder: (context, currentState) => InkWell(
                      child: const Center(
                        child: Text(
                          "Add Subscription cred",
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                      onTap: () {
                        BlocProvider.of<ApiFirestoreBloc>(context).add(
                            AddSubscription(
                                SubscriptionData(
                                    deadline: deadlineController.text,
                                    email: emailController.text,
                                    subscriptionName:
                                        subscriptionController.text),
                                context,
                                [
                              subscriptionController,
                              emailController,
                              deadlineController
                            ]));
                      })))
        ],
      ),
    );
  }
}
