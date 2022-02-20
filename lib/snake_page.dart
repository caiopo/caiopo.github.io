import 'dart:async';

import 'package:flutter/material.dart';
import 'package:snake/snake.dart';

class SnakePage extends StatefulWidget {
  const SnakePage({Key? key}) : super(key: key);

  @override
  State<SnakePage> createState() => _SnakePageState();
}

class _SnakePageState extends State<SnakePage> {
  late final SnakeGame _snakeGame;
  late List<List<SnakeItem>> _board;
  Timer? _timer;

  void _render() {
    setState(() {
      _board = _snakeGame.getBoardWithSnake();
    });
  }

  @override
  void initState() {
    super.initState();
    _snakeGame = SnakeGame(
      renderer: _render,
      boardWidth: boardWidth,
      boardHeight: boardHeight,
      initialSnakeX: 0,
      initialSnakeY: 0,
      initialSnakeDirection: SnakeDirection.right,
      initialSnakeSize: 1,
      maxTicksBeforeFood: 20,
      minTicksBeforeFood: 5,
    );
    _board = _snakeGame.getBoardWithSnake();

    _timer = Timer.periodic(
      const Duration(milliseconds: 250),
      (timer) {
        if (_snakeGame.completed) {
          timer.cancel();
        } else {
          _snakeGame.tick();
        }
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(_snakeGame.completed);

    return Scaffold(
      body: Column(
        children: [
          Board(
            board: _board,
          ),
          Expanded(
            child: Controls(
              onDirectionChanged: (d) => _snakeGame.directionNextTick = d,
            ),
          ),
        ],
      ),
    );
  }
}

class Board extends StatelessWidget {
  final List<List<SnakeItem>> board;

  const Board({
    Key? key,
    required this.board,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          for (final y in range(boardHeight))
            Row(
              children: [
                for (final x in range(boardWidth))
                  Expanded(
                    child: Cell(
                      x: x,
                      y: y,
                      item: board[y][x],
                    ),
                  ),
              ],
            ),
        ],
      ),
    );
  }
}

class Cell extends StatelessWidget {
  final int x;
  final int y;
  final SnakeItem item;

  const Cell({
    Key? key,
    required this.x,
    required this.y,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white.withOpacity(0.1),
            width: 0,
          ),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            switch (item) {
              case SnakeItem.head:
                return Container(color: Colors.green);
              case SnakeItem.body:
                return Container(color: Colors.lime);
              case SnakeItem.tail:
                return Container(color: Colors.yellow);
              case SnakeItem.food:
                return Container(color: Colors.red);
              case SnakeItem.empty:
                return Container();
            }
          },
        ),
      ),
    );
  }
}

class Controls extends StatelessWidget {
  final ValueChanged<SnakeDirection> onDirectionChanged;

  const Controls({
    Key? key,
    required this.onDirectionChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () => onDirectionChanged(SnakeDirection.up),
          icon: Icon(Icons.arrow_upward),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () => onDirectionChanged(SnakeDirection.left),
              icon: Icon(Icons.arrow_back),
            ),
            SizedBox(width: 48),
            IconButton(
              onPressed: () => onDirectionChanged(SnakeDirection.right),
              icon: Icon(Icons.arrow_forward),
            ),
          ],
        ),
        IconButton(
          onPressed: () => onDirectionChanged(SnakeDirection.down),
          icon: Icon(Icons.arrow_downward),
        ),
      ],
    );
  }
}

Iterable<int> range(int i) sync* {
  for (int j = 0; j < i; j++) {
    yield j;
  }
}

const boardWidth = 12;
const boardHeight = 12;
