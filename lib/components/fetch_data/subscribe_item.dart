import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subscription_manager/bloc/api_bloc.dart';
import 'package:subscription_manager/bloc/item_option_bloc.dart';
import 'package:subscription_manager/components/fetch_data/delete_icon.dart';
import 'package:subscription_manager/data/data_model.dart';
import 'package:subscription_manager/data/decoration.dart';

Widget _moreInfo(BuildContext context, String email, String deadline) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.6,
    margin: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        email,
        style: const TextStyle(fontSize: 18),
      ),
      Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: Text(
          deadline,
          style: const TextStyle(fontSize: 15),
        ),
      ),
    ]),
  );
}

class SubscriptionItem extends StatelessWidget {
  final SubscriptionData element;

  const SubscriptionItem({Key? key, required this.element}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ApiFirestoreBloc(SubscriptionData()),
        child: Container(
          margin: const EdgeInsets.all(10),
          decoration: shadowBox,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.all(15),
                    child: Text(
                      element.subscriptionName,
                      style: const TextStyle(fontSize: 22),
                    ),
                  ),
                  BlocBuilder<ShowMoreBloc, bool>(
                      builder: (context, currentStatus) => Container(
                            child: (currentStatus)
                                ? _moreInfo(
                                    context, element.email, element.deadline)
                                : Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.7,
                                  ),
                          )),
                ],
              ),
              DeleteIcon(elementId: element.id)
            ],
          ),
        ));
  }
}
