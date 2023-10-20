import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertestproject/utils/primary_layout.dart';
import 'package:http/http.dart' as http;

import 'profile_overview_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> usProfiles = [];
  List<dynamic> otherProfiles = [];

  @override
  void initState() {
    super.initState();
    _fetchProfiles();
  }

  Future<void> _fetchProfiles() async {
    final response =
        await http.get(Uri.parse('https://randomuser.me/api/?results=15'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final profiles = data['results'] as List;
      setState(() {
        usProfiles =
            profiles.where((profile) => profile['nat'] == 'US').toList();
        otherProfiles =
            profiles.where((profile) => profile['nat'] != 'US').toList();
      });
    } else {
      print('Failed to load profiles');
    }
  }

  @override
  Widget build(BuildContext context) {
    return PrimaryLayout(
        title: 'Home Screen',
        child: ListView.builder(
          itemCount: usProfiles.length + otherProfiles.length + 2,
          itemBuilder: (context, index) {
            if (index == 0 && usProfiles.isNotEmpty) {
              return const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'US Profiles',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              );
            } else if (index <= usProfiles.length) {
              final profile = usProfiles[index - 1];
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ProfileOverViewScreen(
                        fullName:
                            '${profile['name']['first']} ${profile['name']['last']}',
                        email: profile['email'],
                        state: profile['location']['state'],
                        country: profile['location']['country'],
                        image: profile['picture']['large'],
                      ),
                    ),
                  );
                },
                child: ListTile(
                  leading: ClipOval(
                    child: Image.network(
                      profile['picture']['large'],
                      width: 48,
                      height: 48,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    '${profile['name']['first']} ${profile['name']['last']}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              );
            } else if (index == usProfiles.length + 1) {
              return const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Other Profiles',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              );
            } else {
              final profile = otherProfiles[index - usProfiles.length - 2];
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ProfileOverViewScreen(
                        fullName:
                            '${profile['name']['first']} ${profile['name']['last']}',
                        email: profile['email'],
                        state: profile['location']['state'],
                        country: profile['location']['country'],
                        image: profile['picture']['large'],
                      ),
                    ),
                  );
                },
                child: ListTile(
                    leading: ClipOval(
                      child: Image.network(
                        profile['picture']['large'],
                        width: 48,
                        height: 48,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      '${profile['name']['first']} ${profile['name']['last']}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    )),
              );
            }
          },
        ));
  }
}
