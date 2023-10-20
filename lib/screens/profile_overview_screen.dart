import 'package:flutter/material.dart';
import 'package:fluttertestproject/utils/primary_layout.dart';

class ProfileOverViewScreen extends StatefulWidget {
  const ProfileOverViewScreen(
      {super.key,
      required this.fullName,
      required this.email,
      required this.state,
      required this.country,
      required this.image});
  final String fullName;
  final String email;
  final String state;
  final String country;
  final String image;

  @override
  State<ProfileOverViewScreen> createState() => _ProfileOverViewScreenState();
}

class _ProfileOverViewScreenState extends State<ProfileOverViewScreen> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PrimaryLayout(
      title: 'Profile Overview',
      child: Center(
        child: Column(
          children: [
            Stack(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: ClipOval(
                    child: Image.network(
                      widget.image,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : null,
                    ),
                    onPressed: () {
                      setState(() {
                        isFavorite = !isFavorite;
                        // final stmt = db
                        //     .prepare('INSERT INTO favourite (name) VALUES (?)');
                        // stmt
                        //   ..execute(['Full Name: ${widget.fullName}'])
                        //   ..execute(['Email: ${widget.email}'])
                        //   ..execute(['State: ${widget.state}'])
                        //   ..execute(['Country: ${widget.country}']);
                        // stmt.dispose();
                      });
                    },
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Full Name: ${widget.fullName}'),
                Text('Email: ${widget.email}'),
                Text('State: ${widget.state}'),
                Text('Country: ${widget.country}'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
