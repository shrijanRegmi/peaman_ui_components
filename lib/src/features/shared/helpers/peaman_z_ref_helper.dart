class PeamanZRefHelper {
  static String getZRefFromText(
    final String text, {
    final String refText = 'ref',
  }) {
    // z_ref_shrijan_ref;
    return 'z_${refText}_${text}_$refText';
  }

  static String getTextFromZRef(
    final String zRef, {
    final String refText = 'ref',
  }) {
    final refTextFirstIndex = zRef.indexOf(refText);
    final refTextLastIndex = zRef.lastIndexOf(refText);
    if (refTextFirstIndex == -1 || refTextLastIndex == -1) return '';

    return zRef.substring(
      (refTextFirstIndex + refText.length + 1),
      (refTextLastIndex - 1),
    );
  }

  static String getZRefFromList(
    final List<String> texts, {
    final String refText = 'ref',
  }) {
    // z_ref_[shrijan, ram, hari, shyam]_ref;
    return 'z_${refText}_[${texts.join(", ")}]_$refText';
  }

  static List<String> getListFromZRef(
    final String zRef, {
    final String refText = 'ref',
  }) {
    final refTextFirstIndex = zRef.indexOf(refText);
    final refTextLastIndex = zRef.lastIndexOf(refText);

    if (refTextFirstIndex == -1 || refTextLastIndex == -1) return [];
    return zRef
        .substring(
          refTextFirstIndex + refText.length + 2,
          (refTextLastIndex - 2),
        )
        .split(', ');
  }
}
