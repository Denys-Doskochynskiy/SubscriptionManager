import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subscription_manager/bloc/actions_bloc.dart';
import 'package:subscription_manager/bloc/api_bloc.dart';

class DeleteIcon extends StatelessWidget {
  final String elementId;

  const DeleteIcon({Key? key, required this.elementId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        margin: const EdgeInsets.all(10),
        child: InkWell(
            child: const Icon(
              Icons.delete,
              size: 30,
            ),
            onTap: () => BlocProvider.of<ApiFirestoreBloc>(context)
                .add(DeleteSubscription(elementId))),
      ),
    );
  }
}
