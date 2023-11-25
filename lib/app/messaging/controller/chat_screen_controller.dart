import 'package:get/get.dart';
import 'package:note_app/models/options_list_model.dart';
import 'package:note_app/utils/constants.dart';
import 'package:note_app/widgets/bottom_options.dart';

class ChatScreenController extends GetxController {
  List<OptionsListModel> optionsList = <OptionsListModel>[
    OptionsListModel(
        image: AssetRef.cameraIcon,
        title: 'Camera',
        subtitle: 'Share yourself'),
    OptionsListModel(
        image: AssetRef.docsIcon,
        title: 'Documents',
        subtitle: 'Share your files'),
    OptionsListModel(
        image: AssetRef.pollIcon,
        title: 'Create a poll',
        subtitle: 'Create a poll for any querry'),
    OptionsListModel(
        image: AssetRef.picsIcon,
        title: 'Media',
        subtitle: 'Share photos and videos'),
    OptionsListModel(
        image: AssetRef.contactIcon,
        title: 'Contact',
        subtitle: 'Share your contacts'),
    OptionsListModel(
        image: AssetRef.locationIcon,
        title: 'Location',
        subtitle: 'Share your location'),
  ];

  showBottomList() {
    Get.bottomSheet(const BottomOptions());
  }
}
