import 'package:flutter/material.dart';
import 'package:flutter_map/providers/location_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(context.watch<LocationProvider>().latitude ?? "Latitude"),
            Text(context.watch<LocationProvider>().longitude ?? "Longitude"),
            const SizedBox(
              height: 10.0,
            ),
            GestureDetector(
              onTap: () {
                context.read<LocationProvider>().getCurrentLocation();
              },
              child: Container(
                height: 50,
                width: 150,
                decoration: const BoxDecoration(color: Colors.amber),
                child: const Center(child: Text('Get location')),
              ),
            )
          ],
        ),
      )),
    );
  }
}
