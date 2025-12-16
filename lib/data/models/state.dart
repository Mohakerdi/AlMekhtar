import '../../core/constants/images.dart';

enum Location {
  Hasakah(AppImages.kHasakah),
  Raqqa(AppImages.kRaqqa),
  DeirEzZor(AppImages.kDerezzor),
  Aleppo(AppImages.kAleppo),
  Idlib(AppImages.kIdlib),
  Latakia(AppImages.kLatakia),
  Tartous(AppImages.kTartous),
  Hama(AppImages.kHama),
  Homs(AppImages.kHoms),
  Damascus(AppImages.kDamascus),
  RifDimashq(AppImages.kRefDemasheq),
  Daraa(AppImages.kDaraa),
  Quneitra(AppImages.kQonaytera),
  AsSuwayda(AppImages.kSweida);
  const Location(this.imagePath);
  final String imagePath;
}

class StateModel {
  StateModel({required this.name, required this.areas});
  final String name;
  final List<String> areas;

  Location? get locationEnum {
    return _locationStringToEnum(name);
  }

  static Location? _locationStringToEnum(String name) {
    String standardizedName = name.replaceAll(' ', '').replaceAll('-', '').toLowerCase();

    switch (standardizedName) {
      case 'damascus':        return Location.Damascus;
      case 'rifdimashq':        return Location.RifDimashq;
      case 'aleppo':        return Location.Aleppo;
      case 'homs':        return Location.Homs;
      case 'hama':        return Location.Hama;
      case 'latakia':        return Location.Latakia;
      case 'tartous':        return Location.Tartous;
      case 'idlib':        return Location.Idlib;
      case 'deirezzor':        return Location.DeirEzZor;
      case 'raqqa':        return Location.Raqqa;
      case 'hasakah':        return Location.Hasakah;
      case 'daraa':        return Location.Daraa;
      case 'as-suwayda':        return Location.AsSuwayda;
      case 'quneitra':        return Location.Quneitra;
      default:        return null;
    }
  }
}

final List<StateModel> syrianStates = [
  StateModel(
    name: 'Damascus',
    areas: [
      'Old Damascus',
      'Al-Midan',
      'Al-Shaghour',
      'Al-Muhajireen',
      'Abu Rummaneh',
      'Kafr Souseh',
      'Mezzeh',
      'Barzeh',
      'Rukn al-Din',
      'Dummar',
      'Malki',
    ],
  ),
  StateModel(
    name: 'RifDimashq',
    areas: [
      'Douma',
      'Harasta',
      'Darayya',
      'Qudsaya',
      'Jaramana',
      'Saqba',
      'Zamalka',
      'Arbin',
      'Madaya',
      'Al-Tall',
      'Qara',
      'An-Nabek',
      'Yabroud',
      'Zabadani',
    ],
  ),
  StateModel(
    name: 'Aleppo',
    areas: [
      'Aleppo City',
      'Salah Al-Deen',
      'Al-Jamiliyah',
      'Al-Shaar',
      'New Aleppo',
      'Hanano',
      'Midan',
      'Bab Al-Hadid',
      'Azaz',
      'Afrin',
      'Manbij',
      'Al-Bab',
      'Jarabulus',
      'Atarib',
    ],
  ),
  StateModel(
    name: 'Homs',
    areas: [
      'Homs City',
      'Al-Hamidiya',
      'Al-Inshaat',
      'Al-Waer',
      'Karm Al-Zaytoun',
      'Rastan',
      'Talbisah',
      'Qusayr',
      'Palmyra (Tadmor)',
    ],
  ),
  StateModel(
    name: 'Hama',
    areas: [
      'Hama City',
      'Al-Salamiya',
      'Masyaf',
      'Suqaylabiyah',
      'Karnaz',
      'Kafr Zita',
      'Mahardah',
      'Al-Ghab',
    ],
  ),
  StateModel(
    name: 'Latakia',
    areas: [
      'Latakia City',
      'Jableh',
      'Al-Haffah',
      'Qardaha',
      'Ain al-Baida',
      'Kasab',
      'Slinfeh',
    ],
  ),
  StateModel(
    name: 'Tartous',
    areas: [
      'Tartous City',
      'Baniyas',
      'Dreikish',
      'Sheikh Badr',
      'Safita',
      'Al-Hamidiya',
    ],
  ),
  StateModel(
    name: 'Idlib',
    areas: [
      'Idlib City',
      'Saraqib',
      'Maarrat al-Numan',
      'Jisr al-Shughur',
      'Kafr Takharim',
      'Binnish',
      'Ariha',
    ],
  ),
  StateModel(
    name: 'DeirEzZor',
    areas: [
      'Deir ez-Zor City',
      'Al-Mayadin',
      'Al-Bukamal',
      'Al-Kasrah',
      'Hatlah',
      'Al-Shumaytiyah',
    ],
  ),
  StateModel(
    name: 'Raqqa',
    areas: [
      'Raqqa City',
      'Al-Thawrah (Tabqa)',
      'Al-Karama',
      'Al-Sabkha',
      'Mansoura',
    ],
  ),
  StateModel(
    name: 'Hasakah',
    areas: [
      'Hasakah City',
      'Qamishli',
      'Amuda',
      'Rmelan',
      'Al-Malikiyah (Derik)',
      'Al-Shaddadi',
      'Tal Tamr',
    ],
  ),
  StateModel(
    name: 'Daraa',
    areas: [
      'Daraa City',
      'Izra',
      'Busra al-Sham',
      'Jasim',
      'Dael',
      'Nawa',
      'Al-Hirak',
    ],
  ),
  StateModel(
    name: 'AsSuwayda',
    areas: [
      'Suwayda City',
      'Shahba',
      'Salkhad',
      'Qanawat',
      'Al-Mazraa',
    ],
  ),
  StateModel(
    name: 'Quneitra',
    areas: [
      'Quneitra City',
      'Khan Arnabah',
      'Jubata al-Khashab',
      'Bir Ajam',
    ],
  ),
];