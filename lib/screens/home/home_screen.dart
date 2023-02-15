import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:prometeo/screens/code_editor/code_editor_screen.dart';
import 'package:prometeo/screens/home/widgets/home_screen_menu_bar.dart';
import 'package:prometeo/widgets/expandable_side_bar.dart';

class HomeScreen extends StatelessWidget {
  static const String route = "/";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const HomeScreenMenuBar(),
        Expanded(
          child: Row(children: [
            ExpandableSideBar(
              expand: true,
              items: [
                SideBarTile(
                  icon: const Icon(Icons.picture_in_picture_alt_outlined),
                  label: "Scenes",
                  onTap: () {},
                ),
                SideBarTile(
                  icon: const Icon(Icons.card_travel_outlined),
                  label: "Components",
                  onTap: () {},
                ),
                SideBarTile(
                  icon: const Icon(Icons.audio_file),
                  label: "Sounds",
                  onTap: () {},
                ),
                SideBarTile(
                  icon: const Icon(Icons.code),
                  label: "Scripts",
                  onTap: () => context.go(CodeEditorScreen.route),
                ),
                SideBarTile(
                  icon: const Icon(Icons.photo_library_outlined),
                  label: "Assets",
                  onTap: () {},
                ),
              ],
            ),
            Expanded(
              flex: 6,
              child: Column(
                children: [
                  const Expanded(
                    flex: 4,
                    child: Center(
                      child: Text("Welcome to prometeo"),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white)),
                      child: Row(
                        children: [
                          for (int i = 0; i < 10; i++)
                            TextButton(
                              child: Text("Control $i"),
                              onPressed: () {},
                            ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.white)),
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
            )
          ]),
        ),
      ],
    ));
  }
}
