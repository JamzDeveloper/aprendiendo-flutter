import 'package:flutter/material.dart';

class SquareHeader extends StatelessWidget {
  const SquareHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Color(0xff0A62BF),
    );
  }
}

class RoundedEdgeHeader extends StatelessWidget {
  const RoundedEdgeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
          color: Color(0xff0A62BF),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(70),
              bottomRight: Radius.circular(70))),
    );
  }
}

class DiagonalHeader extends StatelessWidget {
  const DiagonalHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderDiagonalPainter(),
      ),
    );
  }
}

class _HeaderDiagonalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    //properties
    paint.color = Color(0xff0A62BF);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20;

    final path = Path();

    //draw with path and pencil
    path.moveTo(0, size.height * 0.35);
    path.lineTo(size.width, size.height * 0.30);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
    throw UnimplementedError();
  }
}

class TriangleHeader extends StatelessWidget {
  const TriangleHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderTrianglePainter(),
      ),
    );
  }
}

class _HeaderTrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    //properties
    paint.color = Color(0xff0A62BF);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20;

    final path = Path();

    //draw with path and pencil
    //,. path.moveTo(0, size.height * 0.35);

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
    throw UnimplementedError();
  }
}

class PicoHeader extends StatelessWidget {
  const PicoHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderPicoPainter(),
      ),
    );
  }
}

class _HeaderPicoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    //properties
    paint.color = Color(0xff0A62BF);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20;

    final path = Path();

    //draw with path and pencil
    //,. path.moveTo(0, size.height * 0.35);
    path.lineTo(0, size.height * 0.30);
    path.lineTo(size.width * 0.5, size.height * 0.40);
    path.lineTo(size.width, size.height * 0.30);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
    throw UnimplementedError();
  }
}

class CurvedHeader extends StatelessWidget {
  const CurvedHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderCurvedPainter(),
      ),
    );
  }
}

class _HeaderCurvedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    //properties
    paint.color = Color(0xff0A62BF);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20;

    final path = Path();

    //draw with path and pencil

    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(
        size.width * 0.5, size.height * 0.4, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
    throw UnimplementedError();
  }
}

class WaveHeader extends StatelessWidget {
  const WaveHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderWavePainter(),
      ),
    );
  }
}

class _HeaderWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    //properties
    paint.color = Color(0xff0A62BF);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 10;

    final path = Path();

    //draw with path and pencil

    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.20, size.height * 0.30,
        size.width * 0.5, size.height * 0.25);

    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.2, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
    throw UnimplementedError();
  }
}

class WaveGradientHeader extends StatelessWidget {
  const WaveGradientHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderWaveGradientPainter(),
      ),
    );
  }
}

class _HeaderWaveGradientPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final reac = Rect.fromCircle(center: Offset(0, 55.0), radius: 180);

    const gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xff393083),
        Color(0xff0A62BF),
        Color(0xff537aca),
      ],
      stops: [0.3, 0.5, 1.0],
    );

    final paint = Paint()..shader = gradient.createShader(reac);

    //properties

    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 10;

    final path = Path();

    //draw with path and pencil

    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.20, size.height * 0.30,
        size.width * 0.5, size.height * 0.25);

    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.2, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
    throw UnimplementedError();
  }
}
