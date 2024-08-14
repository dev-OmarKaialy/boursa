import 'package:flutter/material.dart';
import 'package:p_boursa/features/add_ad/data/models/tender_model.dart';

class detailsScreen extends StatefulWidget {
  const detailsScreen({super.key, required this.tender});
  final TenderModel tender;
  @override
  State<detailsScreen> createState() => _detailsScreenState();
}

class _detailsScreenState extends State<detailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        endDrawer: const Drawer(
          shadowColor: Colors.white,
          shape: Border(),
        ),
        appBar: AppBar(
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Tender",
                style: TextStyle(color: Colors.white),
              ),
              Text(" World", style: TextStyle(color: Colors.white))
            ],
          ),
          iconTheme: const IconThemeData(color: Colors.grey),
          backgroundColor: const Color.fromARGB(255, 0, 39, 71),
          elevation: 0.0,
        ),
        body: Column(
          children: [
            Container(
              color: Colors.grey[400],
              child: Text('Description${widget.tender.descripion!}'),
            ),
            Container(
              color: Colors.grey[400],
              child: Text(widget.tender.timestamp!.toString().substring(0, 10)),
            ),
            Container(
              color: Colors.grey[400],
              child: Text(widget.tender.v!.toString()),
            ),
          ],
        ));
  }
}
