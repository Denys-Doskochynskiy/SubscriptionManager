import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subscription_manager/components/fetch_data/item_bloc.dart';

class AppBarNavigation extends StatelessWidget {
  final String title;
  const AppBarNavigation({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ShowMoreBloc _bloc = BlocProvider.of<ShowMoreBloc>(context);
    return
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(title),
        BlocBuilder<ShowMoreBloc, bool>(
            builder: (context, currentStatus) => InkWell(
              child: const Icon(Icons.more_horiz_outlined),
              onTap: () => _bloc.add((currentStatus)
                  ? SelectEvent.inactive
                  : SelectEvent.active),
            ))
      ]);
  }
}
