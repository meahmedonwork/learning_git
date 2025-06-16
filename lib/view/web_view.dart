import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/web_viewmodel.dart';

class WebView extends StatelessWidget {
  final String fetchUrl;
  const WebView({super.key, required this.fetchUrl});
  @override
  Widget build(BuildContext context) {

    final viewModel = context.watch<WebViewModel>();
    final TextEditingController titleController = TextEditingController();
    final TextEditingController bodyController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Items")),
      body: Column(
        children: [
          Text('This is Feature-2 git Text'),
          TextField(
            controller: titleController,
            decoration: InputDecoration(labelText: 'Title'),
          ),
          TextField(
            controller: bodyController,
            decoration: InputDecoration(labelText: 'Body'),
          ),
          SizedBox(height: 20,),
          ElevatedButton(
            onPressed: () {
              final bodyData = {
                'title': titleController.text,
                'body': bodyController.text,
              };
              viewModel.postData(bodyData);
            },
            child: Text('Send POST Request'),
          ),
          Builder(
            builder: (_) {
              if (viewModel.items.isEmpty) {
                return const Center(child: Text("No items found."));
              }
              return ListView.builder(
                itemCount: viewModel.items.length,
                itemBuilder: (_, index) {
                  final item = viewModel.items[index];
                  return ListTile(
                    title: Text(item.title),
                    subtitle: Text("ID: ${item.id}"),
                  );
                },
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => viewModel.getRequest(fetchUrl as Uri),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}