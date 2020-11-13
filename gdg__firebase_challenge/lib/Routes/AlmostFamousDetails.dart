import 'package:flutter/material.dart';
import 'package:gdg_mahmoud_bensfia/Config/Constants.dart';
import 'package:gdg_mahmoud_bensfia/Widgets/FoodVertical.dart';
import 'package:gdg_mahmoud_bensfia/Widgets/HorizontalSeparateur.dart';
class AlmostFamousDetails extends StatefulWidget {
  @override
  _AlmostFamousDetailsState createState() => _AlmostFamousDetailsState();
}

class _AlmostFamousDetailsState extends State<AlmostFamousDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
            borderRadius: BorderRadius.circular(10),
                  child: Image.asset("assets/images/Mask Group 1.png",
                  height: MediaQuery.of(context).size.height*0.3,
                    fit: BoxFit.cover,
                  )
                  ),
                Text("Royal food court",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
                Text("Chinese,South indian",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400),),
                Row(
                  children: [
                    Icon(Icons.location_on,color: Constants.grey0,size: 12,),
                    Text("100-102 High St, Manchester",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: Constants.grey0),),
                  ],
                ),
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris ut lectus elementum, tristique quam vel, convallis urna. Integer quis risus quis justo tincidunt pretium. Integer malesuada eros aliquet, commodo orci aliquet, pellentesque purus. Vivamus rhoncus malesuada sapien maximus vehicula"
                      ,style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400,color: Constants.grey1),
                    overflow: TextOverflow.ellipsis,maxLines: 3,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text("4.5"),
                        Icon(Icons.star,color: Constants.yellow,),
                        Icon(Icons.star,color: Constants.yellow,),
                        Icon(Icons.star,color: Constants.yellow,),
                        Icon(Icons.star,color: Constants.yellow,),
                        Icon(Icons.star_border,color: Constants.yellow,),
                      ],
                    ),
                    Row(
                      children: [
                        IconsRoundContainer(Icons.share),
                        SizedBox(width: 10,),
                        IconsRoundContainer(Icons.star_border),
                      ],
                    )
                  ],
                ),
                HorizontalSeparateur(),
                Container(
                  height: 450,
                  child: GridView(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                    scrollDirection: Axis.vertical,
                    children: [
                      FoodWidget("assets/images/Rectangle 9.png","Egg  friedrice","Indian food",150,size: 150,),
                      FoodWidget("assets/images/Rectangle 10.png","Fried chicken","Indian food",150,size: 150,),
                      FoodWidget("assets/images/Rectangle 12.png","Egg  friedrice","Indian food",150,size: 150,),
                      FoodWidget("assets/images/Rectangle 17360.png","Egg  friedrice","Indian food",150,size: 150,),
                      FoodWidget("assets/images/Mask Group 27.png","Egg  friedrice","Indian food",150,size: 150,),
                      FoodWidget("assets/images/Mask Group 28.png","Egg  friedrice","Indian food",150,size: 150,),

                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      appBar: PreferredSize(
        preferredSize: Size(400,70),
        child: Container(
          padding: EdgeInsets.fromLTRB(20,40,20,10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.arrow_back_ios),
                  Text("Almost famous",style: TextStyle(color: Constants.grey1,fontSize: 16),),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.search),
                  SizedBox(width: 7,),
                  Icon(Icons.notifications),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Container IconsRoundContainer(IconData icon) {
    return Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Constants.grey4
                        ),
                        padding: EdgeInsets.all(4),
                        child: Icon(icon),
                      );
  }
}

