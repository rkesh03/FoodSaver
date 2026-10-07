import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class AdminUsersScreen extends StatefulWidget {
  const AdminUsersScreen({super.key});

  @override
  State<AdminUsersScreen> createState() => _AdminUsersScreenState();
}

class _AdminUsersScreenState extends State<AdminUsersScreen> {
  int _currentIndex = 2; // Users tab highlighted

  // Dummy user data
  final List<Map<String, dynamic>> _users = [
    {
      'initials': 'DS',
      'name': 'Dalendra Shah',
      'email': 'dalendra@gmail.com',
      'phone': '+977 9823456789',
      'status': 'Active',
      'avatarBg': const Color(0xFFE8F5E9),
      'avatarText': const Color(0xFF388E3C),
    },
    {
      'initials': 'AV',
      'name': 'Mohammad Irsad Rain',
      'email': 'alimdirshad487@gmail.com',
      'phone': '+977 9822034486',
      'status': 'Active',
      'avatarBg': const Color(0xFFFCE4EC),
      'avatarText': const Color(0xFFC2185B),
    },
    {
      'initials': 'MZ',
      'name': 'Mehnaz Parween',
      'email': 'mehnaz@gmail.com',
      'phone': '+977 9814567890',
      'status': 'Inactive',
      'avatarBg': const Color(0xFFFFF3E0),
      'avatarText': const Color(0xFFFFA000),
    },
    {
      'initials': 'NK',
      'name': 'Najmin Khatun',
      'email': 'najmin@gmail.com',
      'phone': '+977 9811122233',
      'status': 'Blocked',
      'avatarBg': const Color(0xFFFFEBEE),
      'avatarText': const Color(0xFFD32F2F),
    },
    {
      'initials': 'RB',
      'name': 'Rakesh Bhul',
      'email': 'rakeshbhul@gmail.com',
      'phone': '+977 9819968776',
      'status': 'Active',
      'avatarBg': const Color(0xFFE3F2FD),
      'avatarText': const Color(0xFF1976D2),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),

      // ============================
      // APP BAR
      // ============================
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu, color: AppTheme.textDark, size: 26),
        ),
        title: const Text(
          'Users',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppTheme.textDark,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_none,
              color: AppTheme.textDark,
              size: 26,
            ),
          ),
        ],
      ),

      // ============================
      // BODY
      // ============================
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ---- 4 STAT CARDS ROW ----
            Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    '245',
                    'Total Users',
                    Icons.person_outline,
                    const Color(0xFFE3F2FD),
                    const Color(0xFF1976D2),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _buildStatCard(
                    '85',
                    'Active Users',
                    Icons.person_add_alt,
                    const Color(0xFFE8F5E9),
                    const Color(0xFF388E3C),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _buildStatCard(
                    '32',
                    'Inactive Users',
                    Icons.person_off_outlined,
                    const Color(0xFFFFF3E0),
                    const Color(0xFFFFA000),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _buildStatCard(
                    '10',
                    'Blocked Users',
                    Icons.block,
                    const Color(0xFFFFEBEE),
                    const Color(0xFFD32F2F),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // ---- SEARCH + FILTER ROW ----
            Row(
              children: [
                // Search field
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xFFE0E0E0)),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search users...',
                        hintStyle: const TextStyle(
                          color: AppTheme.textLight,
                          fontSize: 14,
                        ),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: AppTheme.textLight,
                          size: 22,
                        ),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 14,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),

                // Filter button
                Container(
                  height: 48,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFFE0E0E0)),
                  ),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.filter_list,
                        color: AppTheme.textDark,
                        size: 20,
                      ),
                      SizedBox(width: 6),
                      Text(
                        'Filter',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.textDark,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // ---- "All Users" HEADER ----
            const Text(
              'All Users',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppTheme.textDark,
              ),
            ),
            const SizedBox(height: 12),

            // ---- USER LIST ----
            ..._users.map((u) => _buildUserCard(u)),
          ],
        ),
      ),

      // ============================
      // BOTTOM NAVIGATION
      // ============================
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() => _currentIndex = index);
          if (index == 0) {
            Navigator.pushReplacementNamed(context, '/admin');
          } else if (index == 1) {
            // TODO: Navigator.pushReplacementNamed(context, '/admin_donations');
          } else if (index == 3) {
            // TODO: Navigator.pushReplacementNamed(context, '/admin_reports');
          }
          // Already on Users if index == 2
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        elevation: 8,
        selectedItemColor: AppTheme.primaryGreen,
        unselectedItemColor: AppTheme.textLight,
        selectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: const TextStyle(fontSize: 12),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view_outlined, size: 24),
            activeIcon: Icon(Icons.grid_view, size: 24),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border, size: 24),
            activeIcon: Icon(Icons.favorite, size: 24),
            label: 'Donations',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_outline, size: 24),
            activeIcon: Icon(Icons.people, size: 24),
            label: 'Users',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.description_outlined, size: 24),
            activeIcon: Icon(Icons.description, size: 24),
            label: 'Reports',
          ),
        ],
      ),
    );
  }

  // ============================
  // STAT CARD BUILDER (small, top row)
  // ============================
  Widget _buildStatCard(
    String value,
    String label,
    IconData icon,
    Color bgColor,
    Color iconColor,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFEEEEEE)),
      ),
      child: Column(
        children: [
          // Small icon circle
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: iconColor, size: 18),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: AppTheme.textDark,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: const TextStyle(
              fontSize: 10,
              color: AppTheme.textLight,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  // ============================
  // USER CARD BUILDER
  // ============================
  Widget _buildUserCard(Map<String, dynamic> user) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFEEEEEE)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Avatar circle with initials
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: user['avatarBg'],
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(
              user['initials'],
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: user['avatarText'],
              ),
            ),
          ),
          const SizedBox(width: 12),

          // Name / email / phone
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user['name'],
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textDark,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  user['email'],
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppTheme.textLight,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  user['phone'],
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppTheme.textLight,
                  ),
                ),
              ],
            ),
          ),

          // Status + 3 dots
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _buildStatusBadge(user['status']),
              const SizedBox(height: 10),
              const Icon(Icons.more_horiz, color: AppTheme.textLight, size: 20),
            ],
          ),
        ],
      ),
    );
  }

  // ============================
  // STATUS BADGE
  // ============================
  Widget _buildStatusBadge(String status) {
    Color bgColor;
    Color textColor;
    IconData? icon;

    switch (status.toLowerCase()) {
      case 'active':
        bgColor = const Color(0xFFE8F5E9);
        textColor = const Color(0xFF388E3C);
        icon = Icons.circle;
        break;
      case 'inactive':
        bgColor = const Color(0xFFFFF3E0);
        textColor = const Color(0xFFFFA000);
        icon = Icons.circle;
        break;
      case 'blocked':
        bgColor = const Color(0xFFFFEBEE);
        textColor = const Color(0xFFD32F2F);
        icon = Icons.circle;
        break;
      default:
        bgColor = AppTheme.lightGrey;
        textColor = AppTheme.grey;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 8, color: textColor),
          const SizedBox(width: 5),
          Text(
            status,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}
