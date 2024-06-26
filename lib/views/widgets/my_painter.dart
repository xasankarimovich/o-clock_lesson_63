import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // var paint = Paint()
    //   ..color = Colors.blue
    //   ..style = PaintingStyle.fill
    //   ..strokeWidth = 5;

    // canvas.drawCircle(Offset(size.width / 2, size.height / 2), 100, paint);

    // // Paint sunPaint = Paint()
    // //   ..color = Colors.yellow
    // //   ..style = PaintingStyle.fill;

    // // double sunRadius = 50;
    // // Offset sunCenter = Offset(size.width - sunRadius - 20, sunRadius + 20);

    // // canvas.drawCircle(sunCenter, sunRadius, sunPaint);

    // var rect = const Rect.fromLTWH(50, 200, 200, 100);
    // canvas.drawOval(rect, paint);

    // var painRect = Paint()
    //   ..color = Colors.teal
    //   ..style = PaintingStyle.fill;

    // var rect2 = Rect.fromLTWH(50, 50, 200, 100);
    // canvas.drawRect(rect2, painRect);

    // var arcRect = Rect.fromLTWH(50, 50, 200, 100);
    // canvas.drawArc(arcRect, 0.0, 10, true, paint);

    // var star = Paint()
    //   ..color = Colors.purple
    //   ..strokeWidth = 5
    //   ..style = PaintingStyle.fill;

    // var path = Path()
    //   ..moveTo(size.width / 2, size.height / 2 - 50)
    //   ..lineTo(size.width / 2 + 40, size.height / 2 + 50)
    //   ..lineTo(size.width / 2 - 50, size.height / 2 - 15)
    //   ..lineTo(size.width / 2 + 50, size.height / 2 - 15)
    //   ..lineTo(size.width / 2 - 40, size.height / 2 + 50)
    //   ..close();

    // canvas.drawPath(path, star);

    // var textPain = TextPainter(
    //   text: const TextSpan(
    //     text: "Hello Future!",
    //     style: TextStyle(
    //       color: Colors.black,
    //       fontSize: 24,
    //     ),
    //   ),
    //   textDirection: TextDirection.ltr,
    // );

    // textPain.layout(minWidth: 0, maxWidth: size.width);
    // var offset = const Offset(50, 200);
    // textPain.paint(canvas, offset);

    // if (image != null) {
    //   canvas.drawImage(image, Offset.zero, Paint());
    // }
  }

  // void loadImage() async {
  //   final ByteData data = await rootBundle.load('images/img1.png');
  //   final List<int> bytes = data.buffer.asUint8List();
  //   final ui.Codec codec = await ui.instantiateImageCodec(bytes);
  //   final ui.
  // }
  Future<ui.Image> loadImage(String image) async {
    final ByteData data = await rootBundle.load(image);
    final Uint8List bytes = data.buffer.asUint8List();
    final ui.Codec codec = await ui.instantiateImageCodec(bytes);
    final ui.FrameInfo frame = await codec.getNextFrame();
    return frame.image;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

// import 'dart:math';

// import 'package:flutter/material.dart';

// class MyPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     // Paint the sky
//     Paint skyPaint = Paint()..color = Colors.lightBlue;
//     canvas.drawRect(
//         Rect.fromLTWH(0, 0, size.width, size.height * 0.7), skyPaint);

//     // Paint the ground
//     Paint groundPaint = Paint()..color = Colors.green;
//     canvas.drawRect(
//         Rect.fromLTWH(0, size.height * 0.7, size.width, size.height * 0.3),
//         groundPaint);

//     // Paint the sun
//     Paint sunPaint = Paint()
//       ..color = Colors.yellow
//       ..style = PaintingStyle.fill;

//     double sunRadius = 50;
//     Offset sunCenter = Offset(size.width - sunRadius - 20, sunRadius + 20);
//     canvas.drawCircle(sunCenter, sunRadius, sunPaint);

//     // Paint sun rays
//     for (int i = 0; i < 12; i++) {
//       double angle = i * pi / 6;
//       Offset start = Offset(
//         sunCenter.dx + cos(angle) * sunRadius,
//         sunCenter.dy + sin(angle) * sunRadius,
//       );
//       Offset end = Offset(
//         sunCenter.dx + cos(angle) * (sunRadius + 20),
//         sunCenter.dy + sin(angle) * (sunRadius + 20),
//       );
//       canvas.drawLine(start, end, sunPaint);
//     }
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     // Return true if the new instance needs to repaint the canvas
//     return false;
//   }
// }
