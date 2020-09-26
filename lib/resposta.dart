import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() onSelection;

  Resposta(this.texto, this.onSelection);

  @override
  Widget build(BuildContext context) {
    return Container(      
      width: double.infinity,      
      child: RaisedButton(        
        textColor: Colors.black,
        color: Colors.orange,
        child: Text(texto),
        onPressed: onSelection,
      ),
    );
  }
}
