import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p_boursa/core/extensions/widget_extensions.dart';
import 'package:p_boursa/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:p_boursa/features/home/presentation/pages/detail_screen.dart';

import '../../../add_ad/presentation/bloc/add_ad_bloc.dart';

class My_tender extends StatelessWidget {
  const My_tender({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AddAdBloc, AddAdState>(
        bloc: AddAdBloc()..add(GetTenders()),
        builder: (context, state) {
          return switch (state.tenderStatus) {
            CubitStatus.success => ListView.builder(
                itemCount: state.tenders.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Container(
                      height: 300,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(state.tenders[index].descripion!),
                      ),
                    ),
                  ).onTap(() {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return detailsScreen(tender: state.tenders[index]);
                    }));
                  });
                }),
            _ => const Center(
                child: CircularProgressIndicator(),
              ),
          };
        },
      ),
    );
  }
}
