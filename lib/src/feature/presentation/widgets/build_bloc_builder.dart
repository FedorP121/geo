import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geo/src/feature/presentation/bloc/geo_bloc.dart';

BlocBuilder<GeoBloc, GeoState> buildBlocBuilder() {
  return BlocBuilder<GeoBloc, GeoState>(
    builder: (context, state) {
      if (state is GeoCalculatedState) {
        return Column(
          children: [
            Text('X: ${state.x}, Y: ${state.y}'),
            Image.network(state.imageUrl, errorBuilder: (BuildContext context,
                Object exception, StackTrace? stackTrace) {
              return const Text('Плитка не найдена');
            }),
          ],
        );
      }
      if (state is CalculateGeoErrorState) {
        return Text(state.error.toString());
      }
      return const SizedBox.shrink();
    },
  );
}
