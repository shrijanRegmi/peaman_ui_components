import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

extension UserProviderExt on PUserProvider {
  Future<bool> checkForExistingUsername({
    required final String uid,
    required final String userName,
  }) async {
    var val = false;
    try {
      final usersRef = PeamanReferenceHelper.usersCol
          .where('user_name', isEqualTo: userName);
      final usersSnap = await usersRef.get();
      for (var snap in usersSnap.docs) {
        final userData = snap.data();
        final user = PeamanUser.fromJson(userData);
        val = user.uid != uid;
      }
    } catch (e) {
      debugPrint(e.toString());
      debugPrint('Error!!!: Checking for existing username');
    }

    return val;
  }

  Future<void> deleteAccount({
    required final String uid,
    required final PeamanDeleteProfileTrigger trigger,
  }) async {
    try {
      final deleleProfileTriggersRef =
          Peaman.ref.collection('delete_profile_triggers').doc(uid);
      final newTrigger = trigger.copyWith(
        id: deleleProfileTriggersRef.id,
      );
      final triggerFuture = deleleProfileTriggersRef.set(newTrigger.toJson());

      final userUpdater = PeamanUserUpdater(
        extraData: {
          'deleted': true,
          'restore_deleted_profile_upto': newTrigger.restoreUpto,
        },
      );
      final userUpdateFuture = PUserProvider.updateUserData(
        uid: uid,
        updater: userUpdater,
      );

      await Future.wait([
        triggerFuture,
        userUpdateFuture,
      ]);
      debugPrint("Success: Deleting account");
    } catch (e) {
      debugPrint(e.toString());
      debugPrint("Error!!!: Deleting account");
    }
  }

  Future<void> restoreAccount({
    required final String uid,
  }) async {
    try {
      final deleleProfileTriggersRef =
          Peaman.ref.collection('delete_profile_triggers').doc(uid);
      final triggerFuture = deleleProfileTriggersRef.delete();

      final userUpdater = PeamanUserUpdater(
        extraData: {
          'deleted': false,
          'restore_deleted_profile_upto':
              PeamanDatabaseHelper.fieldValueDelete([]),
        },
      );
      final userUpdateFuture = PUserProvider.updateUserData(
        uid: uid,
        updater: userUpdater,
      );

      await Future.wait([triggerFuture, userUpdateFuture]);
      debugPrint("Success: Restoring account");
    } catch (e) {
      debugPrint(e.toString());
      debugPrint("Error!!!: Restoring account");
    }
  }

  Future<List<PeamanUser>> getUsersByUids({
    required final List<String> uids,
  }) async {
    var users = <PeamanUser>[];
    try {
      final futures = <Future<PeamanUser>>[];
      for (final uid in uids) {
        final future = PUserProvider.getUserById(
          uid: uid,
        );
        futures.add(future);
      }
      users = await Future.wait(futures);
      debugPrint('Success: Gettings users by uids');
    } catch (e) {
      debugPrint(e.toString());
      debugPrint('Error!!!: Gettings users by uids');
    }
    return users;
  }
}
