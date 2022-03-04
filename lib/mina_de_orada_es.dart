import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:readmore/readmore.dart';
import 'package:shimmer/shimmer.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';
import 'package:audio_session/audio_session.dart';
import 'main_es.dart';
import 'mapsES.dart';
import 'mina_de_orada.dart';
import 'main.dart';

void main() => runApp(MinaDeOradaES());

class MinaDeOradaES extends StatefulWidget {
  MinaDeOradaES({Key? key}) : super(key: key);

  @override
  _MinaDeOradaESState createState() => _MinaDeOradaESState();
}

class _MinaDeOradaESState extends State<MinaDeOradaES> {
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
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Mina+da+Orada/G4-Orada+placa+entrada.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Mina+da+Orada/G10-Orada+Placa+Aldeia+Ribeirinha.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Mina+da+Orada/G11-Orada+Placa+Aldeia+Ribeirinha.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Mina+da+Orada/G1-Orada+Capela+de+Nossa+Sra+dos+Prazeres.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Mina+da+Orada/G2-Orada+Capela+de+Nossa+Sra+dos+Prazeres.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Mina+da+Orada/G3-Orada+Capela+de+Nossa+Sra+dos+Prazeres.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Mina+da+Orada/G5-Mina+da++Orada-Editar.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Mina+da+Orada/G6-Orada+patrim%C3%B3nio+natural.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Mina+da+Orada/G7-Mina+da+Orada.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Mina+da+Orada/G8-Mina+da+Orada.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Mina+da+Orada/G9-Mina+da+Orada.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final title = '';
    int _current = 0;
    final CarouselController _controller = CarouselController();
    var screenSize = MediaQuery.of(context).size;

    if(screenSize.width < 384) {return MaterialApp(
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
              snap: true,
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
                    "Mina da Orada",
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
                        "Mina da Orada es una pequeña localidad, ubicada en la parroquia de Pias, en el municipio de Serpa. Orada (nombre popular por el que también es conocida esta aldea) es una región cercana a la albufera de Pedrógão, reconocida como una de las diversas “aldeias ribeirinhas do Alqueva”, situada más al sur. Un dato curioso: una de las mayores atracciones de este pequeño territorio, está, en realidad, sumergida. Se trata de una mina de magnetita, desactivada desde 1971, y que en la actualidad se encuentra totalmente inundada, siendo muy buscada por buceadores y curiosos de todas partes. \n\nQuien tiene la oportunidad de visitar esta zona, consigue quedar dislumbrado por la tranquilidad transmitida por el paisaje, así como por el silencio placentero que caracteriza al Alentejo. Aunque es una localidad pequeña, Orada tiene una capilla que enriquece su patrimonio cultural y destaca como punto de interés para visitar. Esta capilla dedicada a Nossa Senhora dos Prazeres se ubica junto a la carretera EN2581. \n\nOtro sitio adecuado para el descanso es el lago de la aldea, donde es posible disfrutar de la tranquilidad que solo el Alentejo consigue ofrecer. Orada es un local muy demandado para practicar buceo, hay quien afirme que hay una visibilidad aceptable, pero no se recomienda la entrada a galerias y grutas interconectadas a la mina a personal sin certificación especializada en buceo en gruta. \n\nEn Mina da Orada existe solamente un restaurante, A Cantina, aunque a escasos quilómetros, en la parroquia de Pias aumenta la oferta de espacios gastronómicos para disfrutar de la cocina tradicional de la región. Teniendo intención de pernocta en la aldea, el Burrico D’Orada es una óptima opción, así como los alojamientos existentes en Pias y en todo el municipio de Serpa, incluyendo el camping de Serpa. \n\nLa aldea de Mina da Orada forma parte de la Reserva DarkSky Alqueva. ",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Metropolis',
                        ),
                        trimLines: 10,
                        colorClickableText: Color.fromRGBO(84, 156, 193, 1.0),
                        trimMode: TrimMode.Line,
                        trimCollapsedText: '...Mostrar más',
                        trimExpandedText: ' Mostrar menos',
                      ),
                    ),
                  ],
                ),

                Padding(
                  padding: EdgeInsets.only(top: 25, bottom: 10),
                ),
              ],),),
          ],
        ),
      ),
    );}else {return MaterialApp(
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
              snap: true,
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
                    "Mina da Orada",
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
                        "Mina da Orada es una pequeña localidad, ubicada en la parroquia de Pias, en el municipio de Serpa. Orada (nombre popular por el que también es conocida esta aldea) es una región cercana a la albufera de Pedrógão, reconocida como una de las diversas “aldeias ribeirinhas do Alqueva”, situada más al sur. Un dato curioso: una de las mayores atracciones de este pequeño territorio, está, en realidad, sumergida. Se trata de una mina de magnetita, desactivada desde 1971, y que en la actualidad se encuentra totalmente inundada, siendo muy buscada por buceadores y curiosos de todas partes. \n\nQuien tiene la oportunidad de visitar esta zona, consigue quedar dislumbrado por la tranquilidad transmitida por el paisaje, así como por el silencio placentero que caracteriza al Alentejo. Aunque es una localidad pequeña, Orada tiene una capilla que enriquece su patrimonio cultural y destaca como punto de interés para visitar. Esta capilla dedicada a Nossa Senhora dos Prazeres se ubica junto a la carretera EN2581. \n\nOtro sitio adecuado para el descanso es el lago de la aldea, donde es posible disfrutar de la tranquilidad que solo el Alentejo consigue ofrecer. Orada es un local muy demandado para practicar buceo, hay quien afirme que hay una visibilidad aceptable, pero no se recomienda la entrada a galerias y grutas interconectadas a la mina a personal sin certificación especializada en buceo en gruta. \n\nEn Mina da Orada existe solamente un restaurante, A Cantina, aunque a escasos quilómetros, en la parroquia de Pias aumenta la oferta de espacios gastronómicos para disfrutar de la cocina tradicional de la región. Teniendo intención de pernocta en la aldea, el Burrico D’Orada es una óptima opción, así como los alojamientos existentes en Pias y en todo el municipio de Serpa, incluyendo el camping de Serpa. \n\nLa aldea de Mina da Orada forma parte de la Reserva DarkSky Alqueva. ",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Metropolis',
                        ),
                        trimLines: 10,
                        colorClickableText: Color.fromRGBO(84, 156, 193, 1.0),
                        trimMode: TrimMode.Line,
                        trimCollapsedText: '...Mostrar más',
                        trimExpandedText: ' Mostrar menos',
                      ),
                    ),
                  ],
                ),

                Padding(
                  padding: EdgeInsets.only(top: 25, bottom: 10),
                ),
              ],),),
          ],
        ),
      ),
    );}


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
          Uri.parse("https://audioguia.s3.eu-west-3.amazonaws.com/Audios/Mina+da+Orada_es.mp3"),
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
                MaterialPageRoute(builder: (context) => MapasES()),
              );
            },
            icon: Icon(
              Icons.keyboard_arrow_left,
              color: Colors.blue,
            ),
          ),

          Container(margin: const EdgeInsets.only(left: 120),),
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
                      padding: const EdgeInsets.only(top: 15, right: 30),
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
                  icon: Image.asset('assets/pt.png'),
                  iconSize: 25,
                  onPressed: () {
                    Navigator.pop(context);
                    player.stop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MinaDeOrada()),
                    );
                  },
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
                  icon: Image.asset('assets/es.png'),
                  iconSize: 25,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      );
    }else {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
              player.stop();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MapasES()),
              );
            },
            icon: Icon(
              Icons.keyboard_arrow_left,
              color: Colors.blue,
            ),
          ),

          Container(margin: const EdgeInsets.only(left: 210),),
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
                      padding: const EdgeInsets.only(top: 15, right: 30),
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
                  icon: Image.asset('assets/pt.png'),
                  iconSize: 25,
                  onPressed: () {
                    Navigator.pop(context);
                    player.stop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MinaDeOrada()),
                    );
                  },
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
                  icon: Image.asset('assets/es.png'),
                  iconSize: 25,
                  onPressed: () {},
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
