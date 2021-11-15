import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:subscription_manager/data/data_model.dart';
import 'package:subscription_manager/services/firestore_db.dart';

class DataList extends StatelessWidget {
  const DataList({Key? key}) : super(key: key);

  removeItem(String id) {
    DatabaseServices(documentId: id).deleteData();
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<List<SubscriptionData>>(context);
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
          children: data
              .map((e) => Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            e.id,
                            style: const TextStyle(fontSize: 20),
                          ),
                          Text(
                            e.subscriptionName,
                            style: const TextStyle(fontSize: 18),
                          ),
                          Text(
                            e.email,
                            style: const TextStyle(fontSize: 15),
                          ),
                          Text(
                            e.deadline,
                            style: const TextStyle(fontSize: 12),
                          ),
                          const Text(
                            "____________________________________",
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      ),
                      InkWell(
                          child: const Icon(
                            Icons.remove_circle_outline,
                            size: 30,
                          ),
                          onTap: () => removeItem(e.id))
                    ],
                  ))
              .toList()),
    );
  }
}
