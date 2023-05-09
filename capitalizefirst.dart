extension CapitalizeFirst on String {
  String capitalizeFirst() {
    return substring(0, 1).toUpperCase() + substring(1);
  }
}
