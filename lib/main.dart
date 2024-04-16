import 'package:flutter/material.dart';
import 'package:layout_app/navigation_menu.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: BottomNavigationBarExample(),
  ));
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromRGBO(214, 215, 239, 1),
//       appBar: AppBar(
//         title: const Text(
//           'TODO APP',
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 24,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         backgroundColor: const Color.fromRGBO(147, 149, 211, 1),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {},
//         backgroundColor: const Color.fromRGBO(147, 149, 211, 1),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(90)),
//         child: const Icon(
//           Icons.add,
//           size: 21,
//           color: Colors.white,
//         ),
//       ),
//     );
//   }
// }
