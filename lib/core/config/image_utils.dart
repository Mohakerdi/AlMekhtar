import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

class ImageUtils {
  static Future<XFile?> compressImage(
    XFile original, {
    int quality = 75,
    int maxWidth = 1200,
    int maxHeight = 1200,
    CompressFormat format = CompressFormat.jpeg,
  }) async {
    try {
      final originalPath = original.path;
      final ext = p.extension(originalPath).toLowerCase();
      final isHeic = ext == '.heic' || ext == '.heif';
      final outExt = isHeic
          ? '.jpg'
          : (format == CompressFormat.webp ? '.webp' : '.jpg');

      final tempDir = await getTemporaryDirectory();
      final targetPath = p.join(
        tempDir.path,
        'compressed_${DateTime.now().millisecondsSinceEpoch}$outExt',
      );

      final XFile? compressed = await FlutterImageCompress.compressAndGetFile(
        originalPath,
        targetPath,
        quality: quality,
        minWidth: maxWidth,
        minHeight: maxHeight,
        rotate: 0,
        format: format,
        numberOfRetries: 5,
        autoCorrectionAngle: true,
      );

      return compressed;
    } catch (e, stack) {
      return original;
    }
  }
}
