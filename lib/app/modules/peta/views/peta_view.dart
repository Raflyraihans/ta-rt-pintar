import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rtkita/app/modules/tab_decider/controllers/tab_decider_controller.dart';
import 'package:rtkita/app/providers/panic_button.dart';
import 'package:rtkita/env/color.dart';

import '../controllers/peta_controller.dart';

class PetaView extends GetView<PetaController> {
  const PetaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            GetBuilder<TabDeciderController>(
                init: TabDeciderController(),
                builder: (tab) {
                  return GetBuilder<PetaController>(
                    init: PetaController(),
                    builder: (c) {
                      return GoogleMap(
                        mapToolbarEnabled: false,
                        myLocationButtonEnabled: false,
                        zoomControlsEnabled: false,
                        mapType: MapType.normal,
                        initialCameraPosition: c.defaultPlace,
                        onMapCreated: (GoogleMapController controller) {
                          c.mapController.complete(controller);
                        },
                        markers: Set<Marker>.of(c.markers.values),
                        onCameraIdle: () {
                          final PanicProvider panicProvider = PanicProvider();
                          panicProvider.getListPanic(context);
                        },
                      );
                    },
                  );
                }),
            Positioned(
              top: 20,
              right: 20,
              child: Container(
                height: 65,
                width: 65,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: primaryColor,
                ),
                child: IconButton(
                  icon: const Icon(Icons.refresh, color: Colors.white),
                  onPressed: () {
                    final PanicProvider panicProvider = PanicProvider();
                    panicProvider.getListPanic(context);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
