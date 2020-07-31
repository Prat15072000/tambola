import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Ticket {
  Ticket({
    this.tickets,
  });

  List<List<List<int>>> tickets;

  factory Ticket.fromJson(Map<String, dynamic> json) => Ticket(
        tickets: List<List<List<int>>>.from(json["tickets"].map((x) =>
            List<List<int>>.from(
                x.map((x) => List<int>.from(x.map((x) => x)))))),
      );

  Map<String, dynamic> toJson() => {
        "tickets": List<dynamic>.from(tickets.map((x) => List<dynamic>.from(
            x.map((x) => List<dynamic>.from(x.map((x) => x)))))),
      };
}

class TicketPage extends StatefulWidget {
  @override
  _TicketPageState createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  String _nos = '0';
  Ticket ticketList;
  String apiResult;
  Map<String, bool> cellStatus = {};
  final numCon = TextEditingController();

  @override
  void initState() {
    super.initState();
    numCon.addListener(_updateUserInput);
    WidgetsBinding.instance.addPostFrameCallback((_) => _getNumbers());
  }

  _updateUserInput() {
    _nos = numCon.text;
  }

  @override
  void dispose() {
// Clean up the controller when the widget is removed from the widget tree.
// This also removes the listener.
    numCon.dispose();
    super.dispose();
  }

  _getNumbers() async {
    var result = await http
        .post(
            'https://tickets-qzd55332wa-de.a.run.app/generateTickets?ticketsRequired=$_nos')
        .then((result) {
      //Waits for the API response and assigns to apiResult variable
      setState(() {
        apiResult = result.body;
      });
    });
  }

  // List tick = [
  //   {
  //     'tickets': [
  //       [
  //         [11, 5, 7, 10, 28, 9, 7, 74, 59],
  //         [1, 15, 7, 10, 8, 79, 27, 74, 9],
  //         [71, 5, 7, 20, 18, 9, 77, 74, 79],
  //       ],
  //       [
  //         [21, 5, 7, 80, 8, 9, 7, 74, 49],
  //         [31, 15, 7, 10, 18, 79, 7, 74, 19],
  //         [71, 5, 7, 20, 18, 79, 77, 74, 29],
  //       ],
  //     ]
  //   },
  // ];

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    if (apiResult == null) {
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    } else {
      //Get an instance of Ticket from the API assigned to apiResponse variable
      ticketList = Ticket.fromJson(json.decode(apiResult));
      print('Tickets: ${ticketList.tickets}');

      return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(28.0),
                child: Container(
                  child: TextField(
                    controller: numCon,
                    decoration: InputDecoration(
                      hintText: 'nos',
                    ),
                  ),
                ),
              ),
              RaisedButton(
                  child: Text('Generate'),
                  onPressed: () {
                    setState(() {
                      _getNumbers();
                    });
                  }),
              Expanded(
                child: ListView.builder(
                  itemCount: ticketList.tickets.length,
                  itemBuilder: (BuildContext context, index) {
                    List tripleNumbersList = [];
                    List<Widget> cells = [];
                    List<Widget> rows = [];

                    //Get the lists of lists inside the 'tickets' list
                    tripleNumbersList = ticketList.tickets[index];
                    //Iterates over each list with other 3 lists
                    for (int j = 0; j < tripleNumbersList.length; j++) {
                      //Get one of the 3 lists
                      List<int> list = tripleNumbersList[j];
                      //Iterates over the list of numbers
                      for (int k = 0; k < list.length; k++) {
                        //Adds a Widget to 'cells; list for each number
                        cells.add(Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                              ),
                              //color: Colors.pink
                            ),
                            child: GestureDetector(
                              onTap: () {
                                print('Working');
                                if (cellStatus['$j$k'] ?? true) {
                                  print('Working');
                                  setState(() {
                                    cellStatus.addAll({'$j$k': false});
                                  });
                                }
                              },
                              child: list[k] != 0
                                  ? Text(
                                      ' ${list[k]}  ',
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold),
                                    )
                                  : Text(''),
                            )));
                      }
                      //Adds the list of 'cells' in the 'rows' list
                      rows.add(Row(children: cells));
                      cells = [];
                    }
                    //Adds a empty row to make space
                    rows.add(Row(children: [
                      Container(
                        height: 10,
                      )
                    ]));

                    return Center(
                      child: Container(
                        height: h / 5,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                          ),
                          //color: Colors.pink
                        ),
                        child: Column(
                          //Adds the list of rows to the column
                          children: rows,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
