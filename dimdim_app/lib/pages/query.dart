import 'package:dimdim_app/model/moeda.dart';
import 'package:dimdim_app/pages/bitcoin_page.dart';
import 'package:dimdim_app/pages/text_field_widget.dart';
import 'package:flutter/material.dart';

class QueryPage extends StatefulWidget {
  const QueryPage({Key key, this.moedas}) : super(key: key);
  final List<Moeda> moedas;

  @override
  _QueryPageState createState() => _QueryPageState();
}

class _QueryPageState extends State<QueryPage> {
  TextEditingController realController = TextEditingController();
  TextEditingController dolarController = TextEditingController();
  TextEditingController euroController = TextEditingController();
  TextEditingController bitCoinController = TextEditingController();

  _converterReal(String quantiaEmReais) {
    var reais = double.parse(quantiaEmReais);
    dolarController.text = (reais / widget.moedas[0].buy).toStringAsFixed(2);
    euroController.text = (reais / widget.moedas[1].buy).toStringAsFixed(2);
    bitCoinController.text = (reais / widget.moedas[2].buy).toStringAsFixed(2);
  }

  _converterDolar(String quantiaEmDolar) {
    var dolares = double.parse(quantiaEmDolar) * widget.moedas[0].buy;
    realController.text = (dolares).toStringAsFixed(2);
    euroController.text = (dolares / widget.moedas[1].buy).toStringAsFixed(2);
    bitCoinController.text =
        (dolares / widget.moedas[2].buy).toStringAsFixed(2);
  }

  _converterEuro(String quantiaEmEuro) {
    var euro = double.parse(quantiaEmEuro) * widget.moedas[0].buy;
    realController.text = (euro).toStringAsFixed(2);
    dolarController.text = (euro / widget.moedas[1].buy).toStringAsFixed(2);
    bitCoinController.text = (euro / widget.moedas[2].buy).toStringAsFixed(2);
  }

  _converterBitCoin(String quantiaEmBitCoin) {
    var bitcoin = double.parse(quantiaEmBitCoin);
    realController.text = (bitcoin / widget.moedas[0].buy).toStringAsFixed(2);
    euroController.text = (bitcoin / widget.moedas[1].buy).toStringAsFixed(2);
    dolarController.text = (bitcoin / widget.moedas[2].buy).toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 16,
            width: double.infinity,
          ),
          Icon(FontAwesomeIcons.searchDollar, color: Colors.amber, size: 100),
          SizedBox(
            height: 16,
          ),
          TextFieldWidget(
            callBack: (value) {
              _converterReal(value);
            },
            icon: FontAwesomeIcons.commentDollar,
            hint: 'Valor em Reais',
            habilitado: true,
            controller: realController,
          ),
          TextFieldWidget(
            callBack: (value) {
              _converterDolar(value);
            },
            icon: FontAwesomeIcons.dollarSign,
            hint: 'Valor em Dolar',
            habilitado: true,
            controller: dolarController,
          ),
          TextFieldWidget(
            callBack: (value) {
              _converterEuro(value);
            },
            icon: FontAwesomeIcons.euroSign,
            hint: 'Valor em Euro',
            habilitado: true,
            controller: euroController,
          ),
          TextFieldWidget(
            callBack: (value) {
              _converterBitCoin(value);
            },
            icon: FontAwesomeIcons.bitcoin,
            hint: 'Valor em BitCoin',
            habilitado: true,
            controller: bitCoinController,
          ),
        ],
      ),
    );
  }
}

class NumberFormat {
  NumberFormat(String s, String t);

  format(double d) {}
}
