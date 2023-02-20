# NFT 기반 중고거래 플랫폼 앱
- Flutter, Firebase를 활용한 중고거래 앱
- NFT 발행 기능은 추후 추가 예정


### 🖥 See on video : https://www.youtube.com/watch?v=qYMh2ixviP4

### 🔧 Key Feature
- 사용자 인증
- 상품, 판매글 작성
- (예정) 수락 시 상품의 소유권 이전
- (예정) 상품의 거래 기록으로 이전 사용자 추적

### ✨ Skills & Tech Stack
- Flutter
- Provider
- Firebase Authentication
- Firebase Firestore
- Firebase FireStorage

### 🗂 Folder Structure
```
📦lib
 ┣ 📂constants
 ┃ ┗ 📜db_constants.dart
 ┣ 📂models
 ┃ ┣ 📜custom_error.dart
 ┃ ┣ 📜goods.dart
 ┃ ┣ 📜goods.freezed.dart
 ┃ ┗ ...
 ┣ 📂providers
 ┃ ┣ 📂auth
 ┃ ┃ ┣ 📜auth_provider.dart
 ┃ ┃ ┗ 📜auth_state.dart
 ┃ ┣ 📂goods
 ┃ ┃ ┣ 📜goods_list_provider.dart
 ┃ ┃ ┣ 📜goods_list_state.dart
 ┃ ┃ ┣ 📜goods_provider.dart
 ┃ ┃ ┣ 📜goods_register_provider.dart
 ┃ ┃ ┣ 📜goods_register_state.dart
 ┃ ┃ ┗ 📜goods_state.dart
 ┃ ┣ 📂post
 ┃ ┣ 📂profile
 ┃ ┣ 📂repositories
 ┃ ┃ ┣ 📜auth_repository.dart
 ┃ ┃ ┣ 📜goods_repository.dart
 ┃ ┃ ┣ 📜post_repository.dart
 ┃ ┃ ┗ 📜profile_repository.dart
 ┃ ┣ 📂signin
 ┃ ┣ 📂signup
 ┃ ┣ 📜.DS_Store
 ┃ ┗ 📜providers.dart
 ┣ 📂screens
 ┃ ┣ 📂my_page
 ┃ ┣ 📂register
 ┃ ┣ 📂sign
 ┃ ┣ 📜chat_list_screen.dart
 ┃ ┣ 📜history_screen.dart
 ┃ ┣ 📜home_screen.dart
 ┃ ┣ 📜product_detail_screen.dart
 ┃ ┣ 📜show_category_screen.dart
 ┃ ┗ 📜tabs_screen.dart
 ┣ 📂utils
 ┃ ┣ 📜error_dialog.dart
 ┃ ┗ 📜input_image.dart
 ┣ 📂widgets
 ┃ ┣ 📜homeItemContainer.dart
 ┃ ┗ 📜main_navigation_bar.dart
 ┣ 📜.DS_Store
 ┣ 📜generated_plugin_registrant.dart
 ┗ 📜main.dart
```