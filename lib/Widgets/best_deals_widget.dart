import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:zamjy/utils/data_builder.dart';

// ignore: must_be_immutable
class BestDealsWidget extends StatefulWidget {
  BestDealsData bestdeals;
  BestDealsWidget({required this.bestdeals, super.key});

  @override
  State<BestDealsWidget> createState() => _BestDealsWidgetState();
}

class _BestDealsWidgetState extends State<BestDealsWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        child: Container(
          alignment: Alignment.center,
          decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(color: Colors.grey.withOpacity(0.3)))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(widget.bestdeals.bestDealsImages,
                  height: 100, width: 150),
              const SizedBox(height: 5),
              Text(
                widget.bestdeals.bestDealsTitle,
                style:
                    const TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 2),
              RatingBarIndicator(
                rating: widget.bestdeals.bestDealsRating,
                itemCount: 5,
                itemSize: 20,
                itemBuilder: (context, index) {
                  return const Icon(
                    Icons.star,
                    color: Colors.amber,
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("₱${widget.bestdeals.bestDealsPrice.toStringAsFixed(2)}",
                      style: const TextStyle(
                          fontSize: 19, fontWeight: FontWeight.w600)),
                ],
              )
            ],
          ),
        ),
        onTap: () {
          Navigator.pushNamed(context, "productDetails");
        },
      ),
    );
  }
}
