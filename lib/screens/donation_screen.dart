import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class DonationScreen extends StatefulWidget {
  const DonationScreen({super.key});

  @override
  State<DonationScreen> createState() => _DonationScreenState();
}

class _DonationScreenState extends State<DonationScreen> {
  String? _selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppTheme.textDark),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Donate Food',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppTheme.textDark,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),

            // 1. Upload Image Box (Dashed Border)
            CustomPaint(
              painter: _DashedBorderPainter(
                color: const Color(0xFFBDBDBD),
                strokeWidth: 1.5,
                gap: 5,
                radius: 16,
              ),
              child: Container(
                width: double.infinity,
                height: 160,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE8F5E9),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Icon(
                        Icons.camera_alt_outlined,
                        color: AppTheme.primaryGreen,
                        size: 28,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Upload Food Image',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.primaryGreen,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // 2. Food Name
            _buildLabel('Food Name'),
            _buildTextField(hint: 'Enter food name'),
            const SizedBox(height: 16),

            // 3. Category Dropdown
            _buildLabel('Category'),
            DropdownButtonFormField<String>(
              value: _selectedCategory,
              decoration: _inputDecoration(hint: 'Select category'),
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: AppTheme.textLight,
              ),
              items: const [
                DropdownMenuItem(value: 'Meals', child: Text('Meals')),
                DropdownMenuItem(value: 'Fruits', child: Text('Fruits')),
                DropdownMenuItem(
                  value: 'Vegetables',
                  child: Text('Vegetables'),
                ),
                DropdownMenuItem(value: 'Bakery', child: Text('Bakery')),
              ],
              onChanged: (value) {
                setState(() {
                  _selectedCategory = value;
                });
              },
            ),
            const SizedBox(height: 16),

            // 4. Quantity
            _buildLabel('Quantity'),
            _buildTextField(
              hint: 'Enter quantity',
              keyboardType: TextInputType.number,
              suffixText: 'kg',
            ),
            const SizedBox(height: 16),

            // 5. Available Until
            _buildLabel('Available Until'),
            _buildTextField(
              hint: 'Select time',
              readOnly: true,
              suffixIcon: const Icon(
                Icons.calendar_today_outlined,
                size: 20,
                color: AppTheme.textLight,
              ),
              onTap: () {
                // Will show a date/time picker later
              },
            ),
            const SizedBox(height: 16),

            // 6. Pickup Address
            _buildLabel('Pickup Address'),
            _buildTextField(
              hint: 'Enter pickup address',
              suffixIcon: const Icon(
                Icons.location_on_outlined,
                size: 22,
                color: AppTheme.textLight,
              ),
            ),
            const SizedBox(height: 30),

            // 7. Donate Now Button  →  Navigate to Success Screen
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/donation_success');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primaryGreen,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 55),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: const Text('Donate Now'),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // ---- Label builder ----
  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: AppTheme.textDark,
        ),
      ),
    );
  }

  // ---- TextField builder ----
  Widget _buildTextField({
    required String hint,
    TextInputType? keyboardType,
    String? suffixText,
    Widget? suffixIcon,
    bool readOnly = false,
    VoidCallback? onTap,
  }) {
    return TextField(
      keyboardType: keyboardType,
      readOnly: readOnly,
      onTap: onTap,
      decoration: _inputDecoration(
        hint: hint,
        suffixText: suffixText,
        suffixIcon: suffixIcon,
      ),
    );
  }

  // ---- Common InputDecoration ----
  InputDecoration _inputDecoration({
    required String hint,
    String? suffixText,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: AppTheme.textLight, fontSize: 14),
      suffixText: suffixText,
      suffixStyle: const TextStyle(
        color: AppTheme.textDark,
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
      suffixIcon: suffixIcon,
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppTheme.primaryGreen, width: 2),
      ),
    );
  }
}

// ============================================================
// CUSTOM PAINTER: DASHED BORDER
// ============================================================
class _DashedBorderPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double gap;
  final double radius;

  _DashedBorderPainter({
    required this.color,
    this.strokeWidth = 1,
    this.gap = 5,
    this.radius = 12,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final Path path = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(0, 0, size.width, size.height),
          Radius.circular(radius),
        ),
      );

    final Path dashedPath = Path();
    for (final metric in path.computeMetrics()) {
      double distance = 0.0;
      while (distance < metric.length) {
        dashedPath.addPath(
          metric.extractPath(distance, distance + gap),
          Offset.zero,
        );
        distance += gap * 2;
      }
    }
    canvas.drawPath(dashedPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
