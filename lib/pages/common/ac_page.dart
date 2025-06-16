import 'package:bluestar_ac_app/models/ac_model.dart';
import 'package:flutter/material.dart';

class AcPage extends StatefulWidget {
  final ACModel acData;

  const AcPage({super.key, required this.acData});

  @override
  State<AcPage> createState() => _AcPageState();
}

class _AcPageState extends State<AcPage> {
  late ACModel acData;
  late TextEditingController temp;

  @override
  void initState() {
    super.initState();
    acData = widget.acData;
    temp = TextEditingController(text: acData.temperature.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      toolbarHeight: 40,
      actions: [
        Switch(
        value: acData.isPowerOn,
        activeColor: Colors.green,
        inactiveThumbColor: Colors.red,
        onChanged: (value) {
          setState(() {
            acData.isPowerOn = value;
          });
        },
      ),
      ],
    );
  }

  Widget _body() {
    return Padding(
      padding: EdgeInsets.all(15),
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _title(),
          SizedBox(height: 20,),
          _coreControls(),
        ],
      ),
    );
  }

  Widget _title() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          Icons.location_on_outlined,
          color: Colors.purple,
          size: 24.0,
        ),
        SizedBox(width: 10,),
        Text(
          acData.nickname,
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _coreControls() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _subtitle('Core Controls'),
        _temperatureEditor(),
      ],
    );
  }

  Widget _temperatureEditor() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Temperature'),
        IconButton(
          icon: Icon(Icons.remove),
          onPressed: () {
            if (acData.temperature > 10) setState(() => temp.text = (--acData.temperature).toString());
            print([temp.text, acData.temperature]);
          },
        ),
        SizedBox(
          width: 60,
          child: TextFormField(
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            controller: temp,
            onChanged: (val) {
              final t = int.tryParse(val);
              if (t != null && t >= 10 && t <= 25) setState(() => acData.temperature = t);
              print([temp.text, acData.temperature]);
            },
          ),
        ),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            if (acData.temperature < 25) setState(() => temp.text = (++acData.temperature).toString());
            print([temp.text, acData.temperature]);
          },
        ),
      ],
    );
  }

  Widget _subtitle(String subtitle) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(width: 30, child: Divider(thickness: 1,)),
        SizedBox(width: 10,),
        Text(subtitle, style: TextStyle(fontSize: 10),),
        SizedBox(width: 10,),
        Expanded(child: Divider(thickness: 1,)),
      ],
    );
  }
}