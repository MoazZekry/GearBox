import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gearbox3/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:gearbox3/blocs/profile_bloc/profile_bloc.dart';
import 'package:gearbox3/blocs/profile_bloc/profile_event.dart';
import 'package:gearbox3/screens/homescreenbase.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

String downloadUrl = "https://demofree.sirv.com/nope-not-here.jpg";

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  Future<void> _pickImage(BuildContext context) async {
    if (await Permission.photos.request().isGranted) {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        File imageFile = File(pickedFile.path);

        String fileName = FirebaseAuth.instance.currentUser?.uid ?? 'default';
        Reference storageRef =
            FirebaseStorage.instance.ref().child('profile_images/$fileName');
        UploadTask uploadTask = storageRef.putFile(imageFile);

        await uploadTask;
        downloadUrl = await storageRef.getDownloadURL();
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Permission to access gallery is required')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController username = TextEditingController();

    return BlocBuilder<ProfileBloc, AuthenticationState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 25, 25, 25),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  color: const Color.fromARGB(255, 248, 207, 0),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.width / 4.5,
                  child: Center(
                    child: Row(
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomeScreenBase(),
                                ),
                              );
                            },
                            child: const Icon(Icons.arrow_back_ios)),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.3,
                          child: const Center(
                            child: Text(
                              "Setting",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () async {
                          await _pickImage(context);
                        },
                        child: CircleAvatar(
                          radius: 70,
                          backgroundColor:
                              const Color.fromARGB(255, 45, 43, 43),
                          child: CircleAvatar(
                            radius: 65,
                            backgroundColor: Colors.white,
                            backgroundImage: NetworkImage(FirebaseAuth
                                    .instance.currentUser?.photoURL ??
                                "https://demofree.sirv.com/nope-not-here.jpg"),
                            child: const Icon(
                              Icons.edit,
                              size: 50,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 20,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.height / 50,
                          ),
                          const Text(
                            "User Name",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      TextFormField(
                        controller: username,
                        decoration: InputDecoration(
                          hintText:
                              (FirebaseAuth.instance.currentUser?.displayName ??
                                          "User Name") ==
                                      ""
                                  ? "User Name"
                                  : "",
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 16),
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 40,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          context.read<ProfileBloc>().add(UpdateProfile(
                                username.text,
                                downloadUrl,
                              ));
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            minimumSize: const Size.fromHeight(50),
                            backgroundColor:
                                const Color.fromARGB(255, 248, 207, 0)),
                        child: const Text(
                          "Save",
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
