part of 'list_ctry_bloc.dart';

abstract class ListCtryEvent extends Equatable {
  const ListCtryEvent();
  @override
  List<Object> get props => [];
}

class ListCtryFetched extends ListCtryEvent {
  final bool refresh;
  const ListCtryFetched({this.refresh = false});
}
