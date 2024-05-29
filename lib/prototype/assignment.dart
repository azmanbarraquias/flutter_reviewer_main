import 'package:flutter/material.dart';


main() => runApp(const MaterialApp(
      home: MyAssignment(),
    ));

class MyAssignment extends StatelessWidget {
  const MyAssignment({super.key});

  @override
  Widget build(BuildContext context) {
    var enable = false;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 18, 18, 18),
      body: SafeArea(
        child: SizedBox(
          height: 90,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Container(
                height: 90,
                width: 90,
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 1),
                  color: const Color.fromARGB(255, 37, 37, 37),
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 48,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/instagram_bottom_navigation_bar/assets/images/profile.png'),
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Container(
                    margin: const EdgeInsets.only(left: 5, right: 5),
                    child: Row(
                      children: [
                        const Text(
                          "KEIDE",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                        const Spacer(),
                        Icon(
                          size: 16,
                          enable ? Icons.mic_sharp : Icons.mic_off_sharp,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  )
                ],
              ),

          ),
              Container(
                height: 90,
                width: 90,
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 1),
                  color: const Color.fromARGB(255, 37, 37, 37),
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 48,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/instagram_bottom_navigation_bar/assets/images/profile.png'),
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Container(
                    margin: const EdgeInsets.only(left: 5, right: 5),
                    child: Row(
                      children: [
                        const Text(
                          "KEIDE",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                        const Spacer(),
                        Icon(
                          size: 16,
                          enable ? Icons.mic_sharp : Icons.mic_off_sharp,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  )
                ],
              ),

          ),
              Container(
                height: 90,
                width: 90,
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 1),
                  color: const Color.fromARGB(255, 37, 37, 37),
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 48,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/instagram_bottom_navigation_bar/assets/images/profile.png'),
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Container(
                    margin: const EdgeInsets.only(left: 5, right: 5),
                    child: Row(
                      children: [
                        const Text(
                          "KEIDE",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                        const Spacer(),
                        Icon(
                          size: 16,
                          enable ? Icons.mic_sharp : Icons.mic_off_sharp,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  )
                ],
              ),

          ),
              Container(
                height: 90,
                width: 90,
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 1),
                  color: const Color.fromARGB(255, 37, 37, 37),
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 48,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/instagram_bottom_navigation_bar/assets/images/profile.png'),
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Container(
                    margin: const EdgeInsets.only(left: 5, right: 5),
                    child: Row(
                      children: [
                        const Text(
                          "KEIDE",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                        const Spacer(),
                        Icon(
                          size: 16,
                          enable ? Icons.mic_sharp : Icons.mic_off_sharp,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  )
                ],
              ),

          ),
              Container(
                height: 90,
                width: 90,
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 1),
                  color: const Color.fromARGB(255, 37, 37, 37),
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 48,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/instagram_bottom_navigation_bar/assets/images/profile.png'),
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Container(
                    margin: const EdgeInsets.only(left: 5, right: 5),
                    child: Row(
                      children: [
                        const Text(
                          "KEIDE",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                        const Spacer(),
                        Icon(
                          size: 16,
                          enable ? Icons.mic_sharp : Icons.mic_off_sharp,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  )
                ],
              ),

          ),
            ],
      ),
        ),
      ),
    );
  }
}
