import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:readmore/readmore.dart';
import 'package:ribeirinhas/maps.dart';
import 'package:shimmer/shimmer.dart';
import 'package:just_audio/just_audio.dart';
import 'package:audio_session/audio_session.dart';
import 'alconchel_es.dart';
import 'main.dart';

void main() => runApp(Alconchel());

class Alconchel extends StatefulWidget {
  Alconchel({Key? key}) : super(key: key);

  @override
  _AlconchelState createState() => _AlconchelState();
}

class _AlconchelState extends State<Alconchel> {
  final AudioPlayer _player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.black,
    ));
    _init();
  }

  List<String> list = [
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Alconchel/N1-Aconchel+vista+geral.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Alconchel/N10-Alconchel+Plaza+Francisco+Vera.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Alconchel/N11-Alconchel+-+Plaza+Espa%C3%B1a.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Alconchel/N12-Alconchel+-+Ayuntamiento.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Alconchel/N13-Alconchel+-+Plaza+Francisco+Vera.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Alconchel/N14-Alconchel+-Plaza+Mayor.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Alconchel/N15-Alconchel+-+Fontan%C3%A1rio.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Alconchel/N16-Alconchel+-+Fontan%C3%A1rio.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Alconchel/N17-Alconchel+-+Mirador+Celeste.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Alconchel/N18-Vista+do+Castelo+Alconchel.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Alconchel/N19-Castelo+Alconchel.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Alconchel/N2-Aldeia+de+Alconchel.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Alconchel/N20-Vista+geral+alconchel.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Alconchel/N21-Castelo+Alconchel.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Alconchel/N22-Alconchel+Rua+Principal.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Alconchel/N23-vista+geral+do+Castelo+Alconchel.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Alconchel/N24-Paisagem+Vista+do+Castelo+Alconchel.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Alconchel/N25-Entrada+do+Castelo+Alconchel.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Alconchel/N26-Alconchel+Imagem+Nossa+Senhora+da+Luz_.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Alconchel/N27-Alconchel+Ponto+observa%C3%A7%C3%A3o+estrelas+Starlight+junto+castelo+Alconchel.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Alconchel/N3-Alconchel+Museu+local.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Alconchel/N3b-Alconchel+Museu+local.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Alconchel/N4-Ruas+de+Alconchel.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Alconchel/N4b-Ruas+de+Alconchel.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Alconchel/N5-Ruas+de+Alconchel.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Alconchel/N7-Ruas+de+Alconchel.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Alconchel/N8-Alconchel+-+Igreja+Nossa+Senhora+dos+Rem%C3%A9dios_.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Alconchel/N8b-+Alconchel+-Igreja+Nossa+senhora+dos+Rem%C3%A9dios.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Alconchel/N9-Alconchel+-+Igreja+Nossa+Senhora+dos+Rem%C3%A9dios.jpg',
  ];
  final title = '';
  int _current = 0;
  final CarouselController _controller = CarouselController();
  var screenSize = MediaQuery.of(context).size;

  if(screenSize.width < 384) {
  return MaterialApp(
  title: title,
  home: Scaffold(
  //extendBodyBehindAppBar:true,
  // No appbar provided to the Scaffold, only a body with a
  // CustomScrollView.
  body: CustomScrollView(
  slivers: <Widget>[
  // Add the app bar to the CustomScrollView.
  SliverAppBar(
  title: Text(''),
  floating: true,
  expandedHeight: 50,
  //pinned: true,
  snap: true,/*
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyApp()),
                  );
                },
                icon: Icon(
                  Icons.keyboard_arrow_left,
                  color: Colors.blue,
                ),
              ),*/
  backgroundColor: Colors.transparent, elevation: 0.0,
  actions: <Widget>[
  /*IconButton(
                  icon: Icon(
                    Icons.volume_up,
                    color: Colors.blue,
                  ),
                  onPressed: () {
                    // do something
                  },
                ),*/
  Column(
  children: [
  Builder(
  builder: (context) => ControlButtons(_player),
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
  ],
  ),
  // Next, create a SliverList
  SliverList(
  // Use a delegate to build items as they're scrolled on screen.
  delegate: SliverChildListDelegate([
  Container(
  child: CarouselSlider(
  options: CarouselOptions(
  height: 300.0,
  //enlargeCenterPage: true,
  autoPlay: false,
  autoPlayInterval: Duration(seconds: 5),
  aspectRatio: 16 / 9,
  autoPlayCurve: Curves.fastOutSlowIn,
  enableInfiniteScroll: true,
  autoPlayAnimationDuration: Duration(milliseconds: 900),
  viewportFraction: 1,
  ),
  items: [
  Container(
  margin: EdgeInsets.all(6.0),
  child: ClipRRect(
  borderRadius: BorderRadius.circular(8.0),
  child: GestureDetector(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[0],
  fit: BoxFit.cover,
  width: 500,
  ),
  ),
  onTap: () {
  Navigator.push(
  context,
  MaterialPageRoute(
  builder: (_) {
  return GestureDetector(
  child: Center(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[0],
  fit: BoxFit.contain,
  width: 500,
  ),
  /*child: InteractiveViewer(
                                            panEnabled: true,
                                            boundaryMargin: EdgeInsets.all(100),
                                            minScale: 0.5,
                                            maxScale: 5,
                                            child: Image.network(
                                              list[1],
                                              fit: BoxFit.cover,
                                              width: 500,
                                            ),
                                          ),*/
  ),
  ),
  onTap: () {
  Navigator.pop(context);
  },
  );
  },
  ),
  );
  },
  )),
  ),
  Container(
  margin: EdgeInsets.all(6.0),
  child: ClipRRect(
  borderRadius: BorderRadius.circular(8.0),
  child: GestureDetector(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[1],
  fit: BoxFit.cover,
  width: 500,
  ),
  ),
  onTap: () {
  Navigator.push(
  context,
  MaterialPageRoute(
  builder: (_) {
  return GestureDetector(
  child: Center(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[1],
  fit: BoxFit.contain,
  width: 500,
  ),
  ),
  ),
  onTap: () {
  Navigator.pop(context);
  },
  );
  },
  ),
  );
  },
  )),
  ),
  Container(
  margin: EdgeInsets.all(6.0),
  child: ClipRRect(
  borderRadius: BorderRadius.circular(8.0),
  child: GestureDetector(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[2],
  fit: BoxFit.cover,
  width: 500,
  ),
  ),
  onTap: () {
  Navigator.push(
  context,
  MaterialPageRoute(
  builder: (_) {
  return GestureDetector(
  child: Center(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[2],
  fit: BoxFit.contain,
  width: 500,
  ),
  ),
  ),
  onTap: () {
  Navigator.pop(context);
  },
  );
  },
  ),
  );
  },
  )),
  ),
  Container(
  margin: EdgeInsets.all(6.0),
  child: ClipRRect(
  borderRadius: BorderRadius.circular(8.0),
  child: GestureDetector(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[3],
  fit: BoxFit.cover,
  width: 500,
  ),
  ),
  onTap: () {
  Navigator.push(
  context,
  MaterialPageRoute(
  builder: (_) {
  return GestureDetector(
  child: Center(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[3],
  fit: BoxFit.contain,
  width: 500,
  ),
  ),
  ),
  onTap: () {
  Navigator.pop(context);
  },
  );
  },
  ),
  );
  },
  )),
  ),
  Container(
  margin: EdgeInsets.all(6.0),
  child: ClipRRect(
  borderRadius: BorderRadius.circular(8.0),
  child: GestureDetector(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[4],
  fit: BoxFit.cover,
  width: 500,
  ),
  ),
  onTap: () {
  Navigator.push(
  context,
  MaterialPageRoute(
  builder: (_) {
  return GestureDetector(
  child: Center(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[4],
  fit: BoxFit.contain,
  width: 500,
  ),
  ),
  ),
  onTap: () {
  Navigator.pop(context);
  },
  );
  },
  ),
  );
  },
  )),
  ),
  Container(
  margin: EdgeInsets.all(6.0),
  child: ClipRRect(
  borderRadius: BorderRadius.circular(8.0),
  child: GestureDetector(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[5],
  fit: BoxFit.cover,
  width: 500,
  ),
  ),
  onTap: () {
  Navigator.push(
  context,
  MaterialPageRoute(
  builder: (_) {
  return GestureDetector(
  child: Center(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[5],
  fit: BoxFit.contain,
  width: 500,
  ),
  ),
  ),
  onTap: () {
  Navigator.pop(context);
  },
  );
  },
  ),
  );
  },
  )),
  ),
  Container(
  margin: EdgeInsets.all(6.0),
  child: ClipRRect(
  borderRadius: BorderRadius.circular(8.0),
  child: GestureDetector(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[6],
  fit: BoxFit.cover,
  width: 500,
  ),
  ),
  onTap: () {
  Navigator.push(
  context,
  MaterialPageRoute(
  builder: (_) {
  return GestureDetector(
  child: Center(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[6],
  fit: BoxFit.contain,
  width: 500,
  ),
  ),
  ),
  onTap: () {
  Navigator.pop(context);
  },
  );
  },
  ),
  );
  },
  )),
  ),
  Container(
  margin: EdgeInsets.all(6.0),
  child: ClipRRect(
  borderRadius: BorderRadius.circular(8.0),
  child: GestureDetector(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[7],
  fit: BoxFit.cover,
  width: 500,
  ),
  ),
  onTap: () {
  Navigator.push(
  context,
  MaterialPageRoute(
  builder: (_) {
  return GestureDetector(
  child: Center(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[7],
  fit: BoxFit.contain,
  width: 500,
  ),
  ),
  ),
  onTap: () {
  Navigator.pop(context);
  },
  );
  },
  ),
  );
  },
  )),
  ),
  Container(
  margin: EdgeInsets.all(6.0),
  child: ClipRRect(
  borderRadius: BorderRadius.circular(8.0),
  child: GestureDetector(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[8],
  fit: BoxFit.cover,
  width: 500,
  ),
  ),
  onTap: () {
  Navigator.push(
  context,
  MaterialPageRoute(
  builder: (_) {
  return GestureDetector(
  child: Center(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[8],
  fit: BoxFit.contain,
  width: 500,
  ),
  ),
  ),
  onTap: () {
  Navigator.pop(context);
  },
  );
  },
  ),
  );
  },
  )),
  ),
  Container(
  margin: EdgeInsets.all(6.0),
  child: ClipRRect(
  borderRadius: BorderRadius.circular(8.0),
  child: GestureDetector(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[9],
  fit: BoxFit.cover,
  width: 500,
  ),
  ),
  onTap: () {
  Navigator.push(
  context,
  MaterialPageRoute(
  builder: (_) {
  return GestureDetector(
  child: Center(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[9],
  fit: BoxFit.contain,
  width: 500,
  ),
  ),
  ),
  onTap: () {
  Navigator.pop(context);
  },
  );
  },
  ),
  );
  },
  )),
  ),
  Container(
  margin: EdgeInsets.all(6.0),
  child: ClipRRect(
  borderRadius: BorderRadius.circular(8.0),
  child: GestureDetector(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[10],
  fit: BoxFit.cover,
  width: 500,
  ),
  ),
  onTap: () {
  Navigator.push(
  context,
  MaterialPageRoute(
  builder: (_) {
  return GestureDetector(
  child: Center(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[10],
  fit: BoxFit.contain,
  width: 500,
  ),
  ),
  ),
  onTap: () {
  Navigator.pop(context);
  },
  );
  },
  ),
  );
  },
  )),
  ),
  Container(
  margin: EdgeInsets.all(6.0),
  child: ClipRRect(
  borderRadius: BorderRadius.circular(8.0),
  child: GestureDetector(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[11],
  fit: BoxFit.cover,
  width: 500,
  ),
  ),
  onTap: () {
  Navigator.push(
  context,
  MaterialPageRoute(
  builder: (_) {
  return GestureDetector(
  child: Center(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[11],
  fit: BoxFit.contain,
  width: 500,
  ),
  ),
  ),
  onTap: () {
  Navigator.pop(context);
  },
  );
  },
  ),
  );
  },
  )),
  ),
  Container(
  margin: EdgeInsets.all(6.0),
  child: ClipRRect(
  borderRadius: BorderRadius.circular(8.0),
  child: GestureDetector(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[12],
  fit: BoxFit.cover,
  width: 500,
  ),
  ),
  onTap: () {
  Navigator.push(
  context,
  MaterialPageRoute(
  builder: (_) {
  return GestureDetector(
  child: Center(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[12],
  fit: BoxFit.contain,
  width: 500,
  ),
  ),
  ),
  onTap: () {
  Navigator.pop(context);
  },
  );
  },
  ),
  );
  },
  )),
  ),
  Container(
  margin: EdgeInsets.all(6.0),
  child: ClipRRect(
  borderRadius: BorderRadius.circular(8.0),
  child: GestureDetector(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[13],
  fit: BoxFit.cover,
  width: 500,
  ),
  ),
  onTap: () {
  Navigator.push(
  context,
  MaterialPageRoute(
  builder: (_) {
  return GestureDetector(
  child: Center(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[13],
  fit: BoxFit.contain,
  width: 500,
  ),
  ),
  ),
  onTap: () {
  Navigator.pop(context);
  },
  );
  },
  ),
  );
  },
  )),
  ),
  Container(
  margin: EdgeInsets.all(6.0),
  child: ClipRRect(
  borderRadius: BorderRadius.circular(8.0),
  child: GestureDetector(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[14],
  fit: BoxFit.cover,
  width: 500,
  ),
  ),
  onTap: () {
  Navigator.push(
  context,
  MaterialPageRoute(
  builder: (_) {
  return GestureDetector(
  child: Center(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[14],
  fit: BoxFit.contain,
  width: 500,
  ),
  ),
  ),
  onTap: () {
  Navigator.pop(context);
  },
  );
  },
  ),
  );
  },
  )),
  ),
  Container(
  margin: EdgeInsets.all(6.0),
  child: ClipRRect(
  borderRadius: BorderRadius.circular(8.0),
  child: GestureDetector(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[15],
  fit: BoxFit.cover,
  width: 500,
  ),
  ),
  onTap: () {
  Navigator.push(
  context,
  MaterialPageRoute(
  builder: (_) {
  return GestureDetector(
  child: Center(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[15],
  fit: BoxFit.contain,
  width: 500,
  ),
  ),
  ),
  onTap: () {
  Navigator.pop(context);
  },
  );
  },
  ),
  );
  },
  )),
  ),
  Container(
  margin: EdgeInsets.all(6.0),
  child: ClipRRect(
  borderRadius: BorderRadius.circular(8.0),
  child: GestureDetector(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[16],
  fit: BoxFit.cover,
  width: 500,
  ),
  ),
  onTap: () {
  Navigator.push(
  context,
  MaterialPageRoute(
  builder: (_) {
  return GestureDetector(
  child: Center(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[16],
  fit: BoxFit.contain,
  width: 500,
  ),
  ),
  ),
  onTap: () {
  Navigator.pop(context);
  },
  );
  },
  ),
  );
  },
  )),
  ),
  Container(
  margin: EdgeInsets.all(6.0),
  child: ClipRRect(
  borderRadius: BorderRadius.circular(8.0),
  child: GestureDetector(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[17],
  fit: BoxFit.cover,
  width: 500,
  ),
  ),
  onTap: () {
  Navigator.push(
  context,
  MaterialPageRoute(
  builder: (_) {
  return GestureDetector(
  child: Center(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[17],
  fit: BoxFit.contain,
  width: 500,
  ),
  ),
  ),
  onTap: () {
  Navigator.pop(context);
  },
  );
  },
  ),
  );
  },
  )),
  ),
  Container(
  margin: EdgeInsets.all(6.0),
  child: ClipRRect(
  borderRadius: BorderRadius.circular(8.0),
  child: GestureDetector(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[18],
  fit: BoxFit.cover,
  width: 500,
  ),
  ),
  onTap: () {
  Navigator.push(
  context,
  MaterialPageRoute(
  builder: (_) {
  return GestureDetector(
  child: Center(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[18],
  fit: BoxFit.contain,
  width: 500,
  ),
  ),
  ),
  onTap: () {
  Navigator.pop(context);
  },
  );
  },
  ),
  );
  },
  )),
  ),
  Container(
  margin: EdgeInsets.all(6.0),
  child: ClipRRect(
  borderRadius: BorderRadius.circular(8.0),
  child: GestureDetector(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[19],
  fit: BoxFit.cover,
  width: 500,
  ),
  ),
  onTap: () {
  Navigator.push(
  context,
  MaterialPageRoute(
  builder: (_) {
  return GestureDetector(
  child: Center(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[19],
  fit: BoxFit.contain,
  width: 500,
  ),
  ),
  ),
  onTap: () {
  Navigator.pop(context);
  },
  );
  },
  ),
  );
  },
  )),
  ),
  Container(
  margin: EdgeInsets.all(6.0),
  child: ClipRRect(
  borderRadius: BorderRadius.circular(8.0),
  child: GestureDetector(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[20],
  fit: BoxFit.cover,
  width: 500,
  ),
  ),
  onTap: () {
  Navigator.push(
  context,
  MaterialPageRoute(
  builder: (_) {
  return GestureDetector(
  child: Center(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[20],
  fit: BoxFit.contain,
  width: 500,
  ),
  ),
  ),
  onTap: () {
  Navigator.pop(context);
  },
  );
  },
  ),
  );
  },
  )),
  ),
  Container(
  margin: EdgeInsets.all(6.0),
  child: ClipRRect(
  borderRadius: BorderRadius.circular(8.0),
  child: GestureDetector(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[21],
  fit: BoxFit.cover,
  width: 500,
  ),
  ),
  onTap: () {
  Navigator.push(
  context,
  MaterialPageRoute(
  builder: (_) {
  return GestureDetector(
  child: Center(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[21],
  fit: BoxFit.contain,
  width: 500,
  ),
  ),
  ),
  onTap: () {
  Navigator.pop(context);
  },
  );
  },
  ),
  );
  },
  )),
  ),
  Container(
  margin: EdgeInsets.all(6.0),
  child: ClipRRect(
  borderRadius: BorderRadius.circular(8.0),
  child: GestureDetector(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[22],
  fit: BoxFit.cover,
  width: 500,
  ),
  ),
  onTap: () {
  Navigator.push(
  context,
  MaterialPageRoute(
  builder: (_) {
  return GestureDetector(
  child: Center(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[22],
  fit: BoxFit.contain,
  width: 500,
  ),
  ),
  ),
  onTap: () {
  Navigator.pop(context);
  },
  );
  },
  ),
  );
  },
  )),
  ),
  Container(
  margin: EdgeInsets.all(6.0),
  child: ClipRRect(
  borderRadius: BorderRadius.circular(8.0),
  child: GestureDetector(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[23],
  fit: BoxFit.cover,
  width: 500,
  ),
  ),
  onTap: () {
  Navigator.push(
  context,
  MaterialPageRoute(
  builder: (_) {
  return GestureDetector(
  child: Center(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[23],
  fit: BoxFit.contain,
  width: 500,
  ),
  ),
  ),
  onTap: () {
  Navigator.pop(context);
  },
  );
  },
  ),
  );
  },
  )),
  ),
  Container(
  margin: EdgeInsets.all(6.0),
  child: ClipRRect(
  borderRadius: BorderRadius.circular(8.0),
  child: GestureDetector(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[24],
  fit: BoxFit.cover,
  width: 500,
  ),
  ),
  onTap: () {
  Navigator.push(
  context,
  MaterialPageRoute(
  builder: (_) {
  return GestureDetector(
  child: Center(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[24],
  fit: BoxFit.contain,
  width: 500,
  ),
  ),
  ),
  onTap: () {
  Navigator.pop(context);
  },
  );
  },
  ),
  );
  },
  )),
  ),
  Container(
  margin: EdgeInsets.all(6.0),
  child: ClipRRect(
  borderRadius: BorderRadius.circular(8.0),
  child: GestureDetector(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[25],
  fit: BoxFit.cover,
  width: 500,
  ),
  ),
  onTap: () {
  Navigator.push(
  context,
  MaterialPageRoute(
  builder: (_) {
  return GestureDetector(
  child: Center(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[25],
  fit: BoxFit.contain,
  width: 500,
  ),
  ),
  ),
  onTap: () {
  Navigator.pop(context);
  },
  );
  },
  ),
  );
  },
  )),
  ),
  Container(
  margin: EdgeInsets.all(6.0),
  child: ClipRRect(
  borderRadius: BorderRadius.circular(8.0),
  child: GestureDetector(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[26],
  fit: BoxFit.cover,
  width: 500,
  ),
  ),
  onTap: () {
  Navigator.push(
  context,
  MaterialPageRoute(
  builder: (_) {
  return GestureDetector(
  child: Center(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[26],
  fit: BoxFit.contain,
  width: 500,
  ),
  ),
  ),
  onTap: () {
  Navigator.pop(context);
  },
  );
  },
  ),
  );
  },
  )),
  ),
  Container(
  margin: EdgeInsets.all(6.0),
  child: ClipRRect(
  borderRadius: BorderRadius.circular(8.0),
  child: GestureDetector(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[27],
  fit: BoxFit.cover,
  width: 500,
  ),
  ),
  onTap: () {
  Navigator.push(
  context,
  MaterialPageRoute(
  builder: (_) {
  return GestureDetector(
  child: Center(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[27],
  fit: BoxFit.contain,
  width: 500,
  ),
  ),
  ),
  onTap: () {
  Navigator.pop(context);
  },
  );
  },
  ),
  );
  },
  )),
  ),
  Container(
  margin: EdgeInsets.all(6.0),
  child: ClipRRect(
  borderRadius: BorderRadius.circular(8.0),
  child: GestureDetector(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[28],
  fit: BoxFit.cover,
  width: 500,
  ),
  ),
  onTap: () {
  Navigator.push(
  context,
  MaterialPageRoute(
  builder: (_) {
  return GestureDetector(
  child: Center(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[28],
  fit: BoxFit.contain,
  width: 500,
  ),
  ),
  ),
  onTap: () {
  Navigator.pop(context);
  },
  );
  },
  ),
  );
  },
  ),
  ),
  ),
  ],
  ),
  ),
  Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: list.asMap().entries.map((entry) {
  return GestureDetector(
  onTap: () => _controller.animateToPage(entry.key),
  child: Container(
  width: 5.0,
  height: 5.0,
  margin:
  EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
  decoration: BoxDecoration(
  shape: BoxShape.circle,
  color: (Theme.of(context).brightness ==
  Brightness.dark
  ? Colors.white
      : Colors.black)
      .withOpacity(_current == entry.key ? 0.4 : 0.4)),
  ),
  );
  }).toList(),
  ),
  Container(
  padding: const EdgeInsets.only(top: 15, bottom: 10, left: 45),
  child: Text(
  "Alconchel",
  textAlign: TextAlign.left,
  style: TextStyle(
  fontFamily: 'Metropolis',
  color: Color.fromRGBO(84, 156, 193, 1.0),
  fontSize: 24,
  fontWeight: FontWeight.bold),
  ),
  ),
  /*Container(
                    padding: const EdgeInsets.only(top: 30, left: 45),
                    child: Text(
                      "Atividades",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),*/
  Padding(
  padding: EdgeInsets.only(top: 30, bottom: 50),
  child: Row(
  crossAxisAlignment: CrossAxisAlignment.center,
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
  Container(
  margin: EdgeInsets.only(right: 15),
  child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
  Row(
  children: [
  Container(
  height: 50,
  width: 50,
  //margin: EdgeInsets.only(right: 15),
  decoration: BoxDecoration(
  borderRadius: BorderRadius.circular(5.0),
  image: DecorationImage(
  image: AssetImage(
  "assets/ancora.png",
  ),
  fit: BoxFit.cover,
  ),
  ),
  /*child: Tooltip(
                                  message: 'Náuticas',
                                  preferBelow: false,
                                  margin: const EdgeInsets.only(bottom: 10),
                                  showDuration: Duration(seconds: 2),
                                  waitDuration: Duration(milliseconds: 10),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(primary: Colors.transparent, elevation: 0.0),
                                    onPressed: () {},
                                    child: new Tab(icon: new Image.asset("assets/bussola.png", fit: BoxFit.cover,),)
                                  ),
                                ),*/
  ),
  ],
  ),
  Row(
  children: [
  Center(
  child: Container(
  margin: const EdgeInsets.only(top: 5),
  child: Text(
  "Náuticas",
  style: TextStyle(fontFamily: 'Metropolis'),
  ),
  ),
  ),
  ],
  )
  ],
  ),
  ),
  Container(
  margin: EdgeInsets.only(right: 15),
  child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
  Row(
  children: [
  Container(
  height: 50,
  width: 50,
  //margin: EdgeInsets.only(right: 15),
  decoration: BoxDecoration(
  borderRadius: BorderRadius.circular(5.0),
  image: DecorationImage(
  image: AssetImage(
  "assets/bussola.png",
  ),
  fit: BoxFit.cover,
  ),
  ),
  /*child: Tooltip(
                                  message: 'Náuticas',
                                  preferBelow: false,
                                  margin: const EdgeInsets.only(bottom: 10),
                                  showDuration: Duration(seconds: 2),
                                  waitDuration: Duration(milliseconds: 10),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(primary: Colors.transparent, elevation: 0.0),
                                    onPressed: () {},
                                    child: new Tab(icon: new Image.asset("assets/bussola.png", fit: BoxFit.cover,),)
                                  ),
                                ),*/
  ),
  ],
  ),
  Row(
  children: [
  Center(
  child: Container(
  margin: const EdgeInsets.only(top: 5),
  child: Text(
  "Turismo",
  style: TextStyle(fontFamily: 'Metropolis'),
  ),
  ),
  ),
  ],
  )
  ],
  ),
  ),
  Container(
  margin: EdgeInsets.only(right: 15),
  child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
  Row(
  children: [
  Container(
  height: 50,
  width: 50,
  //margin: EdgeInsets.only(right: 15),
  decoration: BoxDecoration(
  borderRadius: BorderRadius.circular(5.0),
  image: DecorationImage(
  image: AssetImage(
  "assets/mar.png",
  ),
  fit: BoxFit.cover,
  ),
  ),
  /*child: Tooltip(
                                  message: 'Náuticas',
                                  preferBelow: false,
                                  margin: const EdgeInsets.only(bottom: 10),
                                  showDuration: Duration(seconds: 2),
                                  waitDuration: Duration(milliseconds: 10),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(primary: Colors.transparent, elevation: 0.0),
                                    onPressed: () {},
                                    child: new Tab(icon: new Image.asset("assets/bussola.png", fit: BoxFit.cover,),)
                                  ),
                                ),*/
  ),
  ],
  ),
  Row(
  children: [
  Center(
  child: Container(
  margin: const EdgeInsets.only(top: 5),
  child: Text(
  "Albufeira",
  style: TextStyle(fontFamily: 'Metropolis'),
  ),
  ),
  ),
  ],
  )
  ],
  ),
  ),
  Container(
  //margin: EdgeInsets.only(right: 10),
  child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
  Row(
  children: [
  Container(
  height: 50,
  width: 50,
  //margin: EdgeInsets.only(right: 15),
  decoration: BoxDecoration(
  borderRadius: BorderRadius.circular(5.0),
  image: DecorationImage(
  image: AssetImage(
  "assets/natureza.png",
  ),
  fit: BoxFit.cover,
  ),
  ),
  /*child: Tooltip(
                                  message: 'Náuticas',
                                  preferBelow: false,
                                  margin: const EdgeInsets.only(bottom: 10),
                                  showDuration: Duration(seconds: 2),
                                  waitDuration: Duration(milliseconds: 10),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(primary: Colors.transparent, elevation: 0.0),
                                    onPressed: () {},
                                    child: new Tab(icon: new Image.asset("assets/bussola.png", fit: BoxFit.cover,),)
                                  ),
                                ),*/
  ),
  ],
  ),
  Row(
  children: [
  Center(
  child: Container(
  margin: const EdgeInsets.only(top: 5),
  child: Text(
  "Natureza",
  style: TextStyle(fontFamily: 'Metropolis'),
  ),
  ),
  ),
  ],
  )
  ],
  ),
  ),
  ],
  ),
  ),
  Column(
  children: [
  Container(
  /*
                  decoration:
                      BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(50), boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 0), // changes position of shadow
                        ),
                      ],),*/
  padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
  child: ReadMoreText(
  'Com uma povoação que privilegia de uma fantástica localização geográfica, a aldeia de Alconchel, no concelho de Olivença, encontra-se a 44 km de Badajoz e faz fronteira com o rio Guadiana. Dos vários pontos de interesse na aldeia, destacam-se o Castelo de Miraflores, o Convento Franciscano de Nossa Senhora da Luz e a Ermita de La Esperanza, entre tantos outros.  \n\nOs séculos XVII, XVIII e XIX são marcados por sucessivas ondas de guerra, nomeadamente a Guerra da Restauração (1640-1668), a Guerra da Sucessão Espanhola (1701-1714) e ainda a Guerra Peninsular (1808-1814), com uma forte influência no Castelo de Alconchel, visto ser um ponto muito desejável, dada a sua localização privilegiada. Quando a vila passa a ser regida pela Câmara Municipal, o castelo acaba por perder relevância, tendo permanecido em estado de degradação até ao primeiro restauro, que acontece no século XIX. \n\nCuriosamente, Alconchel sofreu recentemente obras de requalificação na Plaza de la Iglesia de Alconchel que permitiram dar a conhecer um dos maiores tesouros da história da povoação até então muito bem guardados: um primitivo sistema de abastecimento público de água para a população que viria a ser criado à volta do castelo, sob uma perspetiva de engenharia hidráulica. Este processo resistiu e foi evoluindo para novas fases de construção até aos dias de hoje. \n\nComo pontos de interesse a visitar na aldeia de Alconchel, percebemos a importância e o reconhecimento em torno do Castelo de Miraflores, uma fortaleza de origem árabe construída no século XII pelo rei português D. Afonso Henriques. Ao património cultural de Alconchel acresce o Convento de Nossa Senhora da Luz, situado na quinta Los Jarales, a 10 km da aldeia e na encosta da Serra de Moncarche. Calcula-se que a primitiva igreja de Alconchel tenha sido construída no século XVI, sendo que atualmente apresenta um aspeto gótico-renascentista. Já a Ermita de La Esperanza encontra-se bastante deteriorada, no entanto pode ser vista mesmo em frente ao castelo. \n\nO Município de Alconchel integra a Reserva DarkSky Alqueva, dispondo ainda de um observatório astronómico no Castelo de Miraflores. \n\nPara quem pretende prolongar a estadia em Alconchel, o Hotel Lusitana ou o Albergue Municipal Antigua Casa de Los Maestros poderão ser excelentes opções. A gastronomia regional pode também ser saboreada no Bar Restaurante POLI. ',
  trimLines: 10,
  colorClickableText: Color.fromRGBO(84, 156, 193, 1.0),
  trimMode: TrimMode.Line,
  trimCollapsedText: '...Mostrar mais',
  trimExpandedText: 'Mostrar menos',
  style: TextStyle(
  fontSize: 18,
  fontFamily: 'Metropolis',
  ),
  //textAlign: TextAlign.justify,
  ),
  ),
  Padding(
  padding: EdgeInsets.only(top: 25, bottom: 10),
  ),
  ExpansionTile(
  title: Text("Estadia",style: TextStyle(color: Colors.black),),
  children: [
  InkWell(
  child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
  Column(
  mainAxisAlignment: MainAxisAlignment.start,
  crossAxisAlignment:
  CrossAxisAlignment.start,
  children: [
  Container(
  padding: const EdgeInsets.all(20),
  child: Text(
  "Para quem pretende prolongar a estadia em Alconchel, o Hotel Lusitana ou o Albergue Municipal Antigua Casa de Los Maestros poderão ser excelentes opções. A gastronomia regional pode também ser saboreada no Bar Restaurante POLI. ",
  style: TextStyle(
  fontSize: 18,
  fontFamily: 'Metropolis',
  fontWeight: FontWeight.w400),
  ),
  ),
  Padding(
  padding:
  const EdgeInsets.only(bottom: 10),
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
  Padding(
  padding: EdgeInsets.only(top: 25, bottom: 10),
  ),
  ])),
  ],
  ),
  ),
  );
  } else {

  return MaterialApp(
  title: title,
  home: Scaffold(
  //extendBodyBehindAppBar:true,
  // No appbar provided to the Scaffold, only a body with a
  // CustomScrollView.
  body: CustomScrollView(
  slivers: <Widget>[
  // Add the app bar to the CustomScrollView.
  SliverAppBar(
  title: Text(''),
  floating: true,
  expandedHeight: 50,
  //pinned: true,
  snap: true,/*
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyApp()),
                  );
                },
                icon: Icon(
                  Icons.keyboard_arrow_left,
                  color: Colors.blue,
                ),
              ),*/
  backgroundColor: Colors.transparent, elevation: 0.0,
  actions: <Widget>[
  /*IconButton(
                  icon: Icon(
                    Icons.volume_up,
                    color: Colors.blue,
                  ),
                  onPressed: () {
                    // do something
                  },
                ),*/
  Column(
  children: [
  Builder(
  builder: (context) => ControlButtons(_player),
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
  ],
  ),
  // Next, create a SliverList
  SliverList(
  // Use a delegate to build items as they're scrolled on screen.
  delegate: SliverChildListDelegate([
  Container(
  child: CarouselSlider(
  options: CarouselOptions(
  height: 300.0,
  //enlargeCenterPage: true,
  autoPlay: false,
  autoPlayInterval: Duration(seconds: 5),
  aspectRatio: 16 / 9,
  autoPlayCurve: Curves.fastOutSlowIn,
  enableInfiniteScroll: true,
  autoPlayAnimationDuration: Duration(milliseconds: 900),
  viewportFraction: 1,
  ),
  items: [
  Container(
  margin: EdgeInsets.all(6.0),
  child: ClipRRect(
  borderRadius: BorderRadius.circular(8.0),
  child: GestureDetector(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[0],
  fit: BoxFit.cover,
  width: 500,
  ),
  ),
  onTap: () {
  Navigator.push(
  context,
  MaterialPageRoute(
  builder: (_) {
  return GestureDetector(
  child: Center(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[0],
  fit: BoxFit.contain,
  width: 500,
  ),
  /*child: InteractiveViewer(
                                            panEnabled: true,
                                            boundaryMargin: EdgeInsets.all(100),
                                            minScale: 0.5,
                                            maxScale: 5,
                                            child: Image.network(
                                              list[1],
                                              fit: BoxFit.cover,
                                              width: 500,
                                            ),
                                          ),*/
  ),
  ),
  onTap: () {
  Navigator.pop(context);
  },
  );
  },
  ),
  );
  },
  )),
  ),
  Container(
  margin: EdgeInsets.all(6.0),
  child: ClipRRect(
  borderRadius: BorderRadius.circular(8.0),
  child: GestureDetector(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[1],
  fit: BoxFit.cover,
  width: 500,
  ),
  ),
  onTap: () {
  Navigator.push(
  context,
  MaterialPageRoute(
  builder: (_) {
  return GestureDetector(
  child: Center(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[1],
  fit: BoxFit.contain,
  width: 500,
  ),
  ),
  ),
  onTap: () {
  Navigator.pop(context);
  },
  );
  },
  ),
  );
  },
  )),
  ),
  Container(
  margin: EdgeInsets.all(6.0),
  child: ClipRRect(
  borderRadius: BorderRadius.circular(8.0),
  child: GestureDetector(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[2],
  fit: BoxFit.cover,
  width: 500,
  ),
  ),
  onTap: () {
  Navigator.push(
  context,
  MaterialPageRoute(
  builder: (_) {
  return GestureDetector(
  child: Center(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[2],
  fit: BoxFit.contain,
  width: 500,
  ),
  ),
  ),
  onTap: () {
  Navigator.pop(context);
  },
  );
  },
  ),
  );
  },
  )),
  ),
  Container(
  margin: EdgeInsets.all(6.0),
  child: ClipRRect(
  borderRadius: BorderRadius.circular(8.0),
  child: GestureDetector(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[3],
  fit: BoxFit.cover,
  width: 500,
  ),
  ),
  onTap: () {
  Navigator.push(
  context,
  MaterialPageRoute(
  builder: (_) {
  return GestureDetector(
  child: Center(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[3],
  fit: BoxFit.contain,
  width: 500,
  ),
  ),
  ),
  onTap: () {
  Navigator.pop(context);
  },
  );
  },
  ),
  );
  },
  )),
  ),
  Container(
  margin: EdgeInsets.all(6.0),
  child: ClipRRect(
  borderRadius: BorderRadius.circular(8.0),
  child: GestureDetector(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[4],
  fit: BoxFit.cover,
  width: 500,
  ),
  ),
  onTap: () {
  Navigator.push(
  context,
  MaterialPageRoute(
  builder: (_) {
  return GestureDetector(
  child: Center(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[4],
  fit: BoxFit.contain,
  width: 500,
  ),
  ),
  ),
  onTap: () {
  Navigator.pop(context);
  },
  );
  },
  ),
  );
  },
  )),
  ),
  Container(
  margin: EdgeInsets.all(6.0),
  child: ClipRRect(
  borderRadius: BorderRadius.circular(8.0),
  child: GestureDetector(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[5],
  fit: BoxFit.cover,
  width: 500,
  ),
  ),
  onTap: () {
  Navigator.push(
  context,
  MaterialPageRoute(
  builder: (_) {
  return GestureDetector(
  child: Center(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[5],
  fit: BoxFit.contain,
  width: 500,
  ),
  ),
  ),
  onTap: () {
  Navigator.pop(context);
  },
  );
  },
  ),
  );
  },
  )),
  ),
  Container(
  margin: EdgeInsets.all(6.0),
  child: ClipRRect(
  borderRadius: BorderRadius.circular(8.0),
  child: GestureDetector(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[6],
  fit: BoxFit.cover,
  width: 500,
  ),
  ),
  onTap: () {
  Navigator.push(
  context,
  MaterialPageRoute(
  builder: (_) {
  return GestureDetector(
  child: Center(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[6],
  fit: BoxFit.contain,
  width: 500,
  ),
  ),
  ),
  onTap: () {
  Navigator.pop(context);
  },
  );
  },
  ),
  );
  },
  )),
  ),
  Container(
  margin: EdgeInsets.all(6.0),
  child: ClipRRect(
  borderRadius: BorderRadius.circular(8.0),
  child: GestureDetector(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[7],
  fit: BoxFit.cover,
  width: 500,
  ),
  ),
  onTap: () {
  Navigator.push(
  context,
  MaterialPageRoute(
  builder: (_) {
  return GestureDetector(
  child: Center(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[7],
  fit: BoxFit.contain,
  width: 500,
  ),
  ),
  ),
  onTap: () {
  Navigator.pop(context);
  },
  );
  },
  ),
  );
  },
  )),
  ),
  Container(
  margin: EdgeInsets.all(6.0),
  child: ClipRRect(
  borderRadius: BorderRadius.circular(8.0),
  child: GestureDetector(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[8],
  fit: BoxFit.cover,
  width: 500,
  ),
  ),
  onTap: () {
  Navigator.push(
  context,
  MaterialPageRoute(
  builder: (_) {
  return GestureDetector(
  child: Center(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[8],
  fit: BoxFit.contain,
  width: 500,
  ),
  ),
  ),
  onTap: () {
  Navigator.pop(context);
  },
  );
  },
  ),
  );
  },
  )),
  ),
  Container(
  margin: EdgeInsets.all(6.0),
  child: ClipRRect(
  borderRadius: BorderRadius.circular(8.0),
  child: GestureDetector(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[9],
  fit: BoxFit.cover,
  width: 500,
  ),
  ),
  onTap: () {
  Navigator.push(
  context,
  MaterialPageRoute(
  builder: (_) {
  return GestureDetector(
  child: Center(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[9],
  fit: BoxFit.contain,
  width: 500,
  ),
  ),
  ),
  onTap: () {
  Navigator.pop(context);
  },
  );
  },
  ),
  );
  },
  )),
  ),
  Container(
  margin: EdgeInsets.all(6.0),
  child: ClipRRect(
  borderRadius: BorderRadius.circular(8.0),
  child: GestureDetector(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[10],
  fit: BoxFit.cover,
  width: 500,
  ),
  ),
  onTap: () {
  Navigator.push(
  context,
  MaterialPageRoute(
  builder: (_) {
  return GestureDetector(
  child: Center(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[10],
  fit: BoxFit.contain,
  width: 500,
  ),
  ),
  ),
  onTap: () {
  Navigator.pop(context);
  },
  );
  },
  ),
  );
  },
  )),
  ),
  Container(
  margin: EdgeInsets.all(6.0),
  child: ClipRRect(
  borderRadius: BorderRadius.circular(8.0),
  child: GestureDetector(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[11],
  fit: BoxFit.cover,
  width: 500,
  ),
  ),
  onTap: () {
  Navigator.push(
  context,
  MaterialPageRoute(
  builder: (_) {
  return GestureDetector(
  child: Center(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[11],
  fit: BoxFit.contain,
  width: 500,
  ),
  ),
  ),
  onTap: () {
  Navigator.pop(context);
  },
  );
  },
  ),
  );
  },
  )),
  ),
  Container(
  margin: EdgeInsets.all(6.0),
  child: ClipRRect(
  borderRadius: BorderRadius.circular(8.0),
  child: GestureDetector(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[12],
  fit: BoxFit.cover,
  width: 500,
  ),
  ),
  onTap: () {
  Navigator.push(
  context,
  MaterialPageRoute(
  builder: (_) {
  return GestureDetector(
  child: Center(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[12],
  fit: BoxFit.contain,
  width: 500,
  ),
  ),
  ),
  onTap: () {
  Navigator.pop(context);
  },
  );
  },
  ),
  );
  },
  )),
  ),
  Container(
  margin: EdgeInsets.all(6.0),
  child: ClipRRect(
  borderRadius: BorderRadius.circular(8.0),
  child: GestureDetector(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[13],
  fit: BoxFit.cover,
  width: 500,
  ),
  ),
  onTap: () {
  Navigator.push(
  context,
  MaterialPageRoute(
  builder: (_) {
  return GestureDetector(
  child: Center(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[13],
  fit: BoxFit.contain,
  width: 500,
  ),
  ),
  ),
  onTap: () {
  Navigator.pop(context);
  },
  );
  },
  ),
  );
  },
  )),
  ),
  Container(
  margin: EdgeInsets.all(6.0),
  child: ClipRRect(
  borderRadius: BorderRadius.circular(8.0),
  child: GestureDetector(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[14],
  fit: BoxFit.cover,
  width: 500,
  ),
  ),
  onTap: () {
  Navigator.push(
  context,
  MaterialPageRoute(
  builder: (_) {
  return GestureDetector(
  child: Center(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[14],
  fit: BoxFit.contain,
  width: 500,
  ),
  ),
  ),
  onTap: () {
  Navigator.pop(context);
  },
  );
  },
  ),
  );
  },
  )),
  ),
  Container(
  margin: EdgeInsets.all(6.0),
  child: ClipRRect(
  borderRadius: BorderRadius.circular(8.0),
  child: GestureDetector(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[15],
  fit: BoxFit.cover,
  width: 500,
  ),
  ),
  onTap: () {
  Navigator.push(
  context,
  MaterialPageRoute(
  builder: (_) {
  return GestureDetector(
  child: Center(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[15],
  fit: BoxFit.contain,
  width: 500,
  ),
  ),
  ),
  onTap: () {
  Navigator.pop(context);
  },
  );
  },
  ),
  );
  },
  )),
  ),
  Container(
  margin: EdgeInsets.all(6.0),
  child: ClipRRect(
  borderRadius: BorderRadius.circular(8.0),
  child: GestureDetector(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[16],
  fit: BoxFit.cover,
  width: 500,
  ),
  ),
  onTap: () {
  Navigator.push(
  context,
  MaterialPageRoute(
  builder: (_) {
  return GestureDetector(
  child: Center(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[16],
  fit: BoxFit.contain,
  width: 500,
  ),
  ),
  ),
  onTap: () {
  Navigator.pop(context);
  },
  );
  },
  ),
  );
  },
  )),
  ),
  Container(
  margin: EdgeInsets.all(6.0),
  child: ClipRRect(
  borderRadius: BorderRadius.circular(8.0),
  child: GestureDetector(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[17],
  fit: BoxFit.cover,
  width: 500,
  ),
  ),
  onTap: () {
  Navigator.push(
  context,
  MaterialPageRoute(
  builder: (_) {
  return GestureDetector(
  child: Center(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[17],
  fit: BoxFit.contain,
  width: 500,
  ),
  ),
  ),
  onTap: () {
  Navigator.pop(context);
  },
  );
  },
  ),
  );
  },
  )),
  ),
  Container(
  margin: EdgeInsets.all(6.0),
  child: ClipRRect(
  borderRadius: BorderRadius.circular(8.0),
  child: GestureDetector(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[18],
  fit: BoxFit.cover,
  width: 500,
  ),
  ),
  onTap: () {
  Navigator.push(
  context,
  MaterialPageRoute(
  builder: (_) {
  return GestureDetector(
  child: Center(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[18],
  fit: BoxFit.contain,
  width: 500,
  ),
  ),
  ),
  onTap: () {
  Navigator.pop(context);
  },
  );
  },
  ),
  );
  },
  )),
  ),
  Container(
  margin: EdgeInsets.all(6.0),
  child: ClipRRect(
  borderRadius: BorderRadius.circular(8.0),
  child: GestureDetector(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[19],
  fit: BoxFit.cover,
  width: 500,
  ),
  ),
  onTap: () {
  Navigator.push(
  context,
  MaterialPageRoute(
  builder: (_) {
  return GestureDetector(
  child: Center(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[19],
  fit: BoxFit.contain,
  width: 500,
  ),
  ),
  ),
  onTap: () {
  Navigator.pop(context);
  },
  );
  },
  ),
  );
  },
  )),
  ),
  Container(
  margin: EdgeInsets.all(6.0),
  child: ClipRRect(
  borderRadius: BorderRadius.circular(8.0),
  child: GestureDetector(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[20],
  fit: BoxFit.cover,
  width: 500,
  ),
  ),
  onTap: () {
  Navigator.push(
  context,
  MaterialPageRoute(
  builder: (_) {
  return GestureDetector(
  child: Center(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[20],
  fit: BoxFit.contain,
  width: 500,
  ),
  ),
  ),
  onTap: () {
  Navigator.pop(context);
  },
  );
  },
  ),
  );
  },
  )),
  ),
  Container(
  margin: EdgeInsets.all(6.0),
  child: ClipRRect(
  borderRadius: BorderRadius.circular(8.0),
  child: GestureDetector(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[21],
  fit: BoxFit.cover,
  width: 500,
  ),
  ),
  onTap: () {
  Navigator.push(
  context,
  MaterialPageRoute(
  builder: (_) {
  return GestureDetector(
  child: Center(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[21],
  fit: BoxFit.contain,
  width: 500,
  ),
  ),
  ),
  onTap: () {
  Navigator.pop(context);
  },
  );
  },
  ),
  );
  },
  )),
  ),
  Container(
  margin: EdgeInsets.all(6.0),
  child: ClipRRect(
  borderRadius: BorderRadius.circular(8.0),
  child: GestureDetector(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[22],
  fit: BoxFit.cover,
  width: 500,
  ),
  ),
  onTap: () {
  Navigator.push(
  context,
  MaterialPageRoute(
  builder: (_) {
  return GestureDetector(
  child: Center(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[22],
  fit: BoxFit.contain,
  width: 500,
  ),
  ),
  ),
  onTap: () {
  Navigator.pop(context);
  },
  );
  },
  ),
  );
  },
  )),
  ),
  Container(
  margin: EdgeInsets.all(6.0),
  child: ClipRRect(
  borderRadius: BorderRadius.circular(8.0),
  child: GestureDetector(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[23],
  fit: BoxFit.cover,
  width: 500,
  ),
  ),
  onTap: () {
  Navigator.push(
  context,
  MaterialPageRoute(
  builder: (_) {
  return GestureDetector(
  child: Center(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[23],
  fit: BoxFit.contain,
  width: 500,
  ),
  ),
  ),
  onTap: () {
  Navigator.pop(context);
  },
  );
  },
  ),
  );
  },
  )),
  ),
  Container(
  margin: EdgeInsets.all(6.0),
  child: ClipRRect(
  borderRadius: BorderRadius.circular(8.0),
  child: GestureDetector(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[24],
  fit: BoxFit.cover,
  width: 500,
  ),
  ),
  onTap: () {
  Navigator.push(
  context,
  MaterialPageRoute(
  builder: (_) {
  return GestureDetector(
  child: Center(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[24],
  fit: BoxFit.contain,
  width: 500,
  ),
  ),
  ),
  onTap: () {
  Navigator.pop(context);
  },
  );
  },
  ),
  );
  },
  )),
  ),
  Container(
  margin: EdgeInsets.all(6.0),
  child: ClipRRect(
  borderRadius: BorderRadius.circular(8.0),
  child: GestureDetector(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[25],
  fit: BoxFit.cover,
  width: 500,
  ),
  ),
  onTap: () {
  Navigator.push(
  context,
  MaterialPageRoute(
  builder: (_) {
  return GestureDetector(
  child: Center(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[25],
  fit: BoxFit.contain,
  width: 500,
  ),
  ),
  ),
  onTap: () {
  Navigator.pop(context);
  },
  );
  },
  ),
  );
  },
  )),
  ),
  Container(
  margin: EdgeInsets.all(6.0),
  child: ClipRRect(
  borderRadius: BorderRadius.circular(8.0),
  child: GestureDetector(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[26],
  fit: BoxFit.cover,
  width: 500,
  ),
  ),
  onTap: () {
  Navigator.push(
  context,
  MaterialPageRoute(
  builder: (_) {
  return GestureDetector(
  child: Center(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[26],
  fit: BoxFit.contain,
  width: 500,
  ),
  ),
  ),
  onTap: () {
  Navigator.pop(context);
  },
  );
  },
  ),
  );
  },
  )),
  ),
  Container(
  margin: EdgeInsets.all(6.0),
  child: ClipRRect(
  borderRadius: BorderRadius.circular(8.0),
  child: GestureDetector(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[27],
  fit: BoxFit.cover,
  width: 500,
  ),
  ),
  onTap: () {
  Navigator.push(
  context,
  MaterialPageRoute(
  builder: (_) {
  return GestureDetector(
  child: Center(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[27],
  fit: BoxFit.contain,
  width: 500,
  ),
  ),
  ),
  onTap: () {
  Navigator.pop(context);
  },
  );
  },
  ),
  );
  },
  )),
  ),
  Container(
  margin: EdgeInsets.all(6.0),
  child: ClipRRect(
  borderRadius: BorderRadius.circular(8.0),
  child: GestureDetector(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[28],
  fit: BoxFit.cover,
  width: 500,
  ),
  ),
  onTap: () {
  Navigator.push(
  context,
  MaterialPageRoute(
  builder: (_) {
  return GestureDetector(
  child: Center(
  child: Hero(
  tag: 'hero',
  child: Image.network(
  list[28],
  fit: BoxFit.contain,
  width: 500,
  ),
  ),
  ),
  onTap: () {
  Navigator.pop(context);
  },
  );
  },
  ),
  );
  },
  ),
  ),
  ),
  ],
  ),
  ),
  Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: list.asMap().entries.map((entry) {
  return GestureDetector(
  onTap: () => _controller.animateToPage(entry.key),
  child: Container(
  width: 5.0,
  height: 5.0,
  margin:
  EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
  decoration: BoxDecoration(
  shape: BoxShape.circle,
  color: (Theme.of(context).brightness ==
  Brightness.dark
  ? Colors.white
      : Colors.black)
      .withOpacity(_current == entry.key ? 0.4 : 0.4)),
  ),
  );
  }).toList(),
  ),
  Container(
  padding: const EdgeInsets.only(top: 15, bottom: 10, left: 45),
  child: Text(
  "Alconchel",
  textAlign: TextAlign.left,
  style: TextStyle(
  fontFamily: 'Metropolis',
  color: Color.fromRGBO(84, 156, 193, 1.0),
  fontSize: 24,
  fontWeight: FontWeight.bold),
  ),
  ),
  /*Container(
                    padding: const EdgeInsets.only(top: 30, left: 45),
                    child: Text(
                      "Atividades",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),*/
  Padding(
  padding: EdgeInsets.only(top: 30, bottom: 50),
  child: Row(
  crossAxisAlignment: CrossAxisAlignment.center,
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
  Container(
  margin: EdgeInsets.only(right: 15),
  child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
  Row(
  children: [
  Container(
  height: 65,
  width: 65,
  //margin: EdgeInsets.only(right: 15),
  decoration: BoxDecoration(
  borderRadius: BorderRadius.circular(5.0),
  image: DecorationImage(
  image: AssetImage(
  "assets/ancora.png",
  ),
  fit: BoxFit.cover,
  ),
  ),
  /*child: Tooltip(
                                  message: 'Náuticas',
                                  preferBelow: false,
                                  margin: const EdgeInsets.only(bottom: 10),
                                  showDuration: Duration(seconds: 2),
                                  waitDuration: Duration(milliseconds: 10),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(primary: Colors.transparent, elevation: 0.0),
                                    onPressed: () {},
                                    child: new Tab(icon: new Image.asset("assets/bussola.png", fit: BoxFit.cover,),)
                                  ),
                                ),*/
  ),
  ],
  ),
  Row(
  children: [
  Center(
  child: Container(
  margin: const EdgeInsets.only(top: 5),
  child: Text(
  "Náuticas",
  style: TextStyle(fontFamily: 'Metropolis'),
  ),
  ),
  ),
  ],
  )
  ],
  ),
  ),
  Container(
  margin: EdgeInsets.only(right: 15),
  child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
  Row(
  children: [
  Container(
  height: 65,
  width: 65,
  //margin: EdgeInsets.only(right: 15),
  decoration: BoxDecoration(
  borderRadius: BorderRadius.circular(5.0),
  image: DecorationImage(
  image: AssetImage(
  "assets/bussola.png",
  ),
  fit: BoxFit.cover,
  ),
  ),
  /*child: Tooltip(
                                  message: 'Náuticas',
                                  preferBelow: false,
                                  margin: const EdgeInsets.only(bottom: 10),
                                  showDuration: Duration(seconds: 2),
                                  waitDuration: Duration(milliseconds: 10),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(primary: Colors.transparent, elevation: 0.0),
                                    onPressed: () {},
                                    child: new Tab(icon: new Image.asset("assets/bussola.png", fit: BoxFit.cover,),)
                                  ),
                                ),*/
  ),
  ],
  ),
  Row(
  children: [
  Center(
  child: Container(
  margin: const EdgeInsets.only(top: 5),
  child: Text(
  "Turismo",
  style: TextStyle(fontFamily: 'Metropolis'),
  ),
  ),
  ),
  ],
  )
  ],
  ),
  ),
  Container(
  margin: EdgeInsets.only(right: 15),
  child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
  Row(
  children: [
  Container(
  height: 65,
  width: 65,
  //margin: EdgeInsets.only(right: 15),
  decoration: BoxDecoration(
  borderRadius: BorderRadius.circular(5.0),
  image: DecorationImage(
  image: AssetImage(
  "assets/mar.png",
  ),
  fit: BoxFit.cover,
  ),
  ),
  /*child: Tooltip(
                                  message: 'Náuticas',
                                  preferBelow: false,
                                  margin: const EdgeInsets.only(bottom: 10),
                                  showDuration: Duration(seconds: 2),
                                  waitDuration: Duration(milliseconds: 10),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(primary: Colors.transparent, elevation: 0.0),
                                    onPressed: () {},
                                    child: new Tab(icon: new Image.asset("assets/bussola.png", fit: BoxFit.cover,),)
                                  ),
                                ),*/
  ),
  ],
  ),
  Row(
  children: [
  Center(
  child: Container(
  margin: const EdgeInsets.only(top: 5),
  child: Text(
  "Albufeira",
  style: TextStyle(fontFamily: 'Metropolis'),
  ),
  ),
  ),
  ],
  )
  ],
  ),
  ),
  Container(
  margin: EdgeInsets.only(right: 15),
  child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
  Row(
  children: [
  Container(
  height: 65,
  width: 65,
  //margin: EdgeInsets.only(right: 15),
  decoration: BoxDecoration(
  borderRadius: BorderRadius.circular(5.0),
  image: DecorationImage(
  image: AssetImage(
  "assets/natureza.png",
  ),
  fit: BoxFit.cover,
  ),
  ),
  /*child: Tooltip(
                                  message: 'Náuticas',
                                  preferBelow: false,
                                  margin: const EdgeInsets.only(bottom: 10),
                                  showDuration: Duration(seconds: 2),
                                  waitDuration: Duration(milliseconds: 10),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(primary: Colors.transparent, elevation: 0.0),
                                    onPressed: () {},
                                    child: new Tab(icon: new Image.asset("assets/bussola.png", fit: BoxFit.cover,),)
                                  ),
                                ),*/
  ),
  ],
  ),
  Row(
  children: [
  Center(
  child: Container(
  margin: const EdgeInsets.only(top: 5),
  child: Text(
  "Natureza",
  style: TextStyle(fontFamily: 'Metropolis'),
  ),
  ),
  ),
  ],
  )
  ],
  ),
  ),
  ],
  ),
  ),
  Column(
  children: [
  Container(
  /*
                  decoration:
                      BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(50), boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 0), // changes position of shadow
                        ),
                      ],),*/
  padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
  child: ReadMoreText(
  'Com uma povoação que privilegia de uma fantástica localização geográfica, a aldeia de Alconchel, no concelho de Olivença, encontra-se a 44 km de Badajoz e faz fronteira com o rio Guadiana. Dos vários pontos de interesse na aldeia, destacam-se o Castelo de Miraflores, o Convento Franciscano de Nossa Senhora da Luz e a Ermita de La Esperanza, entre tantos outros.  \n\nOs séculos XVII, XVIII e XIX são marcados por sucessivas ondas de guerra, nomeadamente a Guerra da Restauração (1640-1668), a Guerra da Sucessão Espanhola (1701-1714) e ainda a Guerra Peninsular (1808-1814), com uma forte influência no Castelo de Alconchel, visto ser um ponto muito desejável, dada a sua localização privilegiada. Quando a vila passa a ser regida pela Câmara Municipal, o castelo acaba por perder relevância, tendo permanecido em estado de degradação até ao primeiro restauro, que acontece no século XIX. \n\nCuriosamente, Alconchel sofreu recentemente obras de requalificação na Plaza de la Iglesia de Alconchel que permitiram dar a conhecer um dos maiores tesouros da história da povoação até então muito bem guardados: um primitivo sistema de abastecimento público de água para a população que viria a ser criado à volta do castelo, sob uma perspetiva de engenharia hidráulica. Este processo resistiu e foi evoluindo para novas fases de construção até aos dias de hoje. \n\nComo pontos de interesse a visitar na aldeia de Alconchel, percebemos a importância e o reconhecimento em torno do Castelo de Miraflores, uma fortaleza de origem árabe construída no século XII pelo rei português D. Afonso Henriques. Ao património cultural de Alconchel acresce o Convento de Nossa Senhora da Luz, situado na quinta Los Jarales, a 10 km da aldeia e na encosta da Serra de Moncarche. Calcula-se que a primitiva igreja de Alconchel tenha sido construída no século XVI, sendo que atualmente apresenta um aspeto gótico-renascentista. Já a Ermita de La Esperanza encontra-se bastante deteriorada, no entanto pode ser vista mesmo em frente ao castelo. \n\nO Município de Alconchel integra a Reserva DarkSky Alqueva, dispondo ainda de um observatório astronómico no Castelo de Miraflores. \n\nPara quem pretende prolongar a estadia em Alconchel, o Hotel Lusitana ou o Albergue Municipal Antigua Casa de Los Maestros poderão ser excelentes opções. A gastronomia regional pode também ser saboreada no Bar Restaurante POLI. ',
  trimLines: 10,
  colorClickableText: Color.fromRGBO(84, 156, 193, 1.0),
  trimMode: TrimMode.Line,
  trimCollapsedText: '...Mostrar mais',
  trimExpandedText: 'Mostrar menos',
  style: TextStyle(
  fontSize: 18,
  fontFamily: 'Metropolis',
  ),
  //textAlign: TextAlign.justify,
  ),
  ),
  Padding(
  padding: EdgeInsets.only(top: 25, bottom: 10),
  ),
  ExpansionTile(
  title: Text("Estadia",style: TextStyle(color: Colors.black),),
  children: [
  InkWell(
  child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
  Column(
  mainAxisAlignment: MainAxisAlignment.start,
  crossAxisAlignment:
  CrossAxisAlignment.start,
  children: [
  Container(
  padding: const EdgeInsets.all(20),
  child: Text(
  "Para quem pretende prolongar a estadia em Alconchel, o Hotel Lusitana ou o Albergue Municipal Antigua Casa de Los Maestros poderão ser excelentes opções. A gastronomia regional pode também ser saboreada no Bar Restaurante POLI. ",
  style: TextStyle(
  fontSize: 18,
  fontFamily: 'Metropolis',
  fontWeight: FontWeight.w400),
  ),
  ),
  Padding(
  padding:
  const EdgeInsets.only(bottom: 10),
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
  Padding(
  padding: EdgeInsets.only(top: 25, bottom: 10),
  ),
  ])),
  ],
  ),
  ),
  );
  }
  @override
  Widget build(BuildContext context) {


    
  }

  Future<void> _init() async {
    // Inform the operating system of our app's audio attributes etc.
    // We pick a reasonable default for an app that plays speech.
    final session = await AudioSession.instance;
    await session.configure(AudioSessionConfiguration.speech());
    // Listen to errors during playback.
    _player.playbackEventStream.listen((event) {},
        onError: (Object e, StackTrace stackTrace) {
      print('A stream error occurred: $e');
    });
    // Try to load audio from a source and catch any errors.
    try {
      await _player.setAudioSource(
        AudioSource.uri(
          Uri.parse(
              "https://audioguia.s3.eu-west-3.amazonaws.com/Audios/Alconchel_01.flac"),
        ),
      );
    } catch (e) {
      print("Error loading audio source: $e");
    }
  }

  @override
  void dispose() {
    // Release decoders and buffers back to the operating system making them
    // available for other apps to use.
    _player.dispose();
    super.dispose();
  }
}

class ControlButtons extends StatelessWidget {
  final AudioPlayer player;

  ControlButtons(this.player);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    if(screenSize.width < 384) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
              player.stop();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Mapas()),
              );
            },
            icon: Icon(
              Icons.keyboard_arrow_left,
              color: Colors.blue,
            ),
          ),
          // Opens volume slider dialog
          /*IconButton(
          icon: Icon(
            Icons.volume_up,
            color: Colors.black,
          ),
          onPressed: () {
            showSliderDialog(
              context: context,
              title: "Adjust volume",
              divisions: 10,
              min: 0.0,
              max: 1.0,
              stream: player.volumeStream,
              onChanged: player.setVolume,
            );
          },
        ),*/

          Container(margin: const EdgeInsets.only(left: 120),),

          /// This StreamBuilder rebuilds whenever the player state changes, which
          /// includes the playing/paused state and also the
          /// loading/buffering/ready state. Depending on the state we show the
          /// appropriate button or loading indicator.
          StreamBuilder<PlayerState>(
            stream: player.playerStateStream,
            builder: (context, snapshot) {

              final playerState = snapshot.data;
              final processingState = playerState?.processingState;
              final playing = playerState?.playing;

              if (processingState == ProcessingState.loading ||
                  processingState == ProcessingState.buffering) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 0, right: 30),
                    ),
                    Container(
                      width: 15.0,
                      height: 15.0,
                      child: CircularProgressIndicator(),
                    ),
                  ],
                );
              } else if (playing != true) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.volume_up,
                        color: Colors.blue,
                      ),
                      iconSize: 25.0,
                      onPressed: player.play,
                    ),
                  ],
                );
              } else if (processingState != ProcessingState.completed) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.pause,
                        color: Colors.blue,
                      ),
                      iconSize: 25.0,
                      onPressed: player.pause,
                    ),
                  ],
                );
              } else {
                return IconButton(
                  icon: Icon(
                    Icons.replay,
                    color: Colors.blue,
                  ),
                  iconSize: 25.0,
                  onPressed: () => player.seek(Duration.zero),
                );
              }
            },
          ),
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
                    player.stop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AlconchelES()),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      );
    }
    else {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
              player.stop();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Mapas()),
              );
            },
            icon: Icon(
              Icons.keyboard_arrow_left,
              color: Colors.blue,
            ),
          ),
          // Opens volume slider dialog
          /*IconButton(
          icon: Icon(
            Icons.volume_up,
            color: Colors.black,
          ),
          onPressed: () {
            showSliderDialog(
              context: context,
              title: "Adjust volume",
              divisions: 10,
              min: 0.0,
              max: 1.0,
              stream: player.volumeStream,
              onChanged: player.setVolume,
            );
          },
        ),*/

          Container(margin: const EdgeInsets.only(left: 210),),

          /// This StreamBuilder rebuilds whenever the player state changes, which
          /// includes the playing/paused state and also the
          /// loading/buffering/ready state. Depending on the state we show the
          /// appropriate button or loading indicator.
          StreamBuilder<PlayerState>(
            stream: player.playerStateStream,
            builder: (context, snapshot) {

              final playerState = snapshot.data;
              final processingState = playerState?.processingState;
              final playing = playerState?.playing;

              if (processingState == ProcessingState.loading ||
                  processingState == ProcessingState.buffering) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 0, right: 30),
                    ),
                    Container(
                      width: 15.0,
                      height: 15.0,
                      child: CircularProgressIndicator(),
                    ),
                  ],
                );
              } else if (playing != true) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.volume_up,
                        color: Colors.blue,
                      ),
                      iconSize: 25.0,
                      onPressed: player.play,
                    ),
                  ],
                );
              } else if (processingState != ProcessingState.completed) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.pause,
                        color: Colors.blue,
                      ),
                      iconSize: 25.0,
                      onPressed: player.pause,
                    ),
                  ],
                );
              } else {
                return IconButton(
                  icon: Icon(
                    Icons.replay,
                    color: Colors.blue,
                  ),
                  iconSize: 25.0,
                  onPressed: () => player.seek(Duration.zero),
                );
              }
            },
          ),
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
                    player.stop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AlconchelES()),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      );
    }
  }
}

class _Shimmer extends StatelessWidget {
  const _Shimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        width: 500.0,
        height: 300.0,
        child: Shimmer.fromColors(
          baseColor: Colors.grey,
          highlightColor: Colors.white,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0), color: Colors.white),
            child: Column(),
          ),
        ),
      ),
    );
  }
}
