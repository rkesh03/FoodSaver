import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),

              // 1. Custom Drawn Logo: Green Heart with Fork & Spoon
              SizedBox(
                width: 140,
                height: 140,
                child: CustomPaint(painter: _HeartForkSpoonPainter()),
              ),
              const SizedBox(height: 20),

              // 2. App Title
              const Text(
                'FoodSaver',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.primaryGreen,
                  fontFamily: 'Serif',
                ),
              ),
              const SizedBox(height: 4),

              // 3. Tagline
              const Text(
                'Reduce Waste,Feed Lives.',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textDark,
                  fontFamily: 'Serif',
                ),
              ),

              const Spacer(),

              // 4. Custom Drawn Vegetable Basket Illustration
              Container(
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomPaint(painter: _BasketPainter()),
                ),
              ),

              const Spacer(),

              // 5. Get Started Button
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/role');
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
                child: const Text('Get Started'),
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
// CUSTOM PAINTER 1: HEART + FORK + SPOON LOGO
// ============================================================
class _HeartForkSpoonPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double w = size.width;
    final double h = size.height;

    // ---- 1. Green Heart ----
    final Paint heartPaint = Paint()
      ..color =
          const Color(0xFF2E9E3A) // Slightly brighter green (matches image)
      ..style = PaintingStyle.fill;

    final Path heartPath = Path();
    heartPath.moveTo(w * 0.5, h * 0.92);
    heartPath.cubicTo(
      w * -0.05,
      h * 0.55,
      w * 0.05,
      h * 0.05,
      w * 0.5,
      h * 0.30,
    );
    heartPath.cubicTo(
      w * 0.95,
      h * 0.05,
      w * 1.05,
      h * 0.55,
      w * 0.5,
      h * 0.92,
    );
    heartPath.close();
    canvas.drawPath(heartPath, heartPaint);

    // ---- 2. Fork (left) ----
    final Paint whitePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    // Fork handle
    final Path forkHandle = Path()
      ..moveTo(w * 0.38, h * 0.60)
      ..lineTo(w * 0.33, h * 0.90)
      ..lineTo(w * 0.44, h * 0.90)
      ..lineTo(w * 0.42, h * 0.60)
      ..close();
    canvas.drawPath(forkHandle, whitePaint);

    // Fork head (curved rectangular base for tines)
    final Rect forkBase = Rect.fromLTWH(w * 0.31, h * 0.42, w * 0.13, h * 0.13);
    canvas.drawRRect(
      RRect.fromRectAndRadius(forkBase, const Radius.circular(6)),
      whitePaint,
    );

    // 4 tines
    for (int i = 0; i < 4; i++) {
      final double xPos = w * 0.32 + (i * w * 0.032);
      final Rect tineRect = Rect.fromLTWH(xPos, h * 0.32, w * 0.020, h * 0.14);
      canvas.drawRRect(
        RRect.fromRectAndRadius(tineRect, const Radius.circular(2)),
        whitePaint,
      );
    }

    // ---- 3. Spoon (right) ----
    // Spoon bowl (oval)
    final Rect spoonBowl = Rect.fromCenter(
      center: Offset(w * 0.63, h * 0.42),
      width: w * 0.15,
      height: h * 0.20,
    );
    canvas.drawOval(spoonBowl, whitePaint);

    // Spoon handle
    final Path spoonHandle = Path()
      ..moveTo(w * 0.60, h * 0.52)
      ..lineTo(w * 0.56, h * 0.90)
      ..lineTo(w * 0.68, h * 0.90)
      ..lineTo(w * 0.66, h * 0.52)
      ..close();
    canvas.drawPath(spoonHandle, whitePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// ============================================================
// CUSTOM PAINTER 2: VEGETABLE BASKET ILLUSTRATION
// ============================================================
class _BasketPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double w = size.width;
    final double h = size.height;

    // ============ VEGETABLES BEHIND THE BASKET ============

    // Baguette bread (far right, tilted)
    final Paint breadPaint = Paint()..color = const Color(0xFFC98B4B);
    final Path breadPath = Path()
      ..moveTo(w * 0.82, h * 0.20)
      ..lineTo(w * 0.95, h * 0.55)
      ..lineTo(w * 0.88, h * 0.57)
      ..lineTo(w * 0.76, h * 0.22)
      ..close();
    canvas.drawPath(breadPath, breadPaint);
    // Bread scoring lines
    final Paint breadLinePaint = Paint()
      ..color = const Color(0xFF8D6E63)
      ..strokeWidth = 1.5
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(
      Offset(w * 0.81, h * 0.28),
      Offset(w * 0.85, h * 0.32),
      breadLinePaint,
    );
    canvas.drawLine(
      Offset(w * 0.84, h * 0.38),
      Offset(w * 0.88, h * 0.42),
      breadLinePaint,
    );

    // Broccoli / leafy greens (behind center)
    final Paint broccoliPaint = Paint()..color = const Color(0xFF43A047);
    canvas.drawCircle(Offset(w * 0.68, h * 0.30), w * 0.07, broccoliPaint);
    canvas.drawCircle(Offset(w * 0.60, h * 0.32), w * 0.055, broccoliPaint);

    // Green sprigs (top right)
    final Paint leafPaint = Paint()..color = const Color(0xFF2E7D32);
    canvas.drawCircle(Offset(w * 0.78, h * 0.28), w * 0.03, leafPaint);
    canvas.drawCircle(Offset(w * 0.73, h * 0.25), w * 0.025, leafPaint);

    // ============ VEGETABLES IN THE BASKET ============

    // Eggplant (purple, center)
    final Paint eggplantPaint = Paint()..color = const Color(0xFF5E35B1);
    final Rect eggplantRect = Rect.fromCenter(
      center: Offset(w * 0.47, h * 0.42),
      width: w * 0.15,
      height: h * 0.20,
    );
    canvas.drawOval(eggplantRect, eggplantPaint);

    // Eggplant stem
    final Paint stemPaint = Paint()..color = const Color(0xFF2E7D32);
    canvas.drawRect(
      Rect.fromLTWH(w * 0.46, h * 0.28, w * 0.02, h * 0.06),
      stemPaint,
    );

    // Red tomato (left)
    final Paint tomatoPaint = Paint()..color = const Color(0xFFE53935);
    canvas.drawCircle(Offset(w * 0.32, h * 0.48), w * 0.07, tomatoPaint);

    // Yellow pepper (center-left, below eggplant)
    final Paint yellowPaint = Paint()..color = const Color(0xFFFDD835);
    final Rect yellowRect = Rect.fromCenter(
      center: Offset(w * 0.42, h * 0.55),
      width: w * 0.11,
      height: h * 0.11,
    );
    canvas.drawOval(yellowRect, yellowPaint);
    // Pepper stem
    canvas.drawRect(
      Rect.fromLTWH(w * 0.41, h * 0.47, w * 0.015, h * 0.03),
      stemPaint,
    );

    // Carrot (orange, peeking left)
    final Paint carrotPaint = Paint()..color = const Color(0xFFFF7043);
    final Path carrotPath = Path()
      ..moveTo(w * 0.18, h * 0.38)
      ..lineTo(w * 0.24, h * 0.52)
      ..lineTo(w * 0.20, h * 0.55)
      ..close();
    canvas.drawPath(carrotPath, carrotPaint);

    // Orange pepper (right of eggplant)
    final Paint orangePepperPaint = Paint()..color = const Color(0xFFFB8C00);
    final Rect orangeRect = Rect.fromCenter(
      center: Offset(w * 0.62, h * 0.53),
      width: w * 0.11,
      height: h * 0.11,
    );
    canvas.drawOval(orangeRect, orangePepperPaint);

    // Green leaves between peppers
    canvas.drawCircle(Offset(w * 0.55, h * 0.42), w * 0.03, leafPaint);

    // Small red cherry tomato (right)
    final Paint cherryPaint = Paint()..color = const Color(0xFFD32F2F);
    canvas.drawCircle(Offset(w * 0.72, h * 0.55), w * 0.04, cherryPaint);

    // ============ BASKET (brown paper bag) ============

    final Paint basketPaint = Paint()..color = const Color(0xFFD7A86E);
    final Path basket = Path()
      ..moveTo(w * 0.10, h * 0.60)
      ..lineTo(w * 0.90, h * 0.60)
      ..lineTo(w * 0.82, h * 0.98)
      ..lineTo(w * 0.18, h * 0.98)
      ..close();
    canvas.drawPath(basket, basketPaint);

    // Basket top edge (darker)
    final Paint topEdge = Paint()..color = const Color(0xFFB58B53);
    canvas.drawRect(
      Rect.fromLTWH(w * 0.10, h * 0.58, w * 0.80, h * 0.04),
      topEdge,
    );

    // Basket fold line (dark, curved, right side)
    final Paint foldPaint = Paint()
      ..color = const Color(0xFFA87B42)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    final Path foldPath = Path()
      ..moveTo(w * 0.15, h * 0.98)
      ..quadraticBezierTo(w * 0.55, h * 0.85, w * 0.85, h * 0.98);
    canvas.drawPath(foldPath, foldPaint);

    // White heart on the basket
    final Paint heartPaint = Paint()..color = Colors.white;
    final Path heart = Path();
    final double hx = w * 0.50;
    final double hy = h * 0.78;
    final double hs = w * 0.055;

    heart.moveTo(hx, hy + hs);
    heart.cubicTo(hx - hs * 2, hy, hx - hs * 2, hy - hs, hx, hy - hs * 0.3);
    heart.cubicTo(hx + hs * 2, hy - hs, hx + hs * 2, hy, hx, hy + hs);
    heart.close();
    canvas.drawPath(heart, heartPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
