import 'package:flutter/material.dart';

class FeedBack extends StatefulWidget {
  @override
  _FeedBackState createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  int? selectedRadio;

  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
  }

  setSelectedRadio(int? val) {
    setState(() {
      selectedRadio = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('FeedBack Card'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: TextButton(
              onPressed: () {
                giveFeedbackDialog(context, screenHeight, screenWidth);
              },
              child: Chip(
                avatar: CircleAvatar(
                  backgroundColor: Colors.grey.shade800,
                  child: Text('GF'),
                ),
                label: Text("Give Feedback"),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              searchFilterDialog(context);
            },
            child: Chip(
              avatar: CircleAvatar(
                backgroundColor: Colors.grey.shade800,
                child: Text('SF'),
              ),
              label: Text("Search Filter"),
            ),
          ),
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  String contentText = "Content of Dialog";
                  return StatefulBuilder(
                    builder: (context, setState) {
                      return AlertDialog(
                        title: Text("Title of Dialog"),
                        content: Text(contentText),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text("Cancel"),
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                contentText = "Changed Content of Dialog";
                              });
                            },
                            child: Text("Change"),
                          ),
                        ],
                      );
                    },
                  );
                },
              );
            },
            child: Chip(
              avatar: CircleAvatar(
                backgroundColor: Colors.grey.shade800,
                child: Text('SB'),
              ),
              label: Text('Stateful Builder'),
            ),
          ),
        ],
      ),
    );
  }

  Future searchFilterDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          List categories = ['category1', 'category2', 'category3'];
          String selectedValue = categories.first;
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              title: Text('Search Filter'),
              content: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        border: Border.all(
                          width: 2,
                          color: Colors.teal.withOpacity(0.3),
                        ),
                      ),
                      child: ExpansionTile(
                        collapsedBackgroundColor: Color(0xFFF1EFFC),
                        title: Text(
                          "Categories",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        children: categories.map((e) {
                          return ListTile(
                            onTap: () {
                              print(e);
                            },
                            title: Text(e),
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        border: Border.all(
                          width: 2,
                          color: Colors.teal.withOpacity(0.3),
                        ),
                      ),
                      child: ExpansionTile(
                        collapsedBackgroundColor: Color(0xFFF1EFFC),
                        title: Text(
                          "Radio Categories",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        children: categories.map((e) {
                          return RadioListTile<String>(
                            value: e,
                            groupValue: selectedValue,
                            activeColor: Colors.blue,
                            title: Text(e),
                            onChanged: (vlaue) => setState(
                              () => selectedValue = e,
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(height: 10),
                    ExpansionPanelList.radio(
                      children: [
                        ExpansionPanelRadio(
                          value: "Expansion Panel",
                          headerBuilder: (context, istrue) {
                            return ListTile(
                              title: Text("Expansion Panel"),
                            );
                          },
                          body: Column(
                            children: categories.map((e) {
                              return ListTile(
                                title: Text(e),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Apply"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancle"),
                ),
              ],
            );
          });
        });
  }

  Future giveFeedbackDialog(
      BuildContext context, double screenHeight, double screenWidth) {
    return showDialog(
      context: context,
      builder: (context) {
        bool emoji1 = true;
        bool emoji2 = false;
        bool emoji3 = false;
        bool emoji4 = false;
        List values = <String>['Yes', 'No'];
        String selectedValue = values.first;

        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              contentPadding: EdgeInsets.all(15),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Text(
                      "Give Feedback",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "What do you think of editing tool?",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              emoji1 = true;
                              emoji2 = false;
                              emoji3 = false;
                              emoji4 = false;
                            });
                          },
                          icon: (emoji1)
                              ? Image.asset(
                                  "assets/emoji1A.png",
                                  width: screenWidth * 0.1,
                                )
                              : Image.asset(
                                  "assets/emoji1UA.png",
                                  width: screenWidth * 0.1,
                                ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              emoji1 = false;
                              emoji2 = true;
                              emoji3 = false;
                              emoji4 = false;
                            });
                          },
                          icon: (emoji2)
                              ? Image.asset(
                                  "assets/emoji2A.png",
                                  width: screenWidth * 0.1,
                                )
                              : Image.asset(
                                  "assets/emoji2UA.png",
                                  width: screenWidth * 0.1,
                                ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              emoji1 = false;
                              emoji2 = false;
                              emoji3 = true;
                              emoji4 = false;
                            });
                          },
                          icon: (emoji3)
                              ? Image.asset(
                                  "assets/emoji3A.png",
                                  width: screenWidth * 0.1,
                                )
                              : Image.asset(
                                  "assets/emoji3UA.png",
                                  width: screenWidth * 0.1,
                                ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              emoji1 = false;
                              emoji2 = false;
                              emoji3 = false;
                              emoji4 = true;
                            });
                          },
                          icon: (emoji4)
                              ? Image.asset(
                                  "assets/emoji4A.png",
                                  width: screenWidth * 0.1,
                                )
                              : Image.asset(
                                  "assets/emoji4UA.png",
                                  width: screenWidth * 0.1,
                                ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Text(
                      "Do you have any thoughts you\'d like to share?",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    TextField(
                      maxLines: 5,
                      decoration: InputDecoration(
                        hintText: "Write your thoughts...",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Text(
                      "May we follow you up on your feedback?",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                        children: values.map((value) {
                      return Expanded(
                        child: RadioListTile<String>(
                          value: value,
                          groupValue: selectedValue,
                          activeColor: Colors.blue,
                          title: Text(value),
                          onChanged: (vlaue) => setState(
                            () => selectedValue = value,
                          ),
                        ),
                      );
                    }).toList()),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text("Send"),
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.05),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Cancle"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
