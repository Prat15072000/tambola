import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
// import 'package:ample/numberClass.dart';

class Grid extends StatefulWidget {
  @override
  _GridState createState() => _GridState();
}

class _GridState extends State<Grid> {
  var nos;

  @override
  void initState() {
    super.initState();
    _getNumbers();
  }

  _getNumbers() async {
    var result = await http.post(
        'https://tickets-qzd55332wa-de.a.run.app/generateTickets?ticketsRequired=0');
    print(result.body);
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Center(
              child: Container(
                height: h / 5,
                width: w / 1.3,
                color: Colors.pink[100],
                child: GridView.count(
                  crossAxisCount: 9,
                  children: List.generate(
                    27,
                    (index) {
                      return GestureDetector(
                        onTap: () {
                          print('Working');
                        },
                        child: Center(
                          child: Text('Data'),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            Center(
              child: FlatButton(
                onPressed: () {
                  //nos = 1;
                },
                child: Text('1'),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  //img = 'images/tmhm.jpg';
                });
              },
              child: CircleAvatar(
                radius: 20.0,
                backgroundImage: AssetImage('images/img4.jpg'),
                child: Icon(Icons.access_alarm),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Img extends StatefulWidget {
  @override
  _ImgState createState() => _ImgState();
}

class _ImgState extends State<Img> {
  @override
  Widget build(BuildContext context) {
    String img = "images/tmhm.jpg";
    Image.asset(img);
  }
}
