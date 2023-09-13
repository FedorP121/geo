import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geo/src/feature/presentation/bloc/geo_bloc.dart';

class ButtomCalulate extends StatelessWidget {
  const ButtomCalulate({
    super.key,
    required this.latController,
    required this.lonController,
    required this.zoomController,
  });

  final TextEditingController latController;
  final TextEditingController lonController;
  final TextEditingController zoomController;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        final double? lat = double.tryParse(latController.text);
        final double? lon = double.tryParse(lonController.text);
        final int? zoom = int.tryParse(zoomController.text);
        if (lat != null && lon != null && zoom != null) {
          BlocProvider.of<GeoBloc>(context).add(
            CalculateGeoEvent(
              latitude: lat,
              longitude: lon,
              zoom: zoom,
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Не верные значения')),
          );
        }
      },
      child: const Text('Конвертация'),
    );
  }
}
