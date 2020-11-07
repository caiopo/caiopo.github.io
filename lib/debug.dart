import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class Debug extends StatefulWidget {
  final Widget child;
  final bool printSize;

  const Debug({Key key, this.child, this.printSize = false}) : super(key: key);

  @override
  _DebugState createState() => _DebugState();
}

class _DebugState extends State<Debug> {
  @override
  Widget build(BuildContext context) {
    if (widget.printSize) {
      SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
        final size = (context.findRenderObject() as RenderBox).size;
        print('RenderBox.size: ${size - Size(2, 2)}');
      });
    }

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.pink),
      ),
      child: widget.child,
    );
  }
}
