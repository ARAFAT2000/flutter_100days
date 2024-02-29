import 'package:flutter/material.dart';
import 'package:flutter_media_downloader/flutter_media_downloader.dart';


class MediaDownloader extends StatelessWidget {
  const MediaDownloader({super.key});

  @override
  Widget build(BuildContext context) {
    final _flutterMediaDownloaderPlugin = MediaDownload();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(' DownLoader '),
      ),
      
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(onPressed: ()async{
              _flutterMediaDownloaderPlugin.downloadMedia(context,'https://www.kasandbox.org/programming-images/avatars/spunky-sam-green.png');
            },
                child: Text('Download ')),
          )
        ],
      ),
      
    );
  }
}
