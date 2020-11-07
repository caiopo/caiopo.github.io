import 'package:animated_background/animated_background.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:personal_site/particles.dart';
import 'package:personal_site/songs.dart';
import 'package:personal_site/utils.dart';

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
    setState(() {
      _mousePosition = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);

    return MouseRegion(
      onEnter: _onEnter,
      onHover: _onHover,
      onExit: _onExit,
      child: Scaffold(
        backgroundColor: const Color(0xFF111111),
        floatingActionButton: SongsButton(),
        body: AnimatedBackground(
          behaviour: MouseAvoidingParticleBehaviour(
            mousePosition: _mousePosition ?? mq.size.center(Offset.zero),
            options: ParticleOptions(
              spawnMinSpeed: 50.0,
              spawnMaxSpeed: 100.0,
              spawnMinRadius: 3.0,
              spawnMaxRadius: 8.0,
              minOpacity: 0.8,
              maxOpacity: 1.0,
              baseColor: Colors.yellow,
            ),
          ),
          vsync: this,
          child: Info(),
        ),
      ),
    );
  }
}

class Info extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Hi there!',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 36,
                ),
              ),
              const SizedBox(width: 16),
              Image.asset('assets/icons/wave.png', width: 48, height: 48),
            ],
          ),
          const SizedBox(height: 48),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'My name is ',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 48,
                ),
              ),
              Text(
                'Caio',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 48,
                  color: Colors.yellow.shade600,
                ),
              ),
              const SizedBox(width: 16),
              Image.asset('assets/icons/rocket.png', width: 48, height: 48),
            ],
          ),
          const SizedBox(height: 48),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'I work as a Mobile App Developer',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 36,
                ),
              ),
              const SizedBox(width: 16),
              Image.asset('assets/icons/phone.png', width: 48, height: 48),
            ],
          ),
          const SizedBox(height: 72),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _Link(
                label: 'Resume',
                url: 'https://www.toptal.com/resume/caio-pereira-oliveira',
              ),
              _Slash(),
              _Link(
                label: 'LinkedIn',
                url: 'https://www.linkedin.com/in/caiopo/',
              ),
              _Slash(),
              _Link(
                label: 'GitHub',
                url: 'http://github.com/caiopo',
              ),
              _Slash(),
              _Link(
                label: 'Email',
                url: 'mailto:hello@caiopo.com',
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _Link extends StatelessWidget {
  final String label;
  final String url;

  const _Link({Key key, this.label, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(4),
      onTap: () => openUrl(url),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}

class _Slash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Text(
        '//',
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
          color: Colors.yellow,
        ),
      ),
    );
  }
}
