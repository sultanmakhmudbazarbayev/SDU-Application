import 'package:flutter/material.dart';

class LessonCard extends StatelessWidget {
  final String description;
  final String header;

  const LessonCard({Key key, this.header, this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 15),
      height: 150,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        color: Colors.white,
        elevation: 2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 22, top: 20),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        '$header',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        left: 20, right: 15, top: 10, bottom: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '$description',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
