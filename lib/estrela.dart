import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:readmore/readmore.dart';
import 'package:shimmer/shimmer.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';
import 'package:audio_session/audio_session.dart';
import 'estrela_es.dart';
import 'main.dart';
import 'maps.dart';

void main() => runApp(Estrela());

class Estrela extends StatefulWidget {
  Estrela({Key? key}) : super(key: key);

  @override
  _EstrelasState createState() => _EstrelasState();
}

class _EstrelasState extends State<Estrela> {
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
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Estrela/I1-Estrela+placa+ribeirinha.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Estrela/I4-Estrela+placa+entrada.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Estrela/I11-Vista+da+Albufeira+da++Estrela.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Estrela/I12-Vista+da+Albufeira+Estrela.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Estrela/I13-Vista+da+Albufeira+Estrela.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Estrela/I14-Vista+da+Albufeira+Estrela.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Estrela/I15-+Vista+Geral+da+Estrela.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Estrela/I16-Vista+da+Albufeira+Estrela.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Estrela/I17+-+Centro+N%C3%A1utico+da+Estrela.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Estrela/I2-Estrela+-+vista+geral.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Estrela/I2-Estrela+Parque+de+Merendas.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Estrela/I3-Estrela+Patrim%C3%B3nio+Natural.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Estrela/I5-Aldeia+de+Estrela.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Estrela/I6-Igreja+Nossa+Sra+da+Estrela.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Estrela/I8-Ancoradouro+Estrela.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Estrela/I9-Ancoradouro+Estrela.jpg',
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
                      "Estrela",
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
                          "Pertencente ao concelho de Moura, na sub-região do Baixo Alentejo, a Aldeia de Estrela integra a freguesia da Póvoa de São Miguel. Um dado curioso sobre a região é o facto de outrora ter sido envolvida por montes que se encontram nos dias de hoje submersos pelo Alqueva, locais esses onde a população guardava os seus animais e que agora representam uma península. Com a subida das águas, a aldeia ribeirinha é atualmente rodeada pelo regolfo do Alqueva e estima-se que seja uma das povoações mais envelhecidas do concelho. Curiosamente, foi eleita Aldeia dos Sonhos 2019, um programa que é promovido e organizado pela fundação INATEL e dirigido a aldeias com menos de 100 habitantes. \n\nA privilegiada localização da aldeia junto à albufeira de Alqueva é um dos pontos diferenciadores da região. No entanto, a subida contínua das águas implicou consequências irremediáveis, nomeadamente um alargamento da maior parte das terras habitadas ou arrendadas pela população, o que implicou um contacto inédito com a água. Com o conhecimento dos possíveis recursos provenientes da água, a região passa a apresentar uma maior potencialidade para a dinamização de diversas atividades náuticas, como canoagem, mergulho, vela e pesca, entre outras. O posicionamento excecional permitiu construir um ancoradouro, no qual atracam os barcos que cruzam a albufeira de Alqueva. Também a simplicidade da região permite tornar o local ainda mais propício a diversas atrações turísticas, sendo um ótimo sítio para fazer piqueniques ou apenas desfrutar da tranquilidade da paisagem. Este local paradisíaco desvenda paisagens magníficas, onde o silêncio do Alqueva se faz sentir em cada recanto.  \n\nQuanto aos primórdios da povoação na aldeia, sabe-se que só nos finais do século XVI é que se começam a juntar as primeiras casas em torno da igreja matriz, na qual já existiam duas irmandades: Nossa Senhora do Rosário e do Santíssimo Sacramento.  \n\nNa Aldeia de Estrela, o Largo da Igreja é reconhecido como uma zona de convívio da população, um ponto de encontro para as gentes da aldeia.  \n\nA Aldeia da Estrela integra a Reserva DarkSky Alqueva.  \n\nSe a intenção passa por prolongar a estadia, há vários locais propícios ao descanso ou ao conhecimento da riqueza da região. A Herdade das Altas Moras, o Monte da Estrela, a Sweet Lake Home, as Casas do Alqueva ou o alojamento A Nossa Estrela são excelentes sugestões para pernoitar. No que toca à gastronomia regional, importa salientar que a qualidade gastronómica é um dos cartões de visita à aldeia, sendo a Associação de Moradores da Aldeia da Estrela, o Terreiro (Póvoa de São Miguel) ou o Café Central (Póvoa de São Miguel) ótimas escolhas. ",
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
                                    "Se a intenção passa por prolongar a estadia, há vários locais propícios ao descanso ou ao conhecimento da riqueza da região. A Herdade das Altas Moras, o Monte da Estrela, a Sweet Lake Home, as Casas do Alqueva ou o alojamento A Nossa Estrela são excelentes sugestões para pernoitar. No que toca à gastronomia regional, importa salientar que a qualidade gastronómica é um dos cartões de visita à aldeia, sendo a Associação de Moradores da Aldeia da Estrela, o Terreiro (Póvoa de São Miguel) ou o Café Central (Póvoa de São Miguel) ótimas escolhas.",
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
                      "Estrela",
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
                          "Pertencente ao concelho de Moura, na sub-região do Baixo Alentejo, a Aldeia de Estrela integra a freguesia da Póvoa de São Miguel. Um dado curioso sobre a região é o facto de outrora ter sido envolvida por montes que se encontram nos dias de hoje submersos pelo Alqueva, locais esses onde a população guardava os seus animais e que agora representam uma península. Com a subida das águas, a aldeia ribeirinha é atualmente rodeada pelo regolfo do Alqueva e estima-se que seja uma das povoações mais envelhecidas do concelho. Curiosamente, foi eleita Aldeia dos Sonhos 2019, um programa que é promovido e organizado pela fundação INATEL e dirigido a aldeias com menos de 100 habitantes. \n\nA privilegiada localização da aldeia junto à albufeira de Alqueva é um dos pontos diferenciadores da região. No entanto, a subida contínua das águas implicou consequências irremediáveis, nomeadamente um alargamento da maior parte das terras habitadas ou arrendadas pela população, o que implicou um contacto inédito com a água. Com o conhecimento dos possíveis recursos provenientes da água, a região passa a apresentar uma maior potencialidade para a dinamização de diversas atividades náuticas, como canoagem, mergulho, vela e pesca, entre outras. O posicionamento excecional permitiu construir um ancoradouro, no qual atracam os barcos que cruzam a albufeira de Alqueva. Também a simplicidade da região permite tornar o local ainda mais propício a diversas atrações turísticas, sendo um ótimo sítio para fazer piqueniques ou apenas desfrutar da tranquilidade da paisagem. Este local paradisíaco desvenda paisagens magníficas, onde o silêncio do Alqueva se faz sentir em cada recanto.  \n\nQuanto aos primórdios da povoação na aldeia, sabe-se que só nos finais do século XVI é que se começam a juntar as primeiras casas em torno da igreja matriz, na qual já existiam duas irmandades: Nossa Senhora do Rosário e do Santíssimo Sacramento.  \n\nNa Aldeia de Estrela, o Largo da Igreja é reconhecido como uma zona de convívio da população, um ponto de encontro para as gentes da aldeia.  \n\nA Aldeia da Estrela integra a Reserva DarkSky Alqueva.  \n\nSe a intenção passa por prolongar a estadia, há vários locais propícios ao descanso ou ao conhecimento da riqueza da região. A Herdade das Altas Moras, o Monte da Estrela, a Sweet Lake Home, as Casas do Alqueva ou o alojamento A Nossa Estrela são excelentes sugestões para pernoitar. No que toca à gastronomia regional, importa salientar que a qualidade gastronómica é um dos cartões de visita à aldeia, sendo a Associação de Moradores da Aldeia da Estrela, o Terreiro (Póvoa de São Miguel) ou o Café Central (Póvoa de São Miguel) ótimas escolhas. ",
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
                                    "Se a intenção passa por prolongar a estadia, há vários locais propícios ao descanso ou ao conhecimento da riqueza da região. A Herdade das Altas Moras, o Monte da Estrela, a Sweet Lake Home, as Casas do Alqueva ou o alojamento A Nossa Estrela são excelentes sugestões para pernoitar. No que toca à gastronomia regional, importa salientar que a qualidade gastronómica é um dos cartões de visita à aldeia, sendo a Associação de Moradores da Aldeia da Estrela, o Terreiro (Póvoa de São Miguel) ou o Café Central (Póvoa de São Miguel) ótimas escolhas.",
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
              "https://audioguia.s3.eu-west-3.amazonaws.com/Audios/Estrela.mp3"),
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
                          builder: (context) => EstrelaES()),
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
                          builder: (context) => EstrelaES()),
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
