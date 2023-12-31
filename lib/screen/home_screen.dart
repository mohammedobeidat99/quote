// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:quote/constant/colors.dart';
// import 'package:quote/screen/quotes_screen.dart';
// import 'package:quote/widget/custom_card.dart';

// import '../data/data_quotes.dart';
// import '../model/category.dart';

// class Home extends StatefulWidget {
//   const Home({Key? key});

//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
//   late AnimationController _animationController;
//   late Animation<double> _animation;

//   @override
//   void initState() {
//     _animationController = AnimationController(
//       duration: const Duration(seconds: 1),
//       vsync: this,
//     );
//     _animation = CurvedAnimation(
//       parent: _animationController,
//       curve: Curves.easeInOut,
//     );
//     _animationController.repeat(reverse: true);
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }

//   Future<bool> _onWillPop() async {
//     return (await showDialog(
//           context: context,
//           builder: (context) => AlertDialog(
//             title: Text(
//               'اغلاق التطبيق',
//               textAlign: TextAlign.right,
//               style: TextStyle(
//                   color: Color.fromRGBO(61, 131, 97, 1),
//                   fontFamily: 'Lateef',
//                   fontSize: 32),
//             ),
//             content: Text(
//               'هل تريد الخروج من التطبيق؟',
//               textAlign: TextAlign.right,
//               style: TextStyle(
//                 fontSize: 25,
//                 color: Color2.main2,
//                 fontFamily: 'Lateef',
//               ),
//             ),
//             actions: <Widget>[
//               TextButton(
//                 onPressed: () => Navigator.of(context).pop(false),
//                 child: Text(
//                   'لا',
//                   style: TextStyle(
//                     color: Color2.main2,
//                     fontSize: 25,
//                     fontFamily: 'Lateef',
//                   ),
//                 ),
//               ),
//               TextButton(
//                 onPressed: () => Navigator.of(context).pop(true),
//                 child: Text('نعم',
//                     style: TextStyle(
//                       color: Color2.main2,
//                       fontSize: 25,
//                       fontFamily: 'Lateef',
//                     )),
//               ),
//             ],
//           ),
//         )) ??
//         false;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: _onWillPop,
//       child: SafeArea(
//         child: Scaffold(
//           // floatingActionButton: IconButton(
//           //     onPressed: () {},
//           //     icon: Icon(Icons.favorite, color: Colors.redAccent)),
//           appBar: AppBar(
//             backgroundColor: Color(0xFF3D8361),
//             title: Text(
//               'اِقتِباس',
//               style: TextStyle(
//                 fontSize: 30,
//                 fontWeight: FontWeight.w300,
//                 color: Color2.main4,
//                 fontFamily: 'ArefRuqaa',
//               ),
//             ),
//             centerTitle: true,
//           ),
//           drawer: Drawer(
//             child: ListView(
//               children: <Widget>[
//                 UserAccountsDrawerHeader(
//                   accountName: Text(
//                     'Mohammed Obeidat',
//                     style: TextStyle(color: Colors.black),
//                   ),
//                   accountEmail: Text(
//                     'obeidatmohammed80@gmail.com',
//                     style: TextStyle(color: Colors.black),
//                   ),
//                   currentAccountPicture: CircleAvatar(
//                     child: Icon(Icons.person),
//                   ),
//                 ),
//                 ListTile(
//                   leading: Icon(Icons.home),
//                   title: Text(
//                     'Home',
//                     style: TextStyle(color: Colors.black),
//                   ),
//                   onTap: () {
//                     // Handle drawer item tap
//                   },
//                 ),
//                 ListTile(
//                   leading: Icon(Icons.settings),
//                   title: Text(
//                     'Settings',
//                     style: TextStyle(color: Colors.black),
//                   ),
//                   onTap: () {
//                     // Handle drawer item tap
//                   },
//                 ),
//               ],
//             ),
//           ),
//           body: Container(
//             width: double.infinity,
//             height: double.infinity,
//             child: GridView.builder(
//               padding: EdgeInsets.all(8.0),
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2, // Display two cards per row
//                 childAspectRatio: 1,
//                 mainAxisSpacing: 12,
//                 crossAxisSpacing: 12,
//                 // Set aspect ratio for card width and height
//               ),
//               itemCount: categories.length,
//               itemBuilder: (context, index) {
//                 Category category = categories[index];
//                 return AnimatedBuilder(
//                   animation: _animation,
//                   builder: (context, child) {
//                     return Transform.scale(
//                       scale: 1.0 + _animation.value * 0.04,
//                       child: child,
//                     );
//                   },
//                   child: GestureDetector(
//                     onTap: () => Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => QuotesPage(
//                           category: category,
//                           title: category.name,
//                         ),
//                       ),
//                     ),
//                     child: CustomCard(
//                       name: category.name,
//                       l: category.quotes.length,
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
