import 'package:flutter/material.dart';
import '../models/food_item.dart';
import '../theme/app_theme.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  int _currentIndex = 0; // Default to Home tab; user arrived here from Profile

  // Full donation list (used for the "Ongoing" tab)
  final List<FoodItem> _ongoing = [
    FoodItem(
      restaurantName: 'Hotel Green Park',
      foodName: 'Veg Pulao',
      quantity: '3 kg',
      time: 'Today, 6:00 PM',
      imageUrl:
          'https://images.unsplash.com/photo-1596797038530-2c107229654b?auto=format&fit=crop&w=500&q=80',
      status: 'Accepted',
    ),
    FoodItem(
      restaurantName: 'Shree Restaurant',
      foodName: 'Dal tadka',
      quantity: '5 kg',
      time: 'Tomorrow, 1:00 PM',
      imageUrl:
          'https://images.unsplash.com/photo-1546833999-b9f581a1996d?auto=format&fit=crop&w=500&q=80',
      status: 'Pending',
    ),
  ];

  final List<FoodItem> _completed = [
    FoodItem(
      restaurantName: 'Food Cornor',
      foodName: 'Mix Veg',
      quantity: '4 kg',
      time: 'Yesterday, 8:00 PM',
      imageUrl:
          'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?auto=format&fit=crop&w=500&q=80',
      status: 'Completed',
    ),
  ];

  final List<FoodItem> _cancelled = []; // empty for now

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,

        // ============================
        // APP BAR + TABS
        // ============================
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          automaticallyImplyLeading: false, // no back arrow (arrived from Profile)
          title: const Text(
            'My Donations',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppTheme.textDark,
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: Container(
              color: Colors.white,
              child: const TabBar(
                labelColor: AppTheme.primaryGreen,
                unselectedLabelColor: AppTheme.textLight,
                indicatorColor: AppTheme.primaryGreen,
                indicatorWeight: 3,
                labelStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                unselectedLabelStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
                tabs: [
                  Tab(text: 'Ongoing'),
                  Tab(text: 'Completed'),
                  Tab(text: 'Cancelled'),
                ],
              ),
            ),
          ),
        ),

        // ============================
        // TAB CONTENT
        // ============================
        body: TabBarView(
          children: [
            _buildDonationList(_ongoing),
            _buildDonationList(_completed),
            _buildDonationList(_cancelled),
          ],
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
            if (index == 3) Navigator.pushReplacementNamed(context, '/profile');
          },
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppTheme.primaryGreen,
          unselectedItemColor: AppTheme.textLight,
          selectedLabelStyle:
              const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
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
      ),
    );
  }

  // ============================
  // DONATION LIST BUILDER
  // ============================
  Widget _buildDonationList(List<FoodItem> items) {
    if (items.isEmpty) {
      return const Center(
        child: Text(
          'No donations here yet.',
          style: TextStyle(color: AppTheme.textLight, fontSize: 14),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return _buildHistoryCard(item);
      },
    );
  }

  // ============================
  // HISTORY CARD BUILDER
  // ============================
  Widget _buildHistoryCard(FoodItem item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFEEEEEE)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ---- Food Image ----
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              item.imageUrl,
              width: 90,
              height: 90,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: 90,
                height: 90,
                color: AppTheme.lightGrey,
                child: const Icon(Icons.fastfood,
                    size: 36, color: AppTheme.grey),
              ),
            ),
          ),
          const SizedBox(width: 14),

          // ---- Details ----
          Expanded(
            child: SizedBox(
              height: 90,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Food name + status
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          item.foodName,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.textDark,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 8),
                      _buildStatusText(item.status),
                    ],
                  ),

                  // Restaurant name
                  Text(
                    item.restaurantName,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.textDark,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                  // Quantity + Time
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        item.quantity,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.textDark,
                        ),
                      ),
                      Text(
                        item.time,
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppTheme.textLight,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================
  // STATUS TEXT (colored label)
  // ============================
  Widget _buildStatusText(String status) {
    Color color;
    switch (status.toLowerCase()) {
      case 'pending':
        color = AppTheme.orange;
        break;
      case 'accepted':
        color = AppTheme.primaryGreen;
        break;
      case 'completed':
        color = AppTheme.primaryGreen;
        break;
      default:
        color = AppTheme.textLight;
    }
    return Text(
      status,
      style: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }
}