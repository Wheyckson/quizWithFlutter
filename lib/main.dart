import 'package:flutter/material.dart';
import './resultado.dart';
import './questionario.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final _perguntas = const [
    {
      'texto': '1) De quem é a famosa frase “Penso, logo existo”?',
      'respostas': [
        {'texto': 'Platão', 'pontuacao': 0},
        {'texto': 'Galileu Galilei', 'pontuacao': 0},
        {'texto': 'Descartes', 'pontuacao': 1},
        {'texto': 'Sócrates', 'pontuacao': 0},
        {'texto': 'Francis Bacon', 'pontuacao': 0},
      ],
    },
    {
      'texto': '2) Quais o menor e o maior país do mundo?',
      'respostas': [
        {'texto': 'Vaticano e Rússia', 'pontuacao': 1},
        {'texto': 'Nauru e China', 'pontuacao': 0},
        {'texto': 'Mônaco e Canadá', 'pontuacao': 0},
        {'texto': 'Malta e Estados Unidos', 'pontuacao': 0},
        {'texto': 'São Marino e Índia', 'pontuacao': 0},
      ],
    },
    {
      'texto':
          '3) Qual o nome do presidente do Brasil que ficou conhecido como Jango?',
      'respostas': [
        {'texto': 'Jânio Quadros', 'pontuacao': 0},
        {'texto': 'Jacinto Anjos', 'pontuacao': 0},
        {'texto': 'Getúlio Vargas', 'pontuacao': 0},
        {'texto': 'João Figueiredo', 'pontuacao': 0},
        {'texto': 'João Goulart', 'pontuacao': 1},
      ],
    },
    {
      'texto': '4) Qual o livro mais vendido no mundo a seguir à Bíblia?',
      'respostas': [
        {'texto': 'O Senhor dos Anéis', 'pontuacao': 0},
        {'texto': 'Dom Quixote', 'pontuacao': 1},
        {'texto': 'O Pequeno Príncipe', 'pontuacao': 0},
        {'texto': 'Ela, a Feiticeira', 'pontuacao': 0},
        {'texto': 'Um Conto de Duas Cidades', 'pontuacao': 0},
      ],
    },
    {
      'texto':
          '5) Quais os países que têm a maior e a menor expectativa de vida do mundo?',
      'respostas': [
        {'texto': 'Japão e Serra Leoa', 'pontuacao': 1},
        {'texto': 'Austrália e Afeganistão', 'pontuacao': 0},
        {'texto': 'Itália e Chade', 'pontuacao': 0},
        {'texto': 'Brasil e Congo', 'pontuacao': 0},
        {'texto': 'Estados Unidos e Angola', 'pontuacao': 0},
      ],
    },
  ];

  void _responder(int pontuacao) {
    if (temPergunta) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPergunta {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar( 
          backgroundColor: Colors.orange,          
          title: Text('Perguntas'),
        ),
        body: temPergunta
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                onAnswer: _responder,
              )
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
