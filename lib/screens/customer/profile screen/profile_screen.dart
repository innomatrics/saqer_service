import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final deepPurpleTheme = ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.deepPurple,
        brightness: theme.brightness,
      ),
    );

    return Theme(
      data: deepPurpleTheme,
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.white,
          title: const Text(
            'Profile',
            style: TextStyle(
              color: Colors.deepPurple,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
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
                    color: Colors.deepPurple.shade50,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.deepPurple.withOpacity(0.1),
                        blurRadius: 12,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(10),
                  child: const Icon(
                    Icons.account_circle,
                    size: 100,
                    color: Colors.deepPurple,
                  ),
                ).animate().fadeIn(duration: 500.ms).slideY(begin: 0.2),
                const SizedBox(height: 16),
                const Text(
                  'Nicolas Adams',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
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
                      context,
                      Icons.payment,
                      'Payment Method',
                    ),
                    _buildIndividualCard(
                      context,
                      Icons.location_on,
                      'Saved Locations',
                    ),
                    _buildIndividualCard(context, Icons.help_outline, 'Help'),
                    _buildIndividualCard(
                      context,
                      Icons.description,
                      'Terms & Conditions',
                    ),
                    _buildIndividualCard(
                      context,
                      Icons.privacy_tip,
                      'Privacy and Policies',
                    ),
                    _buildIndividualCard(
                      context,
                      Icons.card_giftcard,
                      'Refer & Earn',
                    ),
                    _buildIndividualCard(
                      context,
                      Icons.logout,
                      'Logout',
                      isLast: true,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIndividualCard(
    BuildContext context,
    IconData icon,
    String text, {
    bool isLast = false,
  }) {
    return GestureDetector(
      onTap: () {
        // Navigation or action
      },
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
                  onTap: () {},
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    leading: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.deepPurple.shade50,
                      ),
                      child: Icon(icon, color: Colors.deepPurple),
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
