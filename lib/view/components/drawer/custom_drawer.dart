
import 'package:desafio_flutter/view-models/login_cubit/login_cubit.dart';
import 'package:desafio_flutter/view/components/drawer/drawer_tile_data.dart';
import 'package:desafio_flutter/view/login/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomDrawer extends StatelessWidget {
  final String userName;
  final void Function(int index)? onTapDrawerItem;

  const CustomDrawer({
    super.key,
    required this.userName,
    this.onTapDrawerItem,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: [
          Container(
            color: Colors.black,
          ),
          ListView(
            padding: const EdgeInsets.only(left: 16.0, top: 16.0, right: 16.0),
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 24),
                      child: const Text(
                        "Olá,",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white24,
                          child: Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Text(
                            userName,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(color: Colors.white30),
              DrawerTile(
                icon: Icons.settings,
                text: "Home / Seguros",
                onTap: () => onTapDrawerItem?.call(1),
              ),
              DrawerTile(
                icon: Icons.settings,
                text: "Minhas Contratações",
                onTap: () => onTapDrawerItem?.call(1),
              ),
              DrawerTile(
                icon: Icons.settings,
                text: "Meus Sinistros",
                onTap: () => onTapDrawerItem?.call(2),
              ),
              DrawerTile(
                icon: Icons.settings,
                text: "Minha Família",
                onTap: () => onTapDrawerItem?.call(3),
              ),
              DrawerTile(
                icon: Icons.settings,
                text: "Meus Bens",
                onTap: () => onTapDrawerItem?.call(4),
              ),
              DrawerTile(
                icon: Icons.settings,
                text: "Pagamentos",
                onTap: () => onTapDrawerItem?.call(5),
              ),
              DrawerTile(
                icon: Icons.settings,
                text: "Coberturas",
                onTap: () => onTapDrawerItem?.call(6),
              ),
              DrawerTile(
                icon: Icons.settings,
                text: "Validar Boleto",
                onTap: () => onTapDrawerItem?.call(7),
              ),
              DrawerTile(
                icon: Icons.settings,
                text: "Telefones Importantes",
                onTap: () => onTapDrawerItem?.call(8),
              ),
              DrawerTile(
                icon: Icons.settings,
                text: "Configurações",
                onTap: () => onTapDrawerItem?.call(9),
              ),
              const Divider(color: Colors.white30),
              const SizedBox(height: 20),
              InkWell(
                onTap: () async{
                  await context.read<LoginCubit>().signOut();
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => LoginView()),
                  );
                },
                child: Container(
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.exit_to_app,
                        color: Colors.white70,
                      ),
                      SizedBox(width: 16),
                      Text(
                        "Fazer Logout",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
