import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:readmore/readmore.dart';
import 'package:shimmer/shimmer.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';
import 'package:audio_session/audio_session.dart';
import 'FerreiraCapelins_es.dart';
import 'main.dart';
import 'maps.dart';

void main() => runApp(FerreiraCapelins());

class FerreiraCapelins extends StatefulWidget {
  FerreiraCapelins({Key? key}) : super(key: key);

  @override
  _FerreiraCapelinsState createState() => _FerreiraCapelinsState();
}

class _FerreiraCapelinsState extends State<FerreiraCapelins> {
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
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Capelins/O1+-+Placa+Capelins.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Capelins/O10+-+Forno+-+Capelins.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Capelins/O10b-+Forno+Capelins.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Capelins/O12+-+Capelins+-+Futura+Praia+Fluvial.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Capelins/O13+-+Capelins+-+Futura+Praia+Fluvial.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Capelins/O14+-+Vista+Geral+-+Capelins.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Capelins/O15+-+Vista+Geral+Capelins.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Capelins/O16+-+Banco+Capelins.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Capelins/O17+-+Casa+Capelins.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Capelins/O18-Sino+Entrada+cemit%C3%A9rio+Capelins.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Capelins/O2+-+Placa+Capelins.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Capelins/O3+-++Igreja+de+Santo+Ant%C3%B3nio+de+Capelins+_.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Capelins/O4+-+Capelins++-+Jardim+P%C3%BAblio.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Capelins/O5+-+Capelins+-+jardim+P%C3%BAblico.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Capelins/O6+-+Jardim+Publico+Capelins.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Capelins/O7+-+Capelins+-+Jardim+Publico.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Capelins/O8+-+Casa+Capelins.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Capelins/O9+-+Casas+Capelins.jpg',
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
                      "Ferreira de Capelins",
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
                          "Sabe-se que a freguesia de Capelins terá sido, outrora, habitada desde a pré-história, sendo prova disso a existência de vários povoados na Ribeira do Lucefecit. Durante anos, localizada na parte sudoeste do concelho de Alandroal, na região do Alentejo, a freguesia de Santo António de Capelins - estende-se até às margens da Barragem de Alqueva, sendo constituída por três aldeias: Monte Juntos, Ferreira de Capelins e Faleiros. A aldeia está ligada geograficamente às freguesias de Santiago Maior e de S. Pedro de Terena e faz ainda fronteira com a União de Freguesias de Alandroal através da Aldeia Ribeirinha de Rosário, palco de necrópoles medievais e variadíssimas antas. A freguesia terá cerca de 600 habitantes e até 1836 pertencia ao extinto concelho de Terena. \n\nAtividades como a pastorícia, a agricultura e ainda o contrabando foram essenciais para o sustento da população residente na freguesia. Curiosamente, o Outeiro dos Castelinhos é a representação da enorme quantidade de minério que existia na freguesia, minério esse que atraía as atenções desde os romanos até há muito recentemente. Também a necrópole escavada em rocha, que está associada à Ermida de Nossa Senhora das Neves (século XVIII), é uma representação direta da Idade Média e da história que ainda ali se preserva. \n\nDesde a pré-história que a população do território ocupado pela freguesia de Santo António de Capelins mantém uma forte e estreita ligação ao rio Guadiana – um rio que hoje “separa”, mas que outrora unia – pelo que desde essa altura os povos oriundos de ambas as margens mantiveram uma afinidade coesa, não só com o rio do Sul, mas também entre eles. Os registos das primeiras povoações no território estão até hoje representados nas gravuras rupestres com que marcaram as rochas do leito e das margens do rio. Com a proximidade ao rio Guadiana, fonte de vários recursos importantes para a região, a freguesia tornou-se numa terra de moleiros e pescadores, mas também um caminho de contrabandistas. A cumplicidade entre a população de ambas as margens manteve-se forte durante gerações, quer através de uniões matrimoniais, como de negócios ou até mesmo de convívios, sendo posteriormente reforçada pela Guerra Civil Espanhola e pelo regime do Estado Novo. Essa mesma ligação está ainda muito presente nos dias de hoje, seja pelo intercâmbio de atividades organizadas, como pelas manifestações espontâneas de convivência entre a população. É ainda hoje possível ouvir testemunhos de muitos desses contrabandistas e dos guardas fiscais que os vigiavam, sendo que parte desta riqueza cultural está hoje devidamente documentada pelos serviços do município. \n\nAtualmente, são vários os pontos de interesse a visitar na freguesia, desde o Jardim das Décimas, a Igreja de Santo António de Capelins, a Ermida de Nossa Senhora das Neves, o Outeiro dos Castelinhos ou a Praia Fluvial das Azenhas D’El Rei. Destaque ainda para a Rota do Contrabando, que permite conhecer ao pormenor a riqueza da fauna e flora da região, assim como alguns dos caminhos muitas vezes utilizados para esta prática. \n\nA aldeia de Capelins está também incluída na Reserva DarkSky Alqueva. \n\nPara quem pretende pernoitar na freguesia de Capelins, o Monte do Peral e José e António Colaço, Lda. poderão ser uma excelente opção. Ao erguer-se sob uma paisagem alentejana de beleza rara, é notável a tranquilidade que se faz sentir, neste que é um lugar totalmente propício ao descanso. Já para desfrutar das iguarias da região, a sugestão vai para o Restaurante Hortelã da Ribeira. ",
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Metropolis',
                          ),
                          trimLines: 10,
                          colorClickableText: Color.fromRGBO(84, 156, 193, 1.0),
                          trimMode: TrimMode.Line,
                          trimCollapsedText: '...Mostrar mais',
                          trimExpandedText: ' Mostrar menos',
                          //textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
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
                                    "Para quem pretende pernoitar na freguesia de Capelins, o Monte do Peral e José e António Colaço, Lda. poderão ser uma excelente opção. Ao erguer-se sob uma paisagem alentejana de beleza rara, é notável a tranquilidade que se faz sentir, neste que é um lugar totalmente propício ao descanso. Já para desfrutar das iguarias da região, a sugestão vai para o Restaurante Hortelã da Ribeira. ",
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
            ),
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
                      "Ferreira de Capelins",
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
                          "Sabe-se que a freguesia de Capelins terá sido, outrora, habitada desde a pré-história, sendo prova disso a existência de vários povoados na Ribeira do Lucefecit. Durante anos, localizada na parte sudoeste do concelho de Alandroal, na região do Alentejo, a freguesia de Santo António de Capelins - estende-se até às margens da Barragem de Alqueva, sendo constituída por três aldeias: Monte Juntos, Ferreira de Capelins e Faleiros. A aldeia está ligada geograficamente às freguesias de Santiago Maior e de S. Pedro de Terena e faz ainda fronteira com a União de Freguesias de Alandroal através da Aldeia Ribeirinha de Rosário, palco de necrópoles medievais e variadíssimas antas. A freguesia terá cerca de 600 habitantes e até 1836 pertencia ao extinto concelho de Terena. \n\nAtividades como a pastorícia, a agricultura e ainda o contrabando foram essenciais para o sustento da população residente na freguesia. Curiosamente, o Outeiro dos Castelinhos é a representação da enorme quantidade de minério que existia na freguesia, minério esse que atraía as atenções desde os romanos até há muito recentemente. Também a necrópole escavada em rocha, que está associada à Ermida de Nossa Senhora das Neves (século XVIII), é uma representação direta da Idade Média e da história que ainda ali se preserva. \n\nDesde a pré-história que a população do território ocupado pela freguesia de Santo António de Capelins mantém uma forte e estreita ligação ao rio Guadiana – um rio que hoje “separa”, mas que outrora unia – pelo que desde essa altura os povos oriundos de ambas as margens mantiveram uma afinidade coesa, não só com o rio do Sul, mas também entre eles. Os registos das primeiras povoações no território estão até hoje representados nas gravuras rupestres com que marcaram as rochas do leito e das margens do rio. Com a proximidade ao rio Guadiana, fonte de vários recursos importantes para a região, a freguesia tornou-se numa terra de moleiros e pescadores, mas também um caminho de contrabandistas. A cumplicidade entre a população de ambas as margens manteve-se forte durante gerações, quer através de uniões matrimoniais, como de negócios ou até mesmo de convívios, sendo posteriormente reforçada pela Guerra Civil Espanhola e pelo regime do Estado Novo. Essa mesma ligação está ainda muito presente nos dias de hoje, seja pelo intercâmbio de atividades organizadas, como pelas manifestações espontâneas de convivência entre a população. É ainda hoje possível ouvir testemunhos de muitos desses contrabandistas e dos guardas fiscais que os vigiavam, sendo que parte desta riqueza cultural está hoje devidamente documentada pelos serviços do município. \n\nAtualmente, são vários os pontos de interesse a visitar na freguesia, desde o Jardim das Décimas, a Igreja de Santo António de Capelins, a Ermida de Nossa Senhora das Neves, o Outeiro dos Castelinhos ou a Praia Fluvial das Azenhas D’El Rei. Destaque ainda para a Rota do Contrabando, que permite conhecer ao pormenor a riqueza da fauna e flora da região, assim como alguns dos caminhos muitas vezes utilizados para esta prática. \n\nA aldeia de Capelins está também incluída na Reserva DarkSky Alqueva. \n\nPara quem pretende pernoitar na freguesia de Capelins, o Monte do Peral e José e António Colaço, Lda. poderão ser uma excelente opção. Ao erguer-se sob uma paisagem alentejana de beleza rara, é notável a tranquilidade que se faz sentir, neste que é um lugar totalmente propício ao descanso. Já para desfrutar das iguarias da região, a sugestão vai para o Restaurante Hortelã da Ribeira. ",
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Metropolis',
                          ),
                          trimLines: 10,
                          colorClickableText: Color.fromRGBO(84, 156, 193, 1.0),
                          trimMode: TrimMode.Line,
                          trimCollapsedText: '...Mostrar mais',
                          trimExpandedText: ' Mostrar menos',
                          //textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
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
                                    "Para quem pretende pernoitar na freguesia de Capelins, o Monte do Peral e José e António Colaço, Lda. poderão ser uma excelente opção. Ao erguer-se sob uma paisagem alentejana de beleza rara, é notável a tranquilidade que se faz sentir, neste que é um lugar totalmente propício ao descanso. Já para desfrutar das iguarias da região, a sugestão vai para o Restaurante Hortelã da Ribeira. ",
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
            ),
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
          Uri.parse(
              "https://audioguia.s3.eu-west-3.amazonaws.com/Audios/Capelins.mp3"),
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
                          builder: (context) => FerreiraCapelinsES()),
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
                          builder: (context) => FerreiraCapelinsES()),
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
