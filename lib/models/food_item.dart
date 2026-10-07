class FoodItem {
  final String restaurantName;
  final String foodName;
  final String quantity;
  final String time;
  final String imageUrl;
  final String status;
  final double distance;
  final String address;

  FoodItem({
    required this.restaurantName,
    required this.foodName,
    required this.quantity,
    required this.time,
    required this.imageUrl,
    required this.status,
    this.distance = 0.0,
    this.address = '',
  });
}

List<FoodItem> dummyDonations = [
  FoodItem(
    restaurantName: 'Sagar Restaurant',
    foodName: 'Veg Biryani',
    quantity: '5 kg left',
    time: 'Today 7:00 PM',
    imageUrl:
        'https://images.unsplash.com/photo-1563379091339-03b21ab4a4f8?auto=format&fit=crop&w=500&q=80',
    status: 'Pending',
    distance: 2.4,
    address: 'Sagar Restaurant, Main Street',
  ),
  FoodItem(
    restaurantName: 'Hotel Green Park',
    foodName: 'Veg Pulao',
    quantity: '3 kg left',
    time: 'Today 6:00 PM',
    imageUrl:
        'https://images.unsplash.com/photo-1596797038530-2c107229654b?auto=format&fit=crop&w=500&q=80',
    status: 'Accepted',
    distance: 1.8,
    address: 'Hotel Green Park, MG Road',
  ),
  FoodItem(
    restaurantName: 'Shree Restaurant',
    foodName: 'Dal Tadka',
    quantity: '5 kg left',
    time: 'Tomorrow 1:00 PM',
    imageUrl:
        'https://images.unsplash.com/photo-1546833999-b9f581a1996d?auto=format&fit=crop&w=500&q=80',
    status: 'Pending',
    distance: 3.2,
    address: 'Shree Restaurant, Station Road',
  ),
];
