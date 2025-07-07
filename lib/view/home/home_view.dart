import 'package:desafio_flutter/utils/web_view_page.dart';
import 'package:desafio_flutter/view-models/login_cubit/login_cubit.dart';
import 'package:desafio_flutter/view-models/login_cubit/login_cubit_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../components/drawer/custom_drawer.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit,LoginCubitModel>(
      builder: (context,state){
        return Scaffold(
          backgroundColor: Colors.black, // Fundo preto global
          appBar: AppBar(
            backgroundColor: Colors.black,
            iconTheme: const IconThemeData(color: Colors.white),
            actions: [
              IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () {},
              ),
            ],
          ),
          drawer: CustomDrawer(
            userName: context.read<LoginCubit>().state.userLogged?.name ?? "",
            onTapDrawerItem: (index) {
              // ação ao clicar nas opções do drawer
            },
          ),
          body: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height - kToolbarHeight,
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFF81C784), // Verde
                            Color(0xFFFFF176), // Amarelo
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.white,
                            child:
                            Icon(Icons.person, size: 30, color: Colors.green),
                          ),
                          const SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Bem-vindo",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                context.read<LoginCubit>().state.userLogged?.name ?? "",
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                    const Text(
                      "Cotar e contratar",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => WebViewPage(
                                    url: "https://jsonplaceholder.typicode.com/",
                                    title: "Carro",
                                  ),
                                ),
                              );
                            },
                            child:
                            _buildSmallCard(Icons.directions_car, "Automóvel")),
                        const SizedBox(
                          width: 8,
                        ),
                        _buildSmallCard(Icons.home, "Residência"),
                        const SizedBox(
                          width: 8,
                        ),
                        _buildSmallCard(Icons.favorite, "Vida"),
                        const SizedBox(
                          width: 8,
                        ),
                        _buildSmallCard(
                            Icons.medical_services, "Acidentes Pessoais"),
                      ],
                    ),
                    const SizedBox(height: 32),
                    const Text(
                      "Minha família",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(24),
                      margin: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 64,
                            height: 64,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                                width: 2,
                              ),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.add,
                                size: 32,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(height: 16),
                          const Text(
                            "Adicionar membro da família",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "Contratados",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(24),
                      margin: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 64,
                            height: 64,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                                width: 2,
                              ),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.sentiment_dissatisfied,
                                size: 32,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            "Você ainda não possui seguros contratados",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildSmallCard(IconData icon, String title) {
    return Container(
      height: 80,
      width: 70,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 30, color: Colors.green),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
