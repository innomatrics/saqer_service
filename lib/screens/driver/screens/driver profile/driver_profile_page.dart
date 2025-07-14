import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:saqer_services/constants/constants.dart';

class DriverProfilePage extends StatelessWidget {
  const DriverProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.mainColor,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.mainColor.withOpacity(0.1),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(10),
                child: const Icon(
                  Icons.account_circle,
                  size: 100,
                  color: Colors.white,
                ),
              ).animate().fadeIn(duration: 500.ms).slideY(begin: 0.2),
              const SizedBox(height: 16),
              const Text(
                'UserName',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.mainColor,
                ),
              ).animate().fadeIn(duration: 500.ms),
              const SizedBox(height: 4),
              Text(
                '+9714533232345',
                style: TextStyle(
                  fontSize: 16,
                  color: theme.colorScheme.onSurface.withOpacity(0.6),
                ),
              ).animate().fadeIn(duration: 600.ms),
              const SizedBox(height: 30),
              Column(
                children: [
                  _buildIndividualCard(
                    context: context,
                    icon: Icons.person,
                    text: 'Edit Profile',
                    onTap: () {},
                  ),
                  _buildIndividualCard(
                    context: context,
                    icon: Icons.payment,
                    text: 'Payment Method',
                    onTap: () {},
                  ),
                  _buildIndividualCard(
                    context: context,
                    icon: Icons.location_on,
                    text: 'Saved Locations',
                    onTap: () {},
                  ),
                  _buildIndividualCard(
                    context: context,
                    icon: Icons.help_outline,
                    text: 'Help',
                    onTap: () {},
                  ),
                  _buildIndividualCard(
                    context: context,
                    icon: Icons.description,
                    text: 'Terms & Conditions',
                    onTap: () {},
                  ),
                  _buildIndividualCard(
                    context: context,
                    icon: Icons.privacy_tip,
                    text: 'Privacy and Policies',
                    onTap: () {},
                  ),
                  _buildIndividualCard(
                    context: context,
                    icon: Icons.card_giftcard,
                    text: 'Refer & Earn',
                    onTap: () {},
                  ),
                  _buildIndividualCard(
                    context: context,
                    icon: Icons.logout,
                    text: 'Logout',
                    isLast: true,
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIndividualCard({
    required BuildContext context,
    required IconData icon,
    required String text,
    bool isLast = false,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: () {},
      child:
          Container(
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: onTap,
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    leading: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.mainColor,
                      ),
                      child: Icon(icon, color: Colors.white),
                    ),
                    title: Text(
                      text,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Colors.grey,
                    ),
                  ),
                ),
              )
              .animate()
              .fadeIn(duration: 500.ms)
              .scale(begin: const Offset(0.95, 0.95)),
    );
  }
}
