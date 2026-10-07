import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class AdminDashboardScreen extends StatefulWidget {
  const AdminDashboardScreen({super.key});

  @override
  State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
  int _currentIndex = 0; // Dashboard tab

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

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
          'Admin Dashboard',
          style: TextStyle(
            fontSize: 18,
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
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ---- 4 STAT CARDS (2x2 Grid) ----
            Row(
              children: [
                Expanded(child: _buildStatCard('320', 'Total Donations')),
                const SizedBox(width: 14),
                Expanded(child: _buildStatCard('245', 'People Helped')),
              ],
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                Expanded(child: _buildStatCard('620 kg', 'Food Saved')),
                const SizedBox(width: 14),
                Expanded(child: _buildStatCard('85', 'Active Users')),
              ],
            ),

            const SizedBox(height: 28),

            // ---- Recent Donations Header ----
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Recent Donations',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textDark,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: const Size(0, 0),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: const Text(
                    'View all',
                    style: TextStyle(
                      fontSize: 13,
                      color: AppTheme.primaryGreen,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // ---- 3 Recent Donation Cards ----
            _buildDonationRow(
              imageUrl:
                  'https://images.unsplash.com/photo-1563379091339-03b21ab4a4f8?auto=format&fit=crop&w=300&q=80',
              restaurant: 'Sagar Restaurant',
              foodName: 'Veg Biryani',
              quantity: '5 kg',
              status: 'Pending',
            ),
            const SizedBox(height: 12),
            _buildDonationRow(
              imageUrl:
                  'https://images.unsplash.com/photo-1596797038530-2c107229654b?auto=format&fit=crop&w=300&q=80',
              restaurant: 'Hotel Green Park',
              foodName: 'Veg Pulao',
              quantity: '3 kg',
              status: 'Accepted',
            ),
            const SizedBox(height: 12),
            _buildDonationRow(
              imageUrl:
                  'https://images.unsplash.com/photo-1546833999-b9f581a1996d?auto=format&fit=crop&w=300&q=80',
              restaurant: 'Shree Restaurant',
              foodName: 'Dal Tadka',
              quantity: '5 kg',
              status: 'Pending',
            ),

            const SizedBox(height: 20),
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
          // if (index == 1) Navigator.pushReplacementNamed(context, '/admin_donations'); // TODO
          if (index == 2)
            Navigator.pushReplacementNamed(context, '/admin_users');
          if (index == 3)
            Navigator.pushReplacementNamed(context, '/admin_reports');
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
  // STAT CARD BUILDER
  // ============================
  Widget _buildStatCard(String value, String label) {
    return Container(
      height: 90,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: AppTheme.primaryGreen,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  // ============================
  // DONATION ROW CARD
  // ============================
  Widget _buildDonationRow({
    required String imageUrl,
    required String restaurant,
    required String foodName,
    required String quantity,
    required String status,
  }) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFEEEEEE)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Image
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              imageUrl,
              width: 56,
              height: 56,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: 56,
                height: 56,
                color: AppTheme.lightGrey,
                child: const Icon(
                  Icons.fastfood,
                  size: 24,
                  color: AppTheme.grey,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),

          // Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  restaurant,
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
                  foodName,
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppTheme.textLight,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),

          // Quantity + Status
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                quantity,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textDark,
                ),
              ),
              const SizedBox(height: 6),
              _buildStatusBadge(status),
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

    switch (status.toLowerCase()) {
      case 'pending':
        bgColor = const Color(0xFFFFF3E0);
        textColor = AppTheme.orange;
        break;
      case 'accepted':
        bgColor = const Color(0xFFE8F5E9);
        textColor = AppTheme.primaryGreen;
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
      child: Text(
        status,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: textColor,
        ),
      ),
    );
  }
}
