import 'dart:async';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rtkita/app/model/panic_button.dart';

class PetaController extends GetxController {
  Completer<GoogleMapController> mapController = Completer();

  CameraPosition defaultPlace = const CameraPosition(
    target: LatLng(-1.234283, 116.863786),
    zoom: 18,
  );

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  updateMarker(List<PanicButton?> panicButton) {
    for (var data in panicButton) {
      if (data!.lat != null) {
        MarkerId markerId = MarkerId(data.id!.toString());
        Marker marker = Marker(
          infoWindow: InfoWindow(
            title: data.houseNumber,
          ),
          markerId: markerId,
          position: LatLng(data.lat!, data.lng!),
        );
        markers[markerId] = marker;
      }
    }
    update();
  }
}
