import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:td_games/game/game.dart';

class PexelWorldScreen extends StatefulWidget {
  const PexelWorldScreen({Key? key}) : super(key: key);

  @override
  State<PexelWorldScreen> createState() => PexelWorldScreenState();
}

class PexelWorldScreenState extends State<PexelWorldScreen> {
  late FocusNode gameFocusNode;

  @override
  void initState() {
    super.initState();

    gameFocusNode = FocusNode();
  }

  @override
  void dispose() {
    gameFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
          // children: [
          //   Expanded(
          //     child: MouseRegion(
          //       onHover: (_) {
          //         if (!gameFocusNode.hasFocus) {
          //           gameFocusNode.requestFocus();
          //         }
          //       },
          //       child: GameWidget(
          //         focusNode: gameFocusNode,
          //         game: VeryGoodAdventuresGame(),
          //       ),
          //     ),
          //   ),
          //   SizedBox(
          //     width: 250,
          //     height: double.infinity,
          //     child: Column(
          //       children: const [
          //         PlayerView(),
          //         Expanded(child: InventoryView()),
          //         SizedBox(height: 8),
          //       ],
          //     ),
          //   ),
          // ],
          ),
    );
  }
}
