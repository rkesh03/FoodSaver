import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class AdminReportsScreen extends StatefulWidget {
  const AdminReportsScreen({super.key});

  @override
  State<AdminReportsScreen> createState() => _AdminReportsScreenState();
}

class _AdminReportsScreenState extends State<AdminReportsScreen> {
  int _currentIndex = 3; // Reports tab highlighted

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),

      // ============================
      // APP BAR
      // ============================
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F7FA),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu, color: AppTheme.textDark, size: 26),
        ),
        title: const Text(
          'Reports',
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
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ---- 4 STAT CARDS (2x2 Grid) ----
            Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    value: '320',
                    label: 'Total Donations',
                    icon: Icons.favorite_border,
                    iconBg: const Color(0xFFE8F5E9),
                    iconColor: const Color(0xFF388E3C),
                    changeText: '↑ 15% from last month',
                    changeColor: const Color(0xFF388E3C),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildStatCard(
                    value: '245',
                    label: 'People Helped',
                    icon: Icons.person_outline,
                    iconBg: const Color(0xFFFFF3E0),
                    iconColor: const Color(0xFFFFA000),
                    changeText: '↓ 90.5% from last month',
                    changeColor: const Color(0xFFD32F2F),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    value: '620 kg',
                    label: 'Food Saved (kg)',
                    icon: Icons.local_dining_outlined,
                    iconBg: const Color(0xFFE3F2FD),
                    iconColor: const Color(0xFF1976D2),
                    changeText: '↑ 15.7% from last month',
                    changeColor: const Color(0xFF388E3C),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildStatCard(
                    value: '85',
                    label: 'Active Users',
                    icon: Icons.person_add_alt,
                    iconBg: const Color(0xFFE8F5E9),
                    iconColor: const Color(0xFF388E3C),
                    changeText: '↑ 8.2% from last month',
                    changeColor: const Color(0xFF388E3C),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // ============================
            // DONATION OVERVIEW CHART
            // ============================
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFEEEEEE)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header: title + "Last 6 Months" dropdown
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Donation Overview',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.textDark,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5F5F5),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Row(
                          children: [
                            Text(
                              'Last 6 Months',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: AppTheme.textDark,
                              ),
                            ),
                            SizedBox(width: 4),
                            Icon(
                              Icons.keyboard_arrow_down,
                              size: 16,
                              color: AppTheme.textDark,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Chart (drawn with CustomPaint)
                  SizedBox(
                    height: 160,
                    width: double.infinity,
                    child: CustomPaint(
                      painter: _DonationChartPainter(),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // ============================
            // RECENT REPORTS
            // ============================
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFEEEEEE)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Recent Reports',
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
                  const SizedBox(height: 12),

                  // Report rows
                  _buildReportRow(
                    icon: Icons.description_outlined,
                    iconBg: const Color(0xFFE8F5E9),
                    iconColor: const Color(0xFF388E3C),
                    title: 'Monthly Donation Report',
                    date: 'June 2024',
                  ),
                  const SizedBox(height: 12),
                  _buildReportRow(
                    icon: Icons.assignment_outlined,
                    iconBg: const Color(0xFFE3F2FD),
                    iconColor: const Color(0xFF1976D2),
                    title: 'User Activity Report',
                    date: 'June 2024',
                  ),
                  const SizedBox(height: 12),
                  _buildReportRow(
                    icon: Icons.restaurant_menu,
                    iconBg: const Color(0xFFFFF3E0),
                    iconColor: const Color(0xFFFFA000),
                    title: 'Food Distribution Report',
                    date: 'June 2024',
                  ),
                ],
              ),
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
          if (index == 0) {
            Navigator.pushReplacementNamed(context, '/admin');
          } else if (index == 2) {
            Navigator.pushReplacementNamed(context, '/admin_users');
          }
          // if (index == 1) Navigator.pushReplacementNamed(context, '/admin_donations'); // TODO
          // Already on Reports if index == 3
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
  Widget _buildStatCard({
    required String value,
    required String label,
    required IconData icon,
    required Color iconBg,
    required Color iconColor,
    required String changeText,
    required Color changeColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFEEEEEE)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Label + icon in a row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  label,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppTheme.textLight,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: iconBg,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, size: 18, color: iconColor),
              ),
            ],
          ),
          const SizedBox(height: 10),

          // Value
          Text(
            value,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppTheme.textDark,
            ),
          ),
          const SizedBox(height: 6),

          // Change text
          Text(
            changeText,
            style: TextStyle(
              fontSize: 11,
              color: changeColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  // ============================
  // REPORT ROW BUILDER
  // ============================
  Widget _buildReportRow({
    required IconData icon,
    required Color iconBg,
    required Color iconColor,
    required String title,
    required String date,
  }) {
    return Row(
      children: [
        // Icon badge
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: iconBg,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, size: 20, color: iconColor),
        ),
        const SizedBox(width: 12),

        // Title + date
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textDark,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 2),
              Text(
                date,
                style: const TextStyle(
                  fontSize: 12,
                  color: AppTheme.textLight,
                ),
              ),
            ],
          ),
        ),

        // Download button
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: const Color(0xFFE8F5E9),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Row(
            children: [
              Icon(
                Icons.download,
                size: 14,
                color: Color(0xFF388E3C),
              ),
              SizedBox(width: 4),
              Text(
                'Download',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF388E3C),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ============================================================
// CUSTOM PAINTER: DONATION OVERVIEW CHART
// ============================================================
class _DonationChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double w = size.width;
    final double h = size.height;

    // Chart area (leave room for y-axis labels)
    const double leftPad = 30;
    const double bottomPad = 25;
    final double chartW = w - leftPad;
    final double chartH = h - bottomPad;

    // ---- Y-axis labels ----
    final List<String> yLabels = ['320', '240', '160', '80', '0'];
    final TextPainter yTextPainter = TextPainter(
      textAlign: TextAlign.right,
      textDirection: TextDirection.ltr,
    );

    for (int i = 0; i < yLabels.length; i++) {
      yTextPainter.text = TextSpan(
        text: yLabels[i],
        style: const TextStyle(
          color: Color(0xFF9E9E9E),
          fontSize: 10,
        ),
      );
      yTextPainter.layout();
      final double y = (chartH / (yLabels.length - 1)) * i;
      yTextPainter.paint(canvas, Offset(0, y - 6));
    }

    // ---- Horizontal dashed grid lines ----
    final Paint gridPaint = Paint()
      ..color = const Color(0xFFEEEEEE)
      ..strokeWidth = 1;

    for (int i = 0; i < yLabels.length; i++) {
      final double y = (chartH / (yLabels.length - 1)) * i;
      // Dashed line
      double dashX = leftPad;
      while (dashX < w) {
        canvas.drawLine(
          Offset(dashX, y),
          Offset(dashX + 4, y),
          gridPaint,
        );
        dashX += 8;
      }
    }

    // ---- Data points (6 months) ----
    final List<double> data = [170, 200, 235, 280, 265, 300];
    final double stepX = chartW / (data.length - 1);

    // Compute coordinates
    final List<Offset> points = [];
    for (int i = 0; i < data.length; i++) {
      final double x = leftPad + stepX * i;
      // Map value to y (320 is top, 0 is bottom)
      final double y = chartH - (data[i] / 320) * chartH;
      points.add(Offset(x, y));
    }

    // ---- Area fill under the line ----
    final Path areaPath = Path()..moveTo(points.first.dx, chartH);
    for (final p in points) {
      areaPath.lineTo(p.dx, p.dy);
    }
    areaPath.lineTo(points.last.dx, chartH);
    areaPath.close();

    final Paint areaPaint = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0x55388E3C), Color(0x00388E3C)],
      ).createShader(Rect.fromLTWH(0, 0, w, chartH));

    canvas.drawPath(areaPath, areaPaint);

    // ---- Line ----
    final Paint linePaint = Paint()
      ..color = const Color(0xFF388E3C)
      ..strokeWidth = 2.5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final Path linePath = Path()..moveTo(points.first.dx, points.first.dy);
    for (int i = 1; i < points.length; i++) {
      linePath.lineTo(points[i].dx, points[i].dy);
    }
    canvas.drawPath(linePath, linePaint);

    // ---- Dots on the line ----
    final Paint dotFill = Paint()..color = const Color(0xFF388E3C);
    final Paint dotRing = Paint()
      ..color = Colors.white
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    for (final p in points) {
      canvas.drawCircle(p, 5, dotFill);
      canvas.drawCircle(p, 5, dotRing);
    }

    // ---- X-axis labels ----
    final List<String> xLabels = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'];
    final TextPainter xTextPainter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    for (int i = 0; i < xLabels.length; i++) {
      xTextPainter.text = TextSpan(
        text: xLabels[i],
        style: const TextStyle(
          color: Color(0xFF9E9E9E),
          fontSize: 11,
        ),
      );
      xTextPainter.layout();
      final double x = leftPad + stepX * i;
      xTextPainter.paint(
        canvas,
        Offset(x - xTextPainter.width / 2, chartH + 8),
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}