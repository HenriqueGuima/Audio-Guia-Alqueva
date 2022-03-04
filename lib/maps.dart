import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ribeirinhas/BottomSheetRoutes/Alconchel.dart';
import 'package:ribeirinhas/BottomSheetRoutes/AldeiaDaLuz.dart';
import 'package:ribeirinhas/BottomSheetRoutes/Alqueva.dart';
import 'package:ribeirinhas/BottomSheetRoutes/Amieira.dart';
import 'package:ribeirinhas/BottomSheetRoutes/Campinho.dart';
import 'package:ribeirinhas/BottomSheetRoutes/Cheles.dart';
import 'package:ribeirinhas/BottomSheetRoutes/Estrela.dart';
import 'package:ribeirinhas/BottomSheetRoutes/FerreiraDeCapelins.dart';
import 'package:ribeirinhas/BottomSheetRoutes/Granja.dart';
import 'package:ribeirinhas/BottomSheetRoutes/Juromenha.dart';
import 'package:ribeirinhas/BottomSheetRoutes/Marmelar.dart';
import 'package:ribeirinhas/BottomSheetRoutes/MinaOrada.dart';
import 'package:ribeirinhas/BottomSheetRoutes/Monsaraz.dart';
import 'package:ribeirinhas/BottomSheetRoutes/MonteDeTrigo.dart';
import 'package:ribeirinhas/BottomSheetRoutes/PedrogaoDeAlentejo.dart';
import 'package:ribeirinhas/BottomSheetRoutes/PovoaDeSaoMiguel.dart';
import 'package:ribeirinhas/BottomSheetRoutes/SaoMarcosDoCampo.dart';
import 'package:ribeirinhas/BottomSheetRoutes/Telheiro.dart';
import 'package:ribeirinhas/BottomSheetRoutes/Villanueva.dart';
import 'package:ribeirinhas/BottomSheetRoutes/Villarreal.dart';
import 'package:ribeirinhas/user.dart';
import 'package:ribeirinhas/user_form_widget.dart';
import 'package:ribeirinhas/user_sheets_api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'infowindow.dart';
import 'main.dart';
import 'main_es.dart';
import 'package:android_intent_plus/android_intent.dart';
import 'package:platform/platform.dart';
import 'openapps.dart';


class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    Key? key,
    required this.text,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
    style: ElevatedButton.styleFrom(
      primary: Color.fromRGBO(196, 215, 109, 1.0),
      elevation: 0.0,
      shape: new RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(50),
      ),
    ),
    child: FittedBox(
      child: Text(text),
    ),
    onPressed: onClicked,
  );
}

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserSheetsApi.init();
  runApp(MaterialApp(debugShowCheckedModeBanner:false,home: Mapas()));
}
//void main() => runApp(MyApp());

class Mapas extends StatefulWidget {
  @override
  _MapasState createState() => _MapasState();
}

class _MapasState extends State<Mapas> {
  late GoogleMapController mapController;
  final keyIsFirstLoaded = 'is_first_loaded';


  //final LatLng _center = const LatLng(38.438566552447476, -7.3706991262788755);

  /*
  @override
  void initState() {
    super.initState();
    aldeias.add(
      Marker(
        markerId: MarkerId('Alqueva'),
        draggable: false,
        onTap: () {
          print('ola ola');
        },
        position: LatLng(38.2259335,-7.6161582,12),
      ),
    );
  }*/

  /*static const _centerCamera = CameraPosition(
    target: LatLng(38.681895, -7.354427),
    zoom: 11.0,
  );*/

  /*void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    controller.setMapStyle(Utils.mapStyle);
  }*/

  // ignore: public_member_api_docs
  static const String routeName = '/explicitIntents';

  void _displaySpotify() {
    final intent = AndroidIntent(
        action: 'action_view',
        data: Uri.encodeFull(
            'https://open.spotify.com/show/0zowOGk3t0DUFGwOC3n2cH'),
        package: 'com.android.spotify');
    intent.launch();
  }

  void _openATLA() {
    final AndroidIntent intent = AndroidIntent(
        action: 'action_view',
        data: Uri.encodeFull('http://www.at-lagoalqueva.eu/'),
        package: 'com.android.chrome');
    intent.launch();
  }

  void _openRDC() {
    final AndroidIntent intent = AndroidIntent(
        action: 'action_view',
        data: Uri.encodeFull('http://www.rdc-la2020.eu/'),
        package: 'com.android.chrome');
    intent.launch();
  }

  CustomInfoWindowController _customInfoWindowController =
  CustomInfoWindowController();

  @override
  void dispose() {
    _customInfoWindowController.dispose();
    super.dispose();
  }

  Set<Marker> _markers = {};

  List<Marker> aldeias = [
    Marker(
      markerId: MarkerId('Alqueva'),
      draggable: false,
      onTap: () {
        print('Alqueva');
        BottomSheet();
      },
      position: LatLng(38.22213146186269, -7.53788167364515),
    ),
    Marker(
      markerId: MarkerId('Campinho'),
      draggable: false,
      onTap: () {
        print('Campinho');
      },
      infoWindow: InfoWindow(title: 'Campinho'),
      position: LatLng(38.36982346574503, -7.471858586041335),
    ),
    Marker(
      markerId: MarkerId('Amieira'),
      draggable: false,
      onTap: () {
        print('Amieira');
      },
      infoWindow: InfoWindow(title: 'Amieira'),
      position: LatLng(38.30524741650808, -7.589860692134267),
    ),
    Marker(
      markerId: MarkerId('Granja'),
      draggable: false,
      onTap: () {
        print('Granja');
      },
      infoWindow: InfoWindow(title: 'Granja'),
      position: LatLng(38.3026136731115, -7.255894528439062),
    ),
    Marker(
      markerId: MarkerId('Alconchel'),
      draggable: false,
      onTap: () {
        print('Alconchel');
      },
      infoWindow: InfoWindow(title: 'Alconchel'),
      position: LatLng(38.517037089251914, -7.070084680349893),
    ),
    Marker(
      markerId: MarkerId('Cheles'),
      draggable: false,
      onTap: () {
        print('Cheles');
      },
      infoWindow: InfoWindow(title: 'Cheles'),
      position: LatLng(38.51293831204829, -7.28115826939133),
    ),
    Marker(
      markerId: MarkerId('Estrela'),
      draggable: false,
      onTap: () {
        print('Estrela');
      },
      infoWindow: InfoWindow(title: 'Estrela'),
      position: LatLng(38.267137520025784, -7.383290028838811),
    ),
    Marker(
      markerId: MarkerId('Ferreira de Capelins'),
      draggable: false,
      onTap: () {
        print('Ferreira de Capelins');
      },
      infoWindow: InfoWindow(title: 'Ferreira de Capelins'),
      position: LatLng(38.566966366925705, -7.358557595763317),
    ),
    Marker(
      markerId: MarkerId('Marmelar'),
      draggable: false,
      onTap: () {
        print('Marmelar');
      },
      infoWindow: InfoWindow(title: 'Marmelar'),
      position: LatLng(38.17180833726715, -7.6534384246781135),
    ),
    Marker(
      markerId: MarkerId('Mina de Orada'),
      draggable: false,
      onTap: () {
        print('Mina de Orada');
      },
      infoWindow: InfoWindow(title: 'Mina de Orada'),
      position: LatLng(38.108311663915686, -7.595361379781079),
    ),
    Marker(
      markerId: MarkerId('Pedrógão de Alentejo'),
      draggable: false,
      onTap: () {
        print('Pedrógão de Alentejo');
      },
      infoWindow: InfoWindow(title: 'Pedrógão de Alentejo'),
      position: LatLng(38.125759450324544, -7.647595887033241),
    ),
    Marker(
      markerId: MarkerId('Póvoa de São Miguel'),
      draggable: false,
      onTap: () {
        print('Póvoa de São Miguel');
      },
      infoWindow: InfoWindow(title: 'Póvoa de São Miguel'),
      position: LatLng(38.22450050546414, -7.3385700463265335),
    ),
    Marker(
      markerId: MarkerId('São Marcos do Campo'),
      draggable: false,
      onTap: () {
        print('São Marcos do Campo');
      },
      infoWindow: InfoWindow(title: 'São Marcos do Campo'),
      position: LatLng(38.34766041367693, -7.502352129118966),
    ),
    Marker(
      markerId: MarkerId('Telheiro'),
      draggable: false,
      onTap: () {
        print('Telheiro');
      },
      infoWindow: InfoWindow(title: 'Telheiro'),
      position: LatLng(38.45522354971223, -7.381812499463081),
    ),
    Marker(
      markerId: MarkerId('Villanueva del Fresno'),
      draggable: false,
      onTap: () {
        print('Villanueva del Fresno');
      },
      infoWindow: InfoWindow(title: 'Villanueva del Fresno'),
      position: LatLng(38.37534552752282, -7.167242070275673),
    ),
    Marker(
      markerId: MarkerId('Villareal'),
      draggable: false,
      onTap: () {
        print('Villareal');
      },
      infoWindow: InfoWindow(title: 'Villareal'),
      position: LatLng(38.72660190729974, -7.213739656053995),
    ),
    Marker(
      markerId: MarkerId('Monte de Trigo'),
      draggable: false,
      onTap: () {
        print('Monte de Trigo');
      },
      infoWindow: InfoWindow(title: 'Monte de Trigo'),
      position: LatLng(38.40038810312174, -7.7139073554429425),
    ),
    Marker(
      markerId: MarkerId('Vila de Juromenha'),
      draggable: false,
      onTap: () {
        print('Vila de Juromenha');
      },
      infoWindow: InfoWindow(title: 'Vila de Juromenha'),
      position: LatLng(38.74065009623554, -7.238265471929976),
    ),
    Marker(
      markerId: MarkerId('Aldeia da Luz'),
      draggable: false,
      onTap: () {
        print('Aldeia da Luz');
      },
      infoWindow: InfoWindow(title: 'Aldeia da Luz'),
      position: LatLng(38.34379139870678, -7.3858981421513334),
    ),
    Marker(
      markerId: MarkerId('Monsaraz'),
      draggable: false,
      onTap: () {
        print('Monsaraz');
      },
      infoWindow: InfoWindow(
        title: 'Monsaraz',
      ),
      position: LatLng(38.44408737961703, -7.380808728118724),
    ),
  ];

  createAlertDialog(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isFirstLoaded = prefs.getBool(keyIsFirstLoaded);

    if (isFirstLoaded == null) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => Dialog(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          child: Container(
            margin: EdgeInsets.only(left: 0.0, right: 0.0),
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 13.0, right: 8.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(16.0),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 0.0,
                          offset: Offset(0.0, 0.0),
                        ),
                      ]),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Center(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                          ) //
                      ),
                      InkWell(
                        child: Container(
                          padding: const EdgeInsets.only(bottom: 10, top: 40),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 250,
                                      padding: const EdgeInsets.only(
                                          bottom: 5, left: 15),
                                      child: Text(
                                        "SUBSCREVA À NOSSA NEWSLETTER",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                129, 195, 215, 1),
                                            fontSize: 14,
                                            fontFamily: 'Metropolis',
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    /*Container(
                                      width: 220,
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        border: Border.all(color: Colors.white),
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(40),
                                          bottomRight: Radius.circular(40),
                                          bottomLeft: Radius.circular(30),
                                        ),
                                      ),
                                      padding: const EdgeInsets.only(
                                          top: 15, bottom: 15, left: 5),
                                      child: Builder(
                                        builder: (context) => Row(
                                          children: [
                                            Column(
                                              children: [
                                                Container(
                                                  padding: const EdgeInsets.only(
                                                      left: 15),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Text(
                                                            "Escreva aqui os seu e-mail",
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: TextStyle(
                                                                color: Color
                                                                    .fromRGBO(
                                                                        200,
                                                                        240,
                                                                        255,
                                                                        1.0),
                                                                fontSize: 12,
                                                                fontFamily:
                                                                    'Metropolis',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),*/
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        onTap: () => {},
                        customBorder: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      Container(
                        child: UserFormWidget(
                          onSavedUser: (user) async {
                            await UserSheetsApi.insert(
                              [
                                user.toJson(),
                              ],
                            );
                          },
                        ), /*ButtonWidget(
                          text: 'save',
                          onClicked: () async {
                            insertUsers();
                            /*final user = User(
                          email: 'vkjsnfdfvkjn',
                        );
                        await UserSheetsApi.insert([user.toJson()]);*/
                          },
                        ),*/
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 0.0,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                      prefs.setBool(keyIsFirstLoaded, false);
                    },
                    child: Align(
                      alignment: Alignment.topRight,
                      child: CircleAvatar(
                        radius: 14.0,
                        backgroundColor: Color.fromRGBO(129, 195, 215, 1),
                        child: Icon(Icons.close, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

  createAlertDialog2(BuildContext context) async {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => Dialog(
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: Container(
          margin: EdgeInsets.only(left: 0.0, right: 0.0),
          child: Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 13.0, right: 8.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(16.0),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 0.0,
                        offset: Offset(0.0, 0.0),
                      ),
                    ]),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Center(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                        ) //
                    ),
                    InkWell(
                      child: Container(
                        padding: const EdgeInsets.only(bottom: 10, top: 40),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 250,
                                    padding: const EdgeInsets.only(
                                        bottom: 5, left: 15),
                                    child: Text(
                                      "SUBSCREVA À NOSSA NEWSLETTER",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color:
                                          Color.fromRGBO(129, 195, 215, 1),
                                          fontSize: 14,
                                          fontFamily: 'Metropolis',
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  /*Container(
                                      width: 220,
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        border: Border.all(color: Colors.white),
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(40),
                                          bottomRight: Radius.circular(40),
                                          bottomLeft: Radius.circular(30),
                                        ),
                                      ),
                                      padding: const EdgeInsets.only(
                                          top: 15, bottom: 15, left: 5),
                                      child: Builder(
                                        builder: (context) => Row(
                                          children: [
                                            Column(
                                              children: [
                                                Container(
                                                  padding: const EdgeInsets.only(
                                                      left: 15),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Text(
                                                            "Escreva aqui os seu e-mail",
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: TextStyle(
                                                                color: Color
                                                                    .fromRGBO(
                                                                        200,
                                                                        240,
                                                                        255,
                                                                        1.0),
                                                                fontSize: 12,
                                                                fontFamily:
                                                                    'Metropolis',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),*/
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      onTap: () => {},
                      customBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    Container(
                      child: UserFormWidget(
                        onSavedUser: (user) async {
                          await UserSheetsApi.insert(
                            [
                              user.toJson(),
                            ],
                          );
                        },
                      ), /*ButtonWidget(
                          text: 'save',
                          onClicked: () async {
                            insertUsers();
                            /*final user = User(
                          email: 'vkjsnfdfvkjn',
                        );
                        await UserSheetsApi.insert([user.toJson()]);*/
                          },
                        ),*/
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 0.0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Align(
                    alignment: Alignment.topRight,
                    child: CircleAvatar(
                      radius: 14.0,
                      backgroundColor: Color.fromRGBO(129, 195, 215, 1),
                      child: Icon(Icons.close, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!
        .addPostFrameCallback((_) => createAlertDialog(context));
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    if(screenSize.width < 410) {return MaterialApp(debugShowCheckedModeBanner:false,
      theme: new ThemeData(
        canvasColor: Color.fromRGBO(228, 238, 201, 1),
      ),
      //supportedLocales: L10n.all,
      home: SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: AppBar(
              title: Text(
                'Alqueva',
                style: TextStyle(fontFamily: 'Metropolis'),
              ),
              actions: <Widget>[
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                    ),
                    Builder(
                      builder: (context) => IconButton(
                        icon: Image.asset('assets/ptI.png'),
                        iconSize: 25,
                        onPressed: () {},
                      ),
                      /*ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(0.0),
                            primary: Colors.transparent,
                            elevation: 0.0,
                            fixedSize: Size(50, 50)),
                        onPressed: () {},
                        child: Image.asset(
                            "assets/bussola.png",
                            fit: BoxFit.cover,

                        ),),*/
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                    ),
                    Builder(
                      builder: (context) => IconButton(
                        icon: Image.asset('assets/esI.png'),
                        iconSize: 25,
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MyAppES()),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
              backgroundColor: Color.fromRGBO(129, 195, 215, 1),
              //leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
            ),
            drawer: Drawer(
              elevation: 1.0,
              child: Scaffold(
                backgroundColor: Color.fromRGBO(129, 195, 215, 1),
                resizeToAvoidBottomInset: true,
                body: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    Container(
                      height: 100,
                      margin: EdgeInsets.only(bottom: 5),
                      child: DrawerHeader(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(129, 195, 215, 1),
                        ),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Builder(
                            builder: (context) => Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(
                                    Icons.keyboard_arrow_left,
                                    color: Colors.white,
                                  ),
                                ),
                                Column(
                                  children: [
                                    Container(
                                      width: 170,
                                      child:
                                      Image.asset('assets/LogoAlqueva.png'),
                                      /*Text(
                              "Aldeias Ribeirinhas do Alqueva",
                              style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontFamily: 'Metropolis'),
                            ),*/
                                      margin: EdgeInsets.only(bottom: 30),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 15),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      color: Color.fromRGBO(129, 195, 215, 1),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 65),
                      ),
                    ),
                    Container(
                      color: Color.fromRGBO(129, 195, 215, 1),
                      child: Column(
                        children: [
                          ExpansionTile(
                            tilePadding: EdgeInsets.only(right: 25),
                            backgroundColor: Color.fromRGBO(129, 195, 215, 1),
                            title: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left: 20),
                                  child: Icon(
                                    Icons.phone,
                                    color: Color.fromRGBO(129, 195, 215, 1),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Text(
                                    "Contactos",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Color.fromRGBO(129, 195, 215, 1),
                                        fontSize: 22,
                                        fontFamily: 'Metropolis',
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ],
                            ),
                            children: [
                              InkWell(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(top: 20),
                                        ),
                                        Container(
                                          padding:
                                          const EdgeInsets.only(left: 15),
                                          child: Text(
                                            "ATLA - Associação Transfronteiriça do Lago Alqueva",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontFamily: 'Metropolis',
                                                color: Color.fromRGBO(
                                                    129, 195, 215, 1),
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(bottom: 10),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.only(
                                              left: 15, bottom: 5),
                                          child: Text(
                                            "Praceta Dr. Francisco Sá Carneiro, 4\n\nApartado 63\n\n7200-335 Reguengos de Monsaraz\n\nTEL. 266 611 085\n\nFAX. 266 611 087\n\nlagoalqueva.eu\n\natmtgla@gmail.com\n\ngeral@lagoalqueva.eu\n\nNIF 507303067",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontFamily: 'Metropolis',
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w100),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(bottom: 20),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          /*InkWell(
                          child: Container(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 220,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(color: Colors.white),
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(40),
                                            bottomRight: Radius.circular(40),
                                            bottomLeft: Radius.circular(30),
                                          ),
                                        ),
                                        padding: const EdgeInsets.all(10),
                                        child: Row(
                                          children: [
                                            Column(
                                              children: [
                                                Container(
                                                  padding: const EdgeInsets.only(
                                                      left: 15),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Container(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    right: 15),
                                                            child: Icon(
                                                              Icons.phone,
                                                              color: Color.fromRGBO(
                                                                  129, 195, 215, 1),
                                                            ),
                                                          ),
                                                          Text(
                                                            "Contactos",
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: TextStyle(
                                                                color:
                                                                    Color.fromRGBO(
                                                                        129,
                                                                        195,
                                                                        215,
                                                                        1),
                                                                fontSize: 22,
                                                                fontFamily:
                                                                    'Metropolis',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          onTap: () => {
                            Navigator.pop(context),
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Amieira(),
                              ),
                            ),
                          },
                          customBorder: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),*/
                          InkWell(
                            child: Container(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 220,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            border:
                                            Border.all(color: Colors.white),
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(40),
                                              bottomRight: Radius.circular(40),
                                              bottomLeft: Radius.circular(30),
                                            ),
                                          ),
                                          padding: const EdgeInsets.only(
                                              top: 15, bottom: 15, left: 5),
                                          child: Row(
                                            children: [
                                              Column(
                                                children: [
                                                  Container(
                                                    padding:
                                                    const EdgeInsets.only(
                                                        left: 15),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Container(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                  right:
                                                                  15),
                                                              child: Icon(
                                                                Icons
                                                                    .help_outline,
                                                                color: Color
                                                                    .fromRGBO(
                                                                    129,
                                                                    195,
                                                                    215,
                                                                    1),
                                                              ),
                                                            ),
                                                            Text(
                                                              "Ajuda",
                                                              textAlign:
                                                              TextAlign
                                                                  .left,
                                                              style: TextStyle(
                                                                  color: Color
                                                                      .fromRGBO(
                                                                      129,
                                                                      195,
                                                                      215,
                                                                      1),
                                                                  fontSize: 22,
                                                                  fontFamily:
                                                                  'Metropolis',
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            onTap: () => {
                              /*createAlertDialog(context),*/
                            },
                            customBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          InkWell(
                            child: Container(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 220,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            border:
                                            Border.all(color: Colors.white),
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(40),
                                              bottomRight: Radius.circular(40),
                                              bottomLeft: Radius.circular(30),
                                            ),
                                          ),
                                          padding: const EdgeInsets.only(
                                              top: 15, bottom: 15, left: 5),
                                          child: Row(
                                            children: [
                                              Column(
                                                children: [
                                                  Container(
                                                    padding:
                                                    const EdgeInsets.only(
                                                        left: 15),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Container(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                  right:
                                                                  15),
                                                              child: Icon(
                                                                Icons.add,
                                                                color: Color
                                                                    .fromRGBO(
                                                                    129,
                                                                    195,
                                                                    215,
                                                                    1),
                                                              ),
                                                            ),
                                                            Text(
                                                              "ATLA",
                                                              textAlign:
                                                              TextAlign
                                                                  .left,
                                                              style: TextStyle(
                                                                  color: Color
                                                                      .fromRGBO(
                                                                      129,
                                                                      195,
                                                                      215,
                                                                      1),
                                                                  fontSize: 22,
                                                                  fontFamily:
                                                                  'Metropolis',
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            onTap: () => {
                              _openATLA() /*
                              Navigator.pop(context),
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Amieira(),
                                ),
                              ),*/
                            },
                            customBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),

                          //newsletter 2
                          InkWell(
                            child: Container(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 220,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            border:
                                            Border.all(color: Colors.white),
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(40),
                                              bottomRight: Radius.circular(40),
                                              bottomLeft: Radius.circular(30),
                                            ),
                                          ),
                                          padding: const EdgeInsets.only(
                                              top: 15, bottom: 15, left: 5),
                                          child: Row(
                                            children: [
                                              Column(
                                                children: [
                                                  Container(
                                                    padding:
                                                    const EdgeInsets.only(
                                                        left: 15),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Container(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                  right:
                                                                  15),
                                                              child:
                                                              Image.asset(
                                                                'assets/paperplane.png',
                                                                width: 25,
                                                              ),
                                                              /*Image.asset(
                                                              'assets/spotify.png',
                                                              width: 25,
                                                              height: 25,
                                                            ),*/
                                                            ),
                                                            Text(
                                                              "Newsletter",
                                                              textAlign:
                                                              TextAlign
                                                                  .left,
                                                              style: TextStyle(
                                                                  color: Color
                                                                      .fromRGBO(
                                                                      129,
                                                                      195,
                                                                      215,
                                                                      1),
                                                                  fontSize: 22,
                                                                  fontFamily:
                                                                  'Metropolis',
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            onTap: () => {
                              Future.delayed(Duration.zero,
                                      () => createAlertDialog2(context)),
                            },
                            customBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          /*InkWell(
                          child: Container(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 220,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              color: Colors.white),
                                          borderRadius:
                                          BorderRadius.only(topRight: Radius.circular(40), bottomRight: Radius.circular(40), bottomLeft: Radius.circular(30),),
                                        ),
                                        padding: const EdgeInsets.all(10),
                                        child: Row(
                                          children: [
                                            Column(
                                              children: [
                                                Container(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      left: 15),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .start,
                                                    children: [
                                                      Row(children: [Container(padding: EdgeInsets.only(right: 15),  child: Icon(Icons.settings, color: Color.fromRGBO(129, 195, 215, 1),),),
                                                        Text(
                                                          "Definições",
                                                          textAlign:
                                                          TextAlign.left,
                                                          style: TextStyle(
                                                              color: Color.fromRGBO(129, 195, 215, 1),
                                                              fontSize: 22,
                                                              fontFamily: 'Metropolis',
                                                              fontWeight:
                                                              FontWeight.w400),
                                                        ),],),

                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          onTap: () => {
                            Navigator.pop(context),
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Amieira(),
                              ),
                            ),
                          },
                          customBorder: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),*/
                          //spotify
                          InkWell(
                            child: Container(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 220,
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            border:
                                            Border.all(color: Colors.white),
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(40),
                                              bottomRight: Radius.circular(40),
                                              bottomLeft: Radius.circular(30),
                                            ),
                                          ),
                                          padding: const EdgeInsets.only(
                                              top: 15, bottom: 15, left: 5),
                                          child: Builder(
                                            builder: (context) => Row(
                                              children: [
                                                Column(
                                                  children: [
                                                    Container(
                                                      padding:
                                                      const EdgeInsets.only(
                                                          left: 15,
                                                          right: 15),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Container(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                    right:
                                                                    15),
                                                                child:
                                                                Image.asset(
                                                                  'assets/spotify.png',
                                                                  width: 25,
                                                                  height: 25,
                                                                ),
                                                              ),
                                                              Text(
                                                                "Spotify",
                                                                textAlign:
                                                                TextAlign
                                                                    .left,
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                    22,
                                                                    fontFamily:
                                                                    'Metropolis',
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            onTap: () => {
                              _displaySpotify(),
                            },
                            customBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          /*InkWell(
                          child: Container(
                            padding: const EdgeInsets.only(bottom: 10, top: 40),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 220,
                                        padding: const EdgeInsets.only(bottom: 5),
                                        child: Text(
                                          "SUBSCREVA À NOSSA NEWSLETTER",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontFamily: 'Metropolis',
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      /*Container(
                                        width: 220,
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          border: Border.all(color: Colors.white),
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(40),
                                            bottomRight: Radius.circular(40),
                                            bottomLeft: Radius.circular(30),
                                          ),
                                        ),
                                        padding: const EdgeInsets.only(
                                            top: 15, bottom: 15, left: 5),
                                        child: Builder(
                                          builder: (context) => Row(
                                            children: [
                                              Column(
                                                children: [
                                                  Container(
                                                    padding: const EdgeInsets.only(
                                                        left: 15),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment.start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Text(
                                                              "Escreva aqui os seu e-mail",
                                                              textAlign:
                                                                  TextAlign.left,
                                                              style: TextStyle(
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          200,
                                                                          240,
                                                                          255,
                                                                          1.0),
                                                                  fontSize: 12,
                                                                  fontFamily:
                                                                      'Metropolis',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),*/
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          onTap: () => {},
                          customBorder: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        Container(
                          child: UserFormWidget(
                            onSavedUser: (user) async {
                              await UserSheetsApi.insert(
                                [
                                  user.toJson(),
                                ],
                              );
                            },
                          ), /*ButtonWidget(
                            text: 'save',
                            onClicked: () async {
                              insertUsers();
                              /*final user = User(
                            email: 'vkjsnfdfvkjn',
                          );
                          await UserSheetsApi.insert([user.toJson()]);*/
                            },
                          ),*/
                        ),*/
                          //newsletter
                          /*InkWell(
                          child: Container(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 220,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border:
                                              Border.all(color: Colors.white),
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(40),
                                            bottomRight: Radius.circular(40),
                                            bottomLeft: Radius.circular(40),
                                            topLeft: Radius.circular(40),
                                          ),
                                        ),
                                        padding: const EdgeInsets.only(
                                            top: 15, bottom: 15, left: 5),
                                        child: Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 30),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Container(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        12),
                                                          ),
                                                          Column(
                                                            children: [
                                                              Text(
                                                                "Newsletter",
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: TextStyle(
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            129,
                                                                            195,
                                                                            215,
                                                                            1),
                                                                    fontSize:
                                                                        22,
                                                                    fontFamily:
                                                                        'Metropolis',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          onTap: () => {
                            createAlertDialog(context),
                          },
                          customBorder: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),*/
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding:
                                const EdgeInsets.only(top: 240, left: 30),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(right: 5),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        'assets/ardc.png',
                                        width: 80,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Image.asset(
                                      'assets/lagoAlqueva.png',
                                      width: 80,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(right: 5),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        'assets/interreg.png',
                                        width: 80,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            body: new Stack(
              children: <Widget>[

                //GOOGLE MAPS
                CustomInfoWindowExample(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BottomSheet(),
                        Padding(padding: const EdgeInsets.only(right:10),),
                        Container(
                          child: new Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              width: 100,
                              //height: 60,
                              margin: const EdgeInsets.only(bottom: 20.0),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  //shadowColor: Color.fromRGBO(255, 255, 255, 0),
                                  elevation: 2.0,
                                  primary: Color.fromRGBO(129, 195, 215, 1),
                                  /*shape: new RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(100),
                                  ),*/
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => MyApp()),
                                  );
                                }, child:Text(
                                "Navegar \nMapa",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Metropolis',
                                    fontWeight: FontWeight.bold),
                              ),
                              ),
                            ),
                          ),),
                      ],
                    ),
                  ],
                ),
              ],
            ) /*Container(
            //height: 500,
            child: new Stack(
              children: <Widget>[
                new Container(
                  child: Container(
                    child: GoogleMap(
                      myLocationEnabled: true,
                      zoomControlsEnabled: true,
                      //circles: Set.from(circles),
                      /*circles: Set<Circle>()
                        ..add(
                          Circle(
                            consumeTapEvents: true,
                            circleId: CircleId('Amieira'),
                            center: LatLng(38.30524741650808, -7.589860692134267),
                            radius: 4000,
                            fillColor: Color.fromRGBO(0, 255, 0, 0.3),
                            strokeWidth: 3,
                            strokeColor: Colors.green,
                          ),
                        ),*/
                      markers: Set.from(aldeias),
                      onMapCreated: _onMapCreated,
                      initialCameraPosition:
                          CameraPosition(target: _center, zoom: 9.0),
                    ),
                  ),
                ),
                new Container(
                  alignment: Alignment.bottomCenter,
                  /*
                  child: BottomAppBar(
                    //shape: CircularNotchedRectangle(),
                    color: Color.fromRGBO(129, 195, 215, 1),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.location_on),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.location_on),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.location_on),
                        ),
                        Spacer(
                          flex: 3,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.location_on),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.location_on),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.location_on),
                        ),
                      ],
                    ),
                  ),*/
                ),
                BottomSheet(),
                //new Container(child: BottomSheet(),),
              ],
            ),
          ),*/

          /*floatingActionButton: Padding(
              padding: const EdgeInsets.only(right: 325.0),
              child: FloatingActionButton(
                backgroundColor: Theme.of(context).primaryColor,
                foregroundColor: Colors.black,
                onPressed: () => mapController.animateCamera(
                  CameraUpdate.newCameraPosition(_centerCamera),
                ),
                child: const Icon(Icons.center_focus_weak_outlined),
              ),
            ),*/
          /*floatingActionButton: FloatingActionButton(
            onPressed: () {
              _settingModalBottomSheet(context);
            },
            child: Icon(Icons.unfold_more),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,*/
        ),
      ),
    );} else {return MaterialApp(debugShowCheckedModeBanner:false,
      theme: new ThemeData(
        canvasColor: Color.fromRGBO(228, 238, 201, 1),
      ),
      //supportedLocales: L10n.all,
      home: SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: AppBar(
              title: Text(
                'Alqueva',
                style: TextStyle(fontFamily: 'Metropolis'),
              ),
              actions: <Widget>[
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                    ),
                    Builder(
                      builder: (context) => IconButton(
                        icon: Image.asset('assets/ptI.png'),
                        iconSize: 25,
                        onPressed: () {},
                      ),
                      /*ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(0.0),
                            primary: Colors.transparent,
                            elevation: 0.0,
                            fixedSize: Size(50, 50)),
                        onPressed: () {},
                        child: Image.asset(
                            "assets/bussola.png",
                            fit: BoxFit.cover,

                        ),),*/
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                    ),
                    Builder(
                      builder: (context) => IconButton(
                        icon: Image.asset('assets/esI.png'),
                        iconSize: 25,
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MyAppES()),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
              backgroundColor: Color.fromRGBO(129, 195, 215, 1),
              //leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
            ),
            drawer: Drawer(
              elevation: 1.0,
              child: Scaffold(
                backgroundColor: Color.fromRGBO(129, 195, 215, 1),
                resizeToAvoidBottomInset: true,
                body: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    Container(
                      height: 100,
                      margin: EdgeInsets.only(bottom: 5),
                      child: DrawerHeader(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(129, 195, 215, 1),
                        ),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Builder(
                            builder: (context) => Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(
                                    Icons.keyboard_arrow_left,
                                    color: Colors.white,
                                  ),
                                ),
                                Column(
                                  children: [
                                    Container(
                                      width: 170,
                                      child:
                                      Image.asset('assets/LogoAlqueva.png'),
                                      /*Text(
                              "Aldeias Ribeirinhas do Alqueva",
                              style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontFamily: 'Metropolis'),
                            ),*/
                                      margin: EdgeInsets.only(bottom: 30),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 15),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      color: Color.fromRGBO(129, 195, 215, 1),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 65),
                      ),
                    ),
                    Container(
                      color: Color.fromRGBO(129, 195, 215, 1),
                      child: Column(
                        children: [
                          ExpansionTile(
                            tilePadding: EdgeInsets.only(right: 25),
                            backgroundColor: Color.fromRGBO(129, 195, 215, 1),
                            title: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left: 20),
                                  child: Icon(
                                    Icons.phone,
                                    color: Color.fromRGBO(129, 195, 215, 1),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Text(
                                    "Contactos",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Color.fromRGBO(129, 195, 215, 1),
                                        fontSize: 22,
                                        fontFamily: 'Metropolis',
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ],
                            ),
                            children: [
                              InkWell(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(top: 20),
                                        ),
                                        Container(
                                          padding:
                                          const EdgeInsets.only(left: 15),
                                          child: Text(
                                            "ATLA - Associação Transfronteiriça do Lago Alqueva",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontFamily: 'Metropolis',
                                                color: Color.fromRGBO(
                                                    129, 195, 215, 1),
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(bottom: 10),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.only(
                                              left: 15, bottom: 5),
                                          child: Text(
                                            "Praceta Dr. Francisco Sá Carneiro, 4\n\nApartado 63\n\n7200-335 Reguengos de Monsaraz\n\nTEL. 266 611 085\n\nFAX. 266 611 087\n\nlagoalqueva.eu\n\natmtgla@gmail.com\n\ngeral@lagoalqueva.eu\n\nNIF 514 771 860",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontFamily: 'Metropolis',
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w100),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(bottom: 20),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          /*InkWell(
                          child: Container(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 220,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(color: Colors.white),
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(40),
                                            bottomRight: Radius.circular(40),
                                            bottomLeft: Radius.circular(30),
                                          ),
                                        ),
                                        padding: const EdgeInsets.all(10),
                                        child: Row(
                                          children: [
                                            Column(
                                              children: [
                                                Container(
                                                  padding: const EdgeInsets.only(
                                                      left: 15),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Container(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    right: 15),
                                                            child: Icon(
                                                              Icons.phone,
                                                              color: Color.fromRGBO(
                                                                  129, 195, 215, 1),
                                                            ),
                                                          ),
                                                          Text(
                                                            "Contactos",
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: TextStyle(
                                                                color:
                                                                    Color.fromRGBO(
                                                                        129,
                                                                        195,
                                                                        215,
                                                                        1),
                                                                fontSize: 22,
                                                                fontFamily:
                                                                    'Metropolis',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          onTap: () => {
                            Navigator.pop(context),
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Amieira(),
                              ),
                            ),
                          },
                          customBorder: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),*/
                          InkWell(
                            child: Container(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 220,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            border:
                                            Border.all(color: Colors.white),
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(40),
                                              bottomRight: Radius.circular(40),
                                              bottomLeft: Radius.circular(30),
                                            ),
                                          ),
                                          padding: const EdgeInsets.only(
                                              top: 15, bottom: 15, left: 5),
                                          child: Row(
                                            children: [
                                              Column(
                                                children: [
                                                  Container(
                                                    padding:
                                                    const EdgeInsets.only(
                                                        left: 15),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Container(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                  right:
                                                                  15),
                                                              child: Icon(
                                                                Icons
                                                                    .help_outline,
                                                                color: Color
                                                                    .fromRGBO(
                                                                    129,
                                                                    195,
                                                                    215,
                                                                    1),
                                                              ),
                                                            ),
                                                            Text(
                                                              "Ajuda",
                                                              textAlign:
                                                              TextAlign
                                                                  .left,
                                                              style: TextStyle(
                                                                  color: Color
                                                                      .fromRGBO(
                                                                      129,
                                                                      195,
                                                                      215,
                                                                      1),
                                                                  fontSize: 22,
                                                                  fontFamily:
                                                                  'Metropolis',
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            onTap: () => {
                              /*createAlertDialog(context),*/
                            },
                            customBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          //ATLA
                          InkWell(
                            child: Container(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 220,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            border:
                                            Border.all(color: Colors.white),
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(40),
                                              bottomRight: Radius.circular(40),
                                              bottomLeft: Radius.circular(30),
                                            ),
                                          ),
                                          padding: const EdgeInsets.only(
                                              top: 15, bottom: 15, left: 5),
                                          child: Row(
                                            children: [
                                              Column(
                                                children: [
                                                  Container(
                                                    padding:
                                                    const EdgeInsets.only(
                                                        left: 15),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Container(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                  right:
                                                                  15),
                                                              child: Icon(
                                                                Icons.add,
                                                                color: Color
                                                                    .fromRGBO(
                                                                    129,
                                                                    195,
                                                                    215,
                                                                    1),
                                                              ),
                                                            ),
                                                            Text(
                                                              "ATLA",
                                                              textAlign:
                                                              TextAlign
                                                                  .left,
                                                              style: TextStyle(
                                                                  color: Color
                                                                      .fromRGBO(
                                                                      129,
                                                                      195,
                                                                      215,
                                                                      1),
                                                                  fontSize: 22,
                                                                  fontFamily:
                                                                  'Metropolis',
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            onTap: () => {
                              _openATLA() /*
                              Navigator.pop(context),
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Amieira(),
                                ),
                              ),*/
                            },
                            customBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          //RDC
                          InkWell(
                            child: Container(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 220,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            border:
                                            Border.all(color: Colors.white),
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(40),
                                              bottomRight: Radius.circular(40),
                                              bottomLeft: Radius.circular(30),
                                            ),
                                          ),
                                          padding: const EdgeInsets.only(
                                              top: 15, bottom: 15, left: 5),
                                          child: Row(
                                            children: [
                                              Column(
                                                children: [
                                                  Container(
                                                    padding:
                                                    const EdgeInsets.only(
                                                        left: 15),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Container(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                  right:
                                                                  15),
                                                              child: Icon(
                                                                Icons.add,
                                                                color: Color
                                                                    .fromRGBO(
                                                                    129,
                                                                    195,
                                                                    215,
                                                                    1),
                                                              ),
                                                            ),
                                                            Text(
                                                              "RDC",
                                                              textAlign:
                                                              TextAlign
                                                                  .left,
                                                              style: TextStyle(
                                                                  color: Color
                                                                      .fromRGBO(
                                                                      129,
                                                                      195,
                                                                      215,
                                                                      1),
                                                                  fontSize: 22,
                                                                  fontFamily:
                                                                  'Metropolis',
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            onTap: () => {
                              _openRDC() /*
                              Navigator.pop(context),
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Amieira(),
                                ),
                              ),*/
                            },
                            customBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),

                          //newsletter 2
                          InkWell(
                            child: Container(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 220,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            border:
                                            Border.all(color: Colors.white),
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(40),
                                              bottomRight: Radius.circular(40),
                                              bottomLeft: Radius.circular(30),
                                            ),
                                          ),
                                          padding: const EdgeInsets.only(
                                              top: 15, bottom: 15, left: 5),
                                          child: Row(
                                            children: [
                                              Column(
                                                children: [
                                                  Container(
                                                    padding:
                                                    const EdgeInsets.only(
                                                        left: 15),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Container(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                  right:
                                                                  15),
                                                              child:
                                                              Image.asset(
                                                                'assets/paperplane.png',
                                                                width: 25,
                                                              ),
                                                              /*Image.asset(
                                                              'assets/spotify.png',
                                                              width: 25,
                                                              height: 25,
                                                            ),*/
                                                            ),
                                                            Text(
                                                              "Newsletter",
                                                              textAlign:
                                                              TextAlign
                                                                  .left,
                                                              style: TextStyle(
                                                                  color: Color
                                                                      .fromRGBO(
                                                                      129,
                                                                      195,
                                                                      215,
                                                                      1),
                                                                  fontSize: 22,
                                                                  fontFamily:
                                                                  'Metropolis',
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            onTap: () => {
                              Future.delayed(Duration.zero,
                                      () => createAlertDialog2(context)),
                            },
                            customBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          /*InkWell(
                          child: Container(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 220,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              color: Colors.white),
                                          borderRadius:
                                          BorderRadius.only(topRight: Radius.circular(40), bottomRight: Radius.circular(40), bottomLeft: Radius.circular(30),),
                                        ),
                                        padding: const EdgeInsets.all(10),
                                        child: Row(
                                          children: [
                                            Column(
                                              children: [
                                                Container(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      left: 15),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .start,
                                                    children: [
                                                      Row(children: [Container(padding: EdgeInsets.only(right: 15),  child: Icon(Icons.settings, color: Color.fromRGBO(129, 195, 215, 1),),),
                                                        Text(
                                                          "Definições",
                                                          textAlign:
                                                          TextAlign.left,
                                                          style: TextStyle(
                                                              color: Color.fromRGBO(129, 195, 215, 1),
                                                              fontSize: 22,
                                                              fontFamily: 'Metropolis',
                                                              fontWeight:
                                                              FontWeight.w400),
                                                        ),],),

                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          onTap: () => {
                            Navigator.pop(context),
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Amieira(),
                              ),
                            ),
                          },
                          customBorder: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),*/
                          //spotify
                          InkWell(
                            child: Container(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 220,
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            border:
                                            Border.all(color: Colors.white),
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(40),
                                              bottomRight: Radius.circular(40),
                                              bottomLeft: Radius.circular(30),
                                            ),
                                          ),
                                          padding: const EdgeInsets.only(
                                              top: 15, bottom: 15, left: 5),
                                          child: Builder(
                                            builder: (context) => Row(
                                              children: [
                                                Column(
                                                  children: [
                                                    Container(
                                                      padding:
                                                      const EdgeInsets.only(
                                                          left: 15,
                                                          right: 15),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Container(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                    right:
                                                                    15),
                                                                child:
                                                                Image.asset(
                                                                  'assets/spotify.png',
                                                                  width: 25,
                                                                  height: 25,
                                                                ),
                                                              ),
                                                              Text(
                                                                "Spotify",
                                                                textAlign:
                                                                TextAlign
                                                                    .left,
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                    22,
                                                                    fontFamily:
                                                                    'Metropolis',
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            onTap: () => {
                              _displaySpotify(),
                            },
                            customBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          /*InkWell(
                          child: Container(
                            padding: const EdgeInsets.only(bottom: 10, top: 40),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 220,
                                        padding: const EdgeInsets.only(bottom: 5),
                                        child: Text(
                                          "SUBSCREVA À NOSSA NEWSLETTER",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontFamily: 'Metropolis',
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      /*Container(
                                        width: 220,
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          border: Border.all(color: Colors.white),
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(40),
                                            bottomRight: Radius.circular(40),
                                            bottomLeft: Radius.circular(30),
                                          ),
                                        ),
                                        padding: const EdgeInsets.only(
                                            top: 15, bottom: 15, left: 5),
                                        child: Builder(
                                          builder: (context) => Row(
                                            children: [
                                              Column(
                                                children: [
                                                  Container(
                                                    padding: const EdgeInsets.only(
                                                        left: 15),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment.start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Text(
                                                              "Escreva aqui os seu e-mail",
                                                              textAlign:
                                                                  TextAlign.left,
                                                              style: TextStyle(
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          200,
                                                                          240,
                                                                          255,
                                                                          1.0),
                                                                  fontSize: 12,
                                                                  fontFamily:
                                                                      'Metropolis',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),*/
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          onTap: () => {},
                          customBorder: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        Container(
                          child: UserFormWidget(
                            onSavedUser: (user) async {
                              await UserSheetsApi.insert(
                                [
                                  user.toJson(),
                                ],
                              );
                            },
                          ), /*ButtonWidget(
                            text: 'save',
                            onClicked: () async {
                              insertUsers();
                              /*final user = User(
                            email: 'vkjsnfdfvkjn',
                          );
                          await UserSheetsApi.insert([user.toJson()]);*/
                            },
                          ),*/
                        ),*/
                          //newsletter
                          /*InkWell(
                          child: Container(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 220,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border:
                                              Border.all(color: Colors.white),
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(40),
                                            bottomRight: Radius.circular(40),
                                            bottomLeft: Radius.circular(40),
                                            topLeft: Radius.circular(40),
                                          ),
                                        ),
                                        padding: const EdgeInsets.only(
                                            top: 15, bottom: 15, left: 5),
                                        child: Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 30),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Container(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        12),
                                                          ),
                                                          Column(
                                                            children: [
                                                              Text(
                                                                "Newsletter",
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: TextStyle(
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            129,
                                                                            195,
                                                                            215,
                                                                            1),
                                                                    fontSize:
                                                                        22,
                                                                    fontFamily:
                                                                        'Metropolis',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          onTap: () => {
                            createAlertDialog(context),
                          },
                          customBorder: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),*/
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding:
                                const EdgeInsets.only(top: 240, left: 30),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(right: 5),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        'assets/ardc.png',
                                        width: 80,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Image.asset(
                                      'assets/lagoAlqueva.png',
                                      width: 80,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(right: 5),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        'assets/interreg.png',
                                        width: 80,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            body: new Stack(
              children: <Widget>[

                //GOOGLE MAPS
                CustomInfoWindowExample(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BottomSheet(),
                        Padding(padding: const EdgeInsets.only(right:10),),
                        Container(
                          child: new Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              width: 120,
                              //height: 60,
                              margin: const EdgeInsets.only(bottom: 20.0),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  //shadowColor: Color.fromRGBO(255, 255, 255, 0),
                                  elevation: 2.0,
                                  primary: Color.fromRGBO(129, 195, 215, 1),
                                  /*shape: new RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(100),
                                  ),*/
                                ),
                                onPressed: () {}, child:Text(
                                "Navegar \nMapa",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'Metropolis',
                                    fontWeight: FontWeight.bold),
                              ),
                              ),
                            ),
                          ),),
                      ],
                    ),
                  ],
                ),
              ],
            ) /*Container(
            //height: 500,
            child: new Stack(
              children: <Widget>[
                new Container(
                  child: Container(
                    child: GoogleMap(
                      myLocationEnabled: true,
                      zoomControlsEnabled: true,
                      //circles: Set.from(circles),
                      /*circles: Set<Circle>()
                        ..add(
                          Circle(
                            consumeTapEvents: true,
                            circleId: CircleId('Amieira'),
                            center: LatLng(38.30524741650808, -7.589860692134267),
                            radius: 4000,
                            fillColor: Color.fromRGBO(0, 255, 0, 0.3),
                            strokeWidth: 3,
                            strokeColor: Colors.green,
                          ),
                        ),*/
                      markers: Set.from(aldeias),
                      onMapCreated: _onMapCreated,
                      initialCameraPosition:
                          CameraPosition(target: _center, zoom: 9.0),
                    ),
                  ),
                ),
                new Container(
                  alignment: Alignment.bottomCenter,
                  /*
                  child: BottomAppBar(
                    //shape: CircularNotchedRectangle(),
                    color: Color.fromRGBO(129, 195, 215, 1),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.location_on),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.location_on),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.location_on),
                        ),
                        Spacer(
                          flex: 3,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.location_on),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.location_on),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.location_on),
                        ),
                      ],
                    ),
                  ),*/
                ),
                BottomSheet(),
                //new Container(child: BottomSheet(),),
              ],
            ),
          ),*/

          /*floatingActionButton: Padding(
              padding: const EdgeInsets.only(right: 325.0),
              child: FloatingActionButton(
                backgroundColor: Theme.of(context).primaryColor,
                foregroundColor: Colors.black,
                onPressed: () => mapController.animateCamera(
                  CameraUpdate.newCameraPosition(_centerCamera),
                ),
                child: const Icon(Icons.center_focus_weak_outlined),
              ),
            ),*/
          /*floatingActionButton: FloatingActionButton(
            onPressed: () {
              _settingModalBottomSheet(context);
            },
            child: Icon(Icons.unfold_more),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,*/
        ),
      ),
    );}

  }

  Future insertUsers() async {
    final users = [
      User(email: 'ssdbdfbdfb'),
    ];
    final jsonUsers = users.map((user) => user.toJson()).toList();
    await UserSheetsApi.insert(jsonUsers);
  }
}

class MapWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class BottomSheet extends StatelessWidget {
  const BottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    if(screenSize.width < 410) {
      return Container(
        child: new Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: 120,
            //height: 60,
            margin: const EdgeInsets.only(bottom: 20.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                //shadowColor: Color.fromRGBO(255, 255, 255, 0),
                elevation: 2.0,
                primary: Color.fromRGBO(129, 195, 215, 1),
                /*shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(100),
              ),*/
              ),
              child: /*Icon(Icons.unfold_more)*/ Text(
                "Descobrir Aldeias",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Metropolis',
                    fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                showModalBottomSheet<void>(
                  backgroundColor: Colors.white,
                  context: context,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  builder: (BuildContext context) {
                    return Container(
                      //width: 20,
                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
                          child: ListView(
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 7,
                                    width: 60,
                                    margin: const EdgeInsets.only(bottom: 10),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.white),
                                      color: Colors.grey[300],
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(bottom: 15),
                                    child: Text(
                                      "Aldeias Ribeirinha de Alqueva",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontFamily: 'Metropolis',
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),

                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                              ),

                              //Alconchel
                              BottomSheetBtnAlconchel(
                                  imagePath: 'assets/alconchel.jpg',
                                  title: 'Alconchel',
                                  subTitle: 'Natureza | Náuticas | Mar | Turismo',
                                  concelho: 'Olivença'),

                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                              ),

                              //Aldeia da Luz
                              BottomSheetBtnAldeiaDaLuz(
                                  imagePath: 'assets/luz.jpg',
                                  title: 'Aldeia da Luz',
                                  subTitle: 'Natureza | Náuticas | Mar | Turismo',
                                  concelho: 'Mourão'),

                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                              ),

                              //Alqueva
                              BottomSheetBtnAlqueva(
                                  imagePath: 'assets/alqueva.jpg',
                                  title: 'Alqueva',
                                  subTitle: 'Natureza | Náuticas | Mar | Turismo',
                                  concelho: 'Portel'),

                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                              ),

                              //Amieira
                              BottomSheetBtnAmieira(
                                  imagePath: ('assets/amieira2.jpg'),
                                  title: 'Amieira',
                                  subTitle: 'Natureza',
                                  concelho: 'Portel'),

                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                              ),

                              //Campinho
                              BottomSheetBtnCampinho(
                                  imagePath: 'assets/campinho.jpg',
                                  title: 'Campinho',
                                  subTitle: 'Natureza | Náuticas | Mar | Turismo',
                                  concelho: 'Reguengos de Monsaraz'),

                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                              ),

                              //Cheles
                              BottomSheetBtnCheles(
                                  imagePath: 'assets/cheles.jpg',
                                  title: 'Cheles',
                                  subTitle: 'Natureza | Náuticas | Mar | Turismo',
                                  concelho: 'Badajoz'),

                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                              ),

                              //Estrela
                              BottomSheetBtnEstrela(
                                  imagePath: 'assets/estrela.jpg',
                                  title: 'Estrela',
                                  subTitle: 'Natureza | Náuticas | Mar | Turismo',
                                  concelho: 'Moura'),

                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                              ),

                              //Ferreira de Capelins
                              BottomSheetBtnFerreiraCapelins(
                                  imagePath: 'assets/capelins.jpg',
                                  title: 'Ferreira de Capelins',
                                  subTitle: 'Natureza | Náuticas | Mar | Turismo',
                                  concelho: 'Alandroal'),

                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                              ),

                              //Granja
                              BottomSheetBtnGranja(
                                  imagePath: 'assets/granja.jpg',
                                  title: 'Granja',
                                  subTitle: 'Natureza | Náuticas | Mar | Turismo',
                                  concelho: 'Mourão'),

                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                              ),

                              //Juromenha
                              BottomSheetBtnJuromenha(
                                  imagePath: 'assets/juromenha.jpg',
                                  title: 'Juromenha',
                                  subTitle: 'Natureza | Náuticas | Mar | Turismo',
                                  concelho: 'Alandroal'),

                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                              ),

                              //Marmelar
                              BottomSheetBtnMarmelar(
                                  imagePath: 'assets/marmelar.jpg',
                                  title: 'Marmelar',
                                  subTitle: 'Natureza | Náuticas | Mar | Turismo',
                                  concelho: 'Vidigueira'),

                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                              ),

                              //Mina de Orada
                              BottomSheetBtnMinaDeOrada(
                                  imagePath: 'assets/orada.jpg',
                                  title: 'Mina da Orada',
                                  subTitle: 'Natureza | Náuticas | Mar | Turismo',
                                  concelho: 'Serpa'),

                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                              ),

                              //Monsaraz
                              BottomSheetBtnMonsaraz(
                                  imagePath: 'assets/monsaraz.jpg',
                                  title: 'Monsaraz',
                                  subTitle: 'Natureza | Náuticas | Mar | Turismo',
                                  concelho: 'Reguengos de Monsaraz'),

                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                              ),

                              //Monte de Trigo
                              BottomSheetBtnMonteDeTrigo(
                                  imagePath: 'assets/trigo.jpg',
                                  title: 'Monte de Trigo',
                                  subTitle: 'Natureza | Náuticas | Mar | Turismo',
                                  concelho: 'Portel'),

                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                              ),

                              //Pedrógão de Alentejo
                              BottomSheetBtnPAlentejo(
                                  imagePath: 'assets/pedrogao.jpg',
                                  title: 'Pedrógão de Alentejo',
                                  subTitle: 'Natureza | Náuticas | Mar | Turismo',
                                  concelho: 'Vidigueira'),

                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                              ),

                              //Póvoa de São Miguel
                              BottomSheetBtnPSMiguel(
                                  imagePath: 'assets/povoa.jpg',
                                  title: 'Póvoa de São Miguel',
                                  subTitle: 'Natureza | Náuticas | Mar | Turismo',
                                  concelho: 'Moura'),

                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                              ),

                              //São Marcos do Campo
                              BottomSheetBtnSMCampo(
                                  imagePath: 'assets/campo.jpg',
                                  title: 'São Marcos de Campo',
                                  subTitle: 'Natureza | Náuticas | Mar | Turismo',
                                  concelho: 'Reguengos de Monsaraz'),

                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                              ),

                              //Telheiro
                              BottomSheetBtnTelheiro(
                                  imagePath: 'assets/telheiro.jpg',
                                  title: 'Telheiro',
                                  subTitle: 'Natureza | Náuticas | Mar | Turismo',
                                  concelho: 'Reguengos de Monsaraz'),

                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                              ),

                              //Villaueva del Fresno
                              BottomSheetBtnVFresno(
                                  imagePath: 'assets/villanueva.jpg',
                                  title: 'Villanueva del Fresno',
                                  subTitle: 'Natureza | Náuticas | Mar | Turismo',
                                  concelho: 'Olivença'),

                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                              ),

                              //Villreal
                              BottomSheetBtnVillareal(
                                  imagePath: 'assets/villarreal.jpg',
                                  title: 'Villarreal',
                                  subTitle: 'Natureza | Náuticas | Mar | Turismo',
                                  concelho: 'Olivença'),

                              /*
                            ListTile(
                              leading: new CircleAvatar(
                                backgroundImage:
                                    AssetImage("assets/amieira.jpg"),
                              ),
                              title: new Text('Aldeia da Luz'),
                              onTap: () => {},
                            ),*/
                              /*
                            ElevatedButton(
                              child: const Text('Close BottomSheet'),
                              onPressed: () => Navigator.pop(context),
                            )*/
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      );
    }
    else{
      return Container(
        child: new Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: 130,
            //height: 60,
            margin: const EdgeInsets.only(bottom: 20.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                //shadowColor: Color.fromRGBO(255, 255, 255, 0),
                elevation: 2.0,
                primary: Color.fromRGBO(129, 195, 215, 1),
                /*shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(100),
              ),*/
              ),
              child: /*Icon(Icons.unfold_more)*/ Text(
                "Descobrir Aldeias",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Metropolis',
                    fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                showModalBottomSheet<void>(
                  backgroundColor: Colors.white,
                  context: context,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  builder: (BuildContext context) {
                    return Container(
                      //width: 20,
                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
                          child: ListView(
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 7,
                                    width: 60,
                                    margin: const EdgeInsets.only(bottom: 10),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.white),
                                      color: Colors.grey[300],
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(bottom: 15),
                                    child: Text(
                                      "Aldeias Ribeirinha de Alqueva",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontFamily: 'Metropolis',
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),

                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                              ),

                              //Alconchel
                              BottomSheetBtnAlconchel(
                                  imagePath: 'assets/alconchel.jpg',
                                  title: 'Alconchel',
                                  subTitle: 'Natureza | Náuticas | Mar | Turismo',
                                  concelho: 'Olivença'),

                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                              ),

                              //Aldeia da Luz
                              BottomSheetBtnAldeiaDaLuz(
                                  imagePath: 'assets/luz.jpg',
                                  title: 'Aldeia da Luz',
                                  subTitle: 'Natureza | Náuticas | Mar | Turismo',
                                  concelho: 'Mourão'),

                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                              ),

                              //Alqueva
                              BottomSheetBtnAlqueva(
                                  imagePath: 'assets/alqueva.jpg',
                                  title: 'Alqueva',
                                  subTitle: 'Natureza | Náuticas | Mar | Turismo',
                                  concelho: 'Portel'),

                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                              ),

                              //Amieira
                              BottomSheetBtnAmieira(
                                  imagePath: ('assets/amieira2.jpg'),
                                  title: 'Amieira',
                                  subTitle: 'Natureza',
                                  concelho: 'Portel'),

                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                              ),

                              //Campinho
                              BottomSheetBtnCampinho(
                                  imagePath: 'assets/campinho.jpg',
                                  title: 'Campinho',
                                  subTitle: 'Natureza | Náuticas | Mar | Turismo',
                                  concelho: 'Reguengos de Monsaraz'),

                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                              ),

                              //Cheles
                              BottomSheetBtnCheles(
                                  imagePath: 'assets/cheles.jpg',
                                  title: 'Cheles',
                                  subTitle: 'Natureza | Náuticas | Mar | Turismo',
                                  concelho: 'Badajoz'),

                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                              ),

                              //Estrela
                              BottomSheetBtnEstrela(
                                  imagePath: 'assets/estrela.jpg',
                                  title: 'Estrela',
                                  subTitle: 'Natureza | Náuticas | Mar | Turismo',
                                  concelho: 'Moura'),

                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                              ),

                              //Ferreira de Capelins
                              BottomSheetBtnFerreiraCapelins(
                                  imagePath: 'assets/capelins.jpg',
                                  title: 'Ferreira de Capelins',
                                  subTitle: 'Natureza | Náuticas | Mar | Turismo',
                                  concelho: 'Alandroal'),

                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                              ),

                              //Granja
                              BottomSheetBtnGranja(
                                  imagePath: 'assets/granja.jpg',
                                  title: 'Granja',
                                  subTitle: 'Natureza | Náuticas | Mar | Turismo',
                                  concelho: 'Mourão'),

                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                              ),

                              //Juromenha
                              BottomSheetBtnJuromenha(
                                  imagePath: 'assets/juromenha.jpg',
                                  title: 'Juromenha',
                                  subTitle: 'Natureza | Náuticas | Mar | Turismo',
                                  concelho: 'Alandroal'),

                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                              ),

                              //Marmelar
                              BottomSheetBtnMarmelar(
                                  imagePath: 'assets/marmelar.jpg',
                                  title: 'Marmelar',
                                  subTitle: 'Natureza | Náuticas | Mar | Turismo',
                                  concelho: 'Vidigueira'),

                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                              ),

                              //Mina de Orada
                              BottomSheetBtnMinaDeOrada(
                                  imagePath: 'assets/orada.jpg',
                                  title: 'Mina da Orada',
                                  subTitle: 'Natureza | Náuticas | Mar | Turismo',
                                  concelho: 'Serpa'),

                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                              ),

                              //Monsaraz
                              BottomSheetBtnMonsaraz(
                                  imagePath: 'assets/monsaraz.jpg',
                                  title: 'Monsaraz',
                                  subTitle: 'Natureza | Náuticas | Mar | Turismo',
                                  concelho: 'Reguengos de Monsaraz'),

                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                              ),

                              //Monte de Trigo
                              BottomSheetBtnMonteDeTrigo(
                                  imagePath: 'assets/trigo.jpg',
                                  title: 'Monte de Trigo',
                                  subTitle: 'Natureza | Náuticas | Mar | Turismo',
                                  concelho: 'Portel'),

                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                              ),

                              //Pedrógão de Alentejo
                              BottomSheetBtnPAlentejo(
                                  imagePath: 'assets/pedrogao.jpg',
                                  title: 'Pedrógão de Alentejo',
                                  subTitle: 'Natureza | Náuticas | Mar | Turismo',
                                  concelho: 'Vidigueira'),

                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                              ),

                              //Póvoa de São Miguel
                              BottomSheetBtnPSMiguel(
                                  imagePath: 'assets/povoa.jpg',
                                  title: 'Póvoa de São Miguel',
                                  subTitle: 'Natureza | Náuticas | Mar | Turismo',
                                  concelho: 'Moura'),

                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                              ),

                              //São Marcos do Campo
                              BottomSheetBtnSMCampo(
                                  imagePath: 'assets/campo.jpg',
                                  title: 'São Marcos de Campo',
                                  subTitle: 'Natureza | Náuticas | Mar | Turismo',
                                  concelho: 'Reguengos de Monsaraz'),

                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                              ),

                              //Telheiro
                              BottomSheetBtnTelheiro(
                                  imagePath: 'assets/telheiro.jpg',
                                  title: 'Telheiro',
                                  subTitle: 'Natureza | Náuticas | Mar | Turismo',
                                  concelho: 'Reguengos de Monsaraz'),

                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                              ),

                              //Villaueva del Fresno
                              BottomSheetBtnVFresno(
                                  imagePath: 'assets/villanueva.jpg',
                                  title: 'Villanueva del Fresno',
                                  subTitle: 'Natureza | Náuticas | Mar | Turismo',
                                  concelho: 'Olivença'),

                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                              ),

                              //Villreal
                              BottomSheetBtnVillareal(
                                  imagePath: 'assets/villarreal.jpg',
                                  title: 'Villarreal',
                                  subTitle: 'Natureza | Náuticas | Mar | Turismo',
                                  concelho: 'Olivença'),

                              /*
                            ListTile(
                              leading: new CircleAvatar(
                                backgroundImage:
                                    AssetImage("assets/amieira.jpg"),
                              ),
                              title: new Text('Aldeia da Luz'),
                              onTap: () => {},
                            ),*/
                              /*
                            ElevatedButton(
                              child: const Text('Close BottomSheet'),
                              onPressed: () => Navigator.pop(context),
                            )*/
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      );
    }

  }
}

class LaunchApp extends StatelessWidget {
  void _openExplicitIntentsView(BuildContext context) {
    Navigator.of(context).pushNamed(ExplicitIntentsWidget.routeName);
  }

  @override
  Widget build(BuildContext context) {
    Widget body;
    if (const LocalPlatform().isAndroid) {
      body = Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => _openExplicitIntentsView(context),
              child: const Text('Tap here to test explicit intents.',
                  style: TextStyle(
                    fontFamily: 'Metropolis',
                  )),
            ),
          ],
        ),
      );
    } else {
      body = const Text('This plugin only works with Android',
          style: TextStyle(
            fontFamily: 'Metropolis',
          ));
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example app',
            style: TextStyle(
              fontFamily: 'Metropolis',
            )),
      ),
      body: Center(child: body),
    );
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
