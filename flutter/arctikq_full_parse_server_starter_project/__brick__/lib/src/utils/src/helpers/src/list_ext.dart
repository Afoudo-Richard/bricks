extension ListExtensions<T> on List<T> {
  /// Filter a list from a list of options
  ///
  /// ```dart

  /// List<String> fruits = ["apple", "banana", "orange", "grape", "pear"];
  /// List<String> selectedFruits = ["apple", "orange"];

  /// List<String> filteredFruits = filterListFromOptions(fruits, selectedFruits, (fruit, option) => fruit == option);

  /// print(filteredFruits); // Output: [apple, orange]
  /// ```

  List<T> filterListFromOptions(
      List<T> options, bool Function(T, T) predicate) {
    return where((item) => options.any((option) => predicate(item, option)))
        .toList();
  }
}
