import 'dart:io';
import 'dart:ui';

import 'package:app/components/app_theme_widget.dart';
import 'package:app/util/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:crop/crop.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rxdart/rxdart.dart';
import '../../components/visual_display.dart';
import '../../util/util.dart';
import 'package:path_provider/path_provider.dart';

class ImageCropperWidget extends StatefulWidget {
  const ImageCropperWidget({
    super.key,
    this.textImage,
    this.title,
    this.image,
    this.imageUrl,
    this.subTitle,
    this.onPress,
    this.interactive = false,
    required this.onChange,
  });

  final String? textImage;
  final String? title;
  final String? subTitle;
  final File? image;
  final String? imageUrl;
  final Function(File?) onChange;
  final Function()? onPress;
  final bool interactive;

  @override
  State<ImageCropperWidget> createState() => _ImageCropperWidgetState();
}

class _ImageCropperWidgetState extends State<ImageCropperWidget> {
  File? image;
  String? imageUrl;
  late bool hasImage;
  final colors = AppColors();
  final text = AppTheme().text;

  @override
  Widget build(BuildContext context) {
    image = image ?? widget.image;
    imageUrl = widget.imageUrl;
    int textLength = 0;
    hasImage = image != null || imageUrl != null;
    if (widget.textImage != null) {
      if (widget.textImage!.length <= 2) {
        textLength = widget.textImage!.length;
      } else {
        textLength = 2;
      }
    }
    return GestureDetector(
      onTap: widget.onPress ?? _openOptions,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16, vertical: 16
        ),
        decoration: BoxDecoration(
          color: const Color(0xFFF2F4F8),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            if (image != null && (imageUrl == null || imageUrl!.isEmpty)) _image(),
            if (imageUrl != null && imageUrl!.isNotEmpty) _imageUrl(),
            if (!hasImage) Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1000),
                  color: const Color(0xFFE4E7EC),
                ),
                child: Center(
                  child: (widget.textImage != null && widget.textImage!.isNotEmpty) ? SizedBox(
                    height: 30,
                    width: 30,
                    child: Center(
                      child: Text(
                        widget.textImage!.substring(0, textLength).toUpperCase(),
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        )
                      ),
                    ),
                  )
                      : const Icon(Icons.person,
                    color: Colors.white, size: 18,),
                ),
              ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  text(
                    widget.title ?? (hasImage ? 'Editar foto' : 'Carregar foto'),
                    maxLines: 1,
                    textOverflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                  if (widget.subTitle != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: text(
                        widget.subTitle!,
                        maxLines: 1,
                        textOverflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w600,
                        color: Colors.black54,
                        fontSize: 12
                      ),
                    ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: colors.primary,
              size: 18,
            )
          ],
        ),
      ),
    );
  }

  void _openOptions(){
    VisualDisplay.bottomSheet(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            text(
                hasImage ? 'Editar foto' : 'Carregar foto',
                color: colors.text,
                fontSize: 20,
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.start
            ),
            const SizedBox(height: 32),
            _itemCard(Icons.photo, 'Escolher nova foto', (){
              getPhoto(onGallery: true);
              Get.back();
            }),
            const SizedBox(height: 32),
            _itemCard(Icons.photo_camera, 'Tirar nova foto', (){
              getPhoto(onGallery: false);
              Get.back();
            }),
            const SizedBox(height: 32),
            _itemCard(Icons.delete, 'Remover foto', () {
              setState(() {
                image = null;
              });
              widget.onChange(null);
              Get.back();
            }),
            const SizedBox(height: 64),
          ],
        ),
        hasHeight: false,
        dismissible: true,
        onClose: (){}
    );
  }

  Widget _itemCard(IconData icon, String title, Function() onPress){
    return GestureDetector(
      onTap: onPress,
      child: Container(
        color: Colors.transparent,
        width: Get.width,
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(width: 20),
            text(title)
          ],
        ),
      ),
    );
  }

  Widget _imageUrl() {
    return CachedNetworkImage(
      imageUrl: imageUrl!,
      height: 45,
      width: 45,
      fit: BoxFit.cover,
      imageBuilder: (_, img) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(1000),
          child: Image(
            height: 45,
            width: 45,
            fit: BoxFit.cover,
            image: img,
          ),
        );
      },
      placeholder: (context, url) => const SizedBox(
        height: 24,
        width: 24,
        child: CircularProgressIndicator(),
      ),
      errorWidget: (context, url, error) {
        int textLength = 0;
        if (widget.textImage != null) {
          if (widget.textImage!.length <= 2) {
            textLength = widget.textImage!.length;
          } else {
            textLength = 2;
          }
        }
        return Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius:
            BorderRadius.circular(1000),
            color: const Color(0xFFE4E7EC),
          ),
          child: Center(
            child: (widget.textImage != null && widget.textImage!.isNotEmpty)
                ? SizedBox(
              height: 30,
              width: 30,
              child: Center(
                child: Text(
                  widget.textImage!
                      .substring(0, textLength)
                      .toUpperCase(),
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  )
                ),
              ),
            )
                : const Icon(Icons.person, color: Colors.white, size: 18),
          ),
        );
      },
    );
  }

  Widget _image() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(1000),
      child: Image.file(
        image!,
        height: 45,
        width: 45,
        fit: BoxFit.cover,
      ),
    );
  }

  Future<File?> pickImage({required bool onGallery}) async {
    try {
      if (onGallery) {
        final FilePickerResult? result = await FilePicker.platform.pickFiles(
          type: FileType.image,
          withReadStream: true,
        );
        if (result != null) {
          return File(result.paths.first!);
        } else {
          return null;
        }
      } else {
        final file = await ImagePicker().pickImage(source: ImageSource.camera);
        if (file != null) return File(file.path);
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  Future<void> getPhoto({required bool onGallery}) async {
    final File? file = await pickImage(onGallery: onGallery);
    if (file != null) {
      Get.to(() => ImageCrop(
        imageOriginal: file,
        interactive: widget.interactive,
        onCropped: (value) {
          setState(() => image = value);
          widget.onChange(value);
        },
      ));
    }
  }
}

class ImageCropperModel {
  final String name;
  final IconData icon;
  final Function() onPress;

  ImageCropperModel({
    required this.name,
    required this.icon,
    required this.onPress,
  });
}


class ImageCrop extends StatefulWidget {
  const ImageCrop({
    required this.imageOriginal,
    required this.onCropped,
    this.interactive = false,
  });

  final File imageOriginal;
  final Function(File?) onCropped;
  final bool interactive;

  @override
  State<ImageCrop> createState() => _ImageCropState();
}

class _ImageCropState extends State<ImageCrop> {

  BehaviorSubject<bool> isLoadingStream = BehaviorSubject.seeded(false);

  final controller = CropController();
  final colors = AppColors();

  @override
  void dispose() {
    isLoadingStream.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return StreamBuilder<bool>(
      stream: isLoadingStream,
      initialData: false,
      builder: (_, snap) {
        final isLoading = snap.data!;
        return WillPopScope(
          onWillPop: () async {
            if (isLoading) return false;
            return true;
          },
          child: Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              backgroundColor: colors.primary,
              title: const Text('Mover e redimensionar',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Colors.white
                ),
              ),
              leading: IconButton(
                icon: const Icon(
                  Icons.keyboard_arrow_left,
                  color: Colors.white,
                ),
                onPressed:  Navigator.of(context).pop,
              ),
              actions: [
                IconButton(
                  icon: isLoading
                      ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Colors.white),
                      strokeWidth: 2,
                    ),
                  )
                      : const Icon(Icons.check),
                  color: Colors.white,
                  iconSize: 24,
                  onPressed: isLoading
                      ? null
                      : () async {
                    isLoadingStream.add(true);
                    try{
                      final tempDir = await getTemporaryDirectory();
                      final pixelRatio = MediaQuery.of(context).devicePixelRatio;
                      final cropped = await controller.crop(pixelRatio: pixelRatio);
                      if(cropped != null){
                        final data = await cropped.toByteData(format: ImageByteFormat.png);
                        final compressImage = await Util.compressWithBytes(
                          bytes: data!.buffer.asUint8List(),
                          quality: 50,
                        );
                        final file = await File('${tempDir.path}/${DateTime.now().toString()}.png').create();
                        file.writeAsBytesSync(compressImage);
                        widget.onCropped(file);
                        isLoadingStream.add(false);
                        Get.back();
                      }
                    }catch(e){
                      widget.onCropped(null);
                      isLoadingStream.add(false);
                      Get.back();
                    }
                  },
                )
              ],
            ),
            body: SizedBox(
              height: size.height,
              width: size.width,
              child: Stack(
                children: [
                  Image.file(
                    widget.imageOriginal,
                    width: size.width,
                    height: size.height,
                    fit: BoxFit.cover,
                    scale: 0.5,
                  ),
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                    child: ColoredBox(
                      color: Colors.black.withOpacity(0.9),
                    ),
                  ),
                  Crop(
                    controller: controller,
                    shape: BoxShape.circle,
                    backgroundColor: Colors.transparent,

                    child: Image.file(
                      widget.imageOriginal,
                      width: size.width,
                      height: size.height,
                      fit: BoxFit.contain,
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
}
