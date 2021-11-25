import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subscription_manager/bloc/actions_bloc.dart';
import 'package:subscription_manager/data/data_model.dart';
import 'package:subscription_manager/services/firestore_db.dart';

class ApiFirestoreBloc extends Bloc<ActionFirestore, SubscriptionData> {
  ApiFirestoreBloc(SubscriptionData initialState) : super(initialState);

  @override
  Stream<SubscriptionData> mapEventToState(ActionFirestore event) async* {
    if (event is AddSubscription) {
      await DatabaseServices(documentId: "")
          .updateData(event.subscription)
          .then((value) {
        event.controller
            .map((controllerField) => controllerField.clear())
            .toList();
      }).then((value) {
        Navigator.pop(event.context);
      });
    }
    if (event is DeleteSubscription) {
      await DatabaseServices(documentId: event.documentID).deleteData();
    }
    // _showMore = (event == SelectEvent.active) ? true : false;
    // yield _showMore;
  }
}
