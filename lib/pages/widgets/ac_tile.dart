import 'package:flutter/material.dart';

import 'package:bluestar_ac_app/models/ac_model.dart';

class AcTile extends StatefulWidget {
  final ACModel acData;

  const AcTile({
    super.key,
    required this.acData,
  });

  @override
  State<AcTile> createState() => _AcTileState();
}

class _AcTileState extends State<AcTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.pushNamed(context, '/acPage', arguments: widget.acData),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: BorderSide(color: Colors.grey.shade300),
      ),
      tileColor: widget.acData.serviceAlert ? Colors.red.shade100 : Colors.blue.shade100,
      trailing: Switch(
        value: widget.acData.isPowerOn,
        activeColor: Colors.green,
        inactiveThumbColor: Colors.red,
        onChanged: (value) {
          setState(() {
            widget.acData.isPowerOn = value;
          });
        },
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            Icons.location_on_outlined,
            color: Colors.purple,
            size: 24.0,
          ),
          SizedBox(width: 10,),
          Text(widget.acData.nickname),
        ],
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${widget.acData.temperature} °C',
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Energy consumption',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Text(
            widget.acData.energyStatus,
          )
        ],
      )
    );
  }
}