import 'package:flutter/material.dart';

class ZoomWidget extends StatelessWidget {
  const ZoomWidget({
    super.key,
    required this.zoomController,
  });

  final TextEditingController zoomController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: zoomController,
      decoration: const InputDecoration(labelText: 'Приближение'),
      keyboardType: TextInputType.number,
    );
  }
}

class LonWidget extends StatelessWidget {
  const LonWidget({
    super.key,
    required this.lonController,
  });

  final TextEditingController lonController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: lonController,
      decoration: const InputDecoration(labelText: 'Долгота'),
      keyboardType: TextInputType.number,
    );
  }
}

class LatWidget extends StatelessWidget {
  const LatWidget({
    super.key,
    required this.latController,
  });

  final TextEditingController latController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: latController,
      decoration: const InputDecoration(labelText: 'Широта'),
      keyboardType: TextInputType.number,
    );
  }
}
