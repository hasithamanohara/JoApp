import 'package:flutter/material.dart';

class ProfileTile extends StatelessWidget {
  final String? name;
  final String? imageAsset;

  const ProfileTile({
    super.key,
    this.name,
    this.imageAsset,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10,
      left: 0,
      right: 0,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        // decoration: const BoxDecoration(color: Colors.white70),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: imageAsset != null
                    ? DecorationImage(
                        image: AssetImage(imageAsset!),
                        fit: BoxFit.fill,
                      )
                    : null,
              ),
              child: imageAsset == null ? const Icon(Icons.person) : null,
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Good Morning, ',
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        ),
                        TextSpan(
                          text: name ?? "Guest",
                          style: const TextStyle(
                            color: Colors.green,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Text(
                    "Where are you going?",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
