import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
void main()=>runApp(SilaApp());
class SilaApp extends StatelessWidget{
@override Widget build(BuildContext c){return MaterialApp(debugShowCheckedModeBanner:false,title:'صلة',theme:ThemeData(primaryColor:Color(0xFF6C4DFF),scaffoldBackgroundColor:Colors.white,textTheme:GoogleFonts.cairoTextTheme()),home:SplashScreen());}}
class SplashScreen extends StatefulWidget{@override _SplashScreenState createState()=>_SplashScreenState();}
class _SplashScreenState extends State<SplashScreen>{
@override void initState(){super.initState();Future.delayed(Duration(seconds:2),(){Navigator.pushReplacement(context,MaterialPageRoute(builder:(_)=>LoginScreen()));});}
@override Widget build(BuildContext c){return Scaffold(backgroundColor:Color(0xFF6C4DFF),body:Center(child:Column(mainAxisAlignment:MainAxisAlignment.center,children:[Icon(Icons.favorite,size:80,color:Colors.white),SizedBox(height:20),Text('صلة',style:TextStyle(fontSize:40,color:Colors.white,fontWeight:FontWeight.bold)),Text('تعارف - محادثة - صداقات',style:TextStyle(color:Colors.white70))])));}}
class LoginScreen extends StatelessWidget{
@override Widget build(BuildContext c){return Scaffold(body:Padding(padding:EdgeInsets.all(24),child:Column(mainAxisAlignment:MainAxisAlignment.center,children:[Text('مرحبا بك في صلة',style:TextStyle(fontSize:28,fontWeight:FontWeight.bold)),SizedBox(height:30),TextField(decoration:InputDecoration(labelText:'رقم الهاتف',border:OutlineInputBorder(borderRadius:BorderRadius.circular(12)))),SizedBox(height:15),TextField(obscureText:true,decoration:InputDecoration(labelText:'كلمة المرور',border:OutlineInputBorder(borderRadius:BorderRadius.circular(12)))),SizedBox(height:20),SizedBox(width:double.infinity,height:50,child:ElevatedButton(style:ElevatedButton.styleFrom(backgroundColor:Color(0xFF6C4DFF)),onPressed:(){Navigator.pushReplacement(context,MaterialPageRoute(builder:(_)=>MainHome()));},child:Text('دخول',style:TextStyle(color:Colors.white)))),TextButton(onPressed:(){Navigator.push(context,MaterialPageRoute(builder:(_)=>RegisterScreen()));},child:Text('ليس لديك حساب؟ سجل الآن'))])));}}
class RegisterScreen extends StatelessWidget{
@override Widget build(BuildContext c){return Scaffold(appBar:AppBar(title:Text('إنشاء حساب')),body:Padding(padding:EdgeInsets.all(24),child:Column(children:[TextField(decoration:InputDecoration(labelText:'ال
