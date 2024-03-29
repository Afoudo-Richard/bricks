import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part '{{name.snakeCase()}}_event.dart';
part '{{name.snakeCase()}}_state.dart';

class {{name.pascalCase()}}Bloc
    extends Bloc<{{name.pascalCase()}}Event, {{name.pascalCase()}}State> {
  {{name.pascalCase()}}Bloc() : super({{name.pascalCase()}}State()) {
    on<{{name.pascalCase()}}Changed>(_on{{name.pascalCase()}}Changed);
  }

  Future<void> _on{{name.pascalCase()}}Changed(
    {{name.pascalCase()}}Changed event,
    Emitter<{{name.pascalCase()}}State> emit,
  ) async {
    
  }
}
