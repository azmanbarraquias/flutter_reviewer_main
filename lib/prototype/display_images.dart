import 'package:flutter/material.dart';

main() => runApp(const MaterialApp(home: DisplayImages()));

class DisplayImages extends StatelessWidget {
  const DisplayImages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
          // localImage()
          // networkImage()
          // fadeInImages()
          circleImage()
    ),
    );
  }
  
  localImage() {
    Image.asset('assets/instagram_bottom_navigation_bar/assets/images/profile.png');
  }

  networkImage() {
    return Image.network('https://images.pexels.com/photos/1402787/pexels-photo-1402787.jpeg');
  }

  fadeInImages() {
    return FadeInImage.assetNetwork(
      placeholder: 'assets/instagram_bottom_navigation_bar/assets/images/profile.png',
      image: 'https://images.pexels.com/photos/1402787/pexels-photo-1402787.jpeg',
      width: 200,
      height: 200,
      fit: BoxFit.cover,
    );
  }

  circleImage() {
    return Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage(
                'assets/instagram_bottom_navigation_bar/assets/images/profile.png'),
          ),
          border: Border.all(color: Colors.red, width: 10),
          shape: BoxShape.circle,
        ),
    );
  }
}
