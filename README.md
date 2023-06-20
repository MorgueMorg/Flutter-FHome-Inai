<h1 align="center"> FHome </h1>

<p align="center"> FHome был задуман как платформа для домашней выпечки с возможностью размещать свои продукты и покупать чужие, а также связывать продавцов выпечки. По сути, это эквивалент мобильного приложения для электронной коммерции. Он все еще находится на стадии разработки. </p>

<h2 align="center"> Предпросмотр </h2>

<h3 align="center"> Splash/SignIn/Errors Screens </h3>

| ![screen1](/assets/results/splash.png) | ![screen2](/assets/results/sign_in.png) | ![screen3](/assets/results/login_errors.png) |
| :------------------------------------: | :-------------------------------------: | :------------------------------------------: |

<h3 align="center"> LoginSuccess/ForgotPassword/SignUp Screens </h3>

| ![screen1](/assets/results/login_success.png) | ![screen2](/assets/results/forgot_password.png) | ![screen3](/assets/results/sign_up.png) |
| :-------------------------------------------: | :---------------------------------------------: | :-------------------------------------: |

<h3 align="center"> EmailOTP/Home/Search Screens </h3>

| ![screen1](/assets/results/email_otp.png) | ![screen2](/assets/results/home.png) | ![screen3](/assets/results/search.png) |
| :---------------------------------------: | :----------------------------------: | :------------------------------------: |

<h3 align="center"> ProductDetails/Categories/Favorites Screens </h3>

| ![screen1](/assets/results/details.png) | ![screen2](/assets/results/categories.png) | ![screen3](/assets/results/favorites.png) |
| :-------------------------------------: | :----------------------------------------: | :---------------------------------------: |

<h3 align="center"> Cart/Notifications/Profile Screens </h3>

| ![screen1](/assets/results/cart.png) | ![screen2](/assets/results/notices.png) | ![screen3](/assets/results/profile.png) |
| :----------------------------------: | :-------------------------------------: | :-------------------------------------: |

<h2 align="center"> Библиотеки </h2>

1. Использую [bloc](https://pub.dev/packages/flutter_bloc) в качестве менеджера состояний (точнее, cubit)
2. Использую [dio](https://pub.dev/packages/dio)/[http](https://pub.dev/packages/http) для работы с сетью (изначально я собирался использовать только dio, но в одном из api из бэкенда я получаю form-data, который dio не поддерживает, поэтому пришлось использовать и http).
3. Использую [get_it](https://pub.dev/packages/get_it) для инъекции зависимостей.
4. Использую [equatable](https://pub.dev/packages/equatable) для равенства значений/состояний.
5. Использую [flutter_svg](https://pub.dev/packages/flutter_svg) для работы с svg

<h2 align="center"> Описание </h2>

Приложение написано на dart(flutter), бэкенд написан на java(spring), используя rest api. В будущем я планирую добавить взаимодействие с firebase, локальную базу данных hive/sqlite и улучшить навигацию (возможно, добавить go_router). На данный момент приложение имеет довольно удобный UX/UI дизайн и имитацию некоторых функций, которых нет на бэкенде (поиск, корзина и т.д.). Есть возможность регистрации, авторизации и подтверждения пароля по почте. Для продуктов, категорий и деталей используются различные api из бэкенда. В качестве базы данных на бэкенде используется Postgres. Существует документация swagger, которая была использована для взаимодействия с rest api - https://fhome.onrender.com/swagger-ui/index.html#/. Я постарался сделать максимальную валидацию и обработку ошибок, но еще многое предстоит сделать. Приложение похоже на паттерн MVVM, где bloc играет роль ViewModel.

<h2 align="center"> Как использовать </h2>
<h3 align="center"> Предисловие </h3>

Сначала необходимо "разбудить" бэкенд и документацию swagger. Это означает, что вам нужно просто открыть документацию swagger по этой ссылке - https://fhome.onrender.com/swagger-ui/index.html#/ и бэкенд самостоятельно запустится через 2-4 минуты, после чего приложение будет полностью готово к работе. Это связано с тем, что бэкенд развернут на бесплатном хостинге.

1. Клонируйте репозиторий
   ```sh
   git@github.com:MorgueMorg/Flutter-FHome-Inai.git
   ```
   or
   ```sh
   https://github.com/MorgueMorg/Flutter-FHome-Inai.git
   ```
2. Установите зависимости
   ```sh
   flutter pub get
   ```
3. Запустите приложение

   ```sh
   flutter run
   ```

4. Если вы не хотите регистрироваться, то используйте тестовый аккаунт:

```
email: atai.tofik@gmail.com
password: dastantimakirill
```

<h2 align="center"> Возможности </h2>

- Splash
- Login
- Registration
- Mail Confirmation
- Home
- Routing
- Dio / http
- Provider
- Validation
- User Notifications
- Mail Confirmation
- Work with Rest Api

<h2 align="center"> Заключение </h2>

Я буду рад ответить на любые вопросы, которые могут возникнуть у вас по этому приложению. Я еще не видел приложения на flutter на тему выпечки, которое взаимодействовало бы с api, так что надеюсь, это кому-нибудь поможет :shipit:
