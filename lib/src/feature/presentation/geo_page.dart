import 'package:flutter/material.dart';
import 'package:geo/src/feature/presentation/widgets/build_bloc_builder.dart';
import 'package:geo/src/feature/presentation/widgets/buttom_calulate.dart';

import 'package:geo/src/feature/presentation/widgets/text_field_widgets.dart';

class GeoPage extends StatelessWidget {
  const GeoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GeoCalculator(),
    );
  }
}

class GeoCalculator extends StatelessWidget {
  final TextEditingController latController = TextEditingController();
  final TextEditingController lonController = TextEditingController();
  final TextEditingController zoomController = TextEditingController();

  GeoCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            width: 500,
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Text('Введите координаты'),
                LatWidget(latController: latController),
                LonWidget(lonController: lonController),
                ZoomWidget(zoomController: zoomController),
                const SizedBox(height: 20),
                ButtomCalulate(
                    latController: latController,
                    lonController: lonController,
                    zoomController: zoomController),
                const SizedBox(height: 20),
                buildBlocBuilder(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
