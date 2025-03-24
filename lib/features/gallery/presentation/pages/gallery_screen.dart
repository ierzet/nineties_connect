import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../bloc/gallery_bloc.dart';
import '../bloc/gallery_event.dart';
import '../bloc/gallery_state.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned(
            top: -320,
            right: -350,
            child: Container(
              width: 820,
              height: 820,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    Color(0xFFFFDD00).withOpacity(0.5),
                    Colors.transparent,
                  ],
                  stops: const [0.0, 1.0],
                ),
              ),
            ),
          ),
          Column(
            children: [
              const SizedBox(height: 20),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Color(0xFFFFDD00), width: 2),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        context.go('/main');
                      },
                    ),
                  ),
                  const SizedBox(width: 14),
                  const Text(
                    "Gallery",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: BlocProvider(
                    create: (context) => GalleryBloc()..add(LoadGallery()),
                    child: BlocBuilder<GalleryBloc, GalleryState>(
                      builder: (context, state) {
                        if (state is GalleryLoading) {
                          return const Center(child: CircularProgressIndicator());
                        } else if (state is GalleryLoaded) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GridView.builder(
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                              ),
                              itemCount: state.images.length,
                              itemBuilder: (context, index) {
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(state.images[index], fit: BoxFit.cover),
                                );
                              },
                            ),
                          );
                        } else if (state is GalleryError) {
                          return Center(child: Text(state.message));
                        }
                        return const Center(child: Text('Tidak ada gambar.'));
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
