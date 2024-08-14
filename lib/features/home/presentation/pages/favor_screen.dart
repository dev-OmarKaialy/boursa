import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class favorScreen extends StatefulWidget {
  const favorScreen({super.key});

  @override
  State<favorScreen> createState() => _favorScreenState();
}

class _favorScreenState extends State<favorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: const [],
          //automaticallyImplyLeading: false,
        ),
        body: Builder(builder: (context) {
          return Hive.box('wishlist').isEmpty
              ? const Center(
                  child: Text('There Is No Favored Items Yet'),
                )
              : ListView.builder(
                  itemCount: Hive.box('wishlist').length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 180,
                      width: 150,
                      padding: const EdgeInsets.only(
                          top: 100, bottom: 30, left: 20, right: 20),
                      margin: const EdgeInsets.only(top: 15),
                      color: Colors.grey[300],
                      child: Container(
                        alignment: Alignment.bottomRight,
                        child: const Icon(
                          Icons.favorite_border,
                          color: Colors.red,
                        ),
                      ),
                    );
                  },
                );
        }));
  }
}
