// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location_permissions/location_permissions.dart';
import 'package:location/location.dart' as loc;



class AnimateCamera extends StatefulWidget {

  double lat,long;
  AnimateCamera(double lat,double long) {
    this.lat = lat;
    this.long = long;
  }

  @override
  State createState() => AnimateCameraState(this.lat,this.long);
}

class AnimateCameraState extends State<AnimateCamera> {
  GoogleMapController mapController;

  var currentLocation = loc.LocationData;

  var location = new loc.Location();

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  MarkerId selectedMarker;
  int _markerIdCounter = 1;


  double lat,long;

  AnimateCameraState(double lat,double long) {
    this.lat = lat;
    this.long = long;
  }


  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    setMap();
  }

  @override
  void initState() {
    askPermission();
    location.onLocationChanged().listen((loc.LocationData currentLocation) {
    setState(() {
      lat = currentLocation.latitude;
      long = currentLocation.longitude;
  
      });
    });
  }


  void askPermission() async {
    PermissionStatus permission = await LocationPermissions().requestPermissions();
  }

  void setMap() {
    print(lat);
    print(long);
    mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          bearing: 270.0,
          target: LatLng(lat,long),
          tilt: 40.0,
          zoom:10.0
        )
      )
    );
  }

  Future<bool> Function() onWill() {
    Navigator.pop(context);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Center(
            child: SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              child: GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition:
                    const CameraPosition(target: LatLng(13.0,77.0)),
                
              ),
            ),
          ),
        ],
      ),
      );
  }
}
