import 'package:flutter/material.dart';

List<DropdownMenuItem> crypto = [
// DropdownMenuItem(
//     child: Row(
//       children: <Widget>[
//         Icon(CryptoFontIcons.ADC),
//         SizedBox(width: 30),
//         Text("ADC"),
//         SizedBox(width: 100),
//         Text("ADC/Usdt"),
//       ],
//     ),
//     value: "Option 1",
//   ),
// DropdownMenuItem(
//     child: Row(
//       children: <Widget>[
//         Icon(CryptoFontIcons.AEON),
//         SizedBox(width: 30),
//         Text("AEON"),
//         SizedBox(width: 100),
//         Text("AEON/Usdt"),
//       ],
//     ),
//     value: "Option 2",
//   ),
// DropdownMenuItem(
//     child: Row(
//       children: <Widget>[
//         Icon(CryptoFontIcons.AMP),
//         SizedBox(width: 30),
//         Text("AMP"),
//         SizedBox(width: 100),
//         Text("AMP/Usdt"),
//       ],
//     ),
//     value: "Option 3",
//   ),
// DropdownMenuItem(
//     child: Row(
//       children: <Widget>[
//         Icon(CryptoFontIcons.ANC),
//         SizedBox(width: 30),
//         Text("ANC"),
//         SizedBox(width: 100),
//         Text("ANC/Usdt"),
//       ],
//     ),
//     value: "Option 4",
//   ),
// DropdownMenuItem(
//     child: Row(
//       children: <Widget>[
//         Icon(CryptoFontIcons.ARDR),
//         SizedBox(width: 30),
//         Text("ARDR"),
//         SizedBox(width: 100),
//         Text("ARDR/Usdt"),
//       ],
//     ),
//     value: "Option 5",
//   ),
// DropdownMenuItem(
//     child: Row(
//       children: <Widget>[
//         Icon(CryptoFontIcons.AUR),
//         SizedBox(width: 30),
//         Text("AUR"),
//         SizedBox(width: 100),
//         Text("AUR/Usdt"),
//       ],
//     ),
//     value: "Option 6",
//   ),
// DropdownMenuItem(
//     child: Row(
//       children: <Widget>[
//         Icon(CryptoFontIcons.BAY),
//         SizedBox(width: 30),
//         Text("BAY"),
//         SizedBox(width: 100),
//         Text("BAY/Usdt"),
//       ],
//     ),
//     value: "Option 7",
//   ),
// DropdownMenuItem(
//     child: Row(
//       children: <Widget>[
//         Icon(CryptoFontIcons.BCN),
//         SizedBox(width: 30),
//         Text("BCN"),
//         SizedBox(width: 100),
//         Text("BCN/Usdt"),
//       ],
//     ),
//     value: "Option 8",
//   ),
// DropdownMenuItem(
//     child: Row(
//       children: <Widget>[
//         Icon(CryptoFontIcons.BRK),
//         SizedBox(width: 30),
//         Text("BRK"),
//         SizedBox(width: 100),
//         Text("BRK/Usdt"),
//       ],
//     ),
//     value: "Option 9",
//   ),
// DropdownMenuItem(
//     child: Row(
//       children: <Widget>[
//         Icon(CryptoFontIcons.BRX),
//         SizedBox(width: 30),
//         Text("BRX"),
//         SizedBox(width: 100),
//         Text("BRX/Usdt"),
//       ],
//     ),
//     value: "Option 10",
//   ),
// DropdownMenuItem(
//     child: Row(
//       children: <Widget>[
//         Icon(CryptoFontIcons.BSD),
//         SizedBox(width: 30),
//         Text("BSD"),
//         SizedBox(width: 100),
//         Text("BSD/Usdt"),
//       ],
//     ),
//     value: "Option 11",
//   ),
// DropdownMenuItem(
//     child: Row(
//       children: <Widget>[
//         Icon(CryptoFontIcons.BTA),
//         SizedBox(width: 30),
//         Text("BTA"),
//         SizedBox(width: 100),
//         Text("BTA/Usdt"),
//       ],
//     ),
//     value: "Option 12",
//   ),
// DropdownMenuItem(
//     child: Row(
//       children: <Widget>[
//         Icon(CryptoFontIcons.BTC),
//         SizedBox(width: 30),
//         Text("BTC"),
//         SizedBox(width: 100),
//         Text("BTC/Usdt"),
//       ],
//     ),
//     value: "Option 13",
//   ),
// DropdownMenuItem(
//     child: Row(
//       children: <Widget>[
//         Icon(CryptoFontIcons.BTC_ALT),
//         SizedBox(width: 30),
//         Text("BTC_ALT"),
//         SizedBox(width: 100),
//         Text("BTC_ALT/Usdt"),
//       ],
//     ),
//     value: "Option 14",
//   ),
// DropdownMenuItem(
//     child: Row(
//       children: <Widget>[
//         Icon(CryptoFontIcons.BTCD),
//         SizedBox(width: 30),
//         Text("BTCD"),
//         SizedBox(width: 100),
//         Text("BTCD/Usdt"),
//       ],
//     ),
//     value: "Option 15",
//   ),
// DropdownMenuItem(
//     child: Row(
//       children: <Widget>[
//         Icon(CryptoFontIcons.BTS),
//         SizedBox(width: 30),
//         Text("BTS"),
//         SizedBox(width: 100),
//         Text("BTS/Usdt"),
//       ],
//     ),
//     value: "Option 16",
//   ),
// DropdownMenuItem(
//     child: Row(
//       children: <Widget>[
//         Icon(CryptoFontIcons.CLAM),
//         SizedBox(width: 30),
//         Text("CLAM"),
//         SizedBox(width: 100),
//         Text("CLAM/Usdt"),
//       ],
//     ),
//     value: "Option 17",
//   ),
// DropdownMenuItem(
//     child: Row(
//       children: <Widget>[
//         Icon(CryptoFontIcons.CLOAK),
//         SizedBox(width: 30),
//         Text("CLOAK"),
//         SizedBox(width: 100),
//         Text("CLOAK/Usdt"),
//       ],
//     ),
//     value: "Option 18",
//   ),
// DropdownMenuItem(
//     child: Row(
//       children: <Widget>[
//         Icon(CryptoFontIcons.DASH),
//         SizedBox(width: 30),
//         Text("DASH"),
//         SizedBox(width: 100),
//         Text("DASH/Usdt"),
//       ],
//     ),
//     value: "Option 19",
//   ),
// DropdownMenuItem(
//     child: Row(
//       children: <Widget>[
//         Icon(CryptoFontIcons.DCR),
//         SizedBox(width: 30),
//         Text("DCR"),
//         SizedBox(width: 100),
//         Text("DCR/Usdt"),
//       ],
//     ),
//     value: "Option 20",
//   ),
// DropdownMenuItem(
//     child: Row(
//       children: <Widget>[
//         Icon(CryptoFontIcons.DGB),
//         SizedBox(width: 30),
//         Text("DGB"),
//         SizedBox(width: 100),
//         Text("DGB/Usdt"),
//       ],
//     ),
//     value: "Option 21",
//   ),
// DropdownMenuItem(
//     child: Row(
//       children: <Widget>[
//         Icon(CryptoFontIcons.DGD),
//         SizedBox(width: 30),
//         Text("DGD"),
//         SizedBox(width: 100),
//         Text("DGD/Usdt"),
//       ],
//     ),
//     value: "Option 22",
//   ),
// DropdownMenuItem(
//     child: Row(
//       children: <Widget>[
//         Icon(CryptoFontIcons.DGX),
//         SizedBox(width: 30),
//         Text("DGX"),
//         SizedBox(width: 100),
//         Text("DGX/Usdt"),
//       ],
//     ),
//     value: "Option 23",
//   ),
// DropdownMenuItem(
//     child: Row(
//       children: <Widget>[
//         Icon(CryptoFontIcons.DMD),
//         SizedBox(width: 30),
//         Text("DMD"),
//         SizedBox(width: 100),
//         Text("DMD/Usdt"),
//       ],
//     ),
//     value: "Option 24",
//   ),
// DropdownMenuItem(
//     child: Row(
//       children: <Widget>[
//         Icon(CryptoFontIcons.DOGE),
//         SizedBox(width: 30),
//         Text("DOGE"),
//         SizedBox(width: 100),
//         Text("DOGE/Usdt"),
//       ],
//     ),
//     value: "Option 25",
//   ),
// DropdownMenuItem(
//     child: Row(
//       children: <Widget>[
//         Icon(CryptoFontIcons.EMC),
//         SizedBox(width: 30),
//         Text("EMC"),
//         SizedBox(width: 100),
//         Text("EMC/Usdt"),
//       ],
//     ),
//     value: "Option 26",
//   ),
// DropdownMenuItem(
//     child: Row(
//       children: <Widget>[
//         Icon(CryptoFontIcons.ERC),
//         SizedBox(width: 30),
//         Text("ERC"),
//         SizedBox(width: 100),
//         Text("ERC/Usdt"),
//       ],
//     ),
//     value: "Option 27",
//   ),
// DropdownMenuItem(
//     child: Row(
//       children: <Widget>[
//         Icon(CryptoFontIcons.ETC),
//         SizedBox(width: 30),
//         Text("ETC"),
//         SizedBox(width: 100),
//         Text("ETC/Usdt"),
//       ],
//     ),
//     value: "Option 28",
//   ),
// DropdownMenuItem(
//     child: Row(
//       children: <Widget>[
//         Icon(CryptoFontIcons.ETH),
//         SizedBox(width: 30),
//         Text("ETH"),
//         SizedBox(width: 100),
//         Text("ETH/Usdt"),
//       ],
//     ),
//     value: "Option 29",
//   ),
// DropdownMenuItem(
//     child: Row(
//       children: <Widget>[
//         Icon(CryptoFontIcons.FCT),
//         SizedBox(width: 30),
//         Text("FCT"),
//         SizedBox(width: 100),
//         Text("FCT/Usdt"),
//       ],
//     ),
//     value: "Option 30",
//   ),
// DropdownMenuItem(
//     child: Row(
//       children: <Widget>[
//         Icon(CryptoFontIcons.FLO),
//         SizedBox(width: 30),
//         Text("FLO"),
//         SizedBox(width: 100),
//         Text("FLO/Usdt"),
//       ],
//     ),
//     value: "Option 31",
//   ),
// DropdownMenuItem(
//     child: Row(
//       children: <Widget>[
//         Icon(CryptoFontIcons.FRK),
//         SizedBox(width: 30),
//         Text("FRK"),
//         SizedBox(width: 100),
//         Text("FRK/Usdt"),
//       ],
//     ),
//     value: "Option 32",
//   ),
// DropdownMenuItem(
//     child: Row(
//       children: <Widget>[
//         Icon(CryptoFontIcons.FTC),
//         SizedBox(width: 30),
//         Text("FTC"),
//         SizedBox(width: 100),
//         Text("FTC/Usdt"),
//       ],
//     ),
//     value: "Option 33",
//   ),
// DropdownMenuItem(
//     child: Row(
//       children: <Widget>[
//         Icon(CryptoFontIcons.GAME),
//         SizedBox(width: 30),
//         Text("GAME"),
//         SizedBox(width: 100),
//         Text("GAME/Usdt"),
//       ],
//     ),
//     value: "Option 34",
//   ),
// DropdownMenuItem(
//     child: Row(
//       children: <Widget>[
//         Icon(CryptoFontIcons.GLD),
//         SizedBox(width: 30),
//         Text("GLD"),
//         SizedBox(width: 100),
//         Text("GLD/Usdt"),
//       ],
//     ),
//     value: "Option 35",
//   ),
// DropdownMenuItem(
//     child: Row(
//       children: <Widget>[
//         Icon(CryptoFontIcons.GNT),
//         SizedBox(width: 30),
//         Text("GNT"),
//         SizedBox(width: 100),
//         Text("GNT/Usdt"),
//       ],
//     ),
//     value: "Option 36",
//   ),
// DropdownMenuItem(
//     child: Row(
//       children: <Widget>[
//         Icon(CryptoFontIcons.GRC),
//         SizedBox(width: 30),
//         Text("GRC"),
//         SizedBox(width: 100),
//         Text("GRC/Usdt"),
//       ],
//     ),
//     value: "Option 37",
//   ),
// DropdownMenuItem(
//     child: Row(
//       children: <Widget>[
//         Icon(CryptoFontIcons.GRS),
//         SizedBox(width: 30),
//         Text("GRS"),
//         SizedBox(width: 100),
//         Text("GRS/Usdt"),
//       ],
//     ),
//     value: "Option 38",
//   ),
// DropdownMenuItem(
//     child: Row(
//       children: <Widget>[
//         Icon(CryptoFontIcons.HEAT),
//         SizedBox(width: 30),
//         Text("HEAT"),
//         SizedBox(width: 100),
//         Text("HEAT/Usdt"),
//       ],
//     ),
//     value: "Option 39",
//   ),
// DropdownMenuItem(
//     child: Row(
//       children: <Widget>[
//         Icon(CryptoFontIcons.ICN),
//         SizedBox(width: 30),
//         Text("ICN"),
//         SizedBox(width: 100),
//         Text("ICN/Usdt"),
//       ],
//     ),
//     value: "Option 40",
//   ),
// DropdownMenuItem(
//     child: Row(
//       children: <Widget>[
//         Icon(CryptoFontIcons.IFC),
//         SizedBox(width: 30),
//         Text("IFC"),
//         SizedBox(width: 100),
//         Text("IFC/Usdt"),
//       ],
//     ),
//     value: "Option 41",
//   ),
// DropdownMenuItem(
//     child: Row(
//       children: <Widget>[
//         Icon(CryptoFontIcons.INCNT),
//         SizedBox(width: 30),
//         Text("INCNT"),
//         SizedBox(width: 100),
//         Text("INCNT/Usdt"),
//       ],
//     ),
//     value: "Option 42",
//   ),
// DropdownMenuItem(
//     child: Row(
//       children: <Widget>[
//         Icon(CryptoFontIcons.IOC),
//         SizedBox(width: 30),
//         Text("IOC"),
//         SizedBox(width: 100),
//         Text("IOC/Usdt"),
//       ],
//     ),
//     value: "Option 43",
//   ),
// DropdownMenuItem(
//     child: Row(
//       children: <Widget>[
//         Icon(CryptoFontIcons.KMD),
//         SizedBox(width: 30),
//         Text("KMD"),
//         SizedBox(width: 100),
//         Text("KMD/Usdt"),
//       ],
//     ),
//     value: "Option 44",
//   ),
// DropdownMenuItem(
//     child: Row(
//       children: <Widget>[
//         Icon(CryptoFontIcons.KOBO),
//         SizedBox(width: 30),
//         Text("KOBO"),
//         SizedBox(width: 100),
//         Text("KOBO/Usdt"),
//       ],
//     ),
//     value: "Option 45",
//   ),
// DropdownMenuItem(
//     child: Row(
//       children: <Widget>[
//         Icon(CryptoFontIcons.KORE),
//         SizedBox(width: 30),
//         Text("KORE"),
//         SizedBox(width: 100),
//         Text("KORE/Usdt"),
//       ],
//     ),
//     value: "Option 46",
//   ),
// DropdownMenuItem(
//     child: Row(
//       children: <Widget>[
//         Icon(CryptoFontIcons.LBC),
//         SizedBox(width: 30),
//         Text("LBC"),
//         SizedBox(width: 100),
//         Text("LBC/Usdt"),
//       ],
//     ),
//     value: "Option 47",
//   ),
// DropdownMenuItem(
//     child: Row(
//       children: <Widget>[
//         Icon(CryptoFontIcons.LDOGE),
//         SizedBox(width: 30),
//         Text("LDOGE"),
//         SizedBox(width: 100),
//         Text("LDOGE/Usdt"),
//       ],
//     ),
//     value: "Option 48",
//   ),
// DropdownMenuItem(
//     child: Row(
//       children: <Widget>[
//         Icon(CryptoFontIcons.LSK),
//         SizedBox(width: 30),
//         Text("LSK"),
//         SizedBox(width: 100),
//         Text("LSK/Usdt"),
//       ],
//     ),
//     value: "Option 49",
//   ),
// DropdownMenuItem(
//     child: Row(
//       children: <Widget>[
//         Icon(CryptoFontIcons.LTC),
//         SizedBox(width: 30),
//         Text("LTC"),
//         SizedBox(width: 100),
//         Text("LTC/Usdt"),
//       ],
//     ),
//     value: "Option 50",
//   ),
// DropdownMenuItem(
//     child: Row(
//       children: <Widget>[
//         Icon(CryptoFontIcons.MAID),
//         SizedBox(width: 30),
//         Text("MAID"),
//         SizedBox(width: 100),
//         Text("MAID/Usdt"),
//       ],
//     ),
//     value: "Option 51",
//   ),
// DropdownMenuItem(
//     child: Row(
//       children: <Widget>[
//         Icon(CryptoFontIcons.MINT),
//         SizedBox(width: 30),
//         Text("MINT"),
//         SizedBox(width: 100),
//         Text("MINT/Usdt"),
//       ],
//     ),
//     value: "Option 52",
//   ),
// DropdownMenuItem(
//     child: Row(
//       children: <Widget>[
//         Icon(CryptoFontIcons.MONA),
//         SizedBox(width: 30),
//         Text("MONA"),
//         SizedBox(width: 100),
//         Text("MONA/Usdt"),
//       ],
//     ),
//     value: "Option 53",
//   ),
// DropdownMenuItem(
//     child: Row(
//       children: <Widget>[
//         Icon(CryptoFontIcons.MUE),
//         SizedBox(width: 30),
//         Text("MUE"),
//         SizedBox(width: 100),
//         Text("MUE/Usdt"),
//       ],
//     ),
//     value: "Option 54",
//   ),
// DropdownMenuItem(
//     child: Row(
//       children: <Widget>[
//         Icon(CryptoFontIcons.NEOS),
//         SizedBox(width: 30),
//         Text("NEOS"),
//         SizedBox(width: 100),
//         Text("NEOS/Usdt"),
//       ],
//     ),
//     value: "Option 55",
//   ),
// DropdownMenuItem(
//     child: Row(
//       children: <Widget>[
//         Icon(CryptoFontIcons.NLG),
//         SizedBox(width: 30),
//         Text("NLG"),
//         SizedBox(width: 100),
//         Text("NLG/Usdt"),
//       ],
//     ),
//     value: "Option 56",
//   ),
// DropdownMenuItem(
//     child: Row(
//       children: <Widget>[
//         Icon(CryptoFontIcons.NMC),
//         SizedBox(width: 30),
//         Text("NMC"),
//         SizedBox(width: 100),
//         Text("NMC/Usdt"),
//       ],
//     ),
//     value: "Option 57",
//   ),
// DropdownMenuItem(
//     child: Row(
//       children: <Widget>[
//         Icon(CryptoFontIcons.NOTE),
//         SizedBox(width: 30),
//         Text("NOTE"),
//         SizedBox(width: 100),
//         Text("NOTE/Usdt"),
//       ],
//     ),
//     value: "Option 58",
//   ),
// DropdownMenuItem(
//     child: Row(
//       children: <Widget>[
//         Icon(CryptoFontIcons.NUC),
//         SizedBox(width: 30),
//         Text("NUC"),
//         SizedBox(width: 100),
//         Text("NUC/Usdt"),
//       ],
//     ),
//     value: "Option 59",
//   ),
// DropdownMenuItem(
//     child: Row(
//       children: <Widget>[
//         Icon(CryptoFontIcons.NXT),
//         SizedBox(width: 30),
//         Text("NXT"),
//         SizedBox(width: 100),
//         Text("NXT/Usdt"),
//       ],
//     ),
//     value: "Option 100",
//   ),
// DropdownMenuItem(
//     child: Row(
//       children: <Widget>[
//         Icon(CryptoFontIcons.OK),
//         SizedBox(width: 30),
//         Text("OK"),
//         SizedBox(width: 100),
//         Text("OK/Usdt"),
//       ],
//     ),
//     value: "Option 61",
//   ),
// DropdownMenuItem(
//     child: Row(
//       children: <Widget>[
//         Icon(CryptoFontIcons.OMNI),
//         SizedBox(width: 30),
//         Text("OMNI"),
//         SizedBox(width: 100),
//         Text("OMNI/Usdt"),
//       ],
//     ),
//     value: "Option 62",
//   ),
// DropdownMenuItem(
//     child: Row(
//       children: <Widget>[
//         Icon(CryptoFontIcons.PINK),
//         SizedBox(width: 30),
//         Text("PINK"),
//         SizedBox(width: 100),
//         Text("PINK/Usdt"),
//       ],
//     ),
//     value: "Option 63",
//   ),
// DropdownMenuItem(
//     child: Row(
//       children: <Widget>[
//         Icon(CryptoFontIcons.PIVX),
//         SizedBox(width: 30),
//         Text("PIVX"),
//         SizedBox(width: 100),
//         Text("PIVX/Usdt"),
//       ],
//     ),
//     value: "Option 64",
//   ),
// DropdownMenuItem(
//     child: Row(
//       children: <Widget>[
//         Icon(CryptoFontIcons.POT),
//         SizedBox(width: 30),
//         Text("POT"),
//         SizedBox(width: 100),
//         Text("POT/Usdt"),
//       ],
//     ),
//     value: "Option 65",
//   ),
// DropdownMenuItem(
//     child: Row(
//       children: <Widget>[
//         Icon(CryptoFontIcons.PPC),
//         SizedBox(width: 30),
//         Text("PPC"),
//         SizedBox(width: 100),
//         Text("PPC/Usdt"),
//       ],
//     ),
//     value: "Option 66",
//   ),
// DropdownMenuItem(
//     child: Row(
//       children: <Widget>[
//         Icon(CryptoFontIcons.QRK),
//         SizedBox(width: 30),
//         Text("QRK"),
//         SizedBox(width: 100),
//         Text("QRK/Usdt"),
//       ],
//     ),
//     value: "Option 67",
//   ),
// DropdownMenuItem(
//     child: Row(
//       children: <Widget>[
//         Icon(CryptoFontIcons.RBY),
//         SizedBox(width: 30),
//         Text("RBY"),
//         SizedBox(width: 100),
//         Text("RBY/Usdt"),
//       ],
//     ),
//     value: "Option 68",
//   ),
// DropdownMenuItem(
//     child: Row(
//       children: <Widget>[
//         Icon(CryptoFontIcons.RDD),
//         SizedBox(width: 30),
//         Text("RDD"),
//         SizedBox(width: 100),
//         Text("RDD/Usdt"),
//       ],
//     ),
//     value: "Option 69",
//   ),
// DropdownMenuItem(
//     child: Row(
//       children: <Widget>[
//         Icon(CryptoFontIcons.REP),
//         SizedBox(width: 30),
//         Text("REP"),
//         SizedBox(width: 100),
//         Text("REP/Usdt"),
//       ],
//     ),
//     value: "Option 70",
//   ),
// DropdownMenuItem(
//     child: Row(
//       children: <Widget>[
//         Icon(CryptoFontIcons.RISE),
//         SizedBox(width: 30),
//         Text("RISE"),
//         SizedBox(width: 100),
//         Text("RISE/Usdt"),
//       ],
//     ),
//     value: "Option 71",
//   ),
// DropdownMenuItem(
//     child: Row(
//       children: <Widget>[
//         Icon(CryptoFontIcons.SJCX),
//         SizedBox(width: 30),
//         Text("SJCX"),
//         SizedBox(width: 100),
//         Text("SJCX/Usdt"),
//       ],
//     ),
//     value: "Option 72",
//   ),
// DropdownMenuItem(
//     child: Row(
//       children: <Widget>[
//         Icon(CryptoFontIcons.SLS),
//         SizedBox(width: 30),
//         Text("SLS"),
//         SizedBox(width: 100),
//         Text("SLS/Usdt"),
//       ],
//     ),
//     value: "Option 73",
//   ),
// DropdownMenuItem(
//     child: Row(
//       children: <Widget>[
//         Icon(CryptoFontIcons.STEEM),
//         SizedBox(width: 30),
//         Text("STEEM"),
//         SizedBox(width: 100),
//         Text("STEEM/Usdt"),
//       ],
//     ),
//     value: "Option 74",
//   ),
// DropdownMenuItem(
//     child: Row(
//       children: <Widget>[
//         Icon(CryptoFontIcons.STRAT),
//         SizedBox(width: 30),
//         Text("STRAT"),
//         SizedBox(width: 100),
//         Text("STRAT/Usdt"),
//       ],
//     ),
//     value: "Option 75",
//   ),
// DropdownMenuItem(
//     child: Row(
//       children: <Widget>[
//         Icon(CryptoFontIcons.SYS),
//         SizedBox(width: 30),
//         Text("SYS"),
//         SizedBox(width: 100),
//         Text("SYS/Usdt"),
//       ],
//     ),
//     value: "Option 76",
//   ),
// DropdownMenuItem(
//     child: Row(
//       children: <Widget>[
//         Icon(CryptoFontIcons.TRIG),
//         SizedBox(width: 30),
//         Text("TRIG"),
//         SizedBox(width: 100),
//         Text("TRIG/Usdt"),
//       ],
//     ),
//     value: "Option 77",
//   ),
// DropdownMenuItem(
//     child: Row(
//       children: <Widget>[
//         Icon(CryptoFontIcons.UBQ),
//         SizedBox(width: 30),
//         Text("UBQ"),
//         SizedBox(width: 100),
//         Text("UBQ/Usdt"),
//       ],
//     ),
//     value: "Option 78",
//   ),
// DropdownMenuItem(
//     child: Row(
//       children: <Widget>[
//         Icon(CryptoFontIcons.UNITY),
//         SizedBox(width: 30),
//         Text("UNITY"),
//         SizedBox(width: 100),
//         Text("UNITY/Usdt"),
//       ],
//     ),
//     value: "Option 79",
//   ),
// DropdownMenuItem(
//     child: Row(
//       children: <Widget>[
//         Icon(CryptoFontIcons.USDT),
//         SizedBox(width: 30),
//         Text("USDT"),
//         SizedBox(width: 100),
//         Text("USDT/Usdt"),
//       ],
//     ),
//     value: "Option 80",
//   ),
// DropdownMenuItem(
//     child: Row(
//       children: <Widget>[
//         Icon(CryptoFontIcons.VRC),
//         SizedBox(width: 30),
//         Text("VRC"),
//         SizedBox(width: 100),
//         Text("VRC/Usdt"),
//       ],
//     ),
//     value: "Option 81",
//   ),
// DropdownMenuItem(
//     child: Row(
//       children: <Widget>[
//         Icon(CryptoFontIcons.VTC),
//         SizedBox(width: 30),
//         Text("VTC"),
//         SizedBox(width: 100),
//         Text("VTC/Usdt"),
//       ],
//     ),
//     value: "Option 82",
//   ),
// DropdownMenuItem(
//     child: Row(
//       children: <Widget>[
//         Icon(CryptoFontIcons.WAVES),
//         SizedBox(width: 30),
//         Text("WAVES"),
//         SizedBox(width: 100),
//         Text("WAVES/Usdt"),
//       ],
//     ),
//     value: "Option 83",
//   ),
// DropdownMenuItem(
//     child: Row(
//       children: <Widget>[
//         Icon(CryptoFontIcons.XCP),
//         SizedBox(width: 30),
//         Text("XCP"),
//         SizedBox(width: 100),
//         Text("XCP/Usdt"),
//       ],
//     ),
//     value: "Option 84",
//   ),
// DropdownMenuItem(
//     child: Row(
//       children: <Widget>[
//         Icon(CryptoFontIcons.XEM),
//         SizedBox(width: 30),
//         Text("XEM"),
//         SizedBox(width: 100),
//         Text("XEM/Usdt"),
//       ],
//     ),
//     value: "Option 85",
//   ),
// DropdownMenuItem(
//     child: Row(
//       children: <Widget>[
//         Icon(CryptoFontIcons.XMR),
//         SizedBox(width: 30),
//         Text("XMR"),
//         SizedBox(width: 100),
//         Text("XMR/Usdt"),
//       ],
//     ),
//     value: "Option 86",
//   ),
// DropdownMenuItem(
//     child: Row(
//       children: <Widget>[
//         Icon(CryptoFontIcons.XRP),
//         SizedBox(width: 30),
//         Text("XRP"),
//         SizedBox(width: 100),
//         Text("XRP/Usdt"),
//       ],
//     ),
//     value: "Option 87",
//   ),
// DropdownMenuItem(
//     child: Row(
//       children: <Widget>[
//         Icon(CryptoFontIcons.ZEC),
//         SizedBox(width: 30),
//         Text("ZEC"),
//         SizedBox(width: 100),
//         Text("ZEC/Usdt"),
//       ],
//     ),
//     value: "Option 88",
//   ),
DropdownMenuItem(
    value: "Option 1",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/usdt.png"),
        
        SizedBox(width: 30),
        Text("USDT",),
        SizedBox(width: 100),
        Text("USDT/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 2",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/btc.png"),
        
        SizedBox(width: 30),
        Text("BTC"),
        SizedBox(width: 100),
        Text("BTC/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 3",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/eth.png"),
        
        SizedBox(width: 30),
        Text("ETH"),
        SizedBox(width: 100),
        Text("ETH/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 4",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/bnb.png"),
        
        SizedBox(width: 30),
        Text("BNB"),
        SizedBox(width: 100),
        Text("BNB/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 5",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/bcc.png"),
        
        SizedBox(width: 30),
        Text("BCC"),
        SizedBox(width: 100),
        Text("BCC/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 6",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/neo.png"),
        
        SizedBox(width: 30),
        Text("NEO"),
        SizedBox(width: 100),
        Text("NEO/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 7",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/ltc.png"),
        
        SizedBox(width: 30),
        Text("LTC"),
        SizedBox(width: 100),
        Text("LTC/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 8",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/qtum.png"),
        
        SizedBox(width: 30),
        Text("QTUM"),
        SizedBox(width: 100),
        Text("QTUM/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 9",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/ada.png"),
        
        SizedBox(width: 30),
        Text("ADA"),
        SizedBox(width: 100),
        Text("ADA/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 10",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/xrp.png"),
        
        SizedBox(width: 30),
        Text("XRP"),
        SizedBox(width: 100),
        Text("XRP/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 11",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/eos.png"),
        
        SizedBox(width: 30),
        Text("EOS"),
        SizedBox(width: 100),
        Text("EOS/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 12",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/tusd.png"),
        
        SizedBox(width: 30),
        Text("TUSD"),
        SizedBox(width: 100),
        Text("TUSD/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 13",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/xlm.png"),
        
        SizedBox(width: 30),
        Text("XLM"),
        SizedBox(width: 100),
        Text("XLM/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 14",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/ont.png"),
        
        SizedBox(width: 30),
        Text("ONT"),
        SizedBox(width: 100),
        Text("ONT/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 15",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/trx.png"),
        
        SizedBox(width: 30),
        Text("TRX"),
        SizedBox(width: 100),
        Text("TRX/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 16",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/etc.png"),
        
        SizedBox(width: 30),
        Text("ETC"),
        SizedBox(width: 100),
        Text("ETC/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 17",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/icx.png"),
        
        SizedBox(width: 30),
        Text("ICX"),
        SizedBox(width: 100),
        Text("ICX/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 18",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/nuls.png"),
        
        SizedBox(width: 30),
        Text("NULS"),
        SizedBox(width: 100),
        Text("NULS/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 19",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/vet.png"),
        
        SizedBox(width: 30),
        Text("VET"),
        SizedBox(width: 100),
        Text("VET/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 20",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/pax.png"),
        
        SizedBox(width: 30),
        Text("PAX"),
        SizedBox(width: 100),
        Text("PAX/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 21",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/usdc.png"),
        
        SizedBox(width: 30),
        Text("USDC"),
        SizedBox(width: 100),
        Text("USDC/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 22",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/link.png"),
        
        SizedBox(width: 30),
        Text("LINK"),
        SizedBox(width: 100),
        Text("LINK/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 23",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/waves.png"),
        
        SizedBox(width: 30),
        Text("WAVES"),
        SizedBox(width: 100),
        Text("WAVES/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 24",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/btt.png"),
        
        SizedBox(width: 30),
        Text("BTT"),
        SizedBox(width: 100),
        Text("BTT/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 25",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/ong.png"),
        
        SizedBox(width: 30),
        Text("ONG"),
        SizedBox(width: 100),
        Text("ONG/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 26",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/hot.png"),
        
        SizedBox(width: 30),
        Text("HOT"),
        SizedBox(width: 100),
        Text("HOT/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 27",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/zil.png"),
        
        SizedBox(width: 30),
        Text("ZIL"),
        SizedBox(width: 100),
        Text("ZIL/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 28",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/zrx.png"),
        
        SizedBox(width: 30),
        Text("ZRX"),
        SizedBox(width: 100),
        Text("ZRX/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 29",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/bat.png"),
        
        SizedBox(width: 30),
        Text("BAT"),
        SizedBox(width: 100),
        Text("BAT/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 30",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/xmr.png"),
        
        SizedBox(width: 30),
        Text("XMR"),
        SizedBox(width: 100),
        Text("XMR/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 31",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/zec.png"),
        
        SizedBox(width: 30),
        Text("ZEC"),
        SizedBox(width: 100),
        Text("ZEC/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 32",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/iost.png"),
        
        SizedBox(width: 30),
        Text("IOST"),
        SizedBox(width: 100),
        Text("IOST/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 33",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/dash.png"),
        
        SizedBox(width: 30),
        Text("DASH"),
        SizedBox(width: 100),
        Text("DASH/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 34",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/nano.png"),
        
        SizedBox(width: 30),
        Text("NANO"),
        SizedBox(width: 100),
        Text("NANO/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 35",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/omg.png"),
        
        SizedBox(width: 30),
        Text("OMG"),
        SizedBox(width: 100),
        Text("OMG/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 36",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/theta.png"),
        
        SizedBox(width: 30),
        Text("THETA"),
        SizedBox(width: 100),
        Text("THETA/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 37",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/enj.png"),
        
        SizedBox(width: 30),
        Text("ENJ"),
        SizedBox(width: 100),
        Text("ENJ/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 38",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/mith.png"),
        
        SizedBox(width: 30),
        Text("MITH"),
        SizedBox(width: 100),
        Text("MITH/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 39",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/matic.png"),
        
        SizedBox(width: 30),
        Text("MATIC"),
        SizedBox(width: 100),
        Text("MATIC/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 40",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/atom.png"),
        
        SizedBox(width: 30),
        Text("ATOM"),
        SizedBox(width: 100),
        Text("ATOM/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 41",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/one.png"),
        
        SizedBox(width: 30),
        Text("ONE"),
        SizedBox(width: 100),
        Text("ONE/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 42",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/algo.png"),
        
        SizedBox(width: 30),
        Text("ALGO"),
        SizedBox(width: 100),
        Text("ALGO/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 43",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/gto.png"),
        
        SizedBox(width: 30),
        Text("GTO"),
        SizedBox(width: 100),
        Text("GTO/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 44",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/doge.png"),
        
        SizedBox(width: 30),
        Text("DOGE"),
        SizedBox(width: 100),
        Text("DOGE/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 45",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/ankr.png"),
        
        SizedBox(width: 30),
        Text("ANKR"),
        SizedBox(width: 100),
        Text("ANKR/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 46",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/npxs.png"),
        
        SizedBox(width: 30),
        Text("NPXS"),
        SizedBox(width: 100),
        Text("NPXS/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 47",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/mtl.png"),
        
        SizedBox(width: 30),
        Text("MTL"),
        SizedBox(width: 100),
        Text("MTL/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 48",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/tomo.png"),
        
        SizedBox(width: 30),
        Text("TOMO"),
        SizedBox(width: 100),
        Text("TOMO/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 49",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/dent.png"),
        
        SizedBox(width: 30),
        Text("DENT"),
        SizedBox(width: 100),
        Text("DENT/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 50",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/mft.png"),
        
        SizedBox(width: 30),
        Text("MFT"),
        SizedBox(width: 100),
        Text("MFT/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 51",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/storm.png"),
        
        SizedBox(width: 30),
        Text("STORM"),
        SizedBox(width: 100),
        Text("STORM/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 52",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/dock.png"),
        
        SizedBox(width: 30),
        Text("DOCK"),
        SizedBox(width: 100),
        Text("DOCK/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 53",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/wan.png"),
        
        SizedBox(width: 30),
        Text("WAN"),
        SizedBox(width: 100),
        Text("WAN/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 54",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/fun.png"),
        
        SizedBox(width: 30),
        Text("FUN"),
        SizedBox(width: 100),
        Text("FUN/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 55",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/cvc.png"),
        
        SizedBox(width: 30),
        Text("CVC"),
        SizedBox(width: 100),
        Text("CVC/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 56",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/band.png"),
        
        SizedBox(width: 30),
        Text("BAND"),
        SizedBox(width: 100),
        Text("BAND/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 57",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/beam.png"),
        
        SizedBox(width: 30),
        Text("BEAM"),
        SizedBox(width: 100),
        Text("BEAM/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 58",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/xtz.png"),
        
        SizedBox(width: 30),
        Text("XTZ"),
        SizedBox(width: 100),
        Text("XTZ/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 59",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/ren.png"),
        
        SizedBox(width: 30),
        Text("REN"),
        SizedBox(width: 100),
        Text("REN/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 60",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/rvn.png"),
        
        SizedBox(width: 30),
        Text("RVN"),
        SizedBox(width: 100),
        Text("RVN/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 61",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/nkn.png"),
        
        SizedBox(width: 30),
        Text("NKN"),
        SizedBox(width: 100),
        Text("NKN/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 62",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/stx.png"),
        
        SizedBox(width: 30),
        Text("STX"),
        SizedBox(width: 100),
        Text("STX/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 63",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/iotx.png"),
        
        SizedBox(width: 30),
        Text("IOTX"),
        SizedBox(width: 100),
        Text("IOTX/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 64",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/rlc.png"),
        
        SizedBox(width: 30),
        Text("RLC"),
        SizedBox(width: 100),
        Text("RLC/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 65",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/mco.png"),
        
        SizedBox(width: 30),
        Text("MCO"),
        SizedBox(width: 100),
        Text("MCO/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 66",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/ctxc.png"),
        
        SizedBox(width: 30),
        Text("CTXC"),
        SizedBox(width: 100),
        Text("CTXC/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 67",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/bch.png"),
        
        SizedBox(width: 30),
        Text("BCH"),
        SizedBox(width: 100),
        Text("BCH/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 68",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/rub.png"),
        
        SizedBox(width: 30),
        Text("RUB"),
        SizedBox(width: 100),
        Text("RUB/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 69",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/eur.png"),
        
        SizedBox(width: 30),
        Text("EUR"),
        SizedBox(width: 100),
        Text("EUR/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 70",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/bts.png"),
        
        SizedBox(width: 30),
        Text("BTS"),
        SizedBox(width: 100),
        Text("BTS/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 71",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/lsk.png"),
        
        SizedBox(width: 30),
        Text("LSK"),
        SizedBox(width: 100),
        Text("LSK/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 72",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/bnt.png"),
        
        SizedBox(width: 30),
        Text("BNT"),
        SizedBox(width: 100),
        Text("BNT/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 73",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/strat.png"),
        
        SizedBox(width: 30),
        Text("STRAT"),
        SizedBox(width: 100),
        Text("STRAT/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 74",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/aion.png"),
        
        SizedBox(width: 30),
        Text("AION"),
        SizedBox(width: 100),
        Text("AION/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 75",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/wtc.png"),
        
        SizedBox(width: 30),
        Text("WTC"),
        SizedBox(width: 100),
        Text("WTC/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 76",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/data.png"),
        
        SizedBox(width: 30),
        Text("DATA"),
        SizedBox(width: 100),
        Text("DATA/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 77",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/xzc.png"),
        
        SizedBox(width: 30),
        Text("XZC"),
        SizedBox(width: 100),
        Text("XZC/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 78",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/sol.png"),
        
        SizedBox(width: 30),
        Text("SOL"),
        SizedBox(width: 100),
        Text("SOL/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 79",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/btc.png"),
        
        SizedBox(width: 30),
        Text("BTC"),
        SizedBox(width: 100),
        Text("BTC/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 80",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/btc.png"),
        
        SizedBox(width: 30),
        Text("BTC"),
        SizedBox(width: 100),
        Text("BTC/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 81",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/gxs.png"),
        
        SizedBox(width: 30),
        Text("GXS"),
        SizedBox(width: 100),
        Text("GXS/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 82",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/ardr.png"),
        
        SizedBox(width: 30),
        Text("ARDR"),
        SizedBox(width: 100),
        Text("ARDR/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 83",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/lend.png"),
        
        SizedBox(width: 30),
        Text("LEND"),
        SizedBox(width: 100),
        Text("LEND/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 84",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/knc.png"),
        
        SizedBox(width: 30),
        Text("KNC"),
        SizedBox(width: 100),
        Text("KNC/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 85",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/rep.png"),
        
        SizedBox(width: 30),
        Text("REP"),
        SizedBox(width: 100),
        Text("REP/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 86",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/lrc.png"),
        
        SizedBox(width: 30),
        Text("LRC"),
        SizedBox(width: 100),
        Text("LRC/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 87",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/comp.png"),
        
        SizedBox(width: 30),
        Text("COMP"),
        SizedBox(width: 100),
        Text("COMP/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 88",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/sc.png"),
        
        SizedBox(width: 30),
        Text("SC"),
        SizedBox(width: 100),
        Text("SC/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 89",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/zen.png"),
        
        SizedBox(width: 30),
        Text("ZEN"),
        SizedBox(width: 100),
        Text("ZEN/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 90",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/snx.png"),
        
        SizedBox(width: 30),
        Text("SNX"),
        SizedBox(width: 100),
        Text("SNX/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 91",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/eth.png"),
        
        SizedBox(width: 30),
        Text("ETH"),
        SizedBox(width: 100),
        Text("ETH/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 92",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/eth.png"),
        
        SizedBox(width: 30),
        Text("ETH"),
        SizedBox(width: 100),
        Text("ETH/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 93",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/ada.png"),
        
        SizedBox(width: 30),
        Text("ADA"),
        SizedBox(width: 100),
        Text("ADA/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 94",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/ada.png"),
        
        SizedBox(width: 30),
        Text("ADA"),
        SizedBox(width: 100),
        Text("ADA/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 95",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/link.png"),
        
        SizedBox(width: 30),
        Text("LINK"),
        SizedBox(width: 100),
        Text("LINK/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 96",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/link.png"),
        
        SizedBox(width: 30),
        Text("LINK"),
        SizedBox(width: 100),
        Text("LINK/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 97",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/vtho.png"),
        
        SizedBox(width: 30),
        Text("VTHO"),
        SizedBox(width: 100),
        Text("VTHO/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 98",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/dgb.png"),
        
        SizedBox(width: 30),
        Text("DGB"),
        SizedBox(width: 100),
        Text("DGB/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 99",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/gbp.png"),
        
        SizedBox(width: 30),
        Text("GBP"),
        SizedBox(width: 100),
        Text("GBP/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 100",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/mkr.png"),
        
        SizedBox(width: 30),
        Text("MKR"),
        SizedBox(width: 100),
        Text("MKR/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 101",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/dai.png"),
        
        SizedBox(width: 30),
        Text("DAI"),
        SizedBox(width: 100),
        Text("DAI/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 102",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/dcr.png"),
        
        SizedBox(width: 30),
        Text("DCR"),
        SizedBox(width: 100),
        Text("DCR/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 103",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/storj.png"),
        
        SizedBox(width: 30),
        Text("STORJ"),
        SizedBox(width: 100),
        Text("STORJ/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 104",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/bnb.png"),
        
        SizedBox(width: 30),
        Text("BNB"),
        SizedBox(width: 100),
        Text("BNB/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 105",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/bnb.png"),
        
        SizedBox(width: 30),
        Text("BNB"),
        SizedBox(width: 100),
        Text("BNB/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 106",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/xtz.png"),
        
        SizedBox(width: 30),
        Text("XTZ"),
        SizedBox(width: 100),
        Text("XTZ/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 107",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/xtz.png"),
        
        SizedBox(width: 30),
        Text("XTZ"),
        SizedBox(width: 100),
        Text("XTZ/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 108",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/mana.png"),
        
        SizedBox(width: 30),
        Text("MANA"),
        SizedBox(width: 100),
        Text("MANA/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 109",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/yfi.png"),
        
        SizedBox(width: 30),
        Text("YFI"),
        SizedBox(width: 100),
        Text("YFI/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 110",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/bal.png"),
        
        SizedBox(width: 30),
        Text("BAL"),
        SizedBox(width: 100),
        Text("BAL/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 111",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/blz.png"),
        
        SizedBox(width: 30),
        Text("BLZ"),
        SizedBox(width: 100),
        Text("BLZ/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 112",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/kmd.png"),
        
        SizedBox(width: 30),
        Text("KMD"),
        SizedBox(width: 100),
        Text("KMD/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 113",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/dai.png"),
        
        SizedBox(width: 30),
        Text("DAI"),
        SizedBox(width: 100),
        Text("DAI/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 114",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/ant.png"),
        
        SizedBox(width: 30),
        Text("ANT"),
        SizedBox(width: 100),
        Text("ANT/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 115",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/crv.png"),
        
        SizedBox(width: 30),
        Text("CRV"),
        SizedBox(width: 100),
        Text("CRV/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 116",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/sand.png"),
        
        SizedBox(width: 30),
        Text("SAND"),
        SizedBox(width: 100),
        Text("SAND/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 117",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/nmr.png"),
        
        SizedBox(width: 30),
        Text("NMR"),
        SizedBox(width: 100),
        Text("NMR/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 118",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/dot.png"),
        
        SizedBox(width: 30),
        Text("DOT"),
        SizedBox(width: 100),
        Text("DOT/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 119",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/paxg.png"),
        
        SizedBox(width: 30),
        Text("PAXG"),
        SizedBox(width: 100),
        Text("PAXG/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 120",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/sushi.png"),
        
        SizedBox(width: 30),
        Text("SUSHI"),
        SizedBox(width: 100),
        Text("SUSHI/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 121",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/ksm.png"),
        
        SizedBox(width: 30),
        Text("KSM"),
        SizedBox(width: 100),
        Text("KSM/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 122",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/uma.png"),
        
        SizedBox(width: 30),
        Text("UMA"),
        SizedBox(width: 100),
        Text("UMA/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 123",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/eos.png"),
        
        SizedBox(width: 30),
        Text("EOS"),
        SizedBox(width: 100),
        Text("EOS/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 124",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/eos.png"),
        
        SizedBox(width: 30),
        Text("EOS"),
        SizedBox(width: 100),
        Text("EOS/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 125",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/trx.png"),
        
        SizedBox(width: 30),
        Text("TRX"),
        SizedBox(width: 100),
        Text("TRX/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 126",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/trx.png"),
        
        SizedBox(width: 30),
        Text("TRX"),
        SizedBox(width: 100),
        Text("TRX/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 127",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/xrp.png"),
        
        SizedBox(width: 30),
        Text("XRP"),
        SizedBox(width: 100),
        Text("XRP/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 128",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/xrp.png"),
        
        SizedBox(width: 30),
        Text("XRP"),
        SizedBox(width: 100),
        Text("XRP/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 129",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/dot.png"),
        
        SizedBox(width: 30),
        Text("DOT"),
        SizedBox(width: 100),
        Text("DOT/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 130",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/dot.png"),
        
        SizedBox(width: 30),
        Text("DOT"),
        SizedBox(width: 100),
        Text("DOT/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 131",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/ltc.png"),
        
        SizedBox(width: 30),
        Text("LTC"),
        SizedBox(width: 100),
        Text("LTC/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 132",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/ltc.png"),
        
        SizedBox(width: 30),
        Text("LTC"),
        SizedBox(width: 100),
        Text("LTC/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 133",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/uni.png"),
        
        SizedBox(width: 30),
        Text("UNI"),
        SizedBox(width: 100),
        Text("UNI/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 134",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/oxt.png"),
        
        SizedBox(width: 30),
        Text("OXT"),
        SizedBox(width: 100),
        Text("OXT/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 135",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/uni.png"),
        
        SizedBox(width: 30),
        Text("UNI"),
        SizedBox(width: 100),
        Text("UNI/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 136",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/uni.png"),
        
        SizedBox(width: 30),
        Text("UNI"),
        SizedBox(width: 100),
        Text("UNI/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 137",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/utk.png"),
        
        SizedBox(width: 30),
        Text("UTK"),
        SizedBox(width: 100),
        Text("UTK/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 138",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/aave.png"),
        
        SizedBox(width: 30),
        Text("AAVE"),
        SizedBox(width: 100),
        Text("AAVE/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 139",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/fil.png"),
        
        SizedBox(width: 30),
        Text("FIL"),
        SizedBox(width: 100),
        Text("FIL/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 140",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/fil.png"),
        
        SizedBox(width: 30),
        Text("FIL"),
        SizedBox(width: 100),
        Text("FIL/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 141",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/fil.png"),
        
        SizedBox(width: 30),
        Text("FIL"),
        SizedBox(width: 100),
        Text("FIL/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 142",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/yfi.png"),
        
        SizedBox(width: 30),
        Text("YFI"),
        SizedBox(width: 100),
        Text("YFI/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 143",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/yfi.png"),
        
        SizedBox(width: 30),
        Text("YFI"),
        SizedBox(width: 100),
        Text("YFI/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 144",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/bch.png"),
        
        SizedBox(width: 30),
        Text("BCH"),
        SizedBox(width: 100),
        Text("BCH/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 145",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/bch.png"),
        
        SizedBox(width: 30),
        Text("BCH"),
        SizedBox(width: 100),
        Text("BCH/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 146",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/dnt.png"),
        
        SizedBox(width: 30),
        Text("DNT"),
        SizedBox(width: 100),
        Text("DNT/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 147",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/xem.png"),
        
        SizedBox(width: 30),
        Text("XEM"),
        SizedBox(width: 100),
        Text("XEM/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 148",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/aave.png"),
        
        SizedBox(width: 30),
        Text("AAVE"),
        SizedBox(width: 100),
        Text("AAVE/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 149",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/aave.png"),
        
        SizedBox(width: 30),
        Text("AAVE"),
        SizedBox(width: 100),
        Text("AAVE/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 150",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/skl.png"),
        
        SizedBox(width: 30),
        Text("SKL"),
        SizedBox(width: 100),
        Text("SKL/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 151",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/sushi.png"),
        
        SizedBox(width: 30),
        Text("SUSHI"),
        SizedBox(width: 100),
        Text("SUSHI/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 152",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/sushi.png"),
        
        SizedBox(width: 30),
        Text("SUSHI"),
        SizedBox(width: 100),
        Text("SUSHI/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 153",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/xlm.png"),
        
        SizedBox(width: 30),
        Text("XLM"),
        SizedBox(width: 100),
        Text("XLM/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 154",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/xlm.png"),
        
        SizedBox(width: 30),
        Text("XLM"),
        SizedBox(width: 100),
        Text("XLM/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 155",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/grt.png"),
        
        SizedBox(width: 30),
        Text("GRT"),
        SizedBox(width: 100),
        Text("GRT/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 156",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/atm.png"),
        
        SizedBox(width: 30),
        Text("ATM"),
        SizedBox(width: 100),
        Text("ATM/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 157",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/auto.png"),
        
        SizedBox(width: 30),
        Text("AUTO"),
        SizedBox(width: 100),
        Text("AUTO/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 158",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/btg.png"),
        
        SizedBox(width: 30),
        Text("BTG"),
        SizedBox(width: 100),
        Text("BTG/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 159",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/icp.png"),
        
        SizedBox(width: 30),
        Text("ICP"),
        SizedBox(width: 100),
        Text("ICP/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 160",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/lpt.png"),
        
        SizedBox(width: 30),
        Text("LPT"),
        SizedBox(width: 100),
        Text("LPT/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 161",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/xvg.png"),
        
        SizedBox(width: 30),
        Text("XVG"),
        SizedBox(width: 100),
        Text("XVG/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 162",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/mln.png"),
        
        SizedBox(width: 30),
        Text("MLN"),
        SizedBox(width: 100),
        Text("MLN/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 163",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/req.png"),
        
        SizedBox(width: 30),
        Text("REQ"),
        SizedBox(width: 100),
        Text("REQ/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 164",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/gno.png"),
        
        SizedBox(width: 30),
        Text("GNO"),
        SizedBox(width: 100),
        Text("GNO/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 165",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/elf.png"),
        
        SizedBox(width: 30),
        Text("ELF"),
        SizedBox(width: 100),
        Text("ELF/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 166",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/poly.png"),
        
        SizedBox(width: 30),
        Text("POLY"),
        SizedBox(width: 100),
        Text("POLY/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 167",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/sys.png"),
        
        SizedBox(width: 30),
        Text("SYS"),
        SizedBox(width: 100),
        Text("SYS/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 168",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/adx.png"),
        
        SizedBox(width: 30),
        Text("ADX"),
        SizedBox(width: 100),
        Text("ADX/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 169",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/powr.png"),
        
        SizedBox(width: 30),
        Text("POWR"),
        SizedBox(width: 100),
        Text("POWR/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 170",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/amp.png"),
        
        SizedBox(width: 30),
        Text("AMP"),
        SizedBox(width: 100),
        Text("AMP/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 171",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/flux.png"),
        
        SizedBox(width: 30),
        Text("FLUX"),
        SizedBox(width: 100),
        Text("FLUX/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 172",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/steem.png"),
        
        SizedBox(width: 30),
        Text("STEEM"),
        SizedBox(width: 100),
        Text("STEEM/Usdt"),
      ],
    ),
  ), 
  
  
  
DropdownMenuItem(
    value: "Option 173",
    child: Row(
      children: <Widget>[
        Image.asset("assets/images/nexo.png"),
        
        SizedBox(width: 30),
        Text("NEXO"),
        SizedBox(width: 100),
        Text("NEXO/Usdt"),
      ],
    ),
  ), 
  
  

];
