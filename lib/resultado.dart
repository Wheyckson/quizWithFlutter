import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() onRestart;

  Resultado(this.pontuacao, this.onRestart);

  String get fraseResultado {
    if (pontuacao <= 2) {
      return 'Que pena ! $pontuacao acertos ';
    } else if (pontuacao <= 3) {
      return 'Você é bom ! $pontuacao acertos';
    } else if (pontuacao <= 4) {
      return 'Impressionante! $pontuacao acertos';
    } else {
      return ('Nivel expert ! $pontuacao acertos');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text(
            fraseResultado,
            style: TextStyle(fontSize: 28),
          ),
        ),
        FlatButton(
          color: Colors.green,
          textColor: Colors.white,
          child: Text(
            'Reiniciar ?',            
            style: TextStyle(fontSize: 18),
          ),
          onPressed: onRestart,
        ),
      ],
    );
  }
}
