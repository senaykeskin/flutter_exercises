import 'package:flutter/material.dart';

class ButtonLearn extends StatelessWidget {
  const ButtonLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor:
                  WidgetStateProperty.resolveWith((Set<WidgetState> states) {
                return states.contains(WidgetState.pressed)
                    ? Colors.green
                    : Colors.red;
              }),
            ),
            child: const Text("Save"),
          ),
          ElevatedButton(onPressed: () {}, child: const Text("data")),
          IconButton(onPressed: () {}, icon: Icon(Icons.abc_rounded)),
          FloatingActionButton(onPressed: () {}, child: const Icon(Icons.add)),
          OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  padding: EdgeInsets.all(10),
                  shape: CircleBorder()),
              child: const Text("data")),
          OutlinedButton.icon(
            onPressed: () {},
            label: Text("data"),
            icon: Icon(Icons.abc),
          ),
          InkWell(onTap: () {}, child: const Text("data")),
          const SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.black, shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))
            )),
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20, right: 40, left: 40),
                child: Text(
                  "Place Bid",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              )
          )
        ],
      ),
    );
  }
}

// Borders:
// CircleBorder(), RoundedRectangleBorder()
