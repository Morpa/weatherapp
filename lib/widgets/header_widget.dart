import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';

import '../controller/global_controller.dart';

class HeaderWidget extends HookWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalController globalController =
        Get.put(GlobalController(), permanent: true);
    final city = useState('');

    getAddress(lat, lon) async {
      List<Placemark> placemark = await placemarkFromCoordinates(lat, lon);

      print(placemark);
    }

    useEffect(() {
      getAddress(
        globalController.getLattitude().value,
        globalController.getLongitude().value,
      );
      return null;
    }, [
      globalController.getLattitude().value,
      globalController.getLongitude().value
    ]);

    return Column(
      children: [
        Container(
          child: Text(city.value),
        )
      ],
    );
  }
}
