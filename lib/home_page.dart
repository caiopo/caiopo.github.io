import 'package:animated_background/animated_background.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:personal_site/particles.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  Offset _mousePosition;

  void _onEnter(PointerEnterEvent event) {}

  void _onHover(PointerHoverEvent event) {
    setState(() {
      _mousePosition = event.position;
    });
  }

  void _onExit(PointerExitEvent event) {
    print('exited');
    setState(() {
      _mousePosition = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);

    return Scaffold(
      body: MouseRegion(
        onEnter: _onEnter,
        onHover: _onHover,
        onExit: _onExit,
        child: Container(
          color: Colors.black,
          child: AnimatedBackground(
            behaviour: MouseAvoidingParticleBehaviour(
              mousePosition: _mousePosition ?? mq.size.center(Offset.zero),
              options: ParticleOptions(
                spawnMinSpeed: 50.0,
                spawnMaxSpeed: 100.0,
                spawnMinRadius: 3.0,
                spawnMaxRadius: 8.0,
                maxOpacity: 1.0,
                minOpacity: 0.8,
                baseColor: Colors.yellow,
              ),
            ),
            vsync: this,
            child: Container(),
          ),
        ),
      ),
    );
  }
}
