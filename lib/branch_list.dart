import 'package:flutter/material.dart';

class BranchList extends StatelessWidget {
  final List<Map> _branches = [
    {"branchCode": "BD0014006", "branchName": "PRINCIPAL BR DHAKA"},
    {"branchCode": "BD0011207", "branchName": "KALIR BAZAR BR"},
    {"branchCode": "BD0013088", "branchName": "ABDUL HAMID ROAD PABNA"},
    {"branchCode": "BD0014664", "branchName": "AGAMASHI LANE BRANCH"},
    {"branchCode": "BD0011016", "branchName": "AGRABAD JN. BLDG. CTNG"},
    {"branchCode": "BD0010001", "branchName": "AGRANI BANK HO"},
    {"branchCode": "BD0010002", "branchName": "AGRANI BANK (LEAD)"},
    {"branchCode": "BD0012109", "branchName": "AHLADIPUR BR 2109"},
    {"branchCode": "BD0014595", "branchName": "AHSANGANJ BR 4595"},
    {"branchCode": "BD0016935", "branchName": "AIHAI BR"},
    {"branchCode": "BD0019421", "branchName": "AIR BASE CHITTAGONG"},
    {"branchCode": "BD0019440", "branchName": "AIR BASE JESSORE BR"},
    {"branchCode": "BD0017930", "branchName": "AISHORA BR"},
    {"branchCode": "BD0010185", "branchName": "AKHAURA BR 0185"},
    {"branchCode": "BD0013693", "branchName": "AKKELPUR BR 3693"},
    {"branchCode": "BD0013372", "branchName": "ALAMDANGA BRANCH"},
    {"branchCode": "BD0013051", "branchName": "ALAMNAGAR"},
    {"branchCode": "BD0016675", "branchName": "ALAMPUR BSCIC BR6675"},
    {"branchCode": "BD0010220", "branchName": "ALGI BAZAR BR 0220"},
    {"branchCode": "BD0017325", "branchName": "ALIPUR BANDAR BRANCH"},
    {"branchCode": "BD0011422", "branchName": "ALLARDARGAH BR 1422"},
    {"branchCode": "BD0016190", "branchName": "AMANAT KHAN SARAK 6190"}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: EdgeInsets.all(8.0),
        itemBuilder: _listItem,
        itemCount: _branches.length,
      ),
    );
  }

  Widget _listItem(BuildContext context, index) {
    final map = _branches[index];
    return InkWell(
      onTap: () {
        Navigator.pop(context, map);
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(8.0, 24.0, 8.0, 0.0),
        child: Row(
          children: <Widget>[
            avatar(map["branchName"], index),
            horizontalSpace(8.0),
            branchCode(map["branchCode"]),
            horizontalSpace(2.0),
            hyphen(),
            horizontalSpace(2.0),
            branchName(map["branchName"])
          ],
        ),
      ),
    );
  }

  Widget avatar(String branchName, int index) {
    List<Color> colors = [Colors.blue, Colors.blueGrey, Colors.teal];
    return CircleAvatar(
      child: Text(
        branchName.substring(0, 1),
        style: TextStyle(
            color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.w600),
      ),
      backgroundColor: colors[index % 3],
      radius: 24.0,
    );
  }

  Widget horizontalSpace(double pixel) {
    return SizedBox(width: pixel);
  }

  Widget branchCode(String branchCode) {
    final branchCodeFormate =
        "BR ${branchCode.substring(branchCode.length - 4, branchCode.length)}";
    return Text(
      branchCodeFormate,
      style: TextStyle(
        fontSize: 15.0,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  Widget branchName(String branchName) {
    return Text(
      branchName,
      style: TextStyle(
        fontSize: 15.0,
        fontWeight: FontWeight.w300,
      ),
    );
  }

  Widget hyphen() => Text(
        "-",
        style: TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.w500,
        ),
      );
}
