import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:{{project_name.snakeCase()}}/{{project_name.snakeCase()}}.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

part 'list_ctry_event.dart';
part 'list_ctry_state.dart';

class ListCtryBloc extends Bloc<ListCtryEvent, ListCtryState> {
  ListCtryBloc() : super(ListCtryState()) {
    on<ListCtryFetched>(_onListCtryFetched);
  }

  Future<void> _onListCtryFetched(
    ListCtryFetched event,
    Emitter<ListCtryState> emit,
  ) async {
    if (!event.refresh) {
      if (state.hasReachedMax) return;
    }

    try {
      final ctries = await _fetchAllCtry();

      return emit(
        state.copyWith(
          listCtryStatus: ListCtryStatus.success,
          ctries: ctries,
          hasReachedMax: true,
        ),
      );
    } catch (e) {
      emit(state.copyWith(
        listCtryStatus: ListCtryStatus.failure,
      ));
    }
  }

  Future<List<Ctry>> _fetchAllCtry() async {
    QueryBuilder<Ctry> query = QueryBuilder(Ctry())
      ..whereEqualTo("isPublished", true);

    return query.find();
  }
}
