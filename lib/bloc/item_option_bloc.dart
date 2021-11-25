import 'package:flutter_bloc/flutter_bloc.dart';

enum SelectEvent { active, inactive }

class ShowMoreBloc extends Bloc<SelectEvent, bool> {
  bool showMore = true;

  ShowMoreBloc(bool initialState) : super(initialState);

  @override
  Stream<bool> mapEventToState(SelectEvent event) async* {
    yield event == SelectEvent.active;
  }
}
