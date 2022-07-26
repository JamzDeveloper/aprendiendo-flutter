import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class Plant {
  Future<void> send_image(String pickedFile) async {
    try {
      Dio dio = new Dio();
      print(pickedFile);
      FormData formData = new FormData.fromMap(
          {"image": await MultipartFile.fromFile(pickedFile)});

      await dio
          .post("http://192.168.1.239:4000/api/plant/uploadimage",
              data: formData)
          .then((value) => {
            print(value),

                if (value.toString() == "1")
                  {print("la foto se subio correctamente ")}
              });
    } catch (e) {
      print(e.toString());
    }
  }
}
