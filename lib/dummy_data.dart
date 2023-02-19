import 'models/history.dart';
import 'models/user.dart';

import 'models/goods.dart';
import 'models/chat_item.dart';

// var DUMMY_GOODS = [
//   Goods(
//     imagePath: [
//       'assets/images/goods1-1.png',
//       'assets/images/goods1-2.png',
//     ],
//     title: '맥북에어 스그 기본형',
//     time: '30분 전',
//     price: '1,060,000원',
//     // like_ids: [
//     //   'u1',
//     //   'u2',
//     //   'u3',
//     //   'u1',
//     //   'u2',
//     //   'u3',
//     // ],
//     goods_id: 'g1',
//     category: '디지털기기',
//     desc:
//         "맥북 프로 터치바 판매합니다.\n\n새로 나왔을 때부터 애지중지 케이스 끼워가며 사용했어요. \n떨어뜨린 적 거의 없고, \n배터리 사이클도 300으로 괜찮습니다.\n\n모든 기능 잘 작동합니다.\n영등포역 1번 출구에서 직거래가능합니다.",
//     item_status: 0,
//     like: false,
//     user_id: 'u1',
//   ),
//   Goods(
//     imagePath: [
//       'assets/images/goods2-1.png',
//       'assets/images/goods2-2.png',
//       'assets/images/goods2-3.png',
//       'assets/images/goods2-4.png',
//       'assets/images/goods2-5.png',
//     ],
//     title: '맥북에어 m1 스페이스 그레이',
//     time: '6분 전',
//     price: '900,000원',
//     // like_ids: [
//     //   'u1',
//     //   'u2',
//     //   'u1',
//     //   'u2',
//     //   'u3',
//     // ],
//     goods_id: 'g2',
//     category: '디지털기기',
//     desc:
//         "맥북 에어 m1 풀박스 팝니다.\n\n램 8GB SSD 512GB. \n작년에 회사에서 줬는데 이번에 새로 나온 맥북으로 구매하고자 팔아요, \n배터리 사이클도 455으로 괜찮습니다.\n\n많은 문의 부탁드립니다.\n\n구로역 3번출구 직거래.",
//     item_status: 0,
//     like: false,
//     user_id: 'u2',
//   ),
//   Goods(
//     imagePath: [
//       'assets/images/goods3-1.png',
//       'assets/images/goods3-2.png',
//       'assets/images/goods3-3.png',
//       'assets/images/goods3-4.png',
//     ],
//     title: '펜디시계 정품',
//     time: '5일 전',
//     price: '360,000원',
//     // like_ids: ['u1', 'u2'],
//     goods_id: 'g3',
//     category: '여성잡화',
//     desc:
//         "하와이 여행시 인터넷 면세점으로 구입한 제품입니다.\n2019년도 구매했고\n당시에 몇번 하다가 요새는 거의 하지않아 판매합니다\n큰 하자 없고 눈에 띄는 기스 없어요. 가죽 상태도 좋구요 \n\n시세 90만원정도 하는 제품이니 저렴하게 겟하세요.",
//     item_status: 0,
//     like: false,
//     user_id: 'u3',
//   ),
//   Goods(
//     imagePath: [
//       'assets/images/goods4-1.png',
//       'assets/images/goods4-2.png',
//       'assets/images/goods4-3.png',
//       'assets/images/goods4-4.png',
//     ],
//     title: '조말론 향수',
//     time: '2주 전',
//     price: '150,000',
//     // like_ids: ['u1'],
//     goods_id: 'g4',
//     category: '뷰티/미용',
//     desc:
//         "한정판 리미티드 에디션 레드 히비스커스 코롱 인텐스 향수\n정가 26만원 100ml\n실사용 10회 정도\n\n 달달하면서도 꽃향기가 느껴지는 향이에요. 산뜻한 느낌으로 봄과 여름에 잘 어울릴 것 같고 바닐라 베이스를 사용해서 부드러운 느낌도 들고 매력적인 향수입니다.\n\n향수가 너무 많아 판매합니다.",
//     item_status: 0,
//     like: false,
//     user_id: 'u4',
//   ),
//   Goods(
//     imagePath: [
//       'assets/images/goods5-1.png',
//       'assets/images/goods5-2.png',
//       'assets/images/goods5-3.png',
//       'assets/images/goods5-4.png',
//       'assets/images/goods5-5.png',
//       'assets/images/goods5-6.png',
//     ],
//     title: '여성 골프채 세트',
//     time: '1달 전',
//     price: '660,000원',
//     // like_ids: ['u1', 'u2', 'u3'],
//     goods_id: 'g5',
//     category: '스포츠/레저',
//     desc:
//         "요넥스아이언 5-9, P, A, S\n온오프우드 5번\n테일러메이드 드라이버 11.5'\n(다 정품, 그립 교환 안된 제 그립으로 상태 좋음\n\n제가 사용하던 채 이번에 바꾸면서 입양보네요~\n처음 사용하는거라 정이 많이 붙었는데 아쉽네요ㅠㅠ\n조심조심 아끼면서 사용했습니다!\n입문자용 쓰시기에 채상태 넘 좋아요!\n\n여의도, 영등포, 강남 직거래 가능",
//     item_status: 0,
//     like: false,
//     user_id: 'u5',
//   ),
// ];

var DUMMY_USER = [
  User(
      id: 'u1',
      profileImage: 'assets/images/profile1.png',
      name: '거래쿨',
      level: 1,
      email: "aaa@naver.com"),
  User(
      id: 'u2',
      profileImage: 'assets/images/profile2.png',
      name: '바다',
      level: 3,
      email: "aaa@naver.com"),
  User(
      id: 'u3',
      profileImage: 'assets/images/profile3.png',
      name: '새우깡',
      level: 2,
      email: "aaa@naver.com"),
  User(
      id: 'u4',
      profileImage: 'assets/images/profile4.png',
      name: '헤어질',
      level: 4,
      email: "aaa@naver.com"),
  User(
      id: 'u5',
      profileImage: 'assets/images/profile5.png',
      name: '결심',
      level: 5,
      email: "aaa@naver.com"),
];

var DUMMY_HISTORY = [
  History(
    goods_id: 'g1',
    user_id: 'u1',
    goods_image_path: 'assets/images/goods1-1.png',
    user_image_path: 'assets/images/profile1.png',
    when: '19.8.3',
    number: 1,
    who: '거래쿨',
    level: 1,
  ),
  History(
    goods_id: 'g1',
    user_id: 'u2',
    goods_image_path: 'assets/images/goods1-1.png',
    user_image_path: 'assets/images/profile2.png',
    when: '20.3.6',
    number: 2,
    who: '바다',
    level: 3,
  ),
  History(
    goods_id: 'g1',
    user_id: 'u1',
    goods_image_path: 'assets/images/goods1-1.png',
    user_image_path: 'assets/images/profile3.png',
    when: '22.1.4',
    number: 3,
    who: '새우깡',
    level: 2,
  ),
];

var DUMMY_CHAT = [
  ChatItem(
    profileImagePath: 'assets/images/profile1.png',
    name: '바다',
    location: '성수동2가',
    time: '1일 전',
    itemImagePath: 'assets/images/goods1-1.png',
    messageLatest: '네',
  ),
  ChatItem(
    profileImagePath: 'assets/images/profile2.png',
    name: '새우깡',
    location: '용답동',
    time: '3일 전',
    itemImagePath: 'assets/images/goods2-1.png',
    messageLatest: '도착했습니다',
  ),
];
