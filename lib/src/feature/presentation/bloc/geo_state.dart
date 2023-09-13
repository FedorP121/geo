part of 'geo_bloc.dart';

abstract class GeoState {}

class InitialState extends GeoState {}

class GeoCalculatedState extends GeoState {
  final int x;
  final int y;
  final String imageUrl;

  GeoCalculatedState({
    required this.x,
    required this.y,
    required this.imageUrl,
  });
}

class CalculateGeoErrorState extends GeoState {
  Object error;
  CalculateGeoErrorState({
    required this.error,
  });
}
