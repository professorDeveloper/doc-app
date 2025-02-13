
import '../../constants/app_images.dart';

class IntroductionContent {
  String image;
  String title;
  String description;

  IntroductionContent(
      {required this.image, required this.title, required this.description});
}

List<IntroductionContent> contents = [
  IntroductionContent(
      title: "Qo’shimcha ish daromadi",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard Lorem Ipsum is simply dummy text of the \nprinting and typesetting industry. Lorem \nIpsum has been the industry's standard",
      image: AppImages.onboarding1),
  IntroductionContent(
      title: "Be’morlarni onlayn qabul\n qilish va davolash",
      description:
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard Lorem Ipsum is simply dummy text of the \nprinting and typesetting industry. Lorem \nIpsum has been the industry's standard",
      image: AppImages.onboarding2),
  IntroductionContent(
      title: "Bemorlarni uylariga borib\ndavolash va qo’shimcha\ndaromad qilish",
      description:
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard Lorem Ipsum is simply dummy text of the \nprinting and typesetting industry. Lorem \nIpsum has been the industry's standard",
      image: AppImages.onboarding3),
  // IntroductionContent(
  //     title: 'Onlayn Ariza topshirish',
  //     description: AppText.onboardText2,
  //     image: AppImages.onBoard2),
  // IntroductionContent(
  //     title: "Retsept tashkilotchisi",
  //     description: AppText.onboardText3,
  //     image: AppImages.onBoard3),
  // IntroductionContent(
  //     title: "24/7 Xizmat ko’rsatish",
  //     description: AppText.onboardText4,
  //     image: AppImages.onBoard4),
];
