import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  ui.Image? image;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);

    loadImage().then((_) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home screen"),
      ),
      body: Center(
        child: image != null
            ? CustomPaint(
                size: const Size(300, 300),
                painter: Line(animation: _animation),
              )
            : const CircularProgressIndicator(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // _controller.reset();
          _controller.reverse();
          _controller.forward();
          if (_controller.status == AnimationStatus.completed) {
            
          }
        },
        child: const Icon(Icons.play_arrow),
      ),
    );
  }

  Future<void> loadImage() async {
    final ByteData data = await rootBundle.load('assets/images/img1.png');
    final Uint8List bytes = data.buffer.asUint8List();
    final ui.Codec codec = await ui.instantiateImageCodec(bytes);
    final ui.FrameInfo frame = await codec.getNextFrame();
    image = frame.image;
  }
}

class Line extends CustomPainter {
  final Animation<double> animation;

  Line({required this.animation}) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    Paint bgPaint = Paint();
    bgPaint.color = Colors.teal;
    bgPaint.strokeWidth = 10;
    bgPaint.strokeCap = StrokeCap.round;

    Offset bgStart = Offset(0, size.height);
    Offset bgEnd = Offset(size.width, size.height);

    canvas.drawLine(bgStart, bgEnd, bgPaint);

    Paint paint = Paint();
    paint.color = Colors.red;
    paint.strokeWidth = 10;
    paint.strokeCap = StrokeCap.round;

    double animatedWidth = animation.value * size.width;
    Offset startingOffset = Offset(0, size.height);
    Offset endingOffset = Offset(animatedWidth, size.height);

    canvas.drawLine(startingOffset, endingOffset, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class ImagePainter extends CustomPainter {
  final ui.Image? image;
  bool? isFilled;

  ImagePainter(this.image, {this.isFilled});

  @override
  void paint(Canvas canvas, Size size) {
    // paintImage(
    //   canvas: canvas,
    //   rect: Rect.fromLTWH(0, 0, size.width, size.height),
    //   image: image!,
    //   fit: BoxFit.contain,
    // );

    Paint paint = Paint();
    paint.color = Colors.blue;
    if (isFilled != null) {
      paint.style = PaintingStyle.fill;
    } else {
      paint.style = PaintingStyle.stroke;
    }
    paint.strokeCap = StrokeCap.round;
    paint.strokeJoin = StrokeJoin.round;
    paint.strokeWidth = 5;
    Offset offset = Offset(size.width / 2, size.height);

    Rect rect = Rect.fromCenter(center: offset, width: 100, height: 100);
    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(covariant ImagePainter oldDelegate) {
    return oldDelegate.image != image;
  }
}
