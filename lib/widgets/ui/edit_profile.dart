import 'package:flutter/material.dart';

class EditProfile extends StatelessWidget {
  EditProfile({Key? key}) : super(key: key);
  String dropdownValue = 'CH';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Profile",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16, left: 24, right: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 127,
                  width: 127,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black, width: 1),
                  ),
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Stack(
                        children: [
                          Center(
                            child: Container(
                              height: 111,
                              width: 111,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Image.asset('images/empty_profile.png'),
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(6),
                            child: ProfileEditButton(),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Martin Luther",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Helvetica Neue',
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                            ),
                          ),
                          ProfileEditButton(),
                        ],
                      ),
                      const Text(
                        "martin_luther@gmail.com",
                        style: TextStyle(
                            fontFamily: 'Helvetica Neue',
                            fontWeight: FontWeight.w400,
                            fontSize: 16),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 38,
            ),
            const Text(
              "Phone",
              style: TextStyle(
                  fontFamily: 'Helvetica Neue',
                  fontSize: 12.8,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              height: 56,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade200),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 15, left: 14),
                child: Row(
                  children: [
                    DropdownButton<String>(
                      value: dropdownValue,
                      icon: const Icon(Icons.expand_more),
                      elevation: 16,
                      style: const TextStyle(
                        fontFamily: 'Helvetica Neue',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                      underline: Container(
                        height: 0,
                      ),
                      onChanged: (String? newValue) {
                        dropdownValue = newValue!;
                      },
                      items: <String>['CH', 'BN', 'IN', 'IR']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Flexible(
                      child: Padding(
                        padding: EdgeInsets.only(top: 3),
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(right: 5),
                              child: Text(
                                "+41",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            prefixIconConstraints: BoxConstraints(
                              minWidth: 25,
                              minHeight: 25,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            const Text(
              "Your Address",
              style: TextStyle(
                  fontFamily: 'Helvetica Neue',
                  fontSize: 12.8,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              height: 56,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade200),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Padding(
                padding:
                    EdgeInsets.only(left: 14, right: 14, top: 15, bottom: 15),
                child: TextField(
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileEditButton extends StatelessWidget {
  const ProfileEditButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      width: 24,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Color(0x73d9d9d9),
            spreadRadius: 5,
            blurRadius: 10,
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () => {},
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(0.0),
          primary: Colors.white,
          shape: const CircleBorder(),
        ),
        child: Icon(
          Icons.edit,
          color: Colors.blue.shade500,
          size: 12.8,
        ),
      ),
    );
  }
}
