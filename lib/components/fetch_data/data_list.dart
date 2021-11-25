import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:subscription_manager/components/fetch_data/subscribe_item.dart';
import 'package:subscription_manager/data/data_model.dart';

class DataList extends StatelessWidget {
  const DataList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<List<SubscriptionData>>(context);

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
          children: data
              .map((element) => SubscriptionItem(element: element))
              .toList()),
    );
  }
}
