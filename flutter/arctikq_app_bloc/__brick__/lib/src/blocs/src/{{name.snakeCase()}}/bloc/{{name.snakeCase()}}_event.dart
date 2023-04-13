part of '{{name.snakeCase()}}_bloc.dart';

abstract class {{name.pascalCase()}}Event extends Equatable {
  {{name.pascalCase()}}Event();
  @override
  List<Object> get props => [];
}

class {{name.pascalCase()}}Changed extends {{name.pascalCase()}}Event {

}


