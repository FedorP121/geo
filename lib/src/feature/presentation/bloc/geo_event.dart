// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'geo_bloc.dart';

abstract class GeoEvent {}

class CalculateGeoEvent extends GeoEvent {
  final double latitude;
  final double longitude;
  final int zoom;

  CalculateGeoEvent({
    required this.latitude,
    required this.longitude,
    required this.zoom,
  });
}
