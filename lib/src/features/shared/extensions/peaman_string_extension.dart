extension StringExt on String {
  bool matchForSearch(final String searchText) {
    final searchValue = searchText.toUpperCase().replaceAll(' ', '');
    final thisValue = toUpperCase().replaceAll(' ', '');
    if (searchValue.isEmpty) return false;
    return thisValue.startsWith(searchValue.substring(0, 1)) &&
        thisValue.contains(searchValue.toUpperCase());
  }
}
