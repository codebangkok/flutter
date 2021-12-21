import 'package:africa/bloc/authen_bloc.dart';
import 'package:africa/bloc/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final key = GlobalKey<FormState>();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF00A6E6),
        elevation: 0,
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              alignment: Alignment.topCenter,
              height: MediaQuery.of(context).size.height * 0.3,
              width: double.infinity,
              color: Color(0xFF00A6E6),
              child: Icon(
                Icons.important_devices,
                size: 170,
                color: Colors.white,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              child: buildBody(),
              height: MediaQuery.of(context).size.height * 0.7,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFF3F3F5),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBody() => Form(
        key: key,
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              buildEmailInput(),
              buildPasswordInput(),
              buildLoginButton(),
            ],
          ),
        ),
      );

  Widget buildLoginButton() => Container(
        margin: EdgeInsets.only(top: 30),
        width: MediaQuery.of(context).size.width * 0.7,
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          )),
          child: BlocConsumer<AuthenBloc, MyState>(
            builder: (context, state) => state is StateLoading ? Text('กำลังเข้าสู่ระบบ...') : Text('เข้าสู่ระบบ'),
            listener: (context, state) {
              if (state is AuthenLoginStateSuccess) {
                Navigator.of(context).pushNamed('/browse');
              } else if (state is StateError) {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    content: Text('อีเมลหรือรหัสผ่านไม่ถูกต้อง'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text('ตกลง'),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
          onPressed: () async {
            if (!(key.currentState?.validate() ?? false)) return;

            context.read<AuthenBloc>().add(AuthenLoginEvent(
                  email: emailController.text.trim(),
                  password: passwordController.text,
                ));

            // setState(() => isRequest = true);

            // final response = await http.post(
            //   Uri.parse('https://techcoach.azurewebsites.net/registration/login'),
            //   headers: {'content-type': 'application/json'},
            //   body: jsonEncode({
            //     'email': emailController.text.trim(),
            //     'password': passwordController.text,
            //   }),
            // );

            // setState(() => isRequest = false);

            // if (response.statusCode != 200) {
            // showDialog(
            //   context: context,
            //   builder: (_) => AlertDialog(
            //     content: Text('อีเมลหรือรหัสผ่านไม่ถูกต้อง'),
            //     actions: [
            //       TextButton(
            //         onPressed: () => Navigator.of(context).pop(),
            //         child: Text('ตกลง'),
            //       ),
            //     ],
            //   ),
            // );
            //   return;
            // }

            //final authUser = AuthUser.fromJson(jsonDecode(response.body));
            // Navigator.of(context).pushNamed('/browse');
          },
        ),
      );

  Widget buildPasswordInput() => Container(
        margin: EdgeInsets.only(left: 10, top: 30, right: 10),
        child: TextFormField(
          obscureText: true,
          validator: (value) {
            value ??= '';
            if (value.isEmpty) return 'กรุณากรอกรหัสผ่าน';
          },
          controller: passwordController,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.vpn_key),
            labelText: 'รหัสผ่าน',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color: Colors.grey),
            ),
          ),
        ),
      );

  Widget buildEmailInput() => Container(
        margin: EdgeInsets.only(left: 10, top: 30, right: 10),
        child: TextFormField(
          validator: (value) {
            value ??= '';
            if (value.isEmpty) return 'กรุณากรอกอีเมล';
            //if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) return 'อีเมลไม่ถูกต้อง';
          },
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.person),
            labelText: 'อีเมล',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color: Colors.grey),
            ),
          ),
        ),
      );
}
