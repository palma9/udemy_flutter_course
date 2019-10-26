import 'package:flutter/material.dart';


class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}


class _SliderPageState extends State<SliderPage> {
  
  String _imgUrl = 'https://upload.wikimedia.org/wikipedia/en/8/87/Batman_DC_Comics.png';
  double _sliderVal = 150;
  bool _blockSlider = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Slider Page')),
      body: Container(
        padding: EdgeInsets.only(top: 15),
        child: Column(
          children: <Widget>[
            _createSlider(),
            _checkBox(),
            _createSwitch(),
            _setImage(),
          ],
        ),
      ),
    );
  }

  Widget _setImage() {
    return Expanded(
      child: FadeInImage(
        image: NetworkImage(_imgUrl),
        placeholder: AssetImage('data/img/jar-loading.gif'),
        fadeInDuration: Duration(milliseconds: 200),
        width: _sliderVal,
      )
    );
  }

  Widget _createSlider() {
    return Slider(
      min: 10,
      max: 400,
      value: _sliderVal,
      onChanged: (_blockSlider) ? null : (val) => setState(() => _sliderVal = val),
    );
  }

  Widget _checkBox() {
    return CheckboxListTile(
      title: Text('Block Slider'),
      value: _blockSlider,
      onChanged: (val) => setState(() => _blockSlider = val),
    );
  }

  Widget _createSwitch() {
    return SwitchListTile(
      title: Text('Block Slider'),
      value: _blockSlider,
      onChanged: (val) => setState(() => _blockSlider = val),
    );
  }
}