class PeamanDeleteProfileTrigger {
  final String? id;
  final String? uid;
  final String? option;
  final String? reason;
  final int? restoreUpto;
  final int? createdAt;
  final int? updatedAt;

  PeamanDeleteProfileTrigger({
    this.id,
    this.uid,
    this.option,
    this.reason,
    this.restoreUpto,
    this.createdAt,
    this.updatedAt,
  });

  PeamanDeleteProfileTrigger copyWith({
    final String? id,
    final String? uid,
    final String? option,
    final String? reason,
    final int? restoreUpto,
    final int? createdAt,
    final int? updatedAt,
  }) {
    return PeamanDeleteProfileTrigger(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      option: option ?? this.option,
      reason: reason ?? this.reason,
      restoreUpto: restoreUpto ?? this.restoreUpto,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{
      'id': id,
      'uid': uid,
      'option': option,
      'reason': reason,
      'restore_upto': restoreUpto,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };

    return data..removeWhere((key, value) => value == null);
  }
}
