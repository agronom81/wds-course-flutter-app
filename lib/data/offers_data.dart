import 'package:wds_first_app/models/offers.dart';

List<Offer> offers = [
  Offer(
    id: 1,
    imageUrl: 'https://picsum.photos/100?image=292',
    images: [
      'https://picsum.photos/420/370?image=292',
      'https://picsum.photos/420/370?image=429',
      'https://picsum.photos/420/370?image=627',
    ],
    price: 4.99,
    qty: '7pcs, Price',
    title: 'Organic Bananas',
    description: [
      OfferDescription(
          title: 'Product detail',
          description:
              'Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.'),
      OfferDescription(
          weight: '100gr',
          title: 'Nutritions',
          description:
              'Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.'),
    ],
  ),
  Offer(
    id: 2,
    imageUrl: 'https://picsum.photos/100?image=429',
    images: [
      'https://picsum.photos/420/370?image=429',
      'https://picsum.photos/420/370?image=292',
      'https://picsum.photos/420/370?image=627',
    ],
    price: 3.99,
    qty: '1kg, Price',
    title: 'Red Apple',
    description: [
      OfferDescription(
          title: 'Product detail',
          description:
              'Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.'),
      OfferDescription(
          weight: '100gr',
          title: 'Nutritions',
          description:
              'Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.'),
    ],
  ),
  Offer(
    id: 3,
    imageUrl: 'https://picsum.photos/100?image=627',
    images: [
      'https://picsum.photos/420/370?image=627',
      'https://picsum.photos/420/370?image=292',
      'https://picsum.photos/420/370?image=429',
    ],
    price: 5.99,
    qty: '1 kg, Price',
    title: 'Strawberry',
    description: [
      OfferDescription(
          title: 'Product detail',
          description:
              'Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.'),
      OfferDescription(
          weight: '100gr',
          title: 'Nutritions',
          description:
              'Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.'),
    ],
  ),
];
