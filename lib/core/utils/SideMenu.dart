import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p_boursa/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:p_boursa/features/auth/presentation/pages/AboutUs.dart';
//import 'package:http/http.dart' as http;

class SideMenu extends StatelessWidget {
  const SideMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Drawer(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                color: const Color(0xFF003B85),
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        margin: const EdgeInsets.only(
                          top: 30,
                          bottom: 10,
                        ),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(
                                'https://cdn.pixabay.com/photo/2024/02/29/11/50/ai-generated-8604086_640.jpg'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Text(
                        state.model?.user?.lastName ?? 'Default',
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        state.model?.user?.email ?? 'yamama2001@gmail.com',
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 25.0,
              ),
              ListTile(
                leading: const Icon(
                  Icons.home,
                  color: Color(0xFF003B85),
                ),
                title: const Text('Home'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.account_circle,
                  color: Color(0xFF003B85),
                ),
                title: const Text('Profile'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.contacts,
                  color: Color(0xFF003B85),
                ),
                title: const Text('Contacts'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.live_help_outlined,
                  color: Color(0xFF003B85),
                ),
                title: const Text('About Us'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const About_Us(),
                      ));
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.settings,
                  color: Color(0xFF003B85),
                ),
                title: const Text('Settings'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.exit_to_app,
                  color: Color(0xFF003B85),
                ),
                title: const Text('LogOut'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              const Divider(
                color: Color(0xFF003B85),
                thickness: 2,
                indent: 15,
                endIndent: 15,
                height: 50,
              ),
              const SizedBox(
                height: 20.0,
              ),
            ],
          ),
        );
      },
    );
  }
}

/*child: ListView(
         padding: EdgeInsets.zero,
         children: [
           UserAccountsDrawerHeader(
               accountName: const Text(
                   'Yamama',
                   style: TextStyle(
                     color: Colors.black,
                   ),
               ),
               accountEmail:  const Text(
                   'yamama.hamora@gmail.com',
                 style: TextStyle(
                   color: Colors.black
                 ),
               ),
              /* currentAccountPicture: CircleAvatar(
                 child: ClipOval(
                   child: Image.network(
                       'https://cdn.pixabay.com/photo/2024/02/29/11/50/ai-generated-8604086_640.jpg',
                        width:90,
                        height:90,
                   ),
                 ),
               ),*/
            decoration: const BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                    'https://cdn.pixabay.com/photo/2017/05/31/03/04/dna-2358911_640.jpg',
                ),
              ),
            ),
          ),*/
/* ListTile(
             leading: Icon(Icons.home),
             title: Text('Home'),
             onTap: () {
               Navigator.pop(context);
             },
           ),
           ListTile(
             leading: Icon(Icons.account_circle),
             title: Text('Profile'),
             onTap: () {
               Navigator.pop(context);
             },
           ),
           ListTile(
             leading: Icon(Icons.contacts),
             title: Text('Contacts'),
             onTap: () {
               Navigator.pop(context);
             },
           ),
         ],
       ),*/