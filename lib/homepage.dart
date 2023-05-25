import 'package:flutter/material.dart';
import 'package.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> with AutomaticKeepAliveClientMixin {
  final TextEditingController _textController = TextEditingController();
  List<Package> package = [
    Package(
        address: 'hat the counter didn',
        carrier: 'apple',
        packageStatus: false,
        trackingNum: 'trackingNum'),
    Package(
        address: 'hat the counter didn',
        carrier: 'apple',
        packageStatus: true,
        trackingNum: 'trackingNum'),
    Package(
        address: 'hat the counter didn',
        carrier: 'apple',
        packageStatus: false,
        trackingNum: 'trackingNum'),
    Package(
        address: 'hat the counter didn',
        carrier: 'apple',
        packageStatus: false,
        trackingNum: 'trackingNum'),
    Package(
        address: 'hat the counter didn',
        carrier: 'apple',
        packageStatus: true,
        trackingNum: 'trackingNum'),
    Package(
        address: 'hat the counter didn',
        carrier: 'apple',
        packageStatus: false,
        trackingNum: 'trackingNum'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            snap: false,
            centerTitle: false,
            title: const Text('PacTrack'),
            bottom: AppBar(
              title: Container(
                width: double.infinity,
                height: 40,
                color: Colors.white,
                child: Center(
                  child: TextField(
                    textInputAction: TextInputAction.go,
                    controller: _textController,
                    onSubmitted: (tracking) {
                      setState(() {
                        package.add(Package(
                            address: "address",
                            carrier: "carrier",
                            packageStatus: false,
                            trackingNum: tracking));
                            _textController.clear();
                      });
                    },
                    decoration: const InputDecoration(
                      hintText: 'add your package using tracking number',
                      prefixIcon: Icon(Icons.numbers),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverFillRemaining(
              child: MediaQuery.removePadding(
                  removeTop: true,
                  context: context,
                  child: ListView.separated(
                      itemCount: package.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          color:  package[index].packageStatus? Colors.green : Colors.grey,
                          height: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Padding(padding: EdgeInsets.only(left: 10)),
                              Image.network(
                                'https://images.squarespace-cdn.com/content/v1/5a593284a8b'
                                '2b0e04f3568f0/1534371749675-2M5SN2XH6CPR2EJE8XJJ/Package.png?format=1000w',
                                height: 80,
                                width: 100,
                                fit: BoxFit.cover,
                              ),
                              const Padding(
                                  padding:
                                      EdgeInsets.only(left: 10, right: 20)),
                              SizedBox(
                                width: 180,
                                child:  Column(
                                  children: [
                                    const Padding(
                                        padding: EdgeInsets.only(top: 15)),
                                    Text(
                                      'Tracking#: ${package[index].trackingNum}',
                                      textAlign: TextAlign.left, overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      'Carrier: ${package[index].carrier}',
                                      textAlign: TextAlign.left, overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      'address: ${package[index].address}',
                                      textAlign: TextAlign.left, overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      'status: ${package[index].packageStatus
                                              ? 'delivered'
                                              : 'on the way'}',
                                      textAlign: TextAlign.left, overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                              const Padding(padding: EdgeInsets.only(left: 30)),
                              IconButton(
                                icon: const Icon(Icons.delete),
                                color: Colors.red,
                                onPressed: () {
                                  setState(() {
                                    package.removeAt(index);
                                  });
                                },
                              )
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(
                            color: Colors.white,
                          ))))
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
