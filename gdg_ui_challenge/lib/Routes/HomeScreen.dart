import 'package:flutter/material.dart';
import 'package:gdg_mahmoud_bensfia/Config/Constants.dart';
import 'package:gdg_mahmoud_bensfia/Widgets/HorizontalSeparateur.dart';

import 'AlmostFamousDetails.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text("Explore our Delicious offer",style: TextStyle(fontSize: 35),),
                Container(
                 height: 300,
                  child: Expanded(
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        RestaurantCard("assets/images/Rectangle 9.png","Royal park","Chinese, South indian",context),
                        RestaurantCard("assets/images/Rectangle 10.png","Royal park","Chinese, South indian",context),
                        RestaurantCard("assets/images/Rectangle 12.png","Almost famous","Chinese, South indian",context),
                      ],
                    ),
                  ),
                ),
                HorizontalSeparateur(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Near me (15)"),
                    Row(
                      children: [
                        Icon(Icons.format_line_spacing,color: Constants.grey0,),
                        SizedBox(width: 3,),
                        Text("Filter",style: TextStyle(color: Constants.grey0),)
                      ],
                    )
                  ],
                ),
                RestaurantVertical("assets/images/Mask Group 1.png", "Royal food Court", "Chineese, South indian", "100-102 High St, Manchester", context),
                RestaurantVertical("assets/images/Mask Group 5.png", "Royal food Court", "Chineese, South indian", "100-102 High St, Manchester", context),
                RestaurantVertical("assets/images/Mask Group 27.png", "Royal food Court", "Chineese, South indian", "100-102 High St, Manchester", context),
              ],
            ),
          ),
        ),
      ),
      appBar: PreferredSize(
        preferredSize: Size(400,40),
        child: Container(
          height: 40,
          padding: EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(Icons.search),
              SizedBox(width: 7,),
              Icon(Icons.notifications),
            ],
          ),
        ),
      ),
    );


  }


  Widget RestaurantCard(String imagePath, String title, String location,BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AlmostFamousDetails()),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width*0.7,
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
        margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [BoxShadow(
              color: Colors.grey[300],
              blurRadius: 2,
              offset: Offset(0,3)
          )],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(imagePath,fit: BoxFit.cover,width: MediaQuery.of(context).size.width*0.7,height: 230,),
            ),
            SizedBox(height: 8,),
            Text(title,style: TextStyle(fontWeight: FontWeight.w500),textAlign: TextAlign.left,),
            Text(location,style: TextStyle(fontWeight: FontWeight.w500,),textAlign: TextAlign.left,),
          ],
        ),
      ),
    );
  }



  Widget RestaurantVertical(String imagePath,String label,String adress,String location,BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AlmostFamousDetails()),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(vertical: 8),
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [BoxShadow(
                blurRadius: 3,
                color: Colors.grey[400],
                offset: Offset(0,3)
            )]
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset(imagePath,height: 100,width: 90,fit: BoxFit.cover,),
            ),
            Expanded(

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(label,style: TextStyle(fontWeight: FontWeight.w600,),),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Constants.green
                            ),
                            width: 4,
                            height: 4,
                          ),
                          SizedBox(width: 5,),
                          Text("Open",style: TextStyle(color: Constants.green),)
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 8,),
                  Text(adress,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12),),
                  Row(
                    children: [
                      Icon(Icons.location_on,color: Colors.grey[500],),
                      Flexible(child: Text("$location km",style: TextStyle(color: Constants.grey2,fontSize: 13,),overflow: TextOverflow.ellipsis,)),
                    ],
                  ),
                  SizedBox(height: 8,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }



}
