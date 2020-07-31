// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class Ticket {
//   Ticket({
//     this.tickets,
//   });

//   List<List<List<int>>> tickets;

//   factory Ticket.fromJson(Map<String, dynamic> json) => Ticket(
//         tickets: List<List<List<int>>>.from(json["tickets"].map((x) =>
//             List<List<int>>.from(
//                 x.map((x) => List<int>.from(x.map((x) => x)))))),
//       );

//   Map<String, dynamic> toJson() => {
//         "tickets": List<dynamic>.from(tickets.map((x) => List<dynamic>.from(
//             x.map((x) => List<dynamic>.from(x.map((x) => x)))))),
//       };
// }

// class TicketPage extends StatefulWidget {
//   @override
//   _TicketPageState createState() => _TicketPageState();
// }

// class _TicketPageState extends State<TicketPage> {
//   var nos;
//   Ticket ticketList;
//   String apiResult;
//   Map<String, bool> cellStatus = {};

//   @override
//   void initState() {
//     super.initState();
//     _getNumbers();
//   }

//   _getNumbers() async {
//     var result = await http
//         .post(
//             'https://tickets-qzd55332wa-de.a.run.app/generateTickets?ticketsRequired=0')
//         .then((result) {
//       //Waits for the API response and assigns to apiResult variable
//       setState(() {
//         apiResult = result.body;
//       });
//     });
//   }

//   // List tick = [
//   //   {
//   //     'tickets': [
//   //       [
//   //         [11, 5, 7, 10, 28, 9, 7, 74, 59],
//   //         [1, 15, 7, 10, 8, 79, 27, 74, 9],
//   //         [71, 5, 7, 20, 18, 9, 77, 74, 79],
//   //       ],
//   //       [
//   //         [21, 5, 7, 80, 8, 9, 7, 74, 49],
//   //         [31, 15, 7, 10, 18, 79, 7, 74, 19],
//   //         [71, 5, 7, 20, 18, 79, 77, 74, 29],
//   //       ],
//   //     ]
//   //   },
//   // ];

//   @override
//   Widget build(BuildContext context) {
//     var h = MediaQuery.of(context).size.height;
//     var w = MediaQuery.of(context).size.width;

//     if (apiResult == null) {
//       return Center(child: CircularProgressIndicator());
//     } else {
//       //Get an instance of Ticket from the API assigned to apiResponse variable
//       ticketList = Ticket.fromJson(json.decode(apiResult));
//       print('Tickets: ${ticketList.tickets}');

//       return Scaffold(
//         body: SafeArea(
//           child: Center(
//             child: Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Container(
//                 decoration: BoxDecoration(
//                     border: Border.all(
//                   color: Colors.black,
//                 )),
//                 child: ListView.builder(
//                   itemCount: ticketList.tickets.length,
//                   itemBuilder: (BuildContext context, index) {
//                     List tripleNumbersList = [];
//                     List<Widget> cells = [];
//                     List<Widget> rows = [];

//                     //Get the lists of lists inside the 'tickets' list
//                     tripleNumbersList = ticketList.tickets[index];
//                     //Iterates over each list with other 3 lists
//                     for (int j = 0; j < tripleNumbersList.length; j++) {
//                       //Get one of the 3 lists
//                       List<int> list = tripleNumbersList[j];
//                       //Iterates over the list of numbers
//                       for (int k = 0; k < list.length; k++) {
//                         //Adds a Widget to 'cells; list for each number
//                         cells.add(Container(
//                             height: 40,
//                             width: 39,
//                             decoration: BoxDecoration(
//                               border: Border.all(
//                                 color: Colors.black,
//                               ),
//                               //color: Colors.pink
//                             ),
//                             child: GestureDetector(
//                               onTap: () {
//                                 if (cellStatus['$j$k'] ?? true) {
//                                   print('working');
//                                   setState(() {
//                                     cellStatus.addAll({'$j$k': false});
//                                     Icon(Icons.access_alarm);
//                                   });
//                                 }
//                               },
//                               child: list[k] != 0
//                                   ? Text(
//                                       ' ${list[k]}  ',
//                                       style: TextStyle(
//                                           fontSize: 18.0,
//                                           fontWeight: FontWeight.bold),
//                                     )
//                                   : Text(''),
//                             )));
//                       }
//                       //Adds the list of 'cells' in the 'rows' list
//                       rows.add(Row(children: cells));
//                       cells = [];
//                     }
//                     //Adds a empty row to make space
//                     rows.add(Row(children: [
//                       Container(
//                         height: 10,
//                       )
//                     ]));

//                     return Center(
//                       child: Container(
//                         height: h / 4,
//                         decoration: BoxDecoration(
//                           border: Border.all(
//                             color: Colors.black,
//                           ),
//                           //color: Colors.pink
//                         ),
//                         child: Column(
//                           //Adds the list of rows to the column
//                           children: rows,
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ),
//           ),
//         ),
//       );
//     }
//   }
// }
