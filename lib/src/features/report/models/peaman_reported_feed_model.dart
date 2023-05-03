class PeamanReportedFeed {
  final String? id;
  final int? createdAt;
  final int? updatedAt;

  PeamanReportedFeed({
    this.id,
    this.createdAt,
    this.updatedAt,
  });

  static PeamanReportedFeed fromJson(final Map<String, dynamic> data) {
    return PeamanReportedFeed(
      id: data['id'] ?? '',
      createdAt: data['created_at'] ?? 0,
      updatedAt: data['updated_at'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{
      'id': id,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };

    return data
      ..removeWhere(
        (key, value) => value == null,
      );
  }
}
