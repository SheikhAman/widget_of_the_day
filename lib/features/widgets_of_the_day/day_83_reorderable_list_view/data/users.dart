import 'package:faker/faker.dart';
import '../model/user.dart';

final faker = Faker();

final urlImages = [
  'https://images.unsplash.com/photo-1554151228-14d9def656e4',
  'https://images.unsplash.com/photo-1552058544-f2b08422138a',
  'https://images.unsplash.com/photo-1544005313-94ddf0286df2',
  'https://images.unsplash.com/photo-1555952517-2e8e729e0b44',
];

List<User> getUsers() => List.generate(
  urlImages.length,
      (index) => User(
    name: faker.person.name(),
    urlImage: urlImages[index],
  ),
);