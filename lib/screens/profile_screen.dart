import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _currentIndex = 3; // Profile tab highlighted

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: false, // so the green header goes under the status bar
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ============================
              // GREEN HEADER
              // ============================
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(top: 50, bottom: 30),
                decoration: const BoxDecoration(color: AppTheme.primaryGreen),
                child: Stack(
                  children: [
                    // Settings icon (top-right)
                    Positioned(
                      top: 0,
                      right: 16,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.settings,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                    ),

                    // Center content (avatar, name, email)
                    Center(
                      child: Column(
                        children: [
                          const SizedBox(height: 10),

                          // Avatar circle with person icon
                          Container(
                            width: 110,
                            height: 110,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 3),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.person_outline,
                                color: Colors.white,
                                size: 70,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),

                          // Name
                          const Text(
                            'Nibesh Shah',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: 'Serif',
                            ),
                          ),
                          const SizedBox(height: 6),

                          // Email
                          const Text(
                            'nibeshshah@gmail.com',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // ============================
              // STATS ROW
              // ============================
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildStatItem('12', 'Donations'),
                    _buildStatItem('24', 'Requests'),
                    _buildStatItem('120', 'Points'),
                  ],
                ),
              ),

              // Divider line
              const Divider(color: Color(0xFFE0E0E0), thickness: 1, height: 1),
              const SizedBox(height: 10),

              // ============================
              // MENU ITEMS
              // ============================
              _buildMenuItem(
                emoji: '💼',
                label: 'My Donations',
                onTap: () {
                  Navigator.pushNamed(context, '/history');
                },
              ),
              _buildMenuItem(emoji: '📥', label: 'My Requests', onTap: () {}),
              _buildMenuItem(emoji: '🥇', label: 'Reward Points', onTap: () {}),
              _buildMenuItem(emoji: '⚙️', label: 'Settings', onTap: () {}),
              _buildMenuItem(
                emoji: '↩️',
                label: 'Logout',
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/login',
                    (route) => false,
                  );
                },
              ),
              _buildMenuItem(
                emoji: '🛡️',
                label: 'Admin Dashboard',
                onTap: () {
                  Navigator.pushNamed(context, '/admin');
                },
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),

      // ============================
      // BOTTOM NAVIGATION
      // ============================
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() => _currentIndex = index);
          if (index == 0) Navigator.pushReplacementNamed(context, '/home');
          if (index == 1) Navigator.pushReplacementNamed(context, '/donate');
          if (index == 2) {
            Navigator.pushReplacementNamed(context, '/notifications');
          }
          // Already on Profile if index == 3
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppTheme.primaryGreen,
        unselectedItemColor: AppTheme.textLight,
        selectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: const TextStyle(fontSize: 12),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, size: 28),
            activeIcon: Icon(Icons.home, size: 28),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.delivery_dining_outlined, size: 28),
            activeIcon: Icon(Icons.delivery_dining, size: 28),
            label: 'Donate',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none, size: 28),
            activeIcon: Icon(Icons.notifications, size: 28),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline, size: 28),
            activeIcon: Icon(Icons.person, size: 28),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  // ---- Stat Item Builder ----
  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: AppTheme.primaryGreen,
            fontFamily: 'Serif',
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: AppTheme.textLight,
          ),
        ),
      ],
    );
  }

  // ---- Menu Item Builder ----
  Widget _buildMenuItem({
    required String emoji,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 18.0),
        child: Row(
          children: [
            // Emoji icon
            Text(emoji, style: const TextStyle(fontSize: 22)),
            const SizedBox(width: 18),

            // Label
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textDark,
                ),
              ),
            ),

            // Chevron
            const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: AppTheme.textLight,
            ),
          ],
        ),
      ),
    );
  }
}
