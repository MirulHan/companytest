import 'package:flutter/material.dart';
import 'package:fluttertestproject/utils/primary_layout.dart';
// import 'package:sqlite3/sqlite3.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final db = sqlite3.openInMemory();
    // final ResultSet resultSet =
    //     db.select('SELECT * FROM favourite ORDER BY name');
    return const PrimaryLayout(
        title: "Favorite List",
        child: Center(
          child: Text(
              "Sorry I couldnt Figure Out How To Create A Local Database In Time"),
        ));
  }
}
