import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:ribeirinhas/mina_de_orada.dart';
import 'package:ribeirinhas/s_m_campo_es.dart';
import 'package:ribeirinhas/telheiro_es.dart';
import 'package:ribeirinhas/v_fresno_es.dart';
import 'FerreiraCapelins_es.dart';
import 'alconchel_es.dart';
import 'alqueva_es.dart';
import 'amieira_es.dart';
import 'campinho_es.dart';
import 'cheles_es.dart';
import 'estrela_es.dart';
import 'granja_es.dart';
import 'juromenha_es.dart';
import 'luz_es.dart';
import 'marmelar_es.dart';
import 'monsaraz_es.dart';
import 'monte_de_trigo_es.dart';
import 'p_alentejo_es.dart';
import 'p_s_miguel_es.dart';
import 'package:geolocator/geolocator.dart';

class CustomInfoWindowExampleES extends StatefulWidget {
  @override
  _CustomInfoWindowExampleStateES createState() =>
      _CustomInfoWindowExampleStateES();
}

class _CustomInfoWindowExampleStateES extends State<CustomInfoWindowExampleES> {
  CustomInfoWindowController _customInfoWindowController =
  CustomInfoWindowController();

  final LatLng _latLng = LatLng(38.438566552447476, -7.3706991262788755);
  final double _zoom = 9.0;
  late Position currentPosition;
  var geoLocator = Geolocator();

  @override
  void dispose() {
    _customInfoWindowController.dispose();
    super.dispose();
  }

  void locatePosition() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    currentPosition = position;

    LatLng latLngPosition = LatLng(position.latitude, position.longitude);
    CameraPosition cameraPosition = new CameraPosition(target: latLngPosition, zoom: 14);
  }

  Set<Marker> markers = new Set();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Stack(
        children: <Widget>[
          GoogleMap(
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
            onTap: (position) {
              _customInfoWindowController.hideInfoWindow!();
            },
            onCameraMove: (position) {
              _customInfoWindowController.onCameraMove!();
            },
            onMapCreated: (GoogleMapController controller) async {
              _customInfoWindowController.googleMapController = controller;
              controller.setMapStyle(Utils.mapStyle);
            },
            markers: getmarkers(),
            initialCameraPosition: CameraPosition(
              target: _latLng,
              zoom: _zoom,
            ),
          ),
          CustomInfoWindow(
            controller: _customInfoWindowController,
            height: 60,
            width: 220,
            offset: 20,
          ),
        ],
      ),
    );
  }

  Set<Marker> getmarkers() {
    //markers to place on map
    setState(() {
      //Alconchel
      markers.add(
        Marker(
          markerId: MarkerId("Alconchel"),
          position: LatLng(38.517037089251914, -7.070084680349893),
          onTap: () {
            _customInfoWindowController.addInfoWindow!(
              Container(
                child: Column(
                  children: [
                    InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Color.fromRGBO(129, 195, 215, 1),
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundImage:
                              AssetImage('assets/alconchel.jpg'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                            ),
                            Expanded(
                                child: Container(
                                  child: Text(
                                    "Alconchel",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Color.fromRGBO(129, 195, 215, 1),
                                        fontFamily: 'Metropolis',
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
                            Padding(
                              padding: const EdgeInsets.only(right: 25),
                            ),
                          ],
                        ),
                      ),
                      onTap: () => {
                        Navigator.pop(context),
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AlconchelES(),
                          ),
                        ),
                      },
                    ),
                  ],
                ),
              ),
              LatLng(38.517037089251914, -7.070084680349893),
            );
          },
        ),
      );

      //Aldeia da Luz
      markers.add(
        Marker(
          markerId: MarkerId("Aldeia da Luz"),
          position: LatLng(38.36982346574503, -7.471858586041335),
          onTap: () {
            _customInfoWindowController.addInfoWindow!(
              Container(
                child: Column(
                  children: [
                    InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Color.fromRGBO(129, 195, 215, 1),
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundImage: AssetImage('assets/luz.jpg'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                            ),
                            Expanded(
                              child: Container(
                                child: Text(
                                  "Aldeia da Luz",
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Color.fromRGBO(129, 195, 215, 1),
                                      fontFamily: 'Metropolis',
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 25),
                            ),
                          ],
                        ),
                      ),
                      onTap: () => {
                        Navigator.pop(context),
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LuzES(),
                          ),
                        ),
                      },
                    ),
                  ],
                ),
              ),
              LatLng(38.36982346574503, -7.471858586041335),
            );
          },
        ),
      );

      //Alqueva
      markers.add(
        Marker(
          markerId: MarkerId("Alqueva"),
          position: LatLng(38.22213146186269, -7.53788167364515),
          onTap: () {
            _customInfoWindowController.addInfoWindow!(
              Container(
                child: Column(
                  children: [
                    InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Color.fromRGBO(129, 195, 215, 1),
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundImage: AssetImage('assets/alqueva.jpg'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                            ),
                            Expanded(
                              child: Container(
                                child: Text(
                                  "Alqueva",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Color.fromRGBO(129, 195, 215, 1),
                                      fontFamily: 'Metropolis',
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 35),
                            ),
                          ],
                        ),
                      ),
                      onTap: () => {
                        Navigator.pop(context),
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AlquevaES(),
                          ),
                        ),
                      },
                    ),
                  ],
                ),
              ),
              LatLng(38.22213146186269, -7.53788167364515),
            );
          },
        ),
      );

      //Amieira
      markers.add(
        Marker(
          markerId: MarkerId("Amieira"),
          position: LatLng(38.30524741650808, -7.589860692134267),
          onTap: () {
            _customInfoWindowController.addInfoWindow!(
              Container(
                child: Column(
                  children: [
                    InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Color.fromRGBO(129, 195, 215, 1),
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundImage: AssetImage('assets/amieira.jpg'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                            ),
                            Expanded(
                              child: Container(
                                child: Text(
                                  "Amieira",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Color.fromRGBO(129, 195, 215, 1),
                                      fontFamily: 'Metropolis',
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 40),
                            ),
                          ],
                        ),
                      ),
                      onTap: () => {
                        Navigator.pop(context),
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AmieiraES(),
                          ),
                        ),
                      },
                    ),
                  ],
                ),
              ),
              LatLng(38.30524741650808, -7.589860692134267),
            );
          },
        ),
      );

      //Campinho
      markers.add(
        Marker(
          markerId: MarkerId("Campinho"),
          position: LatLng(38.36982346574503, -7.471858586041335),
          onTap: () {
            _customInfoWindowController.addInfoWindow!(
              Container(
                child: Column(
                  children: [
                    InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Color.fromRGBO(129, 195, 215, 1),
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundImage:
                              AssetImage('assets/campinho.jpg'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                            ),
                            Expanded(
                              child: Container(
                                child: Text(
                                  "Campinho",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Color.fromRGBO(129, 195, 215, 1),
                                      fontFamily: 'Metropolis',
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 35),
                            ),
                          ],
                        ),
                      ),
                      onTap: () => {
                        Navigator.pop(context),
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CampinhoES(),
                          ),
                        ),
                      },
                    ),
                  ],
                ),
              ),
              LatLng(38.36982346574503, -7.471858586041335),
            );
          },
        ),
      );

      //Cheles
      markers.add(
        Marker(
          markerId: MarkerId("Cheles"),
          position: LatLng(38.51293831204829, -7.28115826939133),
          onTap: () {
            _customInfoWindowController.addInfoWindow!(
              Container(
                child: Column(
                  children: [
                    InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Color.fromRGBO(129, 195, 215, 1),
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: CircleAvatar(
                                radius: 20,
                                backgroundImage:
                                AssetImage('assets/cheles.jpg'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                            ),
                            Expanded(
                              child: Container(
                                child: Text(
                                  "Cheles",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Color.fromRGBO(129, 195, 215, 1),
                                      fontFamily: 'Metropolis',
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 35),
                            ),
                          ],
                        ),
                      ),
                      onTap: () => {
                        Navigator.pop(context),
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChelesES(),
                          ),
                        ),
                      },
                    ),
                  ],
                ),
              ),
              LatLng(38.51293831204829, -7.28115826939133),
            );
          },
        ),
      );

      //Estrela
      markers.add(
        Marker(
          markerId: MarkerId("Estrela"),
          position: LatLng(38.267137520025784, -7.383290028838811),
          onTap: () {
            _customInfoWindowController.addInfoWindow!(
              Container(
                child: Column(
                  children: [
                    InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Color.fromRGBO(129, 195, 215, 1),
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundImage: AssetImage('assets/estrela.jpg'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                            ),
                            Expanded(
                              child: Container(
                                child: Text(
                                  "Estrela",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Color.fromRGBO(129, 195, 215, 1),
                                      fontFamily: 'Metropolis',
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 35),
                            ),
                          ],
                        ),
                      ),
                      onTap: () => {
                        Navigator.pop(context),
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EstrelaES(),
                          ),
                        ),
                      },
                    ),
                  ],
                ),
              ),
              LatLng(38.267137520025784, -7.383290028838811),
            );
          },
        ),
      );

      //Ferreira de Capelins
      markers.add(
        Marker(
          markerId: MarkerId("Ferreira de Capelins"),
          position: LatLng(38.566966366925705, -7.358557595763317),
          onTap: () {
            _customInfoWindowController.addInfoWindow!(
              Container(
                child: Column(
                  children: [
                    InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Color.fromRGBO(129, 195, 215, 1),
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundImage:
                              AssetImage('assets/capelins.jpg'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                            ),
                            Flexible(
                              child: new Container(
                                child: Text(
                                  "Ferreira de Capelins",
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Color.fromRGBO(129, 195, 215, 1),
                                      fontFamily: 'Metropolis',
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () => {
                        Navigator.pop(context),
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FerreiraCapelinsES(),
                          ),
                        ),
                      },
                    ),
                  ],
                ),
              ),
              LatLng(38.566966366925705, -7.358557595763317),
            );
          },
        ),
      );

      //Granja
      markers.add(
        Marker(
          markerId: MarkerId("Granja"),
          position: LatLng(38.3026136731115, -7.255894528439062),
          onTap: () {
            _customInfoWindowController.addInfoWindow!(
              Container(
                child: Column(
                  children: [
                    InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Color.fromRGBO(129, 195, 215, 1),
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundImage: AssetImage('assets/granja.jpg'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                            ),
                            Expanded(
                              child: Container(
                                child: Text(
                                  "Granja",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Color.fromRGBO(129, 195, 215, 1),
                                      fontFamily: 'Metropolis',
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 40),
                            ),
                          ],
                        ),
                      ),
                      onTap: () => {
                        Navigator.pop(context),
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GranjaES(),
                          ),
                        ),
                      },
                    ),
                  ],
                ),
              ),
              LatLng(38.3026136731115, -7.255894528439062),
            );
          },
        ),
      );

      //Marmelar
      markers.add(
        Marker(
          markerId: MarkerId("Marmelar"),
          position: LatLng(38.17180833726715, -7.6534384246781135),
          onTap: () {
            _customInfoWindowController.addInfoWindow!(
              Container(
                child: Column(
                  children: [
                    InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Color.fromRGBO(129, 195, 215, 1),
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundImage:
                              AssetImage('assets/marmelar.jpg'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                            ),
                            Expanded(
                              child: Container(
                                child: Text(
                                  "Marmelar",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Color.fromRGBO(129, 195, 215, 1),
                                      fontFamily: 'Metropolis',
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 35),
                            ),
                          ],
                        ),
                      ),
                      onTap: () => {
                        Navigator.pop(context),
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MarmelarES(),
                          ),
                        ),
                      },
                    ),
                  ],
                ),
              ),
              LatLng(38.17180833726715, -7.6534384246781135),
            );
          },
        ),
      );

      //Mina da Orada
      markers.add(
        Marker(
          markerId: MarkerId("Mina da Orada"),
          position: LatLng(38.108311663915686, -7.595361379781079),
          onTap: () {
            _customInfoWindowController.addInfoWindow!(
              Container(
                child: Column(
                  children: [
                    InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Color.fromRGBO(129, 195, 215, 1),
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundImage: AssetImage('assets/orada.jpg'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                            ),
                            Expanded(
                              child: new Container(
                                child: Text(
                                  "Mina da Orada",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Color.fromRGBO(129, 195, 215, 1),
                                      fontFamily: 'Metropolis',
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 25),
                            ),
                          ],
                        ),
                      ),
                      onTap: () => {
                        Navigator.pop(context),
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MinaDeOrada(),
                          ),
                        ),
                      },
                    ),
                  ],
                ),
              ),
              LatLng(38.108311663915686, -7.595361379781079),
            );
          },
        ),
      );

      //Monte de Trigo
      markers.add(
        Marker(
          markerId: MarkerId("Monte de Trigo"),
          position: LatLng(38.40038810312174, -7.7139073554429425),
          onTap: () {
            _customInfoWindowController.addInfoWindow!(
              Container(
                child: Column(
                  children: [
                    InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Color.fromRGBO(129, 195, 215, 1),
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundImage: AssetImage('assets/trigo.jpg'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                            ),
                            Expanded(
                              child: Container(
                                child: Text(
                                  "Monte de Trigo",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Color.fromRGBO(129, 195, 215, 1),
                                      fontFamily: 'Metropolis',
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 15),
                            ),
                          ],
                        ),
                      ),
                      onTap: () => {
                        Navigator.pop(context),
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MonteDeTrigoES(),
                          ),
                        ),
                      },
                    ),
                  ],
                ),
              ),
              LatLng(38.40038810312174, -7.7139073554429425),
            );
          },
        ),
      );

      //Pedrógão de Alentejo
      markers.add(
        Marker(
          markerId: MarkerId("Pedrógão de Alentejo"),
          position: LatLng(38.125759450324544, -7.647595887033241),
          onTap: () {
            _customInfoWindowController.addInfoWindow!(
              Container(
                child: Column(
                  children: [
                    InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Color.fromRGBO(129, 195, 215, 1),
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundImage:
                              AssetImage('assets/pedrogao.jpg'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                            ),
                            Flexible(
                              child: new Container(
                                child: Text(
                                  "Pedrógão de Alentejo",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Color.fromRGBO(129, 195, 215, 1),
                                      fontFamily: 'Metropolis',
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () => {
                        Navigator.pop(context),
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PAlentejoES(),
                          ),
                        ),
                      },
                    ),
                  ],
                ),
              ),
              LatLng(38.125759450324544, -7.647595887033241),
            );
          },
        ),
      );

      //Póvoa de S.Miguel
      markers.add(
        Marker(
          markerId: MarkerId("Póvoa de S.Miguel"),
          position: LatLng(38.22450050546414, -7.3385700463265335),
          onTap: () {
            _customInfoWindowController.addInfoWindow!(
              Container(
                child: Column(
                  children: [
                    InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Color.fromRGBO(129, 195, 215, 1),
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundImage: AssetImage('assets/povoa.jpg'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                            ),
                            Flexible(
                              child: new Container(
                                child: Text(
                                  "Póvoa de S.Miguel",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Color.fromRGBO(129, 195, 215, 1),
                                      fontFamily: 'Metropolis',
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () => {
                        Navigator.pop(context),
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PSMiguelES(),
                          ),
                        ),
                      },
                    ),
                  ],
                ),
              ),
              LatLng(38.22450050546414, -7.3385700463265335),
            );
          },
        ),
      );

      //São Marcos do Campo
      markers.add(
        Marker(
          markerId: MarkerId("São Marcos do Campo"),
          position: LatLng(38.34766041367693, -7.502352129118966),
          onTap: () {
            _customInfoWindowController.addInfoWindow!(
              Container(
                child: Column(
                  children: [
                    InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Color.fromRGBO(129, 195, 215, 1),
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundImage: AssetImage('assets/campo.jpg'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                            ),
                            Flexible(
                              child: new Container(
                                child: Text(
                                  "São Marcos do Campo",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Color.fromRGBO(129, 195, 215, 1),
                                      fontFamily: 'Metropolis',
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () => {
                        Navigator.pop(context),
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SMCampoES(),
                          ),
                        ),
                      },
                    ),
                  ],
                ),
              ),
              LatLng(38.34766041367693, -7.502352129118966),
            );
          },
        ),
      );

      //Vila de Juromenha
      markers.add(
        Marker(
          markerId: MarkerId("Vila de Juromenha"),
          position: LatLng(38.74065009623554, -7.238265471929976),
          onTap: () {
            _customInfoWindowController.addInfoWindow!(
              Container(
                child: Column(
                  children: [
                    InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Color.fromRGBO(129, 195, 215, 1),
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundImage:
                              AssetImage('assets/juromenha.jpg'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                            ),
                            Expanded(
                              child: Container(
                                child: Text(
                                  "Juromenha",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Color.fromRGBO(129, 195, 215, 1),
                                      fontFamily: 'Metropolis',
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 30),
                            ),
                          ],
                        ),
                      ),
                      onTap: () => {
                        Navigator.pop(context),
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => JuromenhaES(),
                          ),
                        ),
                      },
                    ),
                  ],
                ),
              ),
              LatLng(38.74065009623554, -7.238265471929976),
            );
          },
        ),
      );

      //Villanueva del Fresno
      markers.add(
        Marker(
          markerId: MarkerId("Villanueva del Fresno"),
          position: LatLng(38.37534552752282, -7.167242070275673),
          onTap: () {
            _customInfoWindowController.addInfoWindow!(
              Container(
                child: Column(
                  children: [
                    InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Color.fromRGBO(129, 195, 215, 1),
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundImage:
                              AssetImage('assets/villanueva.jpg'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                            ),
                            Flexible(
                              child: new Container(
                                child: Text(
                                  "Villanueva del Fresno",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Color.fromRGBO(129, 195, 215, 1),
                                      fontFamily: 'Metropolis',
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () => {
                        Navigator.pop(context),
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VFresnoES(),
                          ),
                        ),
                      },
                    ),
                  ],
                ),
              ),
              LatLng(38.37534552752282, -7.167242070275673),
            );
          },
        ),
      );

      //Telheiro
      markers.add(
        Marker(
          markerId: MarkerId("Telheiro"),
          position: LatLng(38.45522354971223, -7.381812499463081),
          onTap: () {
            _customInfoWindowController.addInfoWindow!(
              Container(
                child: Column(
                  children: [
                    InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Color.fromRGBO(129, 195, 215, 1),
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundImage:
                              AssetImage('assets/telheiro.jpg'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                            ),
                            Expanded(
                              child: Container(
                                child: Text(
                                  "Telheiro",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Color.fromRGBO(129, 195, 215, 1),
                                      fontFamily: 'Metropolis',
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 35),
                            ),
                          ],
                        ),
                      ),
                      onTap: () => {
                        Navigator.pop(context),
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TelheiroES(),
                          ),
                        ),
                      },
                    ),
                  ],
                ),
              ),
              LatLng(38.45522354971223, -7.381812499463081),
            );
          },
        ),
      );

      //Monsaraz
      markers.add(
        Marker(
          markerId: MarkerId("Monsaraz"),
          position: LatLng(38.444683758951285, -7.377536406606385),
          onTap: () {
            _customInfoWindowController.addInfoWindow!(
              Container(
                child: Column(
                  children: [
                    InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Color.fromRGBO(129, 195, 215, 1),
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundImage:
                              AssetImage('assets/monsaraz.jpg'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                            ),
                            Expanded(
                              child: Container(
                                child: Text(
                                  "Monsaraz",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Color.fromRGBO(129, 195, 215, 1),
                                      fontFamily: 'Metropolis',
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 35),
                            ),
                          ],
                        ),
                      ),
                      onTap: () => {
                        Navigator.pop(context),
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MonsarazES(),
                          ),
                        ),
                      },
                    ),
                  ],
                ),
              ),
              LatLng(38.444683758951285, -7.377536406606385),
            );
          },
        ),
      );

      //add more markers here
    });

    return markers;
  }
}

class Utils {
  static String mapStyle = '''[
  {
    "featureType": "administrative",
    "elementType": "geometry",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "administrative.country",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "administrative.country",
    "elementType": "geometry.stroke",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "administrative.land_parcel",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "administrative.neighborhood",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "administrative.province",
    "elementType": "geometry.stroke",
    "stylers": [
      {
        "color": "#000000"
      },
      {
        "visibility": "simplified"
      }
    ]
  },
  {
    "featureType": "administrative.province",
    "elementType": "labels.text",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "landscape.natural",
    "elementType": "geometry.fill",
    "stylers": [
      {
        "color": "#c4d76d"
      }
    ]
  },
  {
    "featureType": "poi",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "labels.text",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "labels",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "labels.icon",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "road.arterial",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "labels",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "road.local",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "transit",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "water",
    "stylers": [
      {
        "color": "#81c3d7"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "labels.text",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  }
] ''';
}
