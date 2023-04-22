import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova/business_logic/devices_cubit/devices_cubit.dart';
import 'package:nova/business_logic/devices_cubit/devices_state.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocConsumer<DevicesCubit, DevicesState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            var cubit = DevicesCubit.get(context);
            return ElevatedButton(
              onPressed: () {
                cubit.updateName(idx: 3, name: 'van');
              },
              child: const Text("print"),
            );
          },
        ),
      ),
    );
  }
}
