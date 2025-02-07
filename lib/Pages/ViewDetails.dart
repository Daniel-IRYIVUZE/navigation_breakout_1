import 'package:flutter/material.dart';

class Viewdetails extends StatefulWidget {
  final List<Map<String, dynamic>> phoneDetails;
  const Viewdetails({super.key, required this.phoneDetails});

  @override
  State<Viewdetails> createState() => _ViewdetailsState();
}

class _ViewdetailsState extends State<Viewdetails> {
  @override
  Widget build(BuildContext context) {
        // Get the arguments passed from previous screen
    final Map<String, dynamic>? phoneDetail =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    // Check if data exists
    if (phoneDetail == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Details')),
        body: const Center(child: Text('No data available')),
      );
    }
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title:  Text(phoneDetail["title"],style: TextStyle(color: Colors.white),),
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            color: phoneDetail["color"],
            child: Center(child: Text(phoneDetail["title"],style: TextStyle(color: Colors.white,fontSize: 80))),
          ),
          SizedBox(height: 50,),
          Text(phoneDetail["title"],style: TextStyle(color: Colors.black,fontSize:30)),
          SizedBox(height: 30,),
          Text(phoneDetail["description"]),
          SizedBox(height: 50,),
          Text("Price: ${phoneDetail["price"]}"),
          SizedBox(height: 50,),
          Row(
            children: [
          for(var i = 0; i <4; i++)
          Align(alignment: Alignment.centerRight, // Moves text to the right
            child: Icon(Icons.star, color: Colors.red)
          )
            ],
          )

        ],
      ),
    );
  }
}
