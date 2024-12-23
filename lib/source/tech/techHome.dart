import 'package:flutter/material.dart';
import 'package:pbl3/source/tech/fixIssue.dart';

class TechHomePage extends StatefulWidget {
  const TechHomePage({super.key});

  @override
  _TechHomePageState createState() => _TechHomePageState();
}

class _TechHomePageState extends State<TechHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trang chủ kỹ thuật viên'),
        backgroundColor: Colors.green, // Màu nền cho AppBar (có thể thay đổi)
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildCard(
                    context,
                    icon: Icons.report_problem,
                    title: 'Danh sách Sự cố',
                    description:
                        'Danh sách sự cố giao thông cần xử lý.',
                    pageBuilder: (context) => IssueListPage(), // Trang danh sách sự cố
                  ),
                  SizedBox(height: 16),
                  _buildCard(
                    context,
                    icon: Icons.assignment_turned_in,
                    title: 'Xử lý Sự cố',
                    description: 'Xử lý sự cố giao thông.',
                    pageBuilder: (context) => EquipmentListPage(), // Trang xử lý ...
                  ),
                ],
              ))
          ],
        ),
      ),
    );
  }
}

Widget _buildCard(BuildContext context, 
  {required IconData icon,
  required String title,
  required String description,
  required Widget Function(BuildContext) pageBuilder,}) {
  return Card(
    child: ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(description),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: pageBuilder),
        );
      },
    ),
  );

Widget _buildCard(BuildContext context,
      {required IconData icon,
      required String title,
      required String description,
      required WidgetBuilder pageBuilder}) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue,
          child: Icon(icon, color: Colors.white),
        ),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: (){
          Navigator.push(
              context,
              MaterialPageRoute(builder: pageBuilder),
            );
        }
        
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


