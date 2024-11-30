import 'package:flutter/material.dart';
import 'package:pbl3/source/user/issue.dart';
import 'package:pbl3/source/user/personal.dart'; // Đảm bảo tệp `personal.dart` tồn tại
import 'package:pbl3/source/user/report.dart';
import 'package:flutter/cupertino.dart';

class UserHomePage extends StatefulWidget {
  final Map<String, dynamic> userData;

  const UserHomePage({super.key, required this.userData});

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<UserHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trang thông tin cơ sở hạ tầng'),
        backgroundColor: Colors.blue, // Màu nền cho AppBar
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                
                children: [ //Tất cả những thứ nằm trong màn hình
                  const Text(
                    'Công dân số',
                    style: TextStyle(color: Colors.blue, fontSize: 24),
                  ),
                  const SizedBox(height: 20),

                  GridView.count(
                    crossAxisCount: 2, // Hiển thị 2 cột trong lưới
                    crossAxisSpacing: 20.0, //Khoảng cách giữa các cột
                    mainAxisSpacing: 20.0, //Khoảng cách giữa các hành
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    
                    children: [
                      
                      //Icon dự báo thời tiết
                      GestureDetector(
                        onTap: (){
                          print("Container clicked");
                          Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => WeatherPage()),
                          );
                        },
                        child: new Container(
                          height: 25, 
                          width: 25, 
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/anhmau.jpg'),
                              fit: BoxFit.cover, //để fit hình ảnh với Container của hình
                            )
                          )
                        )
                      ),

                      //Icon đóng góp ý kiến
                      GestureDetector(
                        onTap: (){
                          print("Container clicked");
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => OpinionPage()),
                          );
                        },
                        child: new Container(
                          height: 25, 
                          width: 25, 
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/anhmau.jpg'),
                              fit: BoxFit.cover, //để fit hình ảnh với Container của hình
                            )
                          )
                        )
                      ),

                    //Icon Dịch vụ công
                    GestureDetector(
                      onTap: (){
                        print("Container clicked");
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ServicePage()),
                        );
                      },
                      child: new Container(
                        height: 25, 
                        width: 25, 
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/anhmau.jpg'),
                            fit: BoxFit.cover, //để fit hình ảnh với Container của hình                            )
                          )
                        )
                      )
                    ),

                    //Icon khác
                    GestureDetector(
                      onTap: (){
                        print("Container clicked");
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => OtherPage()),
                        );
                      },
                      child: new Container(
                        height: 25, 
                        width: 25, 
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/anhmau.jpg'),
                            fit: BoxFit.cover, //để fit hình ảnh với Container của hình                            )
                          )
                        )
                      ),
                    )],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Trang chủ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.report),
            label: 'Báo cáo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Giới thiệu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Tài khoản',
          ),
        ],
        currentIndex: 0, // Đặt mặc định mục "Trang chủ" được chọn
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => IssuePage()),
              );
          }
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ReportIssuePage()),
            );
          }
          if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PersonalAccountPage(userData: widget.userData)),
            );
          }
        },
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
      ),
    );
  }
}

//Navigation Bar
class IconContainer extends StatelessWidget {
  final String imageUrl;
  final String label;

  const IconContainer({super.key, required this.imageUrl, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          imageUrl,
          width: 100,
          height: 100,
          errorBuilder: (context, error, stackTrace) {
            return Icon(Icons.image_not_supported,
                size: 100, color: Colors.grey);
          },

        ),
        const SizedBox(height: 5),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}

//Pages that Icons lead to
// Weather Page
class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.activeBlue,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.activeBlue,
        middle: const Text(
          'Dự báo thời tiết',
          style: TextStyle(color: CupertinoColors.black),
        ),

        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          child: const Icon(CupertinoIcons.back, color: CupertinoColors.black),
          onPressed: () => Navigator.pop(context),
        ),

        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: const Icon(CupertinoIcons.add, color: CupertinoColors.black),
          onPressed: () {} //
        ),
      ),
      child: const Center(
        child: Text(
          'Tạm thời để đây đã code cái này sau',
          style: TextStyle(fontSize: 30, color: CupertinoColors.black)
        )
      ),
    );
  }
}

//Dong gop y kien
class OpinionPage extends StatelessWidget {
  const OpinionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.activeBlue,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.activeBlue,
        middle: const Text(
          'Đóng góp ý kiến',
          style: TextStyle(color: CupertinoColors.black),
        ),

        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          child: const Icon(CupertinoIcons.back, color: CupertinoColors.black),
          onPressed: () => Navigator.pop(context),
        ),

        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: const Icon(CupertinoIcons.add, color: CupertinoColors.black),
          onPressed: () {} //
        ),
      ),
      child: const Center(
        child: Text(
          'Tạm thời để đây đã code cái này sau',
          style: TextStyle(fontSize: 30, color: CupertinoColors.black)
        )
      ),
    );
  }
}

//Service Page
//Dong gop y kien
class ServicePage extends StatelessWidget {
  const ServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.activeBlue,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.activeBlue,
        middle: const Text(
          'Dịch vụ công',
          style: TextStyle(color: CupertinoColors.black),
        ),

        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          child: const Icon(CupertinoIcons.back, color: CupertinoColors.black),
          onPressed: () => Navigator.pop(context),
        ),

        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: const Icon(CupertinoIcons.add, color: CupertinoColors.black),
          onPressed: () {} //
        ),
      ),
      child: const Center(
        child: Text(
          'Tạm thời để đây đã code cái này sau',
          style: TextStyle(fontSize: 30, color: CupertinoColors.black)
        )
      ),
    );
  }
}

////Chua biet nx - page :)
class OtherPage extends StatelessWidget {
  const OtherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.activeBlue,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.activeBlue,
        middle: const Text(
          'Khác ...',
          style: TextStyle(color: CupertinoColors.black),
        ),

        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          child: const Icon(CupertinoIcons.back, color: CupertinoColors.black),
          onPressed: () => Navigator.pop(context),
        ),

        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: const Icon(CupertinoIcons.add, color: CupertinoColors.black),
          onPressed: () {} //
        ),
      ),
      child: const Center(
        child: Text(
          'Tạm thời để đây đã code cái này sau',
          style: TextStyle(fontSize: 30, color: CupertinoColors.black)
        )
      ),
    );
  }
}