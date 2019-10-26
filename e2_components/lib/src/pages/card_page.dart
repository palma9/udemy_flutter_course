import 'package:flutter/material.dart';


class CardPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: _cardList(),
      ),
    );
  }

  Widget _cardType1() {
    return Card(
      elevation: 4,
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue),
            title: Text('Title of this card'),
            subtitle: Text('Lorem ipsum dolor sit amet consectetur adipiscing elit venenatis, vitae magna magnis libero accumsan orci mauris suscipit, diam commodo vestibulum...'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text('Cancel'),
                onPressed: () {},
              ),
              FlatButton(
                child: Text('Accept'),
                onPressed: () {},
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _cardType2() {
    return Card(
      elevation: 4,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage('https://static.photocdn.pt/images/articles/2018/03/09/articles/2017_8/landscape_photography.jpg'),
            placeholder: AssetImage('data/img/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 290,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text('This is a beautiful place'), 
          ),
        ],
      ),
    );
  }

  List<Widget> _cardList() {
    List<Widget> list = List<Widget>();
    for (var i = 0; i < 6; i++) {
      list..add(_cardType1())
          ..add(SizedBox(height: 10))
          ..add(_cardType2())
          ..add(SizedBox(height: 10));
    }
    return list;
  }

}
