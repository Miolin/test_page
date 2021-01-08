import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_page/src/assets/application_assets.dart';
import 'package:test_page/src/blocs/event_bloc.dart';
import 'package:test_page/src/blocs/profile_bloc.dart';
import 'package:test_page/src/models/event.dart';
import 'package:test_page/src/models/profile.dart';
import 'package:test_page/src/widgets/category_button.dart';
import 'package:test_page/src/widgets/event_card.dart';
import 'package:test_page/src/widgets/profile_app_bar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileBloc>(
      builder: (context, bloc, _) {
        return StreamBuilder<Profile>(
          stream: bloc.profile,
          builder: (context, profileSnapshot) {
            return Scaffold(
              appBar: ProfileAppBar(
                profile: profileSnapshot.data,
              ),
              body: Column(
                children: [
                  SizedBox(
                    height: 100,
                    child: Center(
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        children: [
                          CategoryButton(
                            child: Image.asset(
                              ApplicationAssets.document,
                              height: 20,
                              width: 20,
                            ),
                            title: 'Contract',
                            eventCount: 2,
                          ),
                          CategoryButton(
                            child: Image.asset(
                              ApplicationAssets.wallet,
                              height: 20,
                              width: 20,
                            ),
                            title: 'Finance',
                            eventCount: 8,
                          ),
                          CategoryButton(
                            child: Image.asset(
                              ApplicationAssets.image,
                              height: 20,
                              width: 20,
                            ),
                            title: 'Photos',
                            eventCount: 12,
                          ),
                          CategoryButton(
                            child: Image.asset(
                              ApplicationAssets.video,
                              height: 20,
                              width: 20,
                            ),
                            title: 'Movies',
                            eventCount: 0,
                          ),
                          CategoryButton(
                            child: Image.asset(
                              ApplicationAssets.location,
                              height: 20,
                              width: 20,
                            ),
                            title: 'Location',
                            eventCount: 0,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Consumer<EventBloc>(
                      builder: (context, bloc, _) {
                        return StreamBuilder<Map<DateTime, List<Event>>>(
                          stream: bloc.events,
                          initialData: {},
                          builder: (context, snapshot) {
                            return ListView.builder(
                              physics: BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return EventCard(
                                  events: snapshot.data.values.toList()[index],
                                );
                              },
                              itemCount: snapshot.data.length,
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
              floatingActionButton: FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () {},
              ),
            );
          },
        );
      },
    );
  }
}
