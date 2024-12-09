//
// import 'package:flutter/material.dart';
//
// class WomensTop extends StatefulWidget {
//   const WomensTop({super.key});
//
//   @override
//   State<WomensTop> createState() => _WomensTopState();
// }
//
// class _WomensTopState extends State<WomensTop> {
//   // Move _showgrid here to make it a state variable
//
//
//   final List<String> img_gridView = [
//     "assets/images/utils/view_all_img1.png",
//     "assets/images/utils/view_all_img2.png",
//     "assets/images/utils/view_all_img1.png",
//     "assets/images/utils/view_all_img2.png",
//     "assets/images/utils/view_all_img1.png",
//     "assets/images/utils/view_all_img2.png",
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       appBar: AppBar(
//         elevation: .7,
//         shadowColor: Colors.white.withOpacity(.25),
//         leading: const BackBtn(),
//         title:  Text(
//           "Women's Top",
//           style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
//         ),
//
//         actions: <Widget>[
//           IconButton(
//             onPressed: () {
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => WomensTop()));
//             },
//             icon: const Icon(Icons.search),
//           ),
//         ],
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//
//           SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: Row(
//               children: List.generate(
//                 6,
//                     (index) => Padding(
//                   padding: const EdgeInsets.only(left: 10),
//                   child: Container(
//                     width: 80,
//                     height: 24,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20),
//                       color: const Color(0xFF222222),
//                     ),
//                     child: Center(
//                       child: Text(
//                         "All",
//                         style: const TextStyle(color: Colors.white),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//
//           const SizedBox(height: 10),
//           Expanded(
//               child:
//               GridView.builder(
//                 itemCount: img_gridView.length,
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                     mainAxisSpacing: 10,
//                     crossAxisSpacing: 10,
//                     mainAxisExtent: 260),
//                 itemBuilder: (_, int index) {
//                   return ViewAllGridItems(image: img_gridView[index]);
//                 },
//               )
//           ),
//         ],
//       ),
//     );
//   }
// }