import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class DonationSuccessScreen extends StatelessWidget {
  const DonationSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            children: [
              const Spacer(),

              // 1. Checkmark Illustration (with confetti dots)
              SizedBox(
                height: 160,
                width: 160,
                child: CustomPaint(painter: _CheckmarkPainter()),
              ),
              const SizedBox(height: 24),

              // 2. Title
              const Text(
                'Donate Successful',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.primaryGreen,
                  fontFamily: 'Serif',
                ),
              ),
              const SizedBox(height: 16),

              // 3. Message
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'You have successfully donate the food.The receivers will contact you soon.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.textDark,
                  ),
                ),
              ),

              const Spacer(),

              // 4. Vegetable Basket with Heart
              SizedBox(
                height: 160,
                width: 200,
                child: CustomPaint(painter: _BasketPainter()),
              ),

              const Spacer(),

              // 5. Go To Home Button
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/home',
                    (route) => false,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryGreen,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: const Text('Go To Home'),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================
// CUSTOM PAINTER 1: CHECKMARK WITH CONFETTI
// ============================================================
class _CheckmarkPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double w = size.width;
    final double h = size.height;

    // Confetti dots (colored small circles scattered around)
    final List<Map<String, dynamic>> dots = [
      {'x': 0.15, 'y': 0.30, 'color': const Color(0xFFFDD835), 'size': 4.0},
      {'x': 0.82, 'y': 0.20, 'color': const Color(0xFF43A047), 'size': 5.0},
      {'x': 0.10, 'y': 0.70, 'color': const Color(0xFFFF7043), 'size': 4.0},
      {'x': 0.90, 'y': 0.65, 'color': const Color(0xFF43A047), 'size': 4.0},
      {'x': 0.25, 'y': 0.85, 'color': const Color(0xFFFF9800), 'size': 3.0},
      {'x': 0.70, 'y': 0.80, 'color': const Color(0xFFFDD835), 'size': 4.0},
      {'x': 0.50, 'y': 0.10, 'color': const Color(0xFF43A047), 'size': 3.5},
      {'x': 0.75, 'y': 0.45, 'color': const Color(0xFFFF7043), 'size': 4.5},
    ];

    for (final d in dots) {
      final Paint p = Paint()..color = d['color'];
      canvas.drawCircle(Offset(w * d['x'], h * d['y']), d['size'], p);
    }

    // Green circle
    final Paint circlePaint = Paint()..color = AppTheme.primaryGreen;
    canvas.drawCircle(Offset(w * 0.5, h * 0.5), w * 0.30, circlePaint);

    // White checkmark
    final Paint checkPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final Path checkPath = Path()
      ..moveTo(w * 0.38, h * 0.50)
      ..lineTo(w * 0.47, h * 0.60)
      ..lineTo(w * 0.65, h * 0.40);

    canvas.drawPath(checkPath, checkPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// ============================================================
// CUSTOM PAINTER 2: VEGETABLE BASKET WITH HEART
// ============================================================
class _BasketPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double w = size.width;
    final double h = size.height;

    // 1. Vegetables sticking out on top (behind the basket)

    // Broccoli (green, left)
    final Paint broccoliPaint = Paint()..color = const Color(0xFF43A047);
    canvas.drawCircle(Offset(w * 0.18, h * 0.38), w * 0.07, broccoliPaint);
    canvas.drawCircle(Offset(w * 0.14, h * 0.42), w * 0.05, broccoliPaint);
    canvas.drawCircle(Offset(w * 0.22, h * 0.42), w * 0.05, broccoliPaint);

    // Carrot (orange, top-left)
    final Paint carrotPaint = Paint()..color = const Color(0xFFFF7043);
    final Path carrot = Path()
      ..moveTo(w * 0.28, h * 0.35)
      ..lineTo(w * 0.32, h * 0.50)
      ..lineTo(w * 0.30, h * 0.50)
      ..close();
    canvas.drawPath(carrot, carrotPaint);

    // Tomato (red, center-left)
    final Paint tomatoPaint = Paint()..color = const Color(0xFFE53935);
    canvas.drawCircle(Offset(w * 0.40, h * 0.38), w * 0.08, tomatoPaint);

    // Green leaves (top, small)
    final Paint leafPaint = Paint()..color = const Color(0xFF2E7D32);
    canvas.drawCircle(Offset(w * 0.50, h * 0.32), w * 0.05, leafPaint);
    canvas.drawCircle(Offset(w * 0.55, h * 0.36), w * 0.04, leafPaint);

    // Yellow pepper (right)
    final Paint pepperPaint = Paint()..color = const Color(0xFFFDD835);
    canvas.drawCircle(Offset(w * 0.63, h * 0.38), w * 0.07, pepperPaint);

    // Red tomato (right)
    final Paint tomatoPaint2 = Paint()..color = const Color(0xFFE53935);
    canvas.drawCircle(Offset(w * 0.75, h * 0.40), w * 0.08, tomatoPaint2);

    // Green round leaf (top right)
    final Paint greenLeaf = Paint()..color = const Color(0xFF66BB6A);
    canvas.drawCircle(Offset(w * 0.83, h * 0.36), w * 0.05, greenLeaf);

    // 2. Basket Body (green box)
    final Paint basketPaint = Paint()..color = AppTheme.primaryGreen;
    final Path basket = Path()
      ..moveTo(w * 0.08, h * 0.50)
      ..lineTo(w * 0.92, h * 0.50)
      ..lineTo(w * 0.85, h * 0.92)
      ..lineTo(w * 0.15, h * 0.92)
      ..close();
    canvas.drawPath(basket, basketPaint);

    // Basket darker top edge
    final Paint topEdge = Paint()..color = const Color(0xFF2E7D32);
    canvas.drawRect(
      Rect.fromLTWH(w * 0.08, h * 0.50, w * 0.84, h * 0.03),
      topEdge,
    );

    // 3. White Heart on the basket
    final Paint heartPaint = Paint()..color = Colors.white;
    final Path heart = Path();
    final double hx = w * 0.50;
    final double hy = h * 0.72;
    final double hs = w * 0.07;

    heart.moveTo(hx, hy + hs);
    heart.cubicTo(hx - hs * 2, hy, hx - hs * 2, hy - hs, hx, hy - hs * 0.3);
    heart.cubicTo(hx + hs * 2, hy - hs, hx + hs * 2, hy, hx, hy + hs);
    heart.close();
    canvas.drawPath(heart, heartPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
