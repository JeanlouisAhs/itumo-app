import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../api/helper.dart';
import '../../../models/video.dart';
import '../../models/statue.dart';

class StatueListView extends StatefulWidget {
  @override
  _StatueListViewState createState() => _StatueListViewState();
}

class _StatueListViewState extends State<StatueListView> {
  final List<Statue> statues = [
    Statue(
      id: "1",
      title: "Statue 1",
      coverImage: "assets/images/vid1.jpg",
      description: "Description de la statue 1",
    ),
    Statue(
      id: "2",
      title: "Statue 2",
      coverImage: "assets/images/vid1.jpg",
      description: "Description de la statue 2",
    ),
    Statue(
      id: "3",
      title: "Statue 3",
      coverImage: "assets/images/vid1.jpg",
      description: "Description de la statue 3",
    ),
    Statue(
      id: "4",
      title: "Statue 4",
      coverImage: "assets/images/vid1.jpg",
      description: "Description de la statue 4",
    ),
    Statue(
      id: "5",
      title: "Statue 5",
      coverImage: "assets/images/vid1.jpg",
      description: "Description de la statue 5",
    ),
    Statue(
      id: "6",
      title: "Statue 6",
      coverImage: "assets/images/vid1.jpg",
      description: "Description de la statue 6",
    ),
    Statue(
      id: "7",
      title: "Statue 7",
      coverImage: "assets/images/vid1.jpg",
      description: "Description de la statue 7",
    ),
    Statue(
      id: "8",
      title: "Statue 8",
      coverImage: "assets/images/vid1.jpg",
      description: "Description de la statue 8",
    ),
    Statue(
      id: "9",
      title: "Statue 9",
      coverImage: "assets/images/vid1.jpg",
      description: "Description de la statue 9",
    ),
    Statue(
      id: "10",
      title: "Statue 10",
      coverImage: "assets/images/vid1.jpg",
      description: "Description de la statue 10",
    ),
  ];
  final List<Tag> tags = [
    Tag('Culture'),
    Tag('Education'),
    Tag('Histoire'),
    Tag('Danxomey'),
    Tag('Tag 5'),
    Tag('Tag 6'),
    Tag('Tag 7'),
    Tag('Tag 8'),
    Tag('Tag 9'),
    Tag('Tag 10'),
  ];
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: tags.length,
              itemBuilder: (context, index) {
                final tag = tags[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      tag.name,
                      style: TextStyle(color: Colors.black),
                    ),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: statues.length,
              itemBuilder: (context, index) {
                final video = statues[index];
                return GestureDetector(
                  onTap: () {},
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: screenWidth,
                            height: screenHeight * 0.3,
                            child: Stack(
                              children: [
                                Image.asset(
                                  video.coverImage ?? '',
                                  fit: BoxFit.cover,
                                  width: screenWidth,
                                  height: screenHeight * 0.2,
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(screenWidth * 0.02),
                        child: Text(
                          video.description ?? '', // Affichage de la description
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: screenWidth * 0.04,
                          ),
                        ),
                      ),
                      Divider(
                        color: Color(0xFFD3D3D3),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

