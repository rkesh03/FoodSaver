import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

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
              const SizedBox(height: 10),

              // 1. Illustration: Boy with Vegetable Box (Same as Login)
              SizedBox(
                height: 150,
                width: 150,
                child: CustomPaint(
                  painter: _BoyWithBoxPainter(),
                ),
              ),
              const SizedBox(height: 16),

              // 2. Title
              const Text(
                'Create Account',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.primaryGreen,
                ),
              ),
              const SizedBox(height: 8),

              // 3. Subtitle
              const Text(
                'Join FoodSaver and help reduce food waste.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.textDark,
                ),
              ),
              const SizedBox(height: 30),

              // 4. Full Name Input
              _buildInputField(
                hint: 'Enter your full name',
                icon: Icons.person_outline,
              ),
              const SizedBox(height: 16),

              // 5. Email Input (Using a custom Email+Lock icon style)
              _buildInputField(
                hint: 'Enter your email',
                icon: Icons.mark_email_unread_outlined,
              ),
              const SizedBox(height: 16),

              // 6. Phone Number Input
              _buildInputField(
                hint: 'Enter your phone number',
                icon: Icons.phone_outlined,
              ),
              const SizedBox(height: 16),

              // 7. Create Password Input
              _buildInputField(
                hint: 'Create password',
                icon: Icons.lock_outline,
                isPassword: true,
                obscureText: _obscurePassword,
                onToggleVisibility: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              ),
              const SizedBox(height: 16),

              // 8. Confirm Password Input
              _buildInputField(
                hint: 'Confirm password',
                icon: Icons.lock_outline,
                isPassword: true,
                obscureText: _obscureConfirmPassword,
                onToggleVisibility: () {
                  setState(() {
                    _obscureConfirmPassword = !_obscureConfirmPassword;
                  });
                },
              ),
              const SizedBox(height: 30),

              // 9. Create Account Button
              ElevatedButton(
                onPressed: () {
                  // Navigate to login or home later
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryGreen,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: const Text('Create Account'),
              ),
              const SizedBox(height: 16),

              // 10. OR
              const Text(
                'OR',
                style: TextStyle(
                  fontSize: 14,
                  color: AppTheme.textLight,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 16),

              // 11. Continue with Google
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
              const SizedBox(height: 24),

              // 12. Already have an account? Login
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account? ",
                    style: TextStyle(fontSize: 14, color: AppTheme.textDark),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context); // Go back to Login
                    },
                    child: const Text(
                      'Login',
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

  // Helper method to build the input fields to keep code clean
  Widget _buildInputField({
    required String hint,
    required IconData icon,
    bool isPassword = false,
    bool obscureText = false,
    VoidCallback? onToggleVisibility,
  }) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: AppTheme.textLight),
        prefixIcon: Icon(
          icon,
          color: AppTheme.textDark,
          size: 22,
        ),
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  obscureText ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                  color: AppTheme.textLight,
                  size: 22,
                ),
                onPressed: onToggleVisibility,
              )
            : null,
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
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
          borderSide: const BorderSide(
            color: AppTheme.primaryGreen,
            width: 2,
          ),
        ),
      ),
    );
  }
}

// ============================================================
// CUSTOM PAINTER 1: BOY WITH VEGETABLE BOX
// ============================================================
class _BoyWithBoxPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double w = size.width;
    final double h = size.height;

    // 1. Light green circular background
    final Paint bgPaint = Paint()..color = const Color(0xFFE8F5E9);
    canvas.drawCircle(Offset(w * 0.5, h * 0.5), w * 0.5, bgPaint);

    // 2. Boy's hair (dark)
    final Paint hairPaint = Paint()..color = const Color(0xFF1A1A2E);
    canvas.drawCircle(Offset(w * 0.42, h * 0.30), w * 0.10, hairPaint);

    // 3. Boy's face (skin tone)
    final Paint facePaint = Paint()..color = const Color(0xFFF5C6A0);
    canvas.drawCircle(Offset(w * 0.42, h * 0.35), w * 0.09, facePaint);

    // 4. Boy's smile
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

    // 5. Boy's shirt (dark blue)
    final Paint shirtPaint = Paint()..color = const Color(0xFF1F3A5F);
    final Path shirt = Path()
      ..moveTo(w * 0.30, h * 0.50)
      ..lineTo(w * 0.55, h * 0.50)
      ..lineTo(w * 0.55, h * 0.75)
      ..lineTo(w * 0.30, h * 0.75)
      ..close();
    canvas.drawPath(shirt, shirtPaint);

    // 6. Boy's arm
    final Paint armPaint = Paint()..color = const Color(0xFFF5C6A0);
    final RRect arm = RRect.fromRectAndRadius(
      Rect.fromLTWH(w * 0.50, h * 0.60, w * 0.15, h * 0.05),
      const Radius.circular(10),
    );
    canvas.drawRRect(arm, armPaint);

    // 7. Cardboard Box
    final Paint boxPaint = Paint()..color = const Color(0xFFC98B4B);
    final RRect box = RRect.fromRectAndRadius(
      Rect.fromLTWH(w * 0.35, h * 0.55, w * 0.40, h * 0.30),
      const Radius.circular(4),
    );
    canvas.drawRRect(box, boxPaint);

    // Box top flaps
    final Paint flapPaint = Paint()..color = const Color(0xFFA8723B);
    canvas.drawRect(
      Rect.fromLTWH(w * 0.35, h * 0.55, w * 0.20, h * 0.03),
      flapPaint,
    );
    canvas.drawRect(
      Rect.fromLTWH(w * 0.55, h * 0.55, w * 0.20, h * 0.03),
      flapPaint,
    );

    // 8. Vegetables
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
// CUSTOM PAINTER 2: GOOGLE "G" LOGO
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
      -0.45, 1.0, false, bluePaint,
    );

    final Paint greenPaint = Paint()
      ..color = const Color(0xFF34A853)
      ..style = PaintingStyle.stroke
      ..strokeWidth = w * 0.22;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius * 0.8),
      0.55, 0.9, false, greenPaint,
    );

    final Paint yellowPaint = Paint()
      ..color = const Color(0xFFFBBC05)
      ..style = PaintingStyle.stroke
      ..strokeWidth = w * 0.22;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius * 0.8),
      1.45, 1.0, false, yellowPaint,
    );

    final Paint redPaint = Paint()
      ..color = const Color(0xFFEA4335)
      ..style = PaintingStyle.stroke
      ..strokeWidth = w * 0.22;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius * 0.8),
      2.45, 1.1, false, redPaint,
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