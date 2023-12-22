// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:golden_toolkit/golden_toolkit.dart';
// import 'package:practice/pages/homeview.dart';
// import 'package:practice/pages/profilepage.dart';

// void main() async {

//   setUpAll(() => {loadAppFonts()});
//   testGoldens('DeviceBuilder - multiple scenarios - with onCreate',
//       (tester) async {

//     final builder = DeviceBuilder()
//       ..overrideDevicesForAllScenarios(devices: [
//         Device.phone,
//         Device.tabletPortrait,
//         Device.tabletLandscape,
//       ])
//       ..addScenario(
//         widget:  ProfilePage(),
//         name: 'sc page',
//       );
//     //flutter test --update-goldens
//     await tester.pumpDeviceBuilder(
//       builder,
//       wrapper: materialAppWrapper(
//         theme: ThemeData.light(),
//         platform: TargetPlatform.android,
//       ),
//     );

//     await screenMatchesGolden(tester, 'firt_screen_shot');
//   });
// }