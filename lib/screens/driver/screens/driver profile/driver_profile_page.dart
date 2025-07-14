import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:saqer_services/constants/constants.dart';
import 'package:saqer_services/screens/driver/screens/driver%20profile/driver%20details%20page/driver_details_page.dart';
import 'package:saqer_services/util/util.dart';

class DriverProfilePage extends StatefulWidget {
  const DriverProfilePage({super.key});

  @override
  State<DriverProfilePage> createState() => _DriverProfilePageState();
}

class _DriverProfilePageState extends State<DriverProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            ListTile(
              title: const Text(
                "Driver Name",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Row(
                children: [
                  const Text(
                    "Referal Code",
                    style: TextStyle(color: Colors.grey),
                  ),
                  IconButton(
                    iconSize: 16,
                    onPressed: () =>
                        justNavigate(context, const DriverDetailsPage()),
                    icon: const Icon(Icons.arrow_forward_ios_rounded),
                  ),
                ],
              ),
              trailing: const CircleAvatar(
                radius: 30,
                backgroundImage: CachedNetworkImageProvider(
                  AppImages.noProfile,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
