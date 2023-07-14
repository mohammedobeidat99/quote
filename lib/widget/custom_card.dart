import 'package:flutter/material.dart';

import '../constant/colors.dart';
import '../screen/quotes_screen.dart';

class CustomCard extends StatelessWidget {
  final String? name;
  final int ?l;


  CustomCard({ required this.name ,this.l});

  @override
  Widget build(BuildContext context) {
    return Card(
      
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(2),
              child: Image.network(
                'https://images.pexels.com/photos/716398/pexels-photo-716398.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      '${l}',
                      style: TextStyle(fontSize: 12, color: Color2.main1),
                    ),
                   const SizedBox(
                      width: 5,
                    ),
                   const Icon(
                      Icons.mail_outline_sharp,
                      color: Color2.main1,
                      size: 15,
                    ),
                  ],
                ),
                Text(
                  name!,
                  style:const TextStyle(
                    fontFamily: 'Lateef',
                    fontSize: 20,
                    color: Color2.main1,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
