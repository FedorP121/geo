import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:geo/src/feature/domain/model/model.dart';

part 'geo_event.dart';
part 'geo_state.dart';

class GeoBloc extends Bloc<GeoEvent, GeoState> {
  GeoBloc() : super(InitialState()) {
    on<CalculateGeoEvent>((event, emit) {
      try {
        final coordinates =
            _latLongToTileCoords(event.latitude, event.longitude, event.zoom);
        emit(GeoCalculatedState(
          x: coordinates.x,
          y: coordinates.y,
          imageUrl:
              "https://core-carparks-renderer-lots.maps.yandex.net/maps-rdr-carparks/tiles?l=carparks&x=${coordinates.x}&y=${coordinates.y}&z=${event.zoom}&scale=1&lang=ru_RU",
        ));
      } catch (e) {
        emit(CalculateGeoErrorState(error: e));
      }
    });
  }
}

GeoCoordinates _latLongToTileCoords(
    double latitude, double longitude, int zoom) {
  final rho = pow(2, zoom + 8) / 2;
  final beta = latitude * pi / 180;
  const e = 0.0818191908426;
  final phi = (1 - e * sin(beta)) / (1 + e * sin(beta));
  final theta = tan(pi / 4 + beta / 2) * pow(phi, e / 2);

  final xP = (rho * (1 + longitude / 180)).floor();
  final yP = (rho * (1 - log(theta) / pi)).floor();

  return GeoCoordinates(
    x: xP ~/ 256,
    y: yP ~/ 256,
  );
}
