import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p_boursa/core/utils/main_button.dart';
import 'package:p_boursa/features/auth/presentation/bloc/auth_bloc.dart';

import '../add_ad/presentation/bloc/add_ad_bloc.dart';

class AdvertisementsScreen extends StatelessWidget {
  const AdvertisementsScreen({super.key});

  get onPressed => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
      ),
      backgroundColor: Colors.black12,
      body: BlocBuilder<AddAdBloc, AddAdState>(
        bloc: AddAdBloc()..add(GetAds()),
        builder: (context, state) {
          return switch (state.status) {
            CubitStatus.success => ListView.builder(
                itemCount: state.ads.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(0.8),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    height: 150,
                    width: 20,
                    color: Colors.white,
                    child: MaterialButton(
                      onPressed: () async {},
                      child: Row(children: [
                        Column(children: [
                          Text(
                            state.ads[index].details!,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 30,
                            ),
                          ),
                          Row(children: [
                            Column(children: [
                              Text('${state.ads[index].startTime}'
                                  .substring(0, 10)),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 16),
                                child: Row(
                                  children: [
                                    const SizedBox(width: 10),
                                    GestureDetector(
                                      onTap: () {
                                        // Navigator.pushNamed(context, 'details');
                                      },
                                      child: const Text(
                                        '   More...',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                          ]),
                        ]),
                      ]),
                    ),
                  ),
                ),
              ),
            CubitStatus.failed => Center(
                child: MainButton(text: 'Try Again', onPressed: () {}),
              ),
            _ => const Center(
                child: CircularProgressIndicator(),
              ),
          };
        },
      ),
    );
  }
}
