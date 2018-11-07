import 'dart:convert';

import 'package:wotta_core/wotta_core.dart';

main() {

  final workout = new Workout((b) => b
      ..id = 'myid'
      ..title = "mytitle"
  );
  print('My first Workout:${workout}');

  print('Json: ${json.encode(serializers.serialize(workout))}');

}
