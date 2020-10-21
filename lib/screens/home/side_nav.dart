import 'package:flutter/material.dart';

class SideNavRouteItem {
  Key key;
  String name;
  IconData icon;
  String route;
  SideNavRouteItem({this.name, this.icon, this.route}) {
    this.key = Key(name);
  }
}

final List<SideNavRouteItem> screenList = [
  SideNavRouteItem(icon: Icons.home, name: "Home", route: '/home'),
  SideNavRouteItem(icon: Icons.person_outline, name: "Profile", route: '/mess'),
  SideNavRouteItem(
      icon: Icons.notifications, name: "Notification", route: '/home'),
  SideNavRouteItem(icon: Icons.search, name: "Search", route: '/home'),
  SideNavRouteItem(icon: Icons.star, name: "Favourite", route: '/home'),
];

class NavBarTile extends StatefulWidget {
  final Function onTap;
  final SideNavRouteItem screen;
  NavBarTile({this.onTap, this.screen});
  @override
  _NavBarTileState createState() => _NavBarTileState();
}

class _NavBarTileState extends State<NavBarTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 6),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 22,
        child: InkWell(
          onTap: widget.onTap,
          child: Icon(
            widget.screen.icon,
            size: 35,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

class SideNavPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var rect = Offset.zero & size;

    Paint paint = new Paint()
      ..style = PaintingStyle.fill
      ..shader = LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        stops: [0.3, 0.7],
        colors: [
          Color.fromRGBO(207, 38, 138, 1),
          Color.fromRGBO(107, 7, 114, 1),
        ],
      ).createShader(rect);
    double barWidth = size.width * 0.16;
    double curveWidth = size.width * 0.30;
    double bezierWidth = size.width * 0.19;
    double curveHeight = size.height * 0.19;
    Path path = Path();
    path.lineTo(0, size.height);
    path.lineTo(barWidth, size.height);
    path.lineTo(barWidth, size.height * 0.33);
    path.quadraticBezierTo(
        barWidth, size.height * 0.30, bezierWidth, size.height * 0.28);
    path.cubicTo(curveWidth, size.height * 0.25, curveWidth, size.height * 0.13,
        bezierWidth, size.height * 0.10);
    path.quadraticBezierTo(barWidth, size.height * 0.08, barWidth, 0);
    path.lineTo(barWidth, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
