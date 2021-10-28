import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

double heihtOfContainer = 120;

class _HomeState extends State<Home> {
  List<String> _values = [
    'Math',
    'Science',
    'Economics',
    'Art and humanities',
    'Computing'
  ];
  List<String> _descriptions = [
    '\n Your lessons are waiting For you!',
    '\n Your lessons are waiting For you!',
    '\n Your lessons are waiting For you!',
    '\n Your lessons are waiting For you!',
    '\n Your lessons are waiting For you!'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView.separated(
            itemCount: _values.length,
            padding: const EdgeInsets.all(5.0),
            separatorBuilder: (context, index) => Divider(
                  color: Colors.black,
                ),
            itemBuilder: (context, index) {
              return Dismissible(
                key: Key('item ${_values[index]}'),
                background: Container(
                  color: Colors.blue,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.favorite, color: Colors.white),
                        Text('Move to favorites',
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ),
                secondaryBackground: Container(
                  color: Colors.red,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Icon(Icons.delete, color: Colors.white),
                        Text('Move to trash',
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ),
                confirmDismiss: (DismissDirection direction) async {
                  return await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Delete Confirmation"),
                        content: const Text(
                            "Are you sure you want to delete this item from Recommendation?"),
                        actions: <Widget>[
                          FlatButton(
                              onPressed: () => Navigator.of(context).pop(true),
                              child: const Text("Delete")),
                          FlatButton(
                            onPressed: () => Navigator.of(context).pop(false),
                            child: const Text("Cancel"),
                          ),
                        ],
                      );
                    },
                  );
                },
                onDismissed: (DismissDirection direction) {
                  if (direction == DismissDirection.startToEnd) {
                    print("Add to favorite");
                  } else {
                    print('Remove item');
                  }

                  setState(() {
                    _values.removeAt(index);
                  });
                },
                child: ListTile(
                  leading: Icon(Icons.local_activity, size: 50),
                  title: Text(_values[index]),
                  subtitle: Text(_descriptions[index]),
                ),
              );
            }),
      ),
    );
  }
}








// import 'package:flutter/material.dart';
//
// class Home extends StatefulWidget {
//   const Home({Key key}) : super(key: key);
//
//   @override
//   State<Home> createState() => _HomeState();
// }
//
// double heihtOfContainer = 120;
//
// class _HomeState extends State<Home> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Container(
//             padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
//             height: heihtOfContainer,
//             width: double.maxFinite,
//             child: Card(
//               child: Text(
//                 "\nFirst lesson\n\n Your lessons are waiting For you!",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 18.0,
//                   fontStyle: FontStyle.normal,
//                 ),
//               ),
//               elevation: 5,
//             ),
//           ),
//           SizedBox(
//             height: 10.0,
//           ),
//           Container(
//             padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
//             height: heihtOfContainer,
//             width: double.maxFinite,
//             child: Card(
//               child: Text(
//                 "\nSecond lesson\n\n Your lessons are waiting For you!",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 18.0,
//                   fontStyle: FontStyle.normal,
//                 ),
//               ),
//               elevation: 5,
//             ),
//           ),
//           SizedBox(
//             height: 10.0,
//           ),
//           Container(
//             padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
//             height: heihtOfContainer,
//             width: double.maxFinite,
//             child: Card(
//               child: Column(
//                 children: [
//                   Text(
//                     "\nThird lesson\n\n Your lessons are waiting For you!",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 18.0,
//                       fontStyle: FontStyle.normal,
//                     ),
//                   ),
//                 ],
//               ),
//               elevation: 5,
//             ),
//           ),
//           SizedBox(
//             height: 10.0,
//           ),
//           Container(
//             padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
//             height: heihtOfContainer,
//             width: double.maxFinite,
//             child: Card(
//               child: Text(
//                 "\nFourth lesson\n\n Your lessons are waiting For you!",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 18.0,
//                   fontStyle: FontStyle.normal,
//                 ),
//               ),
//               elevation: 5,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
