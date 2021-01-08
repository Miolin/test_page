import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_page/src/blocs/event_bloc.dart';
import 'package:test_page/src/blocs/profile_bloc.dart';
import 'package:test_page/src/data/event_repository.dart';
import 'package:test_page/src/data/profile_repository.dart';

class ProvidersCreator extends StatelessWidget {
  final Widget child;

  const ProvidersCreator({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<EventBloc>(
          create: (_) => EventBloc(EventRepository()),
          dispose: (_, bloc) => bloc.dispose(),
        ),
        Provider<ProfileBloc>(
          create: (_) => ProfileBloc(ProfileRepository()),
          dispose: (_, bloc) => bloc.dispose(),
        ),
      ],
      child: child,
    );
  }
}
