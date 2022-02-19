import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFF111111),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: _NewInfo(),
        ),
      ),
    );
  }
}

class _NewInfo extends StatelessWidget {
  const _NewInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DefaultTextStyle.merge(
      style: theme.textTheme.headline2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Hi! I\'m'),
          Text(
            'Caio Pereira Oliveira',
            style: theme.textTheme.headline1?.copyWith(color: Colors.amber),
          ),
          Text('Software Engineer'),
        ],
      ),
    );
  }
}

class Info extends StatelessWidget {
  const Info({Key? key}) : super(key: key);

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
                  fontSize: 36,
                ),
              ),
              SizedBox(width: 16),
              Image.asset(
                'assets/icons/wave.png',
                semanticLabel: 'Waving hand emoji',
                width: 48,
                height: 48,
              ),
            ],
          ),
          SizedBox(height: 48),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              MergeSemantics(
                child: Row(
                  children: [
                    Text(
                      'My name is ',
                      style: TextStyle(
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
                  ],
                ),
              ),
              SizedBox(width: 16),
              Image.asset(
                'assets/icons/rocket.png',
                semanticLabel: 'Rocket emoji',
                width: 48,
                height: 48,
              ),
            ],
          ),
          SizedBox(height: 48),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'I work as a Mobile App Developer',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 36,
                ),
              ),
              SizedBox(width: 16),
              Image.asset(
                'assets/icons/phone.png',
                semanticLabel: 'Phone emoji',
                width: 48,
                height: 48,
              ),
            ],
          ),
          SizedBox(height: 72),
          LinkBar(),
        ],
      ),
    );
  }
}

class LinkBar extends StatelessWidget {
  const LinkBar({Key? key}) : super(key: key);

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
            showArrow: true,
          ),
          _Link(
            label: 'LinkedIn',
            url: 'https://www.linkedin.com/in/caiopo/',
            showArrow: true,
          ),
          _Link(
            label: 'GitHub',
            url: 'http://github.com/caiopo',
            showArrow: true,
          ),
          _Link(
            label: 'Email',
            url: 'mailto:hello@caiopo.com',
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
        ),
        _Link(
          label: 'LinkedIn',
          url: 'https://www.linkedin.com/in/caiopo/',
        ),
        _Link(
          label: 'GitHub',
          url: 'http://github.com/caiopo',
        ),
        _Link(
          label: 'Email',
          url: 'mailto:hello@caiopo.com',
        ),
      ],
    );
  }
}

class _Link extends StatelessWidget {
  final String label;
  final String url;
  final bool showArrow;

  const _Link({
    Key? key,
    required this.label,
    required this.url,
    this.showArrow = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(4),
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (showArrow)
              Text(
                '> ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  color: Colors.yellow.shade600,
                ),
              ),
            Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
