import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/provider_state_management/favourite/my_favourite.dart';
import 'package:todoey_flutter/provider_state_management/provider/favourite_provider.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  List<int> selectedItem = [];
  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourite App'),
        centerTitle:true,
        backgroundColor: Colors.purpleAccent,
        actions: [
          InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyFavouriteItemScreen()));
              },
              child: Icon(Icons.favorite)),
          SizedBox(width: 20,)
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 100,
                itemBuilder: (context, index){
              return Consumer<FavouriteItemProvider>(builder: (context,value,child){
                return ListTile(
                  onTap: (){
                    if(value.selectedItem.contains(index)){
                      value.removeItem(index);
                    }else{
                      value.addItem(index);
                    }
                  },
                  title: Text('item'+ index.toString()),
                  trailing: value.selectedItem.contains(index) ?Icon(Icons.favorite) : Icon(Icons.favorite_border_outlined),
                );
              });
            }),
          ),
        ],
      ),
    );
  }
}
