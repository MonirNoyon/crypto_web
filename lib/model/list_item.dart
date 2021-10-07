import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ListItem extends StatefulWidget{

  List<String>listItems;
  String headerTitle;

  ListItem(this.headerTitle,this.listItems);

  @override
  State<StatefulWidget>createState()
  {
    return ListItemState();
  }
}
class ListItemState extends State<ListItem>
{
  bool isExpand=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isExpand=false;
  }
  @override
  Widget build(BuildContext context) {
    List<String>listItem=this.widget.listItems;
    return  Padding(
      padding: (isExpand==true)?const EdgeInsets.all(8.0):const EdgeInsets.all(8.0),
      child: Container(
        decoration:BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  HexColor("#8575EF"),
                  HexColor("#A0C1FC"),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight
            ),
            borderRadius: (isExpand!=true)?BorderRadius.all(Radius.circular(8)):BorderRadius.all(Radius.circular(8)),
            border: Border.all(color: Colors.white)
        ),
        child: ExpansionTile(
          key: PageStorageKey<String>(this.widget.headerTitle),
          title: Container(
              width: double.infinity,
              child: Text(this.widget.headerTitle,style: TextStyle(fontSize: (isExpand!=true)?18:22),)),
          trailing: (isExpand==true)?Icon(Icons.arrow_drop_down,size: 32,color: Colors.pink,):Icon(Icons.arrow_drop_up,size: 32,color: Colors.pink),
          onExpansionChanged: (value){
            setState(() {
              isExpand=value;
            });
          },
          children: [
            for(final item in listItem)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: (){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.pink,duration:Duration(microseconds: 500),content: Text("Selected Item $item "+this.widget.headerTitle )));
                  },
                  child: Container(
                      width: double.infinity,
                      decoration:BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          border: Border.all(color: Colors.pinkAccent)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(item,style: TextStyle(color: Colors.white),),
                      )),
                ),
              )


          ],

        ),
      ),
    );
  }
}