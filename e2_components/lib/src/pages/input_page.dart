import 'package:flutter/material.dart';


class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}


class _InputPageState extends State<InputPage> {
  
  String _name = '', 
    _email = '', 
    _pass = '',
    _phone = '',
    _date = '',
    _permission = '';

  List<String> _permissions = ['User', 'Manager', 'Moderator', 'Administrator'];

  TextEditingController _inputDateField = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input page'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        children:_formBody(context),
      ),
    );
  }

  List<Widget> _formBody(context) {
    return [
      _createInput(),
      Divider(),
      _createEmail(),
      Divider(),
      _createPass(),
      Divider(),
      _createPhone(),
      Divider(),
      _createDate(context),
      Divider(),
      _createDropdown(),
      Divider(),
      _createPerson(),
    ];
  }

  Widget _createInput() {
    return TextField(
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        // counter: Text('Characters ${_name.length}'),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        labelText: 'Name',
        // helperText: 'Only name and surname',
        icon: Icon(Icons.face),
        suffixIcon: Icon(Icons.accessibility_new),
      ),
      onChanged: (val) => setState(() => _name  = val),
    );
  }

  Widget _createEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        labelText: 'Email',
        icon: Icon(Icons.email),
        suffixIcon: Icon(Icons.alternate_email),
      ),
      onChanged: (val) => setState(() => _email  = val),
    );
  }

  Widget _createPass() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        labelText: 'Password',
        icon: Icon(Icons.lock),
        suffixIcon: Icon(Icons.remove_red_eye),
      ),
      onChanged: (val) => setState(() => _pass  = val),
    );
  }

  Widget _createPhone() {
    return TextField(
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        labelText: 'Phone number',
        icon: Icon(Icons.phone),
        suffixIcon: Icon(Icons.phone_android),
      ),
      onChanged: (val) => setState(() => _phone  = val),
    );
  }

  Widget _createDate(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputDateField,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        labelText: 'Birthday',
        icon: Icon(Icons.calendar_today),
        suffixIcon: Icon(Icons.perm_contact_calendar),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        _selectDate(context);
      },
    );
  }

  void _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      locale: Locale('es', 'ES')
    );

    if (picked != null) {
      setState(() {
        _date = picked.toString();
        _inputDateField.text = _date;
      });
    }
  }

  Widget _createDropdown() {
    return Row(
      children: <Widget>[
        Icon(Icons.security),
        SizedBox(width: 30),
        DropdownButton(
          items: _getDropdownOptions(),
          onChanged: (opt) => setState(() => _permission = opt),
          value: _permission,  
        ),
      ],
    );
  }

  List<DropdownMenuItem<String>> _getDropdownOptions() {
    List<DropdownMenuItem<String>> list = List();
    _permissions.forEach((p) => list.add(DropdownMenuItem(child: Text(p), value: p)));
    return list;
  }

  Widget _createPerson() {
    return ListTile(
      title: Text('Name: $_name'),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text('Email: $_email'),
          Text('Pass: $_pass'),
          Text('Phone: $_phone'),
          Text('Birthday: $_date'),
          Text('Permission: $_permission')

        ],
      ),
    );
  }

}