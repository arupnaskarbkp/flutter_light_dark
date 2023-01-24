import 'package:flutter/material.dart';

class ImageBuilderWidget extends StatelessWidget {

  final String image ;
  final double height, width ;
  const ImageBuilderWidget({Key? key,required this.image,  this.height = 200, this.width = 200 }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
            )
        ),
        child: ClipRRect(
          child: Image(
            fit: BoxFit.cover,
            height: height,
            width: width,
            repeat: ImageRepeat.repeatY,
            image:  NetworkImage(image),
            errorBuilder: (BuildContext context, Object exception,
                StackTrace? stackTrace) {
              return SizedBox(
                  height: height,
                  width: width,
                  child: const Icon(
                    Icons.error,
                    color: Colors.red,
                  ));
            },
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) return child ;
              return SizedBox(
                height: height,
                width: width,
                child: Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}