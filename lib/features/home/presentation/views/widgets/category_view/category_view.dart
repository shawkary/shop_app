import 'package:flutter/material.dart';
import 'package:ibrahim_project/core/utiles/styles.dart';



class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Container(
            color: Colors.grey[200],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'name',
                        style: Styles.textStyle20
                      ),
                      Image(
                        image: NetworkImage('https://i.natgeofe.com/k/63b1a8a7-0081-493e-8b53-81d01261ab5d/red-panda-full-body_4x3.jpg'),
                        width: 150,
                        height: 150,
                        fit: BoxFit.fill,
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                IconButton(onPressed: (){},
                    icon: const Icon(Icons.chevron_right, size: 40,)
                )
              ],
            ),
          ),
        );
      },
      itemCount: 7,
    );
  }
}
