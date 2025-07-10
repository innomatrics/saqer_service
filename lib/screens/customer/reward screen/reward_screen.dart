import 'package:flutter/material.dart';

class RewardsScreen extends StatelessWidget {
  const RewardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: const Text(
          'Your Rewards',
          style: TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Add your input fields here like:
            // _buildInputLabel + _buildInputField
            SizedBox(height: 500), // Example space for form inputs
          ],
        ),
      ),
      bottomNavigationBar: const Padding(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
      ),
    );
  }
}
