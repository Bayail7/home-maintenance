import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_hub_app/datafile/datafile.dart';
import 'package:service_hub_app/routes/app_routes.dart';
import 'package:service_hub_app/utils/pref_data.dart';
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
import '../models/promocode_data_model.dart';
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
  // Renamed from `cheak` to `isChecked` for clarity
  bool isChecked = false;
  bool passVisibility = false;

  // Method to toggle the state of `isChecked`
  void toggleCheck() {
    isChecked = !isChecked;
    update(); // Notify listeners of the change
  }

  // Method to toggle the visibility of the password
  void togglePasswordVisibility() {
    passVisibility = !passVisibility;
    update(); // Notify listeners of the change
  }

  void setPasswordVisibility() {}
}

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

class SideMenuProfifileScreenController extends GetxController {}

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

class PromoCodeScreenController extends GetxController {
  List<PromoCode> promocode = DataFile.getPromocodeData();
  int? promoId;
  int? selectPromoCodeIndex;

  void setPromoCode(id) {
    promoId = id;
    update();
  }

  void setPromocodeIndex(int index) {
    selectPromoCodeIndex = index;
    update();
  }

  void removePromoCode() {
    selectPromoCodeIndex = null;
    update();
  }
}

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
  // createUser function in Authentication > Users
  Future<void> createUser(String email, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.snackbar('Success', 'User created: ${userCredential.user?.email}');
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error', e.message ?? 'An unknown error occurred.');
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: $e');
    }
  }

  // Sign-in function using Firebase Authentication
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

    // Fetch the user data after successful sign-in
    Map<String, dynamic>? userData = await getUserData();

    if (userData != null) {
      Get.snackbar('Success', 'Signed in as: ${userCredential.user?.email}');
      // Navigate to home page after login
      Get.offAllNamed(Routes.homeMainScreenRoute);
    } else {
      Get.snackbar('Error', 'User data not found');
    }

    PrefData.setIsSignIn(true); // Set sign-in to true only after successful sign-in
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar('Error', 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Get.snackbar('Error', 'Wrong password provided.');
      } else {
        Get.snackbar('Error', e.message ?? 'An unknown error occurred.');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: $e');
    }
  }

  // getUserData function
  Future<Map<String, dynamic>?> getUserData() async {
    try {
      // Get current user from FirebaseAuth
      User? currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser != null) {
        String uid = currentUser.uid; // Get user ID from FirebaseAuth

        // Retrieve the document from Firestore using the UID
        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('users_info')
            .doc(uid)
            .get();

        if (userDoc.exists) {
          Map<String, dynamic> userData =
              userDoc.data() as Map<String, dynamic>;
          print('User Data: $userData');
          return userData; // Return the user data
        } else {
          print('No user data found for UID: $uid');
          return null;
        }
      } else {
        print('No user is currently logged in.');
        return null;
      }
    } catch (e) {
      print('Error retrieving user data: $e');
      return null;
    }
  }
}

class MyProfileScreenController extends GetxController {}

class EditProfileSCreenController extends GetxController {}

class SettingScreensController extends GetxController {}
