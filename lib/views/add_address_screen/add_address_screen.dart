import 'dart:async';

import 'package:flutter/material.dart';
import 'package:together_forever/shared/size_config.dart';
import 'package:together_forever/widgets/custom_elevated_button.dart';
import 'package:together_forever/widgets/custom_text.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({Key? key}) : super(key: key);
  static const routeName = '/addAddress';

  @override
  _AddAddressScreenState createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  final _formKey = GlobalKey<FormState>();
  final Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.transparent,
        //centerTitle: true,
        title: const CustomText(
          text: 'ADD ADDRESS',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          //alignment: Alignment.center,
          color: Colors.white,
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              googleMapsSection(context),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  maxLines: 3,
                  decoration: const InputDecoration(
                    labelText: 'Full Address *',
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                  ),
                  validator: (String? val) {
                    if (val!.isEmpty) return 'Enter full address, please.';
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Building Num and Floor *',
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                  ),
                  validator: (String? val) {
                    if (val!.isEmpty) {
                      return 'Enter building num and floor, please.';
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CustomElevatedButton(
                  text: 'Submit',
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) return;
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  SizedBox googleMapsSection(BuildContext context) {
    return SizedBox(
      height: 250,
      width: SizeConfig.screenWidth,
      child: GoogleMap(
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
