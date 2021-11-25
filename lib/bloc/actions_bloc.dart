import 'package:flutter/cupertino.dart';
import 'package:subscription_manager/data/data_model.dart';

abstract class ActionFirestore {}

class DeleteSubscription extends ActionFirestore {
  DeleteSubscription(this._documentID);

  final String _documentID;

  String get documentID => _documentID;
}

class AddSubscription extends ActionFirestore {
  AddSubscription(this._subscription, this._context, this._controller);

  final BuildContext _context;
  final SubscriptionData _subscription;
  final List<TextEditingController> _controller;

  BuildContext get context => _context;

  SubscriptionData get subscription => _subscription;

  List<TextEditingController> get controller => _controller;
}
