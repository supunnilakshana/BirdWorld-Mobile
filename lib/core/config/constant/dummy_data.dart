import 'package:birdworld/core/models/product.dart';
import 'package:flutter/material.dart';

import '../../models/app_user.dart';
import '../../models/post.dart';
import '../../models/post_comment.dart';
import '../../models/post_like.dart';
import 'images.dart';

List<Product> products = [
  Product(
      name: 'Air Max Sequent 4 Shield',
      brand: 'nike',
      description:
          'The Air Jordan 1 Mid shoe is inspired by the first AJ1, offering fans of Jordan retros a chance to follow in the footsteps of the greatness.',
      price: 115,
      rating: 5,
      productColors: [
        Colors.grey.shade600,
        Colors.purple.shade400,
        Colors.pink.shade300,
        Colors.blue.shade400
      ],
      productImages: [
        Images.sh1,
        Images.sh2,
        Images.sh3,
        Images.sh4,
        Images.sh6,
      ]),
  Product(
      name: 'Nike High Run Pro',
      brand: 'nike',
      description:
          'The Air Jordan 1 Mid shoe is inspired by the first AJ1, offering fans of Jordan retros a chance to follow in the footsteps of the greatness.',
      price: 235,
      rating: 5,
      productColors: [
        Colors.blue.shade200,
        Colors.teal.shade400,
        Colors.purple.shade400,
        Colors.blue.shade400
      ],
      productImages: [
        Images.sh2,
        Images.sh1,
        Images.sh3,
        Images.sh4,
        Images.sh6,
      ]),
  Product(
      name: 'Random Color Shoe',
      brand: 'adidas',
      description:
          'The Air Jordan 1 Mid shoe is inspired by the first AJ1, offering fans of Jordan retros a chance to follow in the footsteps of the greatness.',
      price: 80,
      rating: 4,
      productColors: [
        Colors.orange.shade300,
        Colors.teal.shade400,
        Colors.purple.shade400,
        Colors.blue.shade400
      ],
      productImages: [
        Images.sh3,
        Images.sh2,
        Images.sh1,
        Images.sh4,
        Images.sh6,
      ]),
  Product(
      name: 'Air Max 270 Ultramarine',
      brand: 'nike',
      description:
          'The Air Jordan 1 Mid shoe is inspired by the first AJ1, offering fans of Jordan retros a chance to follow in the footsteps of the greatness.',
      price: 80,
      rating: 4,
      productColors: [
        Colors.grey.shade600,
        Colors.teal.shade400,
        Colors.purple.shade400,
        Colors.blue.shade400
      ],
      productImages: [
        Images.sh7,
        Images.sh6,
        Images.sh1,
        Images.sh4,
        Images.sh3,
      ]),
  Product(
      name: 'Runner Pro High Sole',
      brand: 'adidas',
      description:
          'The Air Jordan 1 Mid shoe is inspired by the first AJ1, offering fans of Jordan retros a chance to follow in the footsteps of the greatness.',
      price: 80,
      rating: 4,
      productColors: [
        Colors.amber.shade600,
        Colors.teal.shade400,
        Colors.purple.shade400,
        Colors.blue.shade400
      ],
      productImages: [
        Images.sh6,
        Images.sh4,
        Images.sh1,
        Images.sh7,
        Images.sh3,
      ]),
];

AppUser user1 = AppUser(
  id: "user_id",
  firstName: "John",
  lastName: "Doe",
  email: "john.doe@example.com",
  role: "GUser",
);
AppUser user2 = AppUser(
  id: "user_id",
  firstName: "Saman",
  lastName: "Silva",
  email: "john.doe@example.com",
  role: "GUser",
);
AppUser user3 = AppUser(
  id: "user_id",
  firstName: "Mareen",
  lastName: "Perera",
  email: "john.doe@example.com",
  role: "GUser",
);

// Example posts
List<Post> postslistd = [
  Post(
    id: 1,
    title: "Beautiful Parrot",
    description: "Look at this amazing parrot!",
    imageUrl:
        "https://www.thefactsite.com/wp-content/uploads/2018/07/facts-about-parrots.webp",
    created: DateTime.now(),
    updated: DateTime.now(),
    user: user1,
    comments: [
      PostComment(
        id: 101,
        context: "Wow! This parrot is stunning.",
        created: DateTime.now(),
        updated: DateTime.now(),
        postID: 1,
        userId: "commenter_id_1",
        user: user3,
      ),
      PostComment(
        id: 102,
        context: "I've never seen such vibrant colors!",
        created: DateTime.now(),
        updated: DateTime.now(),
        postID: 1,
        userId: "commenter_id_2",
        user: user2,
      ),
    ],
    likes: [
      PostLike(
        id: 201,
        created: DateTime.now(),
        updated: DateTime.now(),
        postID: 1,
        userId: "liker_id_1",
        user: user3,
      ),
      PostLike(
        id: 202,
        created: DateTime.now(),
        updated: DateTime.now(),
        postID: 1,
        userId: "liker_id_2",
        user: user1,
      ),
    ],
  ),
  Post(
    id: 2,
    title: "Eagle in Flight",
    description: "Witness the majesty of an eagle in flight!",
    imageUrl:
        "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/95f52b0b-7803-4145-a11a-26368199ccde/d6wjhtt-d8ef7462-9a4d-4b9e-a6d3-8a57bd7ded84.jpg/v1/fill/w_1024,h_683,q_75,strp/bald_egale_by_korriedawnphoto_d6wjhtt-fullview.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9NjgzIiwicGF0aCI6IlwvZlwvOTVmNTJiMGItNzgwMy00MTQ1LWExMWEtMjYzNjgxOTljY2RlXC9kNndqaHR0LWQ4ZWY3NDYyLTlhNGQtNGI5ZS1hNmQzLThhNTdiZDdkZWQ4NC5qcGciLCJ3aWR0aCI6Ijw9MTAyNCJ9XV0sImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl19.1FNfJ1TYFT2XBgu3qGZvrPJq6wGwe0VXt40p30DDTIc",
    created: DateTime.now(),
    updated: DateTime.now(),
    user: user2,
    comments: [
      PostComment(
        id: 103,
        context: "This is incredible! Eagles are so majestic.",
        created: DateTime.now(),
        updated: DateTime.now(),
        postID: 2,
        userId: "commenter_id_3",
        user: user1,
      ),
    ],
    likes: [
      PostLike(
        id: 203,
        created: DateTime.now(),
        updated: DateTime.now(),
        postID: 2,
        userId: "liker_id_3",
        user: user1,
      ),
    ],
  ),
  Post(
    id: 3,
    title: "Robin's Nest",
    description: "A peek into the life of a robin and its nest.",
    imageUrl:
        "https://media.istockphoto.com/id/516065925/photo/blue-robin-eggs-in-nest.webp?s=2048x2048&w=is&k=20&c=tmU8DpexV-T7ht8xUAujmkO9MwDXvQRC_82oaOEkbkw=",
    created: DateTime.now(),
    updated: DateTime.now(),
    user: user3,
    comments: [
      PostComment(
        id: 104,
        context: "Nature is so beautiful!",
        created: DateTime.now(),
        updated: DateTime.now(),
        postID: 3,
        userId: "commenter_id_4",
        user: user2,
      ),
    ],
    likes: [
      PostLike(
        id: 204,
        created: DateTime.now(),
        updated: DateTime.now(),
        postID: 3,
        userId: "liker_id_4",
        user: user1,
      ),
      PostLike(
        id: 205,
        created: DateTime.now(),
        updated: DateTime.now(),
        postID: 3,
        userId: "liker_id_5",
        user: user3,
      ),
    ],
  ),
  Post(
    id: 4,
    title: "Hummingbird Feeding",
    description: "Watch the agile hummingbird feeding on nectar.",
    imageUrl:
        "https://media.audubon.org/apa_2015_kevinrees_279316_annas_hummingbird_kk_1.jpg",
    created: DateTime.now(),
    updated: DateTime.now(),
    user: user3,
    comments: [
      PostComment(
        id: 105,
        context: "Hummingbirds are such fascinating creatures!",
        created: DateTime.now(),
        updated: DateTime.now(),
        postID: 4,
        userId: "commenter_id_6",
        user: user2,
      ),
      PostComment(
        id: 106,
        context: "I love how they hover in the air!",
        created: DateTime.now(),
        updated: DateTime.now(),
        postID: 4,
        userId: "commenter_id_7",
        user: user1,
      ),
    ],
    likes: [
      PostLike(
        id: 206,
        created: DateTime.now(),
        updated: DateTime.now(),
        postID: 4,
        userId: "liker_id_6",
        user: user3,
      ),
      PostLike(
        id: 207,
        created: DateTime.now(),
        updated: DateTime.now(),
        postID: 4,
        userId: "liker_id_7",
        user: user2,
      ),
    ],
  ),
];
