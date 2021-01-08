import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_page/src/assets/application_assets.dart';
import 'package:test_page/src/models/profile.dart';

class ProfileAppBar extends StatelessWidget with PreferredSizeWidget {
  final Profile profile;

  const ProfileAppBar({Key key, @required this.profile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int daysLeft = 0;
    if (profile != null) {
      daysLeft = DateTime.now().difference(profile.registrationDate).inDays;
    }
    final dateFormatter = DateFormat('d MMMM y');
    return Container(
      decoration: BoxDecoration(
        color: Colors.deepPurpleAccent,
        image: DecorationImage(
          image: AssetImage(ApplicationAssets.background),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              icon: Icon(Icons.menu),
              color: Colors.white,
              onPressed: () {},
            ),
            Expanded(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 1,
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(profile?.avatarUrl ?? ''),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    profile?.name ?? '',
                    style: Theme.of(context).textTheme.headline6.copyWith(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Is counting the days with you!',
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    '$daysLeft Days left until ${dateFormatter.format(profile?.registrationDate ?? DateTime.now())}',
                    style: Theme.of(context).textTheme.bodyText2.copyWith(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                ApplicationAssets.toolbarAction,
                height: 25,
                width: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(0, 190);
}
