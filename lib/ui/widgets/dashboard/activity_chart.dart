import 'package:flutter/material.dart';
import '../../../core/theme.dart';

class ActivityChart extends StatelessWidget {
  const ActivityChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.slateLight, width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Recent 10 Selling Days Activity',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.darkSlate,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 24),

          SizedBox(
            height: 180,
            width: double.infinity,
            child: CustomPaint(
              painter: SplineChartPainter(),
            ),
          ),

          const SizedBox(height: 16),

          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _LegendItem(color: AppColors.success, label: 'Cash Collected (LKR)'),
              SizedBox(width: 16),
              _LegendItem(color: AppColors.partial, label: 'Expected Revenue (LKR)'),
            ],
          ),
        ],
      ),
    );
  }
}

class SplineChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint linePaint1 = Paint()
      ..color = AppColors.partial //
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    final Paint linePaint2 = Paint()
      ..color = AppColors.success
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    final Path path1 = Path();
    final Path path2 = Path();

    path1.moveTo(0, size.height * 0.75);
    path1.cubicTo(size.width * 0.15, size.height * 0.65, size.width * 0.20, size.height * 0.15, size.width * 0.30, size.height * 0.25);
    path1.cubicTo(size.width * 0.40, size.height * 0.35, size.width * 0.45, size.height * 0.95, size.width * 0.55, size.height * 0.25);
    path1.cubicTo(size.width * 0.65, size.height * 0.05, size.width * 0.75, size.height * 0.70, size.width * 0.85, size.height * 0.45);
    path1.lineTo(size.width, size.height * 0.70);

    path2.moveTo(0, size.height * 0.80);
    path2.cubicTo(size.width * 0.15, size.height * 0.70, size.width * 0.20, size.height * 0.25, size.width * 0.30, size.height * 0.30);
    path2.cubicTo(size.width * 0.40, size.height * 0.40, size.width * 0.45, size.height * 0.98, size.width * 0.55, size.height * 0.30);
    path2.cubicTo(size.width * 0.65, size.height * 0.12, size.width * 0.75, size.height * 0.75, size.width * 0.85, size.height * 0.50);
    path2.lineTo(size.width, size.height * 0.75);

    final Path fillPath1 = Path.from(path1)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    final Paint fillPaint1 = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [AppColors.partial.withOpacity(0.12), Colors.transparent],
      ).createShader(Rect.fromLTRB(0, 0, size.width, size.height));

    canvas.drawPath(fillPath1, fillPaint1);
    canvas.drawPath(path1, linePaint1);
    canvas.drawPath(path2, linePaint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _LegendItem extends StatelessWidget {
  final Color color;
  final String label;
  const _LegendItem({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(width: 8, height: 8, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
        const SizedBox(width: 6),
        Text(label, style: const TextStyle(color: AppColors.textSecondary, fontSize: 11, fontWeight: FontWeight.bold)),
      ],
    );
  }
}