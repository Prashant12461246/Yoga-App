import 'package:flutter/material.dart';
import 'package:tabbar/common/constant.dart';
import 'package:tabbar/component/detail_diet.dart';
import 'package:tabbar/model/product.dart';

// ignore: camel_case_types
class Body_Diet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Text(
            "Diet",
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(fontWeight: FontWeight.bold, color: kTextColor),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: GridView.builder(
              itemCount: products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: kDefaultPadding,
                crossAxisSpacing: kDefaultPadding,
                childAspectRatio: .80,
              ),
              itemBuilder: (context, index) => Itemcard(
                    product: products[index],
                    press: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> Detail_screen(product: products[index],)))),
                  )),
        )
      ],
    );
  }
}

class Itemcard extends StatelessWidget {
  final Product product;
  final Function press;
  const Itemcard({
    Key key,
    this.product,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(kDefaultPadding),
              //height: 180,
              //width: 160,
              decoration: BoxDecoration(
                color: product.color,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Image.asset(products[0].image),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 4),
            child: Text(
              product.title,
              style: TextStyle(color: kTextColor),
            ),
          ),
          Text(
            "\$${product.prize}",
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
