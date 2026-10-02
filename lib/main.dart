import 'package:flutter/material.dart';

import 'Lienhe.dart';
import 'Noidung.dart';
import 'TrangChu.dart';

const Color kTaupe = Color(0xFF7A706C);
const Color kOrangeAccent = Color(0xFFFE8A01);
const Color kSoftGray = Color(0xFFBBC2C4);
const Color kTealAccent = Color(0xFF00DFE5);
const Color kSoftWhite = Color(0xFFF1F3F3);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ứng dụng KTGK',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: kSoftWhite,
        colorScheme: const ColorScheme.light(
          primary: kTaupe,
          onPrimary: Colors.white,
          secondary: kTealAccent,
          onSecondary: kTaupe,
          tertiary: kOrangeAccent,
          onTertiary: Colors.white,
          surface: Colors.white,
          onSurface: kTaupe,
          surfaceContainerHighest: kSoftGray,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: kSoftWhite,
          foregroundColor: kTaupe,
          centerTitle: true,
          elevation: 0,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: kTealAccent,
          unselectedItemColor: kTaupe,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
          selectedIconTheme: IconThemeData(size: 26),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: kOrangeAccent,
          foregroundColor: Colors.white,
        ),
        dialogTheme: const DialogThemeData(
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(
            color: kTaupe,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
          contentTextStyle: TextStyle(color: kTaupe, fontSize: 16),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: kTealAccent),
        ),
      ),
      home: const MainNavigationScreen(),
    );
  }
}

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [TrangChu(), Noidung(), Lienhe()];

  final List<String> _titles = const ['Trang chủ', 'Nội dung', 'Liên hệ'];

  void _showStudentInfo() {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Thông tin sinh viên'),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Họ và tên: Nguyễn Vũ Trường Sơn'),
              SizedBox(height: 8),
              Text('Mã SV: 24100468'),
              SizedBox(height: 8),
              Text('Tuổi: 20'),
              SizedBox(height: 8),
              Text('Nơi ở hiện tại: Hà Nội'),
              SizedBox(height: 8),
              Text('Quê quán: Ninh Bình'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Đóng'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_titles[_currentIndex])),
      body: IndexedStack(index: _currentIndex, children: _pages),
      floatingActionButton: _currentIndex == 2
          ? FloatingActionButton(
              onPressed: _showStudentInfo,
              child: const Icon(Icons.add),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Trang chủ'),
          BottomNavigationBarItem(icon: Icon(Icons.article), label: 'Nội dung'),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_mail),
            label: 'Liên hệ',
          ),
        ],
      ),
    );
  }
}
