// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'dart:io';
// import 'package:barcode_scan/barcode_scan.dart';
// import 'package:flutter/services.dart';

// class CartItems extends StatefulWidget {
//   @override
//   _CartItemsState createState() => _CartItemsState();
// }

// class _CartItemsState extends State<CartItems> {
//   String barcodeResult = "";
//   String barcode = ""; //Skip anyone of the variables I guess.

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(child: Text('Code: ' + barcode)),
//       floatingActionButton: FloatingActionButton(
//         onPressed: barcodeScanning.then((value) {
//           //this to
//           setState(() {
//             barcodeResult = value;
//           });
//         }), // this
//         child: Icon(Icons.add),
//       ),
//     );
//   }

//   Future barcodeScanning() async {
//     try {
//       String barcode = BarcodeScanner.scan() as String;
//       setState(() => this.barcode = barcode);
//     } on PlatformException catch (e) {
//       if (e.code == BarcodeScanner.cameraAccessDenied) {
//         setState(() {
//           this.barcode = 'No camera permission!';
//         });
//       } else {
//         setState(() => this.barcode = 'Unknown error: $e');
//       }
//     } on FormatException {
//       setState(() => this.barcode = 'Nothing captured.');
//     } catch (e) {
//       setState(() => this.barcode = 'Unknown error: $e');
//     }
//     return barcode; //this
//   }
// }
