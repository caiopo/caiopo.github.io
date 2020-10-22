import 'package:animated_background/animated_background.dart';
import 'package:flutter/painting.dart';

class MouseAvoidingParticleBehaviour extends RandomParticleBehaviour {
  final Offset mousePosition;

  MouseAvoidingParticleBehaviour({
    this.mousePosition,
    ParticleOptions options = const ParticleOptions(),
    Paint paint,
  }) : super(options: options, paint: paint);

  @override
  void initParticle(Particle p) {
    super.initParticle(p);

    // p.data = Offset(
    //   RandomParticleBehaviour.random.nextDouble(),
    //   RandomParticleBehaviour.random.nextDouble(),
    // );
  }

  @override
  void updateParticle(Particle particle, double delta, Duration elapsed) {
    if (mousePosition != null) {
      particle.dx = (particle.cx - mousePosition.dx) * _speedFactor;
      particle.dy = (particle.cy - mousePosition.dy) * _speedFactor;
    }
    return super.updateParticle(particle, delta, elapsed);
  }
}

const _speedFactor = 0.8;
