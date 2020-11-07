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
    final scaling = (mq.size.width / 800).clamp(0.4, 1.0).toDouble();
    print('screen size: ${mq.size}, scaling: $scaling');

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
          child: Info(scaling: scaling),
        ),
      ),
    );
  }
}

class Info extends StatelessWidget {
  final double scaling;

  const Info({Key key, this.scaling}) : super(key: key);

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
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 36 * scaling,
                ),
              ),
              SizedBox(width: 16 * scaling),
              Image.asset(
                'assets/icons/wave.png',
                width: 48 * scaling,
                height: 48 * scaling,
              ),
            ],
          ),
          SizedBox(height: 48 * scaling),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'My name is ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 48 * scaling,
                ),
              ),
              Text(
                'Caio',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 48 * scaling,
                  color: Colors.yellow.shade600,
                ),
              ),
              SizedBox(width: 16 * scaling),
              Image.asset(
                'assets/icons/rocket.png',
                width: 48 * scaling,
                height: 48 * scaling,
              ),
            ],
          ),
          SizedBox(height: 48 * scaling),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'I work as a Mobile App Developer',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 36 * scaling,
                ),
              ),
              // if (MediaQuery.of(context).size.width > 340)
              //   Text(
              //     'I work as a Mobile App Developer',
              //     style: TextStyle(
              //       fontWeight: FontWeight.bold,
              //       fontSize: 36 * scaling,
              //     ),
              //   )
              // else
              //   Column(
              //     crossAxisAlignment: CrossAxisAlignment.end,
              //     children: [
              //       Text(
              //         'I work as a',
              //         style: TextStyle(
              //           fontWeight: FontWeight.bold,
              //           fontSize: 36 * scaling,
              //         ),
              //       ),
              //       Text(
              //         'Mobile App Developer',
              //         style: TextStyle(
              //           fontWeight: FontWeight.bold,
              //           fontSize: 36 * scaling,
              //         ),
              //       )
              //     ],
              //   ),
              SizedBox(width: 16 * scaling),
              Image.asset(
                'assets/icons/phone.png',
                width: 48 * scaling,
                height: 48 * scaling,
              ),
            ],
          ),
          SizedBox(height: 72 * scaling),
          LinkBar(scaling: scaling),
        ],
      ),
    );
  }
}

class LinkBar extends StatelessWidget {
  final double scaling;

  const LinkBar({Key key, this.scaling}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);

    if (mq.size.width < 500) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Link(
            label: 'Resume',
            url: 'https://www.toptal.com/resume/caio-pereira-oliveira',
            scaling: scaling,
            showArrow: true,
          ),
          _Link(
            label: 'LinkedIn',
            url: 'https://www.linkedin.com/in/caiopo/',
            scaling: scaling,
            showArrow: true,
          ),
          _Link(
            label: 'GitHub',
            url: 'http://github.com/caiopo',
            scaling: scaling,
            showArrow: true,
          ),
          _Link(
            label: 'Email',
            url: 'mailto:hello@caiopo.com',
            scaling: scaling,
            showArrow: true,
          ),
        ],
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _Link(
          label: 'Resume',
          url: 'https://www.toptal.com/resume/caio-pereira-oliveira',
          scaling: scaling,
        ),
        _Slash(scaling: scaling),
        _Link(
          label: 'LinkedIn',
          url: 'https://www.linkedin.com/in/caiopo/',
          scaling: scaling,
        ),
        _Slash(scaling: scaling),
        _Link(
          label: 'GitHub',
          url: 'http://github.com/caiopo',
          scaling: scaling,
        ),
        _Slash(scaling: scaling),
        _Link(
          label: 'Email',
          url: 'mailto:hello@caiopo.com',
          scaling: scaling,
        ),
      ],
    );
  }
}

class _Link extends StatelessWidget {
  final String label;
  final String url;
  final double scaling;
  final bool showArrow;

  const _Link({
    Key key,
    this.label,
    this.url,
    this.scaling,
    this.showArrow = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(4),
      onTap: () => openUrl(url),
      child: Padding(
        padding: EdgeInsets.all(16 * scaling),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (showArrow)
              Text(
                '> ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28 * scaling,
                  color: Colors.yellow.shade600,
                ),
              ),
            Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28 * scaling,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Slash extends StatelessWidget {
  final double scaling;

  const _Slash({Key key, this.scaling}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Text(
        '//',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 28 * scaling,
          color: Colors.yellow,
        ),
      ),
    );
  }
}
