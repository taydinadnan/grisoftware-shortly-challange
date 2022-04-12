# grisoftware_shortly_challenge
# Url Shortener

A new Flutter project.

## Screenshots of the project :

![url_shortener](https://github.com/taydinadnan/grisoftware-shortly-challange/blob/main/screenshots/APP.jpg)




### Brief

URL shortening is a technique on the Web in which a Uniform Resource Locator (URL) may be made substantially shorter and still direct to the required page. This is achieved by using a redirect that links to the web page that has a long URL. For example, the URL "https://example.com/assets/category_B/subcategory_C/Foo/" can be shortened to "https://example.com/Foo", and the URL "http://example.com/about/index.html" can be shortened to "https://goo.gl/aO3Ssc ".

Users are able to:

-   View the optimal layout for the mobile app depending on their device's screen size
-   Shorten any valid URL
-   Copy the shortened link to their clipboard in a single click
-   Receive an error message when the `form` is submitted if:
    -   The `input` field is empty

## pubspec.yaml

```
environment:
  sdk: ">=2.17.0-69.2.beta <3.0.0"

dependencies:
  flutter:
    sdk: flutter

  cupertino_icons: ^1.0.2
  flutter_svg: ^1.03
  http: ^0.13.4

dev_dependencies:
  flutter_test:
    sdk: flutter

  flutter_lints: ^1.0.0
flutter:
  uses-material-design: true

  assets:
    - assets/del.svg
    - assets/illustration.svg
    - assets/logo.svg
    - assets/shape.svg
```

## What has been done in this project :

-API --> https://shrtco.de/docs/.

-CustomPaint --> https://fluttershapemaker.com.
