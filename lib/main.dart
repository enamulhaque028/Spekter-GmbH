import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Marker> myMarker = [];

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
              return Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Coordinates(lat and lng)',
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Name',
                      ),
                    ),
                    FlatButton(
                      child: Text('send'),
                      textColor: Colors.purple,
                      onPressed: () {},
                    )
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Maps'),
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(23.761694, 90.419091),
              zoom: 14.0,
            ),
            mapType: MapType.normal,
            markers: Set.from(myMarker),
          ),
        ),
      ),
    );
  }
}
