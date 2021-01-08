import 'package:rxdart/rxdart.dart';
import 'package:test_page/src/data/profile_repository.dart';
import 'package:test_page/src/models/profile.dart';

class ProfileBloc {
  final ProfileRepository _profileRepository;

  final BehaviorSubject<Profile> _profile = BehaviorSubject();
  Stream<Profile> get profile => _profile.stream;

  ProfileBloc(this._profileRepository) {
    _profile.add(_profileRepository.getProfile());
  }

  void dispose() {
    _profile.close();
  }
}