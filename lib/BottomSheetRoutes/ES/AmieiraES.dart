import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ribeirinhas/amieira.dart';
import 'package:ribeirinhas/amieira_es.dart';
import 'package:ribeirinhas/main.dart';
import 'AmieiraES.dart';

class BottomSheetBtnAmieiraES extends StatelessWidget {
  const BottomSheetBtnAmieiraES(
      {Key? key,
        required this.imagePath,
        required this.title,
        required this.subTitle,
        required this.concelho,})
      : super(key: key);
  final String imagePath;
  final String title;
  final String subTitle;
  final String concelho;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        splashColor: Color.fromRGBO(84, 156, 193, 1.0),
        child: Container(
          //padding: const EdgeInsets.only(bottom: 10),
          child: Row(
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Color.fromRGBO(84, 156, 193, 1.0)),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      padding: const EdgeInsets.all(5),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(imagePath),
                          ),
                          Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(left: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      title,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontFamily: 'Metropolis',
                                          color:
                                          Color.fromRGBO(84, 156, 193, 1.0),
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      subTitle,
                                      style: TextStyle(
                                        fontFamily: 'Metropolis',
                                        color:
                                        Color.fromRGBO(196, 215, 109, 1.0),
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(concelho,
                                        style: TextStyle(
                                            fontFamily: 'Metropolis',
                                            color: Colors.grey,
                                            fontSize: 16)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                height: 25,
                                width: 25,
                                margin:
                                const EdgeInsets.only(left: 5, right: 5),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/arrowRight.png"),
                                    fit: BoxFit.contain,
                                  ),
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
              builder: (context) => AmieiraES(),
            ),
          ),
        },
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
    );
  }
}
