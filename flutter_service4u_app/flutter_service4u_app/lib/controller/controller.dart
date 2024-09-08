import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_hub_app/datafile/datafile.dart';
import '../models/ac_repair_all_service_data_model.dart';
import '../models/added_card_data_maodel.dart';
import '../models/address_data_model.dart';
import '../models/appliance_categories_data_model.dart';
import '../models/beauty_category_data_model.dart';
import '../models/booking_upcoming_data_model.dart';
import '../models/cancel_order_reason_model.dart';
import '../models/categories_model.dart';
import '../models/cleaning_service_model.dart';
import '../models/cleaninng_service_offer_model.dart';
import '../models/notification_data_model.dart';
import '../models/offer_data_model.dart';
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

class VerificationScreenController extends GetxController {}

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
    tabController = TabController(length: 3, vsync: this);
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
  List<AllianceData> allianceData = DataFile.getAllianceData();
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

class SideMenuOfferScreenController extends GetxController {
  List<OfferData> offerData = DataFile.getOfferData();
  int? likeid;
  bool grid = false;

  void setGrid(bool val) {
    grid = val;
    update();
  }

  void setLike(int index) {
    if (offerData[index].like == false) {
      offerData[index].like = true;
      update();
    } else {
      offerData[index].like = false;
      update();
    }
  }
}

class SideMenuRaferFriendScreenController extends GetxController {}

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

class MyProfileScreenController extends GetxController {}

class EditProfileSCreenController extends GetxController {}

class SettingScreensController extends GetxController {}
