import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_hub_app/datafile/datafile.dart';
import '../models/ac_repair_all_service_data_model.dart';
import '../models/added_card_data_maodel.dart';
import '../models/address_data_model.dart';
import '../models/appliance_categories_data_model.dart';
import '../models/electronics_categories_data_model.dart';
import '../models/plumbing_categories_data_model.dart';
import '../models/beauty_category_data_model.dart';
import '../models/booking_upcoming_data_model.dart';
import '../models/cancel_order_reason_model.dart';
import '../models/categories_model.dart';
import '../models/cleaning_service_model.dart';
import '../models/cleaninng_service_offer_model.dart';
import '../models/notification_data_model.dart';
import '../models/phone_number_data_model.dart';
import '../models/recommended_data_model.dart';
import '../models/service_offer_model.dart';
import '../models/side_menu_data_model.dart';
import '../utils/color_category.dart';

class SplashScreenController extends GetxController {}

class OnBoardingScreenController extends GetxController {
  int currentPage = 0;

  onPageChange(int initialPage) {
    currentPage = initialPage;
    update();
  }
}

class SignInEmptyStateController extends GetxController {
  bool passVisibility = false;

  void setPasswordVisibility() {
    passVisibility = !passVisibility;
    update();
  }
}

class ResetPasswordScreenController extends GetxController {
  bool oldpassVisibility = false;
  bool newpassVisibility = false;
  bool confirmpassVisibility = false;

  void setOldPasswordVisibility() {
    oldpassVisibility = !oldpassVisibility;
    update();
  }

  void setNewPasswordVisibility() {
    newpassVisibility = !newpassVisibility;
    update();
  }

  void setConfirmPasswordVisibility() {
    confirmpassVisibility = !confirmpassVisibility;
    update();
  }
}

class SinUpEmptyStateController extends GetxController {
  bool cheak = false;
  bool passVisibility = false;

  void setCheakPos() {
    cheak = !cheak;
    update();
  }

  void setPasswordVisibility() {
    passVisibility = !passVisibility;
    update();
  }
}

class SignUpProviderEmptyStateController extends GetxController {
  bool cheak = false;
  bool passVisibility = false;

  void setCheakPos() {
    cheak = !cheak;
    update();
  }

  void setPasswordVisibility() {
    passVisibility = !passVisibility;
    update();
  }
}

void setPasswordVisibility() {}

class VerificationScreenController extends GetxController {}

class VerificationProviderScreenController extends GetxController {}

class HomeMainScreenController extends GetxController {
  static GlobalKey<ScaffoldState> drawerKey = GlobalKey(debugLabel: "dsds");

  // static final GlobalKey<FormState> drawerKey = GlobalKey<FormState>();
  // GlobalKey<FormState> drawerKey = GlobalKey<FormState>();
  RxInt position = 0.obs;

  onChange(int value) {
    position.value = value;
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }
}

class ProviderServiceScreenController extends GetxController {
  static GlobalKey<ScaffoldState> drawerKey = GlobalKey(debugLabel: "dsds");

  // static final GlobalKey<FormState> drawerKey = GlobalKey<FormState>();
  // GlobalKey<FormState> drawerKey = GlobalKey<FormState>();
  RxInt position = 0.obs;

  onChange(int value) {
    position.value = value;
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }
}

class HomeScreenController extends GetxController {
  List<CleaningServiceOffer> cleaningOffer = DataFile.getCleaningOfferData();
  List<RecommendedData> recommendedData = DataFile.getRecommendedData();
  List<Offer> offer = DataFile.getofferData();
  List<CleaningService> cleaningService = DataFile.getCleaningService();
  List<Categories> categories = DataFile.getCategories();
}

class CleaningServiceScreenController extends GetxController {
  // List<CleaningService> claningData = DataFile.getCleaningService();
  List<CleaningServiceOffer> claningData = DataFile.getCleaningOfferData();
  bool grid = true;
  bool list = false;

  void setGrid() {
    grid = true;
    list = false;
    update();
  }

  void setList() {
    list = true;
    grid = false;
    update();
  }
}

class BeautyScreenController extends GetxController {
  List<BeautyData> beautyData = DataFile.getBeautyData();
  bool grid = true;
  bool list = false;

  void setGrid() {
    grid = true;
    list = false;
    update();
  }

  void setList() {
    list = true;
    grid = false;
    update();
  }
}

class CategoriesScreenController extends GetxController {}

class ACRepairScreenController extends GetxController {
  List<AllacService> allacservice = DataFile.getAllacService();
  bool grid = true;
  bool list = false;

  void setGrid() {
    grid = true;
    list = false;
    update();
  }

  void setList() {
    list = true;
    grid = false;
    update();
  }
}

class ApplianceRepairScreenController extends GetxController {
  // List of appliance repair services
  List<ApplianceService> allApplianceService = DataFile.getApplianceService();

  // Toggle for grid or list view
  bool grid = true;
  bool list = false;

  // Switch to grid view
  void setGrid() {
    grid = true;
    list = false;
    update(); // Notifies the UI to update
  }

  // Switch to list view
  void setList() {
    list = true;
    grid = false;
    update(); // Notifies the UI to update
  }
}

class ElectronicsRepairScreenController extends GetxController {
  // List of appliance repair services
  List<ElectronicsService> allElectronicsService =
      DataFile.getElectronicsService();

  // Toggle for grid or list view
  bool grid = true;
  bool list = false;

  // Switch to grid view
  void setGrid() {
    grid = true;
    list = false;
    update(); // Notifies the UI to update
  }

  // Switch to list view
  void setList() {
    list = true;
    grid = false;
    update(); // Notifies the UI to update
  }
}

class PlumbingRepairScreenController extends GetxController {
  // List of appliance repair services
  List<PlumbingService> allPlumbingService = DataFile.getPlumbingService();

  // Toggle for grid or list view
  bool grid = true;
  bool list = false;

  // Switch to grid view
  void setGrid() {
    grid = true;
    list = false;
    update(); // Notifies the UI to update
  }

  // Switch to list view
  void setList() {
    list = true;
    grid = false;
    update(); // Notifies the UI to update
  }
}

// class ApplianceCategoriesScreenController extends GetxController{
//   List<AllianceData> allianceData = DataFile.getAllianceData();
//   bool grid = false;
//   void setGrid(bool val) {
//     grid = val;
//     update();
//   }
// }
class BookingScreenController extends GetxController
    with GetTickerProviderStateMixin {
  late TabController tabController;
  late PageController pController;

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    tabController = TabController(length: 2, vsync: this);
    pController = PageController();
    super.onInit();
  }
}

class SideMenuScreenController extends GetxController {
  List<SideMenu> sidemenu = DataFile.getSideMenuData();
  bool currentTheme = false;
  bool notification = true;
  int themeId = 1;
  int selectedID = 1;

  void onSetTheme() {
    currentTheme = !currentTheme;
    update();
    if (themeId == 1) {
      Get.changeThemeMode(ThemeMode.light);
      update();
    } else {
      Get.changeThemeMode(ThemeMode.dark);
      update();
    }
  }

  void setThemeId(int id) {
    themeId = id;
    update();
  }

  void setSelectedId(id) {
    selectedID = id;
    update();
  }
}

class AcRepairServiceDetailScreenController extends GetxController {
  List<ApplianceService> allianceData = DataFile.getApplianceService();
  int selectedPropertyID = 2;
  int units = 0;
  int bedRoom = 0;

  void setSelectProperty(id) {
    selectedPropertyID = id;
    update();
  }

  void addUnits() {
    units++;
    update();
  }

  void removeUnit() {
    if (units > 0) {
      units--;
      update();
    }
  }

  void addBedroom() {
    bedRoom++;
    update();
  }

  void removeBedroom() {
    if (bedRoom > 0) {
      bedRoom--;
      update();
    }
  }
}

class ApplianceServiceDetailScreenController extends GetxController {
  List<ApplianceService> allianceData = DataFile.getApplianceService();
  int selectedPropertyID = 2;
  int units = 0;
  int bedRoom = 0;

  void setSelectProperty(id) {
    selectedPropertyID = id;
    update();
  }

  void addUnits() {
    units++;
    update();
  }

  void removeUnit() {
    if (units > 0) {
      units--;
      update();
    }
  }

  void addBedroom() {
    bedRoom++;
    update();
  }

  void removeBedroom() {
    if (bedRoom > 0) {
      bedRoom--;
      update();
    }
  }
}

class CleaningServiceDetailScreenController extends GetxController {
  int units = 0;
  int bedRoom = 0;

  void addUnits() {
    units++;
    update();
  }

  void removeUnit() {
    if (units > 0) {
      units--;
      update();
    }
  }

  void addBedroom() {
    bedRoom++;
    update();
  }

  void removeBedroom() {
    if (bedRoom > 0) {
      bedRoom--;
      update();
    }
  }
}

class BeautyServiceDetailScreenController extends GetxController {
  int units = 0;
  int bedRoom = 0;

  void addUnits() {
    units++;
    update();
  }

  void removeUnit() {
    if (units > 0) {
      units--;
      update();
    }
  }

  void addBedroom() {
    bedRoom++;
    update();
  }

  void removeBedroom() {
    if (bedRoom > 0) {
      bedRoom--;
      update();
    }
  }
}

class SideMenuProfifileScreenController extends GetxController {
  static void addAddessScreen(bool bool) {}
}

class CalendarScreenController extends GetxController {}

class SideDrawerController extends GetxController {
  List<SideMenu> sidemenu = DataFile.getSideMenuData();
  List<Address> addressData = DataFile.getAddressData();
  bool addAddress = false;
  bool paymentScreen = false;
  int? addressID;

  int? addressIndex = 0;
  int? selectAddressIndex;
  Color? ordericonBg;
  String? addressIcon;
  String? title;
  String? address;
  int? id;

  int? selectedID;

  void addAddessScreen(bool val) {
    addAddress = val;
    update();
  }

  void setAddress(id) {
    addressID = id;
    update();
  }

  void setOrderaddress(color, icon, addresstitle, orderaddress, addid) {
    ordericonBg = color;
    addressIcon = icon;
    title = addresstitle;
    address = orderaddress;
    id = addid;
    update();
  }

  void setAddressIndex(int index) {
    addressIndex = index;
    update();
  }

  void setFinalAddressIndex(int? index) {
    selectAddressIndex = index;
    update();
  }

  void setSelectedId(int? id) {
    selectedID = id;
    update();
  }
}

class SideMenuPaymentMenuScreenController extends GetxController {
  bool showPaymentMethod = false;

  void setPaymentScreen(bool val) {
    showPaymentMethod = val;
    update();
  }
}

class SideMenuNotificationScreenController extends GetxController {
  List<NotificationData> notification = DataFile.getNotificationData();
}

class SideMenuSupportScreenController extends GetxController {}

class BookNowBottomSheetController extends GetxController {
  List time = [
    "12:00  PM",
    "12:30  PM",
    "1:00  PM",
    "1:30  PM",
    "2:00  PM",
    "2:30  PM",
    "3:00  PM",
    "3:30  PM",
    "4:00  PM",
    "4:30  PM"
  ];
  String? selectedtime = '';
  int timeIndex = 0;
  String? currentTime;
  bool calender = false;
  bool timeSelecter = false;

  void setCalenderPosition() {
    calender = !calender;
    timeSelecter = false;
    update();
  }

  void setTimeSelectionPosition() {
    calender = false;
    timeSelecter = !timeSelecter;
    update();
  }

  void setTime(int index) {
    currentTime = time[index];
    timeIndex = index;
    update();
  }
}

class CheakOutScreenController extends GetxController {
  bool cheakOut = false;

  void setChkoutScreenPosition(bool val) {
    cheakOut = val;
    update();
  }
}

class PhoneNumberScreenController extends GetxController {
  List<PhoneNumbers> phone = DataFile.getPhoneNumberData();
  int? id;
  int? selectNumberIndex;

  void setNumber(numberid) {
    id = numberid;
    update();
  }

  void setNumberIndex(int index) {
    selectNumberIndex = index;
    update();
  }
}

//class PromoCodeScreenController extends GetxController {
//  List<PromoCode> promocode = DataFile.getPromocodeData();
// int? promoId;
// int? selectPromoCodeIndex;

// void setPromoCode(id) {
//   promoId = id;
//   update();
// }

// void setPromocodeIndex(int index) {
//   selectPromoCodeIndex = index;
//   update();
// }

// void removePromoCode() {
//   selectPromoCodeIndex = null;
//   update();
// }
//}

class PayMentScreenController extends GetxController {
  List<PaymentCard> card = DataFile.getPaymentCardData();

  int? paymentId;
  int? selectPaymentIndex;

  void setID(int? id) {
    paymentId = id;
    update();
  }

  void setPaymentIndex(int index) {
    selectPaymentIndex = index;
    update();
  }
}

class PlaceOrderScreenController extends GetxController {}

class HistryDetailScreenController extends GetxController {}

class UpcomingPageController extends GetxController {
  List<Booking> bookingData = DataFile.getBookingData();
}

class HistryPageController extends GetxController {
  List<Booking> histryData = DataFile.getBookingData();
}

class DraftPageController extends GetxController {
  List<Booking> draftData = DataFile.getBookingData();
}

class CalcelBookingScreenController extends GetxController {
  List<CancelReason> reason = DataFile.getReasonData();
}

class RewardsPointScreenController extends GetxController {}

class AddCardBottomSheetController extends GetxController {
  bool cheak = false;

  void setCheakButtonPosition() {
    cheak = !cheak;
    update();
  }
}

class ServiceBookBottomSheetController extends GetxController {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  DateTime date = DateTime.now();
  TimeOfDay time = TimeOfDay.now();

  String? provider;
  List<String> providers = [];

  @override
  void onInit() {
    super.onInit();
    fetchProviders(); // Fetch providers on initialization
  }

  Future<void> fetchProviders() async {
    try {
      final snapshot =
          await FirebaseFirestore.instance.collection('providers_info').get();
      if (snapshot.docs.isNotEmpty) {
        providers = snapshot.docs.map((doc) => doc['name'] as String).toList();
      } else {
        print("No providers found.");
      }
      update(); // Update the controller with the fetched providers
    } catch (e) {
      print('Error fetching providers: $e');
    }
  }

  Future<void> selectProvider(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize:
                  MainAxisSize.min, // To make the dialog box fit the content
              children: <Widget>[
                Text(
                  'Select Provider',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                // Empty space where you can add the provider selection logic
                providers.isNotEmpty
                    ? Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: providers.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(providers[index]),
                              onTap: () {
                                setProvider(providers[index]);
                                Navigator.of(context).pop(); // Close the dialog
                              },
                            );
                          },
                        ),
                      )
                    : Text(
                        'No providers available yet.',
                        style: TextStyle(fontSize: 16),
                      ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: () {
                      // setProvider();
                      Navigator.of(context).pop(); // Close the dialog
                    },
                    child: Text('CLOSE'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void setProvider(String selectedProvider) {
    provider = selectedProvider;
    update();
  }

  // DateTime _dateTime = DateTime.now();

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: darkYellow, // <-- SEE HERE
              onPrimary: regularBlack, // <-- SEE HERE
              onSurface: regularBlack, // <-- SEE HERE
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.red, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != date) {
      date = picked;
      setDate(picked);
      update();
    }
  }

  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: time,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: darkYellow, // <-- SEE HERE
              onPrimary: regularBlack, // <-- SEE HERE
              onSurface: regularBlack, // <-- SEE HERE
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.red, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != time) {
      setTime(picked);
      time = picked;
      update();
    }
  }

  void setDate(DateTime date) {
    selectedDate = date;
    update();
  }

  void setTime(TimeOfDay time) {
    selectedTime = time;
    update();
  }
}

class AddNewCardScreenController extends GetxController {
  bool cardsave = false;

  void setCardSaveCheakButton() {
    cardsave = !cardsave;
    update();
  }
}

class RecommendedServiceScreenController extends GetxController {
  List<RecommendedData> recommnded = DataFile.getRecommendedData();
  bool grid = true;
  bool list = false;

  void setGrid() {
    grid = true;
    list = false;
    update();
  }

  void setList() {
    list = true;
    grid = false;
    update();
  }
}

class AuthController extends GetxController {
  // Sign-in function using Firebase Authentication
  Future<int> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      String uid = userCredential.user!.uid;

      // Check if user exists in the 'providers_info' collection
      DocumentSnapshot providerDoc = await FirebaseFirestore.instance
          .collection('providers_info')
          .doc(uid)
          .get();

      if (providerDoc.exists) {
        return 1; // User is a provider
      }

      // If not a provider, check the 'users_info' collection
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users_info')
          .doc(uid)
          .get();

      if (userDoc.exists) {
        return 2; // User is a regular user
      }

      // If neither collection contains the user, show an error
      Get.snackbar('Error', 'User data not found');
      return 0;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar('Error', 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Get.snackbar('Error', 'Wrong password provided.');
      } else {
        Get.snackbar('Error', e.message ?? 'An unknown error occurred.');
      }
      return -1; // Return false on any error
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: $e');
      return -1; // Return false on any exception
    }
  }

  // Fetch user data
  Future<Map<String, dynamic>?> getUserData() async {
    try {
      User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        String uid = currentUser.uid;
        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('users_info')
            .doc(uid)
            .get();

        if (userDoc.exists) {
          return userDoc.data() as Map<String, dynamic>?;
        } else {
          Get.snackbar('Error', 'No user data found for UID: $uid');
          return null;
        }
      } else {
        Get.snackbar('Error', 'No user is currently logged in.');
        return null;
      }
    } catch (e) {
      Get.snackbar('Error', 'Error retrieving user data: $e');
      return null;
    }
  }

  // Fetch provider data
  Future<Map<String, dynamic>?> getProviderData() async {
    try {
      User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        String uid = currentUser.uid;
        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('providers_info')
            .doc(uid)
            .get();

        if (userDoc.exists) {
          return userDoc.data() as Map<String, dynamic>?;
        } else {
          Get.snackbar('Error', 'No provider data found for UID: $uid');
          return null;
        }
      } else {
        Get.snackbar('Error', 'No provider is currently logged in.');
        return null;
      }
    } catch (e) {
      Get.snackbar('Error', 'Error retrieving provider data: $e');
      return null;
    }
  }
}

class MyProfileScreenController extends GetxController {}

class ProviderMyProfileScreenController extends GetxController {}

class EditProfileSCreenController extends GetxController {}

class EditProfileProSCreenController extends GetxController {}

class SettingScreensController extends GetxController {}
