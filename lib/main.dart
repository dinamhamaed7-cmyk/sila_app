import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ZegoUIKit().initLog().then((_) {
    ZegoUIKitPrebuiltCallInvitationService().setNavigatorKey(GlobalKey<NavigatorState>());
  });
  runApp(const SilaApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class SilaApp extends StatelessWidget {
  const SilaApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Cairo', scaffoldBackgroundColor: const Color(0xFF120A28)),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final nameCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('صلة', style: TextStyle(color: Colors.white, fontSize: 48, fontWeight: FontWeight.bold)),
            const Text('تعارف - الحديث - الصداقات', style: TextStyle(color: Color(0xFFFF2E7E))),
            const SizedBox(height: 40),
            TextField(controller: nameCtrl, style: const TextStyle(color: Colors.white), decoration: InputDecoration(hintText: 'اسمك', filled: true, fillColor: Colors.white12, border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)))),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFFF2E7E), minimumSize: const Size(double.infinity, 50)),
              onPressed: () async {
                if (nameCtrl.text.isEmpty) return;
                String userID = DateTime.now().millisecondsSinceEpoch.toString();
                await ZegoUIKitPrebuiltCallInvitationService().init(
                  appID: 713077775,
                  appSign: 'ca98c6bfac4b2dc210918490939179a4e4bfe8297af63c5012953617dd90f24a',
                  userID: userID,
                  userName: nameCtrl.text,
                  plugins: [ZegoUIKitSignalingPlugin()],
                );
                if (mounted) Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage(userName: nameCtrl.text, userID: userID)));
              },
              child: const Text('دخول', style: TextStyle(fontSize: 18)),
            )
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  final String userName, userID;
  const HomePage({super.key, required this.userName, required this.userID});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> rooms = ['غرفة سفيان', 'غرفة دردشة عامة', 'غرفة تعارف'];
  final roomCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF1E123F),
          title: Text('أهلا ${widget.userName}'),
          bottom: const TabBar(tabs: [Tab(text: 'التعارف'), Tab(text: 'الحديث'), Tab(text: 'الغرف')]),
        ),
        body: TabBarView(
          children: [
            _usersList(),
            const Center(child: Text('الرسائل قريبا...', style: TextStyle(color: Colors.white))),
            _roomsList(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xFFFF2E7E),
          onPressed: () {
            showDialog(context: context, builder: (_) => AlertDialog(
              title: const Text('انشاء غرفة جديدة'),
              content: TextField(controller: roomCtrl, decoration: const InputDecoration(hintText: 'اسم الغرفة')),
              actions: [TextButton(onPressed: () { setState(() => rooms.add(roomCtrl.text)); roomCtrl.clear(); Navigator.pop(context); }, child: const Text('انشاء'))],
            ));
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  Widget _usersList() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (c, i) => ListTile(
        leading: const CircleAvatar(backgroundColor: Color(0xFFFF2E7E), child: Icon(Icons.person)),
        title: Text('مستخدم ${i+1}', style: const TextStyle(color: Colors.white)),
        subtitle: const Text('م
