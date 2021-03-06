// import 'package:flutter/material.dart';
// import 'package:sampleproject/models/video_model.dart';

// class Video_Carousel extends StatelessWidget {
//   final String title, video;
//   final Function press;
//   const Video_Carousel({
//     Key key,
//     this.title,
//     this.video,
//     this.press,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     const kPrimaryColor = Color(0xFFFFC61F);
//     // This size provide you the total height and width of the screen
//     Size size = MediaQuery.of(context).size;
//     return Container(
//       margin: EdgeInsets.only(left: 20, right: 15, top: 20, bottom: 20),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(10),
//         boxShadow: [
//           BoxShadow(
//             offset: Offset(0, 4),
//             blurRadius: 20,
//             color: Color(0xFFB0CCE1).withOpacity(0.32),
//           ),
//         ],
//       ),
//       child: Material(
//         color: Colors.transparent,
//         child: InkWell(
//           onTap: press,
//           child: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               children: <Widget>[
//                 Container(
//                   margin: EdgeInsets.only(bottom: 15),
//                   padding: EdgeInsets.all(25),
//                   decoration: BoxDecoration(
//                     color: kPrimaryColor.withOpacity(0.13),
//                     shape: BoxShape.circle,
//                   ),
//                   child: SvgPicture.asset(
//                     svgSrc,
//                     width: size.width * 0.18,
//                     // size.width * 0.18 means it use 18% of total width
//                   ),
//                 ),
//                 Text(title),
//                 SizedBox(height: 10),
//                 Text(
//                   shopName,
//                   style: TextStyle(fontSize: 12),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }