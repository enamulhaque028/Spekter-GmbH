import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OpenModalSheet extends StatefulWidget {
  @override
  OpenModalSheetState createState() => OpenModalSheetState();
}

class OpenModalSheetState extends State<OpenModalSheet> {
  List<Marker> myMarker = [];

  final coordinateController = TextEditingController();
  final nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    myMarker.add(
      Marker(
        markerId: MarkerId('myMarker'),
        draggable: false,
        position: LatLng(23.761694, 90.419091),
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (builder) {
              return SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  padding: EdgeInsets.only(
                    top: 10,
                    left: 10,
                    right: 10,
                    bottom: MediaQuery.of(context).viewInsets.bottom + 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Coordinates(lat,lng)',
                        ),
                        controller: coordinateController,
                        keyboardType: TextInputType.number,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Name',
                        ),
                        controller: nameController,
                      ),
                      RaisedButton(
                        color: Colors.purple,
                        child: Text('send'),
                        textColor: Colors.white,
                        onPressed: () {
                          print(coordinateController.text);
                          print(nameController.text);
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: LatLng(23.761694, 90.419091),
        zoom: 14.0,
      ),
      mapType: MapType.normal,
      markers: Set.from(myMarker),
    );
  }
}
