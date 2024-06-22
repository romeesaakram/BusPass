import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fyp_project/Admin/JourneyUpdate.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
class RechargeJourneysScreen extends StatefulWidget {
  const RechargeJourneysScreen({super.key});

  @override
  State<RechargeJourneysScreen> createState() => _RechargeJourneysScreenState();
}

class _RechargeJourneysScreenState extends State<RechargeJourneysScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade400,
        title: Text('Recharge Journeys'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                'Scan a QR code',
                style: TextStyle(color: Colors.grey, fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      if (scanData.code == 'VALID_JOURNEY') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => JourneyUpdate()),
        );
      } else {
        _showInvalidDialog();
      }
    });
  }

  void _showInvalidDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            padding: EdgeInsets.all(16.0),
            color: Colors.red,
            child: Text(
              'Pass Invalid',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}