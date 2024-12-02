// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'list_ctry_bloc.dart';

enum ListCtryStatus { initial, success, failure, refresh }

class ListCtryState extends Equatable {
  final ListCtryStatus listCtryStatus;
  final List<Ctry> ctries;
  final bool hasReachedMax;

  ListCtryState({
    this.listCtryStatus = ListCtryStatus.initial,
    this.ctries = const [],
    this.hasReachedMax = false,
  });

  @override
  List<Object> get props => [
        listCtryStatus,
        ctries,
        hasReachedMax,
      ];

  ListCtryState copyWith({
    ListCtryStatus? listCtryStatus,
    List<Ctry>? ctries,
    bool? hasReachedMax,
  }) {
    return ListCtryState(
      listCtryStatus: listCtryStatus ?? this.listCtryStatus,
      ctries: ctries ?? this.ctries,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'listCtryStatus': listCtryStatus.name,
      'ctries': ctries.map((x) => x.toMap()).toList(),
      'hasReachedMax': hasReachedMax,
    };
  }

  factory ListCtryState.fromMap(Map<String, dynamic> map) {
    return ListCtryState(
      listCtryStatus:
          ListCtryStatus.values.byName(map['listCtryStatus'] as String),
      ctries: List<Ctry>.from(
        (map['ctries'] as List<int>).map<Ctry>(
          (x) => Ctry.fromMap(x as Map<String, dynamic>),
        ),
      ),
      hasReachedMax: map['hasReachedMax'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory ListCtryState.fromJson(String source) =>
      ListCtryState.fromMap(json.decode(source) as Map<String, dynamic>);
}
