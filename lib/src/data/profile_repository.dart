import 'package:test_page/src/models/profile.dart';

class ProfileRepository {
  Profile getProfile() {
    return Profile(
      'Shitzu Photographers',
      DateTime(2020, 2, 19),
      'https://rivaresblog.files.wordpress.com/2016/02/cool-avatars-anonymous-avatar.jpg',
    );
  }
}
