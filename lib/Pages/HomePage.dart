import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  final List<Map<String, dynamic>> phoneDetails;

  const Homepage({super.key, required this.phoneDetails});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Product Navigation',style: TextStyle(color: Colors.white),),
      ),
      body: SingleChildScrollView(
        child:Column(
        children: [
          for(var i = 0; i<widget.phoneDetails.length; i++) 
          Padding(padding: const EdgeInsets.all(8.0),
          child:GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, '/viewDetails', arguments: widget.phoneDetails[i]);
            },
            child:  Row(
            children: [
              Container(
                height: 115,
                width: 200,
                decoration: BoxDecoration(
                  color:  widget.phoneDetails[i]['color'],
                ),
                child:  Center(child:Text(widget.phoneDetails[i]['title'], style: TextStyle(color: Colors.white,fontSize: 30),)),
              ),
              SizedBox(width: 13,),
              Container(
                height: 115,
                width: 200,

                child:  Column(
                  children: [
                    Text(widget.phoneDetails[i]['title'],style: TextStyle(fontWeight: FontWeight.bold),),
                    Text(widget.phoneDetails[i]['description'],style: TextStyle(),),
                    Center(child: Text("price : ${widget.phoneDetails[i]['price']}"),),
                    SizedBox(height: 10,width: 10,),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.star, color: Colors.red),
                        Icon(Icons.star, color: Colors.red),
                        Icon(Icons.star, color: Colors.red),
                        Icon(Icons.star, color: Colors.red),
                      ],
                    )
                  ],
                ),
              )
          ],),
          ),
          )
        ],
      ),
        )
      
    );
  }
}