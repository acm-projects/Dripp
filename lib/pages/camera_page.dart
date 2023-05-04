import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:new_app/pages/home_confirm_page.dart';
import 'package:new_app/pages/splash_confirm_page.dart';
import 'dart:async';
import 'dart:io';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';
import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:file_picker/file_picker.dart';
import 'package:new_app/services/storage_service.dart';
import 'package:new_app/pages/splash_page.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage>
    with SingleTickerProviderStateMixin {
  CameraController? _controller;
  Future<void>? _initializeControllerFuture;
  List<CameraDescription>? _availableCameras;
  int _selectedCameraIndex = 0;
  bool _flashOn = false;
  late AnimationController _flipController;
  late Animation<double> _flipAnimation;

  @override
  void initState() {
    super.initState();

    availableCameras().then((cameras) {
      setState(() {
        _availableCameras = cameras;
      });
      _initializeCamera();
    });

    _initializeControllerFuture = Future.value();

    _flipController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _flipAnimation =
        Tween<double>(begin: 0.0, end: 0.5).animate(_flipController);
  }

  void _initializeCamera() {
    if (_availableCameras == null || _availableCameras!.isEmpty) {
      return;
    }
    _controller = CameraController(
      _availableCameras![_selectedCameraIndex],
      ResolutionPreset.ultraHigh,
      imageFormatGroup: ImageFormatGroup.yuv420,
    );

    _initializeControllerFuture = _controller!.initialize().then((_) {
      if (!mounted) {
        return;
      }
      print('Camera initialized successfully');
      setState(() {});
    });

    _controller!.setFlashMode(_flashOn ? FlashMode.torch : FlashMode.off);
  }

  @override
  void dispose() {
    _controller?.dispose();
    _flipController.dispose();
    super.dispose();
  }

  void _toggleCamera() {
    _flipController.forward(from: 0.0).whenComplete(() {
      setState(() {
        _selectedCameraIndex = (_selectedCameraIndex + 1) % 2;
        _initializeCamera();
      });
    });
  }

  void _toggleFlash() {
    setState(() {
      _flashOn = !_flashOn;
      print('Flash mode toggled: $_flashOn');
      _controller!.setFlashMode(_flashOn ? FlashMode.torch : FlashMode.off);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture ?? Future.value(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(
              children: [
                Container(
                  color: Colors.black, // Set your desired background color here
                ),
                Center(
                  child: Transform.translate(
                    offset: const Offset(0, -75),
                    child: ClipRRect(
                      child: AspectRatio(
                        aspectRatio: 9 / 16,
                        child: Container(
                          child: CameraPreview(_controller!),
                        ),
                      ),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: const Offset(0, -20),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: 290,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        color: Color.fromRGBO(69, 0, 103, 0.5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: _toggleFlash,
                            icon: Icon(
                              _flashOn ? Icons.flash_on : Icons.flash_off,
                              color: Colors.white,
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              try {
                                await _initializeControllerFuture;

                                final path = join(
                                  (await getTemporaryDirectory()).path,
                                  '${DateTime.now().millisecondsSinceEpoch}.png',
                                );

                                XFile picture =
                                    await _controller!.takePicture();

                                await picture.saveTo(path);

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        DisplayPicturePage(imagePath: path),
                                  ),
                                );
                              } catch (e) {
                                print(e);
                              }
                            },
                            child: Container(
                              height: 60,
                              width: 60,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: const Icon(
                                Icons.camera_alt,
                                color: Color.fromRGBO(69, 0, 103, 0.5),
                                size: 30,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () => _toggleCamera(),
                            icon: Icon(
                              Icons.flip_camera_ios,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class DisplayPicturePage extends StatefulWidget {
  final String imagePath;

  const DisplayPicturePage({required this.imagePath});

  @override
  _DisplayPicturePageState createState() => _DisplayPicturePageState();
}

class _DisplayPicturePageState extends State<DisplayPicturePage> {
  late final File _imageFile = File(widget.imagePath);
  TextEditingController _captionController = TextEditingController();
  FocusNode _captionFocusNode = FocusNode();

  @override
  void dispose() {
    _captionController.dispose();
    _captionFocusNode.dispose(); // added
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Storage storage = Storage();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
          color: Colors.white,
        ),
        centerTitle: true,
        elevation: 0.0, // set elevation to 0.0
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 69, 0, 103),
              Color.fromARGB(255, 0, 26, 130)
            ],
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 90.0),
            Expanded(
              child: Center(
                child: Container(
                  margin: EdgeInsets.only(top: 20.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.4),
                        blurRadius: 10.0,
                        spreadRadius: 1.0,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(55),
                    child: Image.file(_imageFile),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30.0),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Ready to dropp your dripp?',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10.0),
                      const Text(
                        'Write a caption and share your style!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 30.0),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: TextField(
                          controller: _captionController,
                          decoration: const InputDecoration(
                            hintText: 'Add a caption to your dropp',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 18.0,
                            ),
                            border: InputBorder.none,
                          ),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                          textInputAction: TextInputAction.done, // added
                          focusNode: _captionFocusNode, // added
                          onSubmitted: (_) =>
                              _captionFocusNode.unfocus(), // added
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => SplashPageDone(),
            ),
          );

          final path = widget.imagePath;
          storage.uploadFile(path).then((value) => print('Done'));
        },
        child: Icon(Icons.check),
      ),
    );
  }
}
