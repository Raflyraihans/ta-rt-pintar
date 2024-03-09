import 'package:get/get.dart';

import '../modules/Manajemen_Iuran/bindings/manajemen_iuran_binding.dart';
import '../modules/Manajemen_Iuran/views/manajemen_iuran_view.dart';
import '../modules/aduan/bindings/aduan_binding.dart';
import '../modules/aduan/views/aduan_view.dart';
import '../modules/berita/bindings/berita_binding.dart';
import '../modules/berita/views/berita_view.dart';
import '../modules/donation/bindings/donation_binding.dart';
import '../modules/donation/views/detail_donation_view.dart';
import '../modules/donation/views/donation_view.dart';
import '../modules/epolling/bindings/epolling_binding.dart';
import '../modules/epolling/views/epolling_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/iuran/bindings/iuran_binding.dart';
import '../modules/iuran/views/iuran_view.dart';
import '../modules/kontak/bindings/kontak_binding.dart';
import '../modules/kontak/views/kontak_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/lupa_password/bindings/lupa_password_binding.dart';
import '../modules/lupa_password/views/lupa_password_view.dart';
import '../modules/lupa_telepon/bindings/lupa_telepon_binding.dart';
import '../modules/lupa_telepon/views/lupa_telepon_view.dart';
import '../modules/manajemenAduanWarga/bindings/manajemen_aduan_warga_binding.dart';
import '../modules/manajemenAduanWarga/views/manajemen_aduan_warga_view.dart';
import '../modules/manajemenPengumuman/bindings/manajemen_pengumuman_binding.dart';
import '../modules/manajemenPengumuman/views/manajemen_pengumuman_view.dart';
import '../modules/manajemenPersuratan/bindings/manajemen_persuratan_binding.dart';
import '../modules/manajemenPersuratan/views/manajemen_persuratan_view.dart';
import '../modules/pengumuman/bindings/pengumuman_binding.dart';
import '../modules/pengumuman/views/pengumuman_view.dart';
import '../modules/persuratan/bindings/persuratan_binding.dart';
import '../modules/persuratan/views/persuratan_view.dart';
import '../modules/peta/bindings/peta_binding.dart';
import '../modules/peta/views/peta_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/splash_screen/bindings/splash_screen_binding.dart';
import '../modules/splash_screen/views/splash_screen_view.dart';
import '../modules/tab_decider/bindings/tab_decider_binding.dart';
import '../modules/tab_decider/views/tab_decider_view.dart';
import '../modules/verif_kk/bindings/verif_kk_binding.dart';
import '../modules/verif_kk/views/verif_kk_view.dart';
import '../modules/verif_otp/bindings/verif_otp_binding.dart';
import '../modules/verif_otp/views/verif_otp_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.LUPA_PASSWORD,
      page: () => const LupaPasswordView(),
      binding: LupaPasswordBinding(),
    ),
    GetPage(
      name: _Paths.LUPA_TELEPON,
      page: () => const LupaTeleponView(),
      binding: LupaTeleponBinding(),
    ),
    GetPage(
      name: _Paths.VERIF_KK,
      page: () => VerifKkView(),
      binding: VerifKkBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.TAB_DECIDER,
      page: () => TabDeciderView(),
      binding: TabDeciderBinding(),
    ),
    GetPage(
      name: _Paths.EPOLLING,
      page: () => EpollingView(),
      binding: EpollingBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.KONTAK,
      page: () => KontakView(),
      binding: KontakBinding(),
    ),
    GetPage(
      name: _Paths.PERSURATAN,
      page: () => PersuratanView(),
      binding: PersuratanBinding(),
    ),
    GetPage(
      name: _Paths.ADUAN,
      page: () => AduanView(),
      binding: AduanBinding(),
    ),
    GetPage(
      name: _Paths.PENGUMUMAN,
      page: () => PengumumanView(),
      binding: PengumumanBinding(),
    ),
    GetPage(
      name: _Paths.BERITA,
      page: () => const BeritaView(),
      binding: BeritaBinding(),
    ),
    GetPage(
      name: _Paths.PETA,
      page: () => const PetaView(),
      binding: PetaBinding(),
    ),
    GetPage(
      name: _Paths.DONATION,
      page: () => DonationView(),
      binding: DonationBinding(),
    ),
    GetPage(
      name: _Paths.MANAJEMEN_ADUAN_WARGA,
      page: () => const ManajemenAduanWargaView(),
      binding: ManajemenAduanWargaBinding(),
    ),
    GetPage(
      name: _Paths.MANAJEMEN_PERSURATAN,
      page: () => ManajemenPersuratanView(),
      binding: ManajemenPersuratanBinding(),
    ),
    GetPage(
      name: _Paths.MANAJEMEN_PENGUMUMAN,
      page: () => ManajemenPengumumanView(),
      binding: ManajemenPengumumanBinding(),
    ),
    GetPage(
      name: _Paths.MANAJEMEN_IURAN,
      page: () => ManajemenIuranView(),
      binding: ManajemenIuranBinding(),
    ),
    GetPage(
      name: _Paths.IURAN,
      page: () => const IuranView(),
      binding: IuranBinding(),
    ),
  ];
}
