import 'package:first_app/controllers/banner_controller.dart';
import 'package:flutter/material.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});
 

  @override
  State<BannerWidget> createState() => _BannerWidgetState();

}

class _BannerWidgetState extends State<BannerWidget> {
  final BannerController _bannerController = BannerController();
   final List<String> _bannerImages = [
     "assets/images/banner1.png",
     "assets/images/banner2.png",
     "assets/images/banner3.png",
  ]; 
  @override
  Widget build(BuildContext context) {
    return Container(
        // margin: EdgeInsets.only(top: 10),
        width: MediaQuery.of(context).size.width,
        height: 170,
        decoration: BoxDecoration(color: const Color(0xFFF7F7F7), boxShadow: [
          BoxShadow(
            color:  Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ]),
        child: StreamBuilder<List<String>>(
          stream: _bannerController.getBanners(),
          builder: (context, snapshot) {
            // if (snapshot.connectionState == ConnectionState.waiting) {
            //   return Center(
            //     child: CircularProgressIndicator(
            //       color: Colors.blue,
            //     ),
            //   );
            // } else if (snapshot.hasError) {
            //   return const Icon(Icons.error);
            // } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            //   return Center(
            //     child: Text(
            //       "No Banner available",
            //       style: TextStyle(fontSize: 18, color: Colors.grey),
            //     ),
            //   );
            // } else {
              return Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  PageView.builder(
                    itemCount: _bannerImages.length,
                    itemBuilder: (context, index) {
                      // return Image.network(snapshot.data![index], fit: BoxFit.cover); 
                      return Image.asset(_bannerImages[index], fit: BoxFit.cover,);
                      // return CachedNetworkImage(
                      //   imageUrl: _bannerImages[index],
                      //   placeholder: (context, url) =>
                      //       SizedBox(
                      //         width: 100,
                      //         height: 100,
                      //         child: CircularProgressIndicator()
                      //   ),
                      //   errorWidget: (context, url, error) => Icon(Icons.error),
                      //   fit: BoxFit.cover,
                      // );
                    },
                  ),
                  _buildPageIndicator(_bannerImages.length)
                ],
              );
            // }
          },
        ),
      );
  }

  Widget _buildPageIndicator(int pageCount) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(pageCount, (index) {
            return Container(
              width: 8.0,
              height: 8,
              margin: EdgeInsets.symmetric(horizontal: 4),
              decoration:
                  BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
            );
          })),
    );
  }
}
