import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopBarS extends StatelessWidget implements PreferredSizeWidget {
  final int _notificationCount = 0;
  final VoidCallback onNotificationPressed;
  final TabController? tabController;

  TopBarS({
    Key? key,
    required this.onNotificationPressed,
    this.tabController,
  }) : super(key: key);

  int get notificationCount => _notificationCount;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight * 0.5),
      child: AppBar(
        backgroundColor: Color(0xFF01986D),
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(0),
          ),
        ),
        title: Padding(
          padding: EdgeInsets.only(right: 240.0), // Décalage vers la gauche
          child: Image.asset(
            'assets/images/end-removebg-preview.png',
            height: 150, // Hauteur de l'image
            width: 150, // Largeur de l'image
            fit: BoxFit.cover,
          ),
        ),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.notifications, color: Colors.white),
                onPressed: onNotificationPressed,
              ),
              if (_notificationCount > 0)
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    constraints: BoxConstraints(
                      minWidth: 18,
                      minHeight: 18,
                    ),
                    child: Text(
                      _notificationCount.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight * 1.01);
}
