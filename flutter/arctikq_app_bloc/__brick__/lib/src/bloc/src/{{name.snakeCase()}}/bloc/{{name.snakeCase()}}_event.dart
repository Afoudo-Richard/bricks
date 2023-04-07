part of '{{name.snakeCase()}}_bloc.dart';

@immutable
abstract class {{name.pascalCase()}}Event extends Equatable {
  @override
  List<Object> get props => [];
}

class {{name.pascalCase()}}Changed extends {{name.pascalCase()}}Event {

}


