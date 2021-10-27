import 'package:flutter/material.dart';

class Bookmarks extends StatefulWidget {
  const Bookmarks({Key key}) : super(key: key);

  @override
  _BookmarksState createState() => _BookmarksState();
}

List<String> favorites = [
  "Machine Learning",
  "Digital Design",
  "Data Analysis",
  "FAANG",
];

class _BookmarksState extends State<Bookmarks> {
  @override
  void initState() {
    super.initState();
    // Implement here!
  }

  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              favorites[0],
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(
              height: 6.0,
            ),
            Text(
              "Let's Start your course!",
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey[800],
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextButton.icon(
              //onPressed: delete,
              label: Text('Delete course'),
              icon: Icon(Icons.delete),
            ),
            Text(
              favorites[1],
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(
              height: 6.0,
            ),
            Text(
              "Let's Start your course!",
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey[800],
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextButton.icon(
              //onPressed: delete,
              label: Text('Delete course'),
              icon: Icon(Icons.delete),
            ),
            Text(
              favorites[2],
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(
              height: 6.0,
            ),
            Text(
              "Let's Start your course!",
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey[800],
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextButton.icon(
              //onPressed: delete,
              label: Text('Delete course'),
              icon: Icon(Icons.delete),
            ),
            Text(
              favorites[3],
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(
              height: 6.0,
            ),
            Text(
              "Let's Start your course!",
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey[800],
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextButton.icon(
              onPressed: () {},
              label: Text('Delete course'),
              icon: Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}
//
//class Bookmarks extends StatefulWidget {
//  const Bookmarks({Key key}) : super(key: key);
//
//  @override
//  _BookmarksState createState() => _BookmarksState();
//}
//
//class _BookmarksState extends State<Bookmarks> {
//  @override
//  void initState() {
//    super.initState();
//    // Implement here!
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return LayoutBuilder(
//      builder: (context, constraint) {
//        return Column(
//          children: <Widget>[
//            Row(
//              children: <Widget>[
//                Container(
//                  width: constraint.maxWidth,
//                  decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
//
//                  child:Padding(
//                    padding: EdgeInsets.all(16.0),
//                    child: Text('Bookmarks',style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22)),
//                  ),
//                )
//              ],
//            ),
//            Row(
//              children: <Widget>[
//                Container(
//                  width: constraint.maxWidth,
//                  decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
//
//                  child:Padding(
//                    padding: EdgeInsets.all(16.0),
//                    child: Text('Download settings',style: TextStyle(fontWeight: FontWeight.w400, fontSize: 22)),
//                  ),
//                )
//              ],
//            ),
//            Column(
//              children: [
//                SizedBox(height: 100),
//                Image.network("https://cdn.dribbble.com/users/876908/screenshots/7034541/media/a5dbf47103f35a82f8f0501ea78f25e7.png?compress=1&resize=1000x750",
//                  height: 256,
//                  fit: BoxFit.fitHeight,
//                ),
//                Text("You have no bookmarks.",style: TextStyle(fontWeight: FontWeight.w600, fontSize: 26)),
//                Text("You can download videos in Bookmarks for offline viewing", textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w400, fontSize: 22))
//              ],
//            )
//          ],
//        );
//      },
//    );
//  }
//}
