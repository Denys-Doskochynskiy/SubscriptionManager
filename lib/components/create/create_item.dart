import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:subscription_manager/data/decoration.dart';
import 'package:subscription_manager/services/firestore_db.dart';

String deadline = '';
String email = '';
String subscription = '';

class CreateItem extends StatelessWidget {
  const CreateItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void onDeadlineChanged(String value) {
      deadline = value;
    }

    void onSubscriptionNameChanged(String value) {
      subscription = value;
    }

    void onEmailChanged(String value) {
      email = value;
    }

    createSubscription() async {
      DatabaseServices(documentId: "")
          .updateData(subscription, email, deadline)
          .then((value) {
        Navigator.pop(context);
      }).then((value) {
        print("dummy obj created!!!");
      });
    }

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.deepPurple.shade900,
          title: const Text("Add subscription")),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
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
                            decoration: const InputDecoration(
                                hintText: "Enter Subscription name"),
                            onChanged: onSubscriptionNameChanged),
                        TextField(
                            decoration: const InputDecoration(
                                hintText: "Enter Subscription synced email"),
                            onChanged: onEmailChanged),
                        TextField(
                            decoration: const InputDecoration(
                                hintText: "Enter Subscription deadline"),
                            onChanged: onDeadlineChanged),
                      ],
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      height: MediaQuery.of(context).size.height * 0.1,
                      decoration: shadowBox,
                      child: InkWell(
                        child: const Center(
                          child: Text(
                            "Add Subscription cred",
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                        onTap: createSubscription,
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
