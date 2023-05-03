class PeamanReportedBy {
  final String? uid;
  final String? reason;

  PeamanReportedBy({
    this.uid,
    this.reason,
  });

  static PeamanReportedBy fromJson(final Map<String, dynamic> data) {
    return PeamanReportedBy(
      uid: data['uid'] ?? '',
      reason: data['reason'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{
      'uid': uid,
      'reason': reason,
    };

    return data..removeWhere((key, value) => value == null);
  }
}
