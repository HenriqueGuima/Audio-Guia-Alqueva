import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:readmore/readmore.dart';
import 'package:shimmer/shimmer.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';
import 'package:audio_session/audio_session.dart';
import 'maps.dart';
import 'mina_de_orada_es.dart';
import 'main.dart';
import 'monte_de_trigo_es.dart';

void main() => runApp(MonteDeTrigo());

class MonteDeTrigo extends StatefulWidget {
  MonteDeTrigo({Key? key}) : super(key: key);

  @override
  _MonteDeTrigoState createState() => _MonteDeTrigoState();
}

class _MonteDeTrigoState extends State<MonteDeTrigo> {
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
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Monte+Trigo/M12-Monte+Trigo+placa+entrada.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Monte+Trigo/M1-Entrada+Monte+Trigo.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Monte+Trigo/M10-Pequeno+Jardim+Monte+Trigo-Editar.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Monte+Trigo/M11-Pequeno+Jardim+Monte+Trigo.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Monte+Trigo/M14-Monte+TrigoPlaca+Ribeirinha.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Monte+Trigo/M16-Jardim+Publico+Monte+Trigo.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Monte+Trigo/M2-Entrada+Monte+Trigo.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Monte+Trigo/M4-Entrada+Monte+Trigo.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Monte+Trigo/M6-Pequeno+Jardim+Monte+Trigo.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Monte+Trigo/M7-Aldeia+de+Monte+Trigo.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Monte+Trigo/M8-Aldeia+de+Monte+Trigo.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Monte+Trigo/M9-Monte+Trigo+Igreja+Paroquial+S%C3%A3o+Juli%C3%A3o.jpg',

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
                delegate: SliverChildListDelegate(
                    [
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
                              margin: EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 4.0),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: (Theme.of(context).brightness ==
                                      Brightness.dark
                                      ? Colors.white
                                      : Colors.black)
                                      .withOpacity(
                                      _current == entry.key ? 0.4 : 0.4)),
                            ),
                          );
                        }).toList(),
                      ),
                      Container(
                        padding:
                        const EdgeInsets.only(top: 15, bottom: 10, left: 45),
                        child: Text(
                          "Monte de Trigo",
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
                                  message: 'N??uticas',
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
                                            "N??uticas",
                                            style:
                                            TextStyle(fontFamily: 'Metropolis'),
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
                                  message: 'N??uticas',
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
                                            style:
                                            TextStyle(fontFamily: 'Metropolis'),
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
                                  message: 'N??uticas',
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
                                            style:
                                            TextStyle(fontFamily: 'Metropolis'),
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
                                  message: 'N??uticas',
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
                                            style:
                                            TextStyle(fontFamily: 'Metropolis'),
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
                              "Integrada no concelho de Portel, a aldeia de Monte de Trigo ?? uma das v??rias aldeias ribeiras do Alqueva. Com uma maior densidade demogr??fica e at?? populacional, comparativamente com as regi??es circundantes, a aldeia fica muito pr??xima de Portel e de S??o Man??os. A proximidade ?? zona do lago ?? um fator que enriquece qualquer visita. \n\nNuma terra caracteristicamente rica e f??rtil, a sua localiza????o privilegiada j?? viria a ser referenciada desde o s??culo XIII. Apesar de se desconhecer a origem topon??mica da freguesia, as excelentes colheitas de cereais (especialmente de trigo) poder??o ser um bom princ??pio para a designa????o deste pequeno territ??rio. Tudo indica que a freguesia de Monte de Trigo j?? constitu??sse, nesse mesmo s??culo, um local desde sempre muito prestigiado, quer pela localiza????o geogr??fica, quer pelos recursos econ??micos, o que permitiu que estas terras n??o fossem, outrora, inclu??das na doa????o de D. Afonso III para D. Jo??o de Aboim. Em 1283, a herdade de Monte de Trigo era propriedade da coroa, numa altura em que D. Dinis troca o territ??rio pela Vila de Alvito, ficando ent??o na propriedade do Mosteiro da Trindade de Santar??m. J?? no s??culo XV, uma parte deste reguengo foi doado ?? Condessa de Faro, sendo que toda a ??rea acabou posteriormente por integrar o patrim??nio do padroado da Casa de Bragan??a. \n\nNa Rela????o Hist??rica (1730), Francisco Patalim refor??a a aptid??o agr??cola desta regi??o, uma terra que considerava ???maravilhosa??? quanto ?? ???produ????o de frutos???, destacando tamb??m a condi????o dos seus moradores. A igreja primitiva da aldeia, que seria de orago ao santo padroeiro S. Juli??o, ter?? desaparecido por completo entre 1946/47, dando lugar ao atual templo que se ergue no mesmo local. A seguir ?? freguesia de Portel, Monte de Trigo destaca-se economicamente, dadas as terras f??rteis e a localiza????o privilegiada que tem contribu??do para o importante desenvolvimento da regi??o. \n\nAtualmente, encontramos v??rios pontos de interesse e de atra????o tur??stica para conhecer na regi??o. Uma delas ?? a Igreja Paroquial de S. Juli??o de Monte de Trigo, constru??da nos anos 40 do s??culo XX e ?? atualmente um exemplar paradigm??tico da arquitetura religiosa do Estado Novo. A igreja tomou o lugar de um primitivo templo que acabou por ser demolido. Destaque ainda para o Jardim Municipal de Monte do Trigo, para o conjunto diversificado de equipamentos desportivos existentes na aldeia e nas proximidades a Albufeira do Loureiro, que proporcionam as melhores condi????es para a pr??tica desportiva. \n\nMonte de Trigo acaba por ainda anexar a freguesia de Nossa Senhora da Assun????o da Atalaia, cuja igreja paroquial se encontra atualmente em ru??nas. A aldeia integra a Reserva DarkSky Alqueva. ",
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Metropolis',
                              ),
                              trimLines: 10,
                              colorClickableText: Color.fromRGBO(84, 156, 193, 1.0),
                              trimMode: TrimMode.Line,
                              trimCollapsedText: '...Mostrar mais',
                              trimExpandedText: ' Mostrar menos',
                            ),
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
                delegate: SliverChildListDelegate(
                    [
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
                              margin: EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 4.0),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: (Theme.of(context).brightness ==
                                      Brightness.dark
                                      ? Colors.white
                                      : Colors.black)
                                      .withOpacity(
                                      _current == entry.key ? 0.4 : 0.4)),
                            ),
                          );
                        }).toList(),
                      ),
                      Container(
                        padding:
                        const EdgeInsets.only(top: 15, bottom: 10, left: 45),
                        child: Text(
                          "Monte de Trigo",
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
                                  message: 'N??uticas',
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
                                            "N??uticas",
                                            style:
                                            TextStyle(fontFamily: 'Metropolis'),
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
                                  message: 'N??uticas',
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
                                            style:
                                            TextStyle(fontFamily: 'Metropolis'),
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
                                  message: 'N??uticas',
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
                                            style:
                                            TextStyle(fontFamily: 'Metropolis'),
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
                                  message: 'N??uticas',
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
                                            style:
                                            TextStyle(fontFamily: 'Metropolis'),
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
                              "Integrada no concelho de Portel, a aldeia de Monte de Trigo ?? uma das v??rias aldeias ribeiras do Alqueva. Com uma maior densidade demogr??fica e at?? populacional, comparativamente com as regi??es circundantes, a aldeia fica muito pr??xima de Portel e de S??o Man??os. A proximidade ?? zona do lago ?? um fator que enriquece qualquer visita. \n\nNuma terra caracteristicamente rica e f??rtil, a sua localiza????o privilegiada j?? viria a ser referenciada desde o s??culo XIII. Apesar de se desconhecer a origem topon??mica da freguesia, as excelentes colheitas de cereais (especialmente de trigo) poder??o ser um bom princ??pio para a designa????o deste pequeno territ??rio. Tudo indica que a freguesia de Monte de Trigo j?? constitu??sse, nesse mesmo s??culo, um local desde sempre muito prestigiado, quer pela localiza????o geogr??fica, quer pelos recursos econ??micos, o que permitiu que estas terras n??o fossem, outrora, inclu??das na doa????o de D. Afonso III para D. Jo??o de Aboim. Em 1283, a herdade de Monte de Trigo era propriedade da coroa, numa altura em que D. Dinis troca o territ??rio pela Vila de Alvito, ficando ent??o na propriedade do Mosteiro da Trindade de Santar??m. J?? no s??culo XV, uma parte deste reguengo foi doado ?? Condessa de Faro, sendo que toda a ??rea acabou posteriormente por integrar o patrim??nio do padroado da Casa de Bragan??a. \n\nNa Rela????o Hist??rica (1730), Francisco Patalim refor??a a aptid??o agr??cola desta regi??o, uma terra que considerava ???maravilhosa??? quanto ?? ???produ????o de frutos???, destacando tamb??m a condi????o dos seus moradores. A igreja primitiva da aldeia, que seria de orago ao santo padroeiro S. Juli??o, ter?? desaparecido por completo entre 1946/47, dando lugar ao atual templo que se ergue no mesmo local. A seguir ?? freguesia de Portel, Monte de Trigo destaca-se economicamente, dadas as terras f??rteis e a localiza????o privilegiada que tem contribu??do para o importante desenvolvimento da regi??o. \n\nAtualmente, encontramos v??rios pontos de interesse e de atra????o tur??stica para conhecer na regi??o. Uma delas ?? a Igreja Paroquial de S. Juli??o de Monte de Trigo, constru??da nos anos 40 do s??culo XX e ?? atualmente um exemplar paradigm??tico da arquitetura religiosa do Estado Novo. A igreja tomou o lugar de um primitivo templo que acabou por ser demolido. Destaque ainda para o Jardim Municipal de Monte do Trigo, para o conjunto diversificado de equipamentos desportivos existentes na aldeia e nas proximidades a Albufeira do Loureiro, que proporcionam as melhores condi????es para a pr??tica desportiva. \n\nMonte de Trigo acaba por ainda anexar a freguesia de Nossa Senhora da Assun????o da Atalaia, cuja igreja paroquial se encontra atualmente em ru??nas. A aldeia integra a Reserva DarkSky Alqueva. ",
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Metropolis',
                              ),
                              trimLines: 10,
                              colorClickableText: Color.fromRGBO(84, 156, 193, 1.0),
                              trimMode: TrimMode.Line,
                              trimCollapsedText: '...Mostrar mais',
                              trimExpandedText: ' Mostrar menos',
                            ),
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
          Uri.parse("https://audioguia.s3.eu-west-3.amazonaws.com/Audios/Monte+de+Trigo.mp3"),
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
                          builder: (context) => MonteDeTrigoES()),
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
                          builder: (context) => MonteDeTrigoES()),
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
