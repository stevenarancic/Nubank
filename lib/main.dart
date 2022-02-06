import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nubank',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const Home(),
    );
  }
}

Color backgroundColor = const Color.fromRGBO(131, 10, 210, 1);
Color secondaryPurple = const Color.fromRGBO(155, 59, 218, 1);
Color greyColor = const Color.fromRGBO(240, 241, 245, 1);

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    _setStatusBarColor();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            child: Column(
              children: [
                _header(),
                _account(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _header() {
    return Container(
      color: backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _profile(),
              _options(),
            ],
          ),
          _welcome(),
        ],
      ),
    );
  }

  _profile() {
    return InkWell(
      child: Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: secondaryPurple,
        ),
        child: const Icon(
          MdiIcons.accountOutline,
          color: Colors.white,
        ),
      ),
      onTap: () {},
    );
  }

  _options() {
    return Row(
      children: [
        _icon(MdiIcons.eyeOutline),
        _icon(MdiIcons.helpCircleOutline),
        _icon(MdiIcons.emailPlusOutline),
      ],
    );
  }

  _icon(icon) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }

  _welcome() {
    return Container(
      margin: const EdgeInsets.only(
        left: 20,
        bottom: 20,
      ),
      child: const Text(
        'Olá, Steve',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  _account() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _accountText(),
                _money(),
                _actions(),
                _myCards(),
                _info(),
              ],
            ),
          ),
          _divider(),
          _creditCard(),
          _divider(),
          _listItem(
              MdiIcons.handCoinOutline, 'Empréstimo', 'Compras está em dia.'),
          _divider(),
          _listItem(MdiIcons.heartOutline, 'Seguro de vida',
              'Conheça Nubank Vida: um seguro simples e que cabe no bolso.'),
          _divider(),
          _listItem(MdiIcons.shoppingOutline, 'Shopping',
              'Vantagens exclusivas das nossas marcas preferidas.'),
          _divider(),
          _discoveryArea(),
        ],
      ),
    );
  }

  _accountText() {
    return Container(
      margin: const EdgeInsets.only(left: 10, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // ignore: prefer_const_constructors
          Text(
            'Conta',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              right: 15,
            ),
            child: const Icon(MdiIcons.chevronRight),
          ),
        ],
      ),
    );
  }

  _money() {
    return Container(
      margin: const EdgeInsets.only(
        top: 20,
        left: 10,
      ),
      child: const Text(
        'R\$ 1.000,00',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }

  _actions() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _actionItem(icon: MdiIcons.clover, name: 'Área PIX'),
            _actionItem(icon: MdiIcons.barcode, name: 'Pagar'),
            _actionItem(icon: MdiIcons.cash, name: 'Transferir'),
            _actionItem(icon: MdiIcons.cash, name: 'Depositar'),
            _actionItem(icon: MdiIcons.cellphone, name: 'Recarga de\ncelular'),
            _actionItem(icon: MdiIcons.messageReplyOutline, name: 'Cobrar'),
            _actionItem(icon: MdiIcons.heartOutline, name: 'Doação'),
            _actionItem(icon: MdiIcons.web, name: 'Transferir\nInternac.'),
          ],
        ),
      ),
    );
  }

  _actionItem({required IconData icon, required String name}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(25),
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: greyColor,
              borderRadius: BorderRadius.circular(
                40,
              ),
            ),
            child: Icon(
              icon,
            ),
          ),
          Text(
            name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  _myCards() {
    return Container(
      margin: const EdgeInsets.only(
        left: 10,
        right: 20,
        top: 10,
        bottom: 10,
      ),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: greyColor, borderRadius: BorderRadius.circular(15)),
      child: Row(children: [
        const Icon(MdiIcons.creditCardOutline),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: const Text(
            'Meus cartões',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ]),
    );
  }

  _info() {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _infoBox('Você tem R\$ 100.000,00 disponíveis para ', 'empréstimo'),
            _infoBox('Salve seus amigos da burocracia.',
                '\nFaça um convite para o Nubank'),
          ],
        ),
      ),
    );
  }

  _infoBox(String texto, String markedText) {
    return Container(
      width: MediaQuery.of(context).size.width * .7,
      margin: const EdgeInsets.only(left: 10, top: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: greyColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: RichText(
        text: TextSpan(children: [
          TextSpan(text: texto, style: const TextStyle(color: Colors.black)),
          TextSpan(
              text: markedText,
              style: TextStyle(
                color: backgroundColor,
              )),
        ]),
      ),
    );
  }

  _divider() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: const Divider(
        thickness: 2,
      ),
    );
  }

  _creditCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _creditCardIcon(),
          _creditCardText(),
          _invoiceText(),
          _invoiceValue(),
          _limitText(),
        ],
      ),
    );
  }

  _creditCardIcon() {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: const Icon(
        MdiIcons.creditCardOutline,
      ),
    );
  }

  _creditCardText() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const Text(
            'Cartão de crédito',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Icon(
            MdiIcons.chevronRight,
          ),
        ],
      ),
    );
  }

  _invoiceText() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: const Text(
        'Fatura atual',
        style: TextStyle(
          color: Colors.grey,
        ),
      ),
    );
  }

  _invoiceValue() {
    return Container(
      child: const Text(
        'R\$ 500,00',
        style: TextStyle(
          fontSize: 23,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  _limitText() {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: const Text(
        'Limite disponível de R\$ 240,00',
        style: TextStyle(
          color: Colors.grey,
        ),
      ),
    );
  }

  _listItem(IconData icon, String title, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Icon(icon),
                ),
                _listItemTitle(title),
                _listItemText(text),
              ],
            ),
          ),
          const Icon(
            MdiIcons.chevronRight,
          ),
        ],
      ),
    );
  }

  _listItemTitle(String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
      ),
    );
  }

  _listItemText(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.grey,
      ),
    );
  }

  _discoveryArea() {
    return Container(
      margin: EdgeInsets.only(
        left: 20,
        bottom: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 25),
            child: const Text(
              'Descubra Mais',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _discoveryBox('Indique seus amigos',
                    'Mostre aos seus amigos como é fácil ter uma vida sem burocracia.'),
                _discoveryBox('Whatsapp',
                    'Pagamentos seguros, rápidos e sem tarifa. A experiência Nubank sem nem sair da ...')
              ],
            ),
          ),
        ],
      ),
    );
  }

  _discoveryBox(String title, String text) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          10,
        ),
        color: greyColor,
      ),
      width: 250,
      padding: const EdgeInsets.all(20),
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              text,
            ),
          ],
        ),
      ),
    );
  }

  _setStatusBarColor() {
    FlutterStatusbarcolor.setStatusBarColor(backgroundColor);
  }
}
