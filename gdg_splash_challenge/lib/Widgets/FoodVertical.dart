import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gdg_mahmoud_bensfia/Config/Constants.dart';

class FoodWidget extends StatefulWidget{
  String imagePath,label,description;
  int prix;
  bool des;
  double size;
  FoodWidget(this.imagePath, this.label, this.description, this.prix,{this.des=true,this.size=110});

  @override
  _FoodWidgetState createState() => _FoodWidgetState();
}

class _FoodWidgetState extends State<FoodWidget> {



  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.symmetric(vertical: 5,horizontal: 3),
      padding: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [BoxShadow(
              blurRadius: 3,
              color: Colors.grey[400],
              offset: Offset(0,3)
          )]
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            margin: EdgeInsets.only(right: 8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(widget.imagePath,height: 70,width: widget.size,fit: BoxFit.fill,),
            ),
          ),
          Text(widget.label,style: TextStyle(fontWeight: FontWeight.w700,),),
          widget.des?Text("${widget.description}",style: TextStyle(color: Colors.grey[500],fontSize: 12,),maxLines: 3,overflow: TextOverflow.ellipsis,):SizedBox(height: 0,),
          Container(
            padding: EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${widget.prix} DA",style: TextStyle(color: Constants.orange,fontSize: 13,fontWeight: FontWeight.w600,),textAlign: TextAlign.center,),
                Icon(Icons.add_circle_outline,color: Constants.orange,size: 13,)
              ],
            ),
          )
        ],
      ),
    );
  }
}
