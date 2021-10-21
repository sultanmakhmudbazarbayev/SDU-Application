import 'package:flutter/material.dart';

class Bookmarks extends StatefulWidget {
  const Bookmarks({Key? key}) : super(key: key);

  @override
  _BookmarksState createState() => _BookmarksState();
}

class _BookmarksState extends State<Bookmarks> {
  @override
  void initState() {
    super.initState();
    // Implement here!
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        return Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  width: constraint.maxWidth,
                  decoration: BoxDecoration(border: Border.all(color: Colors.grey)),

                  child:Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text('Bookmarks',style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22)),
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  width: constraint.maxWidth,
                  decoration: BoxDecoration(border: Border.all(color: Colors.grey)),

                  child:Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text('Hello World!',style: TextStyle(fontWeight: FontWeight.w400, fontSize: 22)),
                  ),
                )
              ],
            ),
            Column(
              children: [
                SizedBox(height: 10),
                Image.network("https://cdn.dribbble.com/users/876908/screenshots/7034541/media/a5dbf47103f35a82f8f0501ea78f25e7.png?compress=1&resize=1000x750",
                  height: 256,
                  fit: BoxFit.fitHeight,
                ),
                Text("Hello, Bex"),
                Text("Hello")
              ],
            )
          ],
        );
      },
    );
  }
}
