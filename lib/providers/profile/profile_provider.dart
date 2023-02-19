import 'package:demo_app/models/user.dart';
import 'package:demo_app/providers/profile/profile_state.dart';
import 'package:demo_app/providers/repositories/profile_repository.dart';
import 'package:flutter/foundation.dart';

import '../../models/custom_error.dart';

class ProfileProvider with ChangeNotifier {
  ProfileState _state = ProfileState.initial();
  ProfileState get state => _state;

  final ProfileRepository profileRepository;
  ProfileProvider({
    required this.profileRepository,
  });

  Future<void> getProfile({required String uid}) async {
    _state = _state.copyWith(profileStatus: ProfileStatus.loading);
    notifyListeners();

    try {
      final User user = await profileRepository.getProfile(uid: uid);

      _state = _state.copyWith(
        profileStatus: ProfileStatus.loaded,
        user: user,
      ); //성공했으니까 새로운걸로 생성
      notifyListeners();
    } on CustomError catch (e) {
      _state = _state.copyWith(profileStatus: ProfileStatus.error, error: e);
      notifyListeners();
    }
  }
}
