import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Images extends StatelessWidget {
  final void Function()? ontap ;
  final String title ;

  const Images({super.key, this.ontap, required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap, 
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Image.network(
                'https://example.com/your_image_url.jpg',
                fit: BoxFit.fill , // Adjust as needed
                width: 100,
                height: 100,

              ),
            ),
            Expanded(flex: 2,
                child: ListTile(
                  title: Text("$title"),

                ),
            ),
          ],
        ),
      ),
    );
  }
}
