import 'dart:async';


class Validations {

  final validateMessage = StreamTransformer<Map<String, dynamic>,Map<String, dynamic>>.fromHandlers(
    handleData: (data, skin){
      skin.add(data);

    }


  );
  
}