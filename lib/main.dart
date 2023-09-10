import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyStackWidget(),
    );
  }
}

class MyStackWidget extends StatefulWidget {
  @override
  _MyStackWidgetState createState() => _MyStackWidgetState();
}

class _MyStackWidgetState extends State<MyStackWidget> {
  double xPos = 0.0;
  double yPos = 0.0;
  double boxSize = 100.0;
  Color boxColor = Colors.blue;
  bool isCircle = false;
  double rotation = 0.0;
  bool initialized = false;

  @override
  Widget build(BuildContext context) {
    if (!initialized) {
      xPos = (MediaQuery.of(context).size.width - boxSize) / 2;
      yPos = (MediaQuery.of(context).size.height - boxSize) / 2;
      initialized = true;
    }

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              onPanUpdate: (details) {
                setState(() {
                  xPos += details.delta.dx;
                  yPos += details.delta.dy;
                });
              },
              onTap: () {
                toggleShapeAndColor();
              },
              onLongPressStart: (_) {
                startRotation();
              },
              onLongPressEnd: (_) {
                stopRotation();
              },
              child: Container(
                color: Colors.transparent,
              ),
            ),
          ),
          Positioned(
            left: xPos,
            top: yPos,
            child: Transform.rotate(
              angle: rotation,
              child: Draggable(
                child: Container(
                  width: boxSize,
                  height: boxSize,
                  decoration: BoxDecoration(
                    color: boxColor,
                    shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
                  ),
                ),
                feedback: Container(
                  width: boxSize,
                  height: boxSize,
                  decoration: BoxDecoration(
                    color: boxColor.withOpacity(0.5),
                    shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
                  ),
                  child: Center(
                    child: Text('Перетаскивается...'),
                  ),
                ),
                onDraggableCanceled: (velocity, offset) {
                  setState(() {
                    xPos = offset.dx;
                    yPos = offset.dy;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void toggleShapeAndColor() {
    setState(() {
      if (isCircle) {
        boxSize = 100.0;
        boxColor = Colors.blue;
      } else {
        boxSize = 100.0;
        boxColor = Colors.red;
      }
      isCircle = !isCircle;
    });
  }

  void startRotation() {
    setState(() {
      rotation += 1.0;
    });
  }

  void stopRotation() {
    setState(() {
      rotation = 0.0;
    });
  }
}
