import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/user_cubit.dart';
import '../cubit/user_state.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        return Directionality(
          textDirection: TextDirection.ltr,
          child: Scaffold(
            backgroundColor: Colors.black,
            body: SafeArea(
              child: Column(
                children: [
                  _buildHeader(context),
                  _buildUserInfoCard(context, "Name", state.name, "name"),
                  _buildUserInfoCard(context, "Email", state.email, "email"),
                  _buildUserInfoCard(context, "Birth of date", state.birthDate, "birthDate"),
                  _buildUserInfoCard(context, "Phone Number", state.phone, "phone"),
                  _buildUserInfoCard(context, "Address", state.address, "address"),
                  _buildUserInfoCard(context, "Password", state.password, "password"),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFFDD00),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      onPressed: () {
                        // Handle Submit
                      },
                      child: const Text(
                        "Submit",
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context), // GoRouter pop
          ),
          const Text(
            "Personal Information",
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildUserInfoCard(BuildContext context, String title, String value, String field) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(value),
        trailing: IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () {
            _showEditDialog(context, field, value);
          },
        ),
      ),
    );
  }

  void _showEditDialog(BuildContext context, String field, String currentValue) {
    final TextEditingController controller = TextEditingController(text: currentValue);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Edit Information"),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(border: OutlineInputBorder()),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<UserCubit>().updateUserInfo(field, controller.text);
                Navigator.pop(context);
              },
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }
}
