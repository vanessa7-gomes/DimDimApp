import 'package:dimdim_app/model/moeda.dart';
import 'package:dimdim_app/pages/bitcoin_page.dart';
import 'package:flutter/material.dart';

class EuroPage extends StatefulWidget {
  const EuroPage({this.moeda});

  final Moeda moeda;

  @override
  _EuroPageState createState() => _EuroPageState();
}

class _EuroPageState extends State<EuroPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: double.infinity,
        ),
        Icon(
          FontAwesomeIcons.euroSign,
          size: 200,
          color: Colors.amberAccent.shade200,
        ),
        SizedBox(
          height: 32,
        ),
        ExibicaoMoedaWigted(widget.moeda),
      ],
    );
  }

  // ignore: non_constant_identifier_names
  ExibicaoMoedaWigted(Moeda moeda) {}
}
