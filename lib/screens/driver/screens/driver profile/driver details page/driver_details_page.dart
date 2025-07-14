import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:saqer_services/constants/constants.dart';

class DriverDetailsPage extends StatelessWidget {
  const DriverDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'My Profile',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              // Profile Header
              Center(
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      backgroundImage: CachedNetworkImageProvider(
                        AppImages.noProfile,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'John Doe',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '@johndoe_driver',
                      style: TextStyle(color: Colors.grey[600], fontSize: 14),
                    ),
                    const SizedBox(height: 16),
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.blue),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        'Edit Profile',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),
              const Divider(height: 1),
              const SizedBox(height: 20),

              // Personal Information Section
              const Text(
                'Personal Information',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              _buildInfoField(title: 'Name', value: 'John Doe'),
              _buildInfoField(
                title: 'Email address',
                value: 'john.doe@example.com',
              ),
              _buildInfoField(title: 'Username', value: '@johndoe_driver'),
              _buildInfoField(
                title: 'Password',
                value: '********',
                isPassword: true,
              ),
              _buildInfoField(
                title: 'Phone number',
                value: '+966 512345678',
                trailing: const Icon(Icons.arrow_drop_down, color: Colors.grey),
              ),

              const SizedBox(height: 30),
              const Divider(height: 1),
              const SizedBox(height: 20),

              // Preferences Section
              const Text(
                'Preferences',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              _buildMenuOption('Downloads', Icons.download),
              _buildMenuOption('Language', Icons.language),
              _buildMenuOption('Location', Icons.location_on),
              _buildMenuOption('Subscription', Icons.subscriptions),
              _buildMenuOption('Clear cache', Icons.cached),
              _buildMenuOption('Clear history', Icons.history),

              const SizedBox(height: 20),
              _buildMenuOption('Log out', Icons.logout, isLogout: true),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoField({
    required String title,
    required String value,
    bool isPassword = false,
    Widget? trailing,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontSize: 14, color: Colors.grey[600])),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Text(
                  isPassword ? '•' * 8 : value,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              if (trailing != null) trailing,
            ],
          ),
          const SizedBox(height: 8),
          const Divider(height: 1),
        ],
      ),
    );
  }

  Widget _buildMenuOption(
    String title,
    IconData icon, {
    bool isLogout = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: InkWell(
        onTap: () {},
        child: Row(
          children: [
            Icon(
              icon,
              color: isLogout ? Colors.red : Colors.grey[700],
              size: 24,
            ),
            const SizedBox(width: 15),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                color: isLogout ? Colors.red : Colors.black,
                fontWeight: isLogout ? FontWeight.w500 : FontWeight.normal,
              ),
            ),
            const Spacer(),
            if (!isLogout)
              const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
