import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:subscription_manager/services/firestore_db.dart';

class CreateItem extends StatelessWidget {
  const CreateItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String deadline = '';
    String email = '';
    String subscription = '';
    void onDeadlineChanged(String value) {
      deadline = value;
    }

    void onSubscriptionNameChanged(String value) {
      subscription = value;
    }

    void onEmailChanged(String value) {
      email=value;
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
        title: const Text("Create dummy  object"),
      ),
      body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
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
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child: InkWell(
                    child: const Text(
                      "Create dummy obj?",
                      style: TextStyle(fontSize: 25),
                    ),
                    onTap: createSubscription,
                  ))
            ],
          )),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            child: const Icon(
              Icons.home_filled,
              size: 40,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const Icon(
            Icons.create,
            size: 40,
          ),
        ],
      ),
    );
  }
}
