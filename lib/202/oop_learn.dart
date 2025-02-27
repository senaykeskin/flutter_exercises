import 'dart:io';

import 'package:flutter_exercises/202/custom_exception.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class IFileDownload {
  bool? downloadItem(FileItem? fileItem);

  void toShare(String path) async {
    if (!await launchUrl(Uri.parse(path))) {}
  }
}

class FileDownload extends IFileDownload {
  @override
  bool? downloadItem(FileItem? fileItem) {
    if (fileItem == null) {
      throw FileDownloadException();
    }
    print("a");

    return true;
  }

  void smsShare() {}
}

class SMSDownload implements IFileDownload {
  @override
  bool? downloadItem(FileItem? fileItem) {
    if (fileItem == null) throw FileDownloadException();

    print('a');

    return true;
  }

  @override
  Future<void> toShare(String path) async {
    if (!await launchUrl(Uri.parse(path))) {}
  }
}

class FileItem {
  final String name;
  final File file;

  FileItem(this.name, this.file);
}

class SenayDownload extends IFileDownload with ShareMixin {
  @override
  bool? downloadItem(FileItem? fileItem) {
    // TODO: implement downloadItem
    throw UnimplementedError();
  }

}

mixin ShareMixin on IFileDownload {
  void toShowFile() {}
}
