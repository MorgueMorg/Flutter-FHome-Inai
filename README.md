<h1 align="center"> FHome </h1>

<p align="center"> FHome was conceived as a platform for home baking, with the ability to post your products and buy someone else's, as well as to connect baking vendors. It is essentially the equivalent of a mobile e-commerce app. It is still in development. </p>

<h2 align="center"> Preview </h2>

<h1 align="center"> Splash/SignIn/Errors Screens </h1>
| ![screen1](/assets/results/splash.png) | ![screen2](/assets/results/sign_in.png) | ![screen3](/assets/results/login_errors.png) |
| :------------: | :------------: | :------------: |

<h1 align="center"> LoginSuccess/ForgotPassword/SignUp Screens </h1>
| ![screen1](/assets/results/login_success.png) | ![screen2](/assets/results/forgot_password.png) | ![screen3](/assets/results/sign_up.png) |
| :------------: | :------------: | :------------: |

<h1 align="center"> EmailOTP/Home/Search Screens </h1>
| ![screen1](/assets/results/email_otp.png) | ![screen2](/assets/results/home.png) | ![screen3](/assets/results/search.png) |
| :------------: | :------------: | :------------: |

<h1 align="center"> ProductDetails/Categories/Favorites Screens </h1>
| ![screen1](/assets/results/details.png) | ![screen2](/assets/results/categories.png) | ![screen3](/assets/results/favorites.png) |
| :------------: | :------------: | :------------: |

<h1 align="center"> Cart/Notifications/Profile Screens </h1>
| ![screen1](/assets/results/cart.png) | ![screen2](/assets/results/notices.png) | ![screen3](/assets/results/profile.png) |
| :------------: | :------------: | :------------: |

<h2 align="center"> Libraries </h2>

1. Uses [bloc](https://pub.dev/packages/flutter_bloc) as state management (to be exact, cubit)
2. Uses [dio](https://pub.dev/packages/dio)/[http](https://pub.dev/packages/http) for work with network (Originally I was going to use only dio, but in one of the api from the backend I get form-data, which dio doesn't support, so I had to use http as well)
3. Uses [get_it](https://pub.dev/packages/get_it) for dependency injection
4. Uses [equatable](https://pub.dev/packages/equatable) for value/states equality
5. Users[flutter_svg](https://pub.dev/packages/flutter_svg) for work with svg

<h2 align="center"> Description </h2>

The application is written in dart(flutter), the backend is written in java(spring), using the rest api. In the future I plan to add interaction with firebase, a local database hive/sqlite and improve navigation (possibly add go_router). At the moment, the app has a pretty clear UX/UI design and imitation of some features that are not on the backend (search, shopping cart, etc.). It is possible to register, authorize and confirm the password by mail. Different api from the backend are used for products, categories and parts. Postgres is used as the database on the backend. There is swagger documentation which was used to interact with rest api - https://fhome.onrender.com/swagger-ui/index.html#/. I tried to do maximum validation and error handling, but there's still a lot to do. The application is kind of like an MVVM pattern, where bloc plays the role of ViewModel.

<h2 align="center"> How to use </h2>
<h3 align="center"> Foreword </h3>

First, you have to "wake up" the backend and the swagger documentation. Meaning you just have to open the swagger documentation and the backend will come up on its own in 2-4 minutes, after which the application will be fully operational. This is due to the fact that the backend is deployed on free hosting.

1. Clone the repo
   ```sh
   git@github.com:MorgueMorg/Flutter-FHome-Inai.git
   ```
   or
   ```sh
   https://github.com/MorgueMorg/Flutter-FHome-Inai.git
   ```
   
2. Install all the packages by typing
   ```sh
   flutter pub get
   ```
   
3. Run the App
   ```sh
   flutter run
   ```

4. If you don't want to register, you can use a test account to log in:
  ```
  email: atai.tofik@gmail.com
  password: dastantimakirill
  ```

<h2 align="center"> Features </h2>

* Splash
* Login
* Registration
* Mail Confirmation
* Home
* Routing
* Dio / http
* Provider 
* Validation
* User Notifications
* Mail Confirmation
* Work with Rest Api

<h2 align="center"> Conclusion </h2>

I will be happy to answer any questions that you may have on this application. I haven't yet seen a flutter-themed baking app that interacts with the api, so hopefully this will help someone. :shipit:
