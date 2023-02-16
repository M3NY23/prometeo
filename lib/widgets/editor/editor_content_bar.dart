import 'package:flutter/material.dart';

class EditorContentBar extends StatelessWidget {
  const EditorContentBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.white)),
        child: Column(children: const [
          ExpansionTile(
            title: Text("Propiedades"),
            children: [
              Text("Propiedad 1"),
              Text("Propiedad 3"),
              Text("Propiedad 3"),
            ],
          ),
          ExpansionTile(
            title: Text("Componentes"),
            children: [
              Text("Componente 1"),
              Text("Componente 3"),
              Text("Componente 3"),
            ],
          ),
          ExpansionTile(
            title: Text("Variables"),
            children: [
              Text("Variable 1"),
              Text("Variable 3"),
              Text("Variable 3"),
            ],
          ),
          ExpansionTile(
            title: Text("Eventos"),
            children: [
              Text("Evento 1"),
              Text("Evento 3"),
              Text("Evento 3"),
            ],
          ),
        ]),
      ),
    );
  }
}
