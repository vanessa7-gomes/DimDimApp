import 'package:dimdim_app/model/moeda.dart';
import 'package:dimdim_app/pages/bitcoin_page.dart';
import 'package:dimdim_app/pages/shared/widgets/exibicao_moeda_widget.dart';
import 'package:flutter/material.dart';

class DolarPage extends StatefulWidget {
  const DolarPage({this.moeda});

  final Moeda moeda;

  @override
  _DolarPageState createState() => _DolarPageState();
}

class _DolarPageState extends State<DolarPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      //crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 32,
        ),
        Icon(
          FontAwesomeIcons.dollarSign,
          size: 200,
          color: Colors.amberAccent.shade200,
        ),
        SizedBox(
          height: 32,
        ),
        ExibicaoMoedaWigted(widget.moeda),
        SizedBox(
          width: double.infinity,
        ),
      ],
    );
  }
}
