import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: const BorderSide(width: 0.8),
                ),
                hintText: 'Search Food',
                prefixIcon: const Icon(
                  Icons.search,
                  size: 30.0,
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {},
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    const Text(
                      'BEST DEALS',
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                          fontWeight: FontWeight.w700),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(left: 177),
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "See All",
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.teal,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // SizedBox(
              //   height: 210,
              //   child: ListView.builder(
              //       itemCount: 5,
              //       scrollDirection: Axis.horizontal,
              //       itemBuilder: (context, index) {
              //         return const BestDealsWidget();
              //       }),
              // )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Text(
                  'ALL PRODUCTS',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
