import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),

              // 1. Illustration
              SizedBox(
                height: 180,
                width: 180,
                child: CustomPaint(painter: _BoyWithBoxPainter()),
              ),
              const SizedBox(height: 20),

              // 2. Welcome Title
              const Text(
                'Welcome Back!',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.primaryGreen,
                ),
              ),
              const SizedBox(height: 8),

              // 3. Subtitle
              const Text(
                'Login to continue',
                style: TextStyle(fontSize: 15, color: AppTheme.textLight),
              ),
              const SizedBox(height: 36),

              // 4. Email Input
              TextField(
                decoration: InputDecoration(
                  hintText: 'Email or Phone',
                  hintStyle: const TextStyle(color: AppTheme.textLight),
                  prefixIcon: const Icon(
                    Icons.email, // ✅ Standard icon that always works
                    color: AppTheme.textDark,
                    size: 22,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFFBDBDBD)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFFBDBDBD)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: AppTheme.primaryGreen,
                      width: 2,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // 5. Password Input
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: const TextStyle(color: AppTheme.textLight),
                  prefixIcon: const Icon(
                    Icons.lock, // ✅ Standard icon
                    color: AppTheme.textDark,
                    size: 22,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFFBDBDBD)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFFBDBDBD)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: AppTheme.primaryGreen,
                      width: 2,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),

              // 6. Forget Password
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Forget Password?',
                    style: TextStyle(
                      color: AppTheme.primaryGreen,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),

              // 7. Login Button
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/home');
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
                child: const Text('Login'),
              ),
              const SizedBox(height: 24),

              // 8. OR
              const Text(
                'OR',
                style: TextStyle(
                  fontSize: 14,
                  color: AppTheme.textLight,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),

              // 9. Continue with Google
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  side: const BorderSide(color: Color(0xFFE0E0E0)),
                  backgroundColor: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 24,
                      height: 24,
                      child: CustomPaint(painter: _GoogleLogoPainter()),
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      'Continue with Google',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.textDark,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // 10. Sign Up Link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account? ",
                    style: TextStyle(fontSize: 14, color: AppTheme.textDark),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/register');
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppTheme.primaryGreen,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
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
// Boy with Vegetable Box Painter (same as before)
// ============================================================
class _BoyWithBoxPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double w = size.width;
    final double h = size.height;

    final Paint bgPaint = Paint()..color = const Color(0xFFE8F5E9);
    canvas.drawCircle(Offset(w * 0.5, h * 0.5), w * 0.5, bgPaint);

    final Paint hairPaint = Paint()..color = const Color(0xFF1A1A2E);
    canvas.drawCircle(Offset(w * 0.42, h * 0.30), w * 0.10, hairPaint);

    final Paint facePaint = Paint()..color = const Color(0xFFF5C6A0);
    canvas.drawCircle(Offset(w * 0.42, h * 0.35), w * 0.09, facePaint);

    final Paint smilePaint = Paint()
      ..color = const Color(0xFF1A1A2E)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(w * 0.42, h * 0.37),
        width: w * 0.06,
        height: h * 0.03,
      ),
      0,
      3.14,
      false,
      smilePaint,
    );

    final Paint shirtPaint = Paint()..color = const Color(0xFF1F3A5F);
    final Path shirt = Path()
      ..moveTo(w * 0.30, h * 0.50)
      ..lineTo(w * 0.55, h * 0.50)
      ..lineTo(w * 0.55, h * 0.75)
      ..lineTo(w * 0.30, h * 0.75)
      ..close();
    canvas.drawPath(shirt, shirtPaint);

    final Paint armPaint = Paint()..color = const Color(0xFFF5C6A0);
    final RRect arm = RRect.fromRectAndRadius(
      Rect.fromLTWH(w * 0.50, h * 0.60, w * 0.15, h * 0.05),
      const Radius.circular(10),
    );
    canvas.drawRRect(arm, armPaint);

    final Paint boxPaint = Paint()..color = const Color(0xFFC98B4B);
    final RRect box = RRect.fromRectAndRadius(
      Rect.fromLTWH(w * 0.35, h * 0.55, w * 0.40, h * 0.30),
      const Radius.circular(4),
    );
    canvas.drawRRect(box, boxPaint);

    final Paint flapPaint = Paint()..color = const Color(0xFFA8723B);
    canvas.drawRect(
      Rect.fromLTWH(w * 0.35, h * 0.55, w * 0.20, h * 0.03),
      flapPaint,
    );
    canvas.drawRect(
      Rect.fromLTWH(w * 0.55, h * 0.55, w * 0.20, h * 0.03),
      flapPaint,
    );

    final Paint carrotPaint = Paint()..color = const Color(0xFFFF7043);
    canvas.drawCircle(Offset(w * 0.42, h * 0.53), w * 0.04, carrotPaint);

    final Paint tomatoPaint = Paint()..color = const Color(0xFFE53935);
    canvas.drawCircle(Offset(w * 0.52, h * 0.51), w * 0.045, tomatoPaint);

    final Paint broccoliPaint = Paint()..color = const Color(0xFF43A047);
    canvas.drawCircle(Offset(w * 0.62, h * 0.52), w * 0.05, broccoliPaint);

    final Paint pepperPaint = Paint()..color = const Color(0xFFFDD835);
    canvas.drawCircle(Offset(w * 0.70, h * 0.53), w * 0.035, pepperPaint);

    final Paint leafPaint = Paint()..color = const Color(0xFF2E7D32);
    canvas.drawCircle(Offset(w * 0.56, h * 0.48), w * 0.03, leafPaint);
    canvas.drawCircle(Offset(w * 0.60, h * 0.46), w * 0.025, leafPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// ============================================================
// Google Logo Painter (same as before)
// ============================================================
class _GoogleLogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double w = size.width;
    final double h = size.height;
    final double radius = w / 2;
    final Offset center = Offset(w / 2, h / 2);

    final Paint bluePaint = Paint()
      ..color = const Color(0xFF4285F4)
      ..style = PaintingStyle.stroke
      ..strokeWidth = w * 0.22;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius * 0.8),
      -0.45,
      1.0,
      false,
      bluePaint,
    );

    final Paint greenPaint = Paint()
      ..color = const Color(0xFF34A853)
      ..style = PaintingStyle.stroke
      ..strokeWidth = w * 0.22;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius * 0.8),
      0.55,
      0.9,
      false,
      greenPaint,
    );

    final Paint yellowPaint = Paint()
      ..color = const Color(0xFFFBBC05)
      ..style = PaintingStyle.stroke
      ..strokeWidth = w * 0.22;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius * 0.8),
      1.45,
      1.0,
      false,
      yellowPaint,
    );

    final Paint redPaint = Paint()
      ..color = const Color(0xFFEA4335)
      ..style = PaintingStyle.stroke
      ..strokeWidth = w * 0.22;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius * 0.8),
      2.45,
      1.1,
      false,
      redPaint,
    );

    final Paint barPaint = Paint()..color = const Color(0xFF4285F4);
    canvas.drawRect(
      Rect.fromLTWH(w * 0.5, h * 0.42, w * 0.35, h * 0.16),
      barPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
