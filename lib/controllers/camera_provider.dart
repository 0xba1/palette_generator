import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

/// For controlling camera screen
class CameraProvider extends ChangeNotifier {
  int _cameraIndex = 0;

  int get cameraIndex => _cameraIndex;

  bool _permissionIsGranted = false;

  bool get permissionIsGranted => _permissionIsGranted;

  set permissionIsGranted(bool permissionIsGranted) {
    _permissionIsGranted = permissionIsGranted;
    notifyListeners();
  }

  set cameraIndex(int cameraIndex) {
    _cameraIndex = cameraIndex;
    notifyListeners();
  }

  List<CameraDescription>? _cameras;

  List<CameraDescription>? get cameras => _cameras;

  set cameras(List<CameraDescription>? cameras) {
    _cameras = cameras;
    notifyListeners();
  }

  CameraController? _controller;

  CameraController? get controller => _controller;

  set controller(CameraController? controller) {
    _controller = controller;
    notifyListeners();
  }

  Future<void>? _initializeControllerFuture;

  Future<void>? get initializeControllerFuture => _initializeControllerFuture;

  set initializeControllerFuture(Future<void>? initializeControllerFuture) {
    _initializeControllerFuture = initializeControllerFuture;
    notifyListeners();
  }

  Future<void> toggleCamera() async {
    _cameraIndex = (_cameraIndex + 1) % _cameras!.length;
    _controller =
        CameraController(_cameras![_cameraIndex], ResolutionPreset.medium);
    _initializeControllerFuture = _controller?.initialize();
    notifyListeners();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}
