import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:subscription_manager/components/create/create_item_view.dart';
import 'package:subscription_manager/data/decoration.dart';

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: shadowBox,
      child: InkWell(
        child: const Icon(
          Icons.create,
          size: 25,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateItem()),
          );
        },
      ),
    );
  }
}
