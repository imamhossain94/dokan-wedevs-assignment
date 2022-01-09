# Dokan weDevs Assignment

weDevs Flutter assignment done with GetX & MVC pattern

<p align="center">
  <img alt="Light" src="https://github.com/imamhossain94/dokan-wedevs-assignment/blob/main/sreenshots/cover.jpg" width="48%">
</p>

<div align="center">

[![Open Source Love svg1](https://badges.frapsoft.com/os/v1/open-source.svg?v=103)](#)
[![GitHub Forks](https://img.shields.io/github/forks/saadhaxxan/Car_Game_Python_Pygame.svg?style=social&label=Fork&maxAge=2592000)](https://github.com/imamhossain94/dokan-wedevs-assignment/fork)
[![GitHub Issues](https://img.shields.io/github/issues/saadhaxxan/Car_Game_Python_Pygame.svg?style=flat&label=Issues&maxAge=2592000)](https://github.com/imamhossain94/dokan-wedevs-assignment/issues)
[![contributions welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat&label=Contributions&colorA=red&colorB=black	)](#)

</div>


## Assignment Link

View assignment <a href="https://drive.google.com/file/d/1C9Oc8R0w_OTBBth04eDRpLo1DtHL8SY_/view?usp=sharing">PDF</a>

## Design

View design on <a href="https://www.figma.com/file/lHDVMCVsE6R3NWxxG6Wfbo/Demo?node-id=0%3A1">Figma</a>


## 📁 Download Now

Get it from <a href="https://drive.google.com/file/d/11Vnc10UpDa6zx5l2Mt2FEMUIw-psG3KX/view?usp=sharing">Google drive</a>

## 💻 Installation steps

Null Safety?

Open CMD where you want to clone the project & run the following commands

```
git clone https://github.com/imamhossain94/dokan-wedevs-assignment.git
cd dokan-wedevs-assignment
flutter packages get
flutter run
```

## Packages used
```yaml
  get: ^4.6.1
  get_storage: ^2.0.3
  http: ^0.13.4
  flutter_rating_bar: ^4.0.0
  dotted_border: ^2.0.0+2
  sizer: ^2.0.15

  font_awesome_flutter: ^9.2.0
  cupertino_icons: ^1.0.2
```

## SignIn Example 
Email: john@doe.com
Pass: demo


SignIn Request:
Endpoint: [POST] https://apptest.dokandemo.com/wp-json/jwt-auth/v1/token
Content-Type: application/json
Body:
```json
{
	"username": "john@doe.com",
	"password": "demo"
}
```
SignIn Response:
```json
{
    "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvbmV3YWdlZGV2cy5jb20iLCJpYXQiOjE2NDE3MTgxODgsIm5iZiI6MTY0MTcxODE4OCwiZXhwIjoxNjQyMzIyOTg4LCJkYXRhIjp7InVzZXIiOnsiaWQiOiI0In19fQ.GbEOWBOtRpSO8dcSvdyM35FQNCee3MFB_YeMlVmTZ0w",
    "user_email": "john@doe.com",
    "user_nicename": "john",
    "user_display_name": "John Doe"
}
```

## SignUp Example 

Username: john
Email: john@doe.com
Pass: demo


SignUp Request:
Endpoint: [POST] https://newagedevs.com/wp-json/wp/v2/users/register
Content-Type: application/json
Body:
```json
{
  "username": "john",
  "email": "john@doe.com",
  "password": "demo"
}
```
SignUp Response:
```json
{
    "code": 200,
    "message": "User 'john' Registration was Successful"
}
```

## Get User Information Example
Bearer Token: ??


User Info Request:
Endpoint: [POST/GET] https://newagedevs.com/wp-json/wp/v2/users/me
Content-Type: application/json
Authorization: 'Bearer Token'


User Info Response:
```json
{
    "id": 4,
    "username": "john",
    "name": "John Doe",
    "first_name": "",
    "last_name": "",
    "email": "john@doe.com",
    "url": "",
    "description": "",
    "link": "https://newagedevs.com/author/john/",
    "locale": "en_US",
    "nickname": "john",
    "slug": "john",
    "roles": [
        "subscriber"
    ],
    "registered_date": "2022-01-07T15:21:13+00:00",
    "capabilities": {
        "read": true,
        "level_0": true,
        "subscriber": true
    },
    "extra_capabilities": {
        "subscriber": true
    },
    "avatar_urls": {
        "24": "https://secure.gravatar.com/avatar/6a6c19fea4a3676970167ce51f39e6ee?s=24&d=mm&r=g",
        "48": "https://secure.gravatar.com/avatar/6a6c19fea4a3676970167ce51f39e6ee?s=48&d=mm&r=g",
        "96": "https://secure.gravatar.com/avatar/6a6c19fea4a3676970167ce51f39e6ee?s=96&d=mm&r=g"
    },
    "meta": [],
    "_links": {
        "self": [
            {
                "href": "https://newagedevs.com/wp-json/wp/v2/users/4"
            }
        ],
        "collection": [
            {
                "href": "https://newagedevs.com/wp-json/wp/v2/users"
            }
        ]
    }
}
```

## Update User Information Example
Bearer Token: ??


User Info Request:
Endpoint: [POST] https://newagedevs.com/wp-json/wp/v2/users/<id>
Content-Type: application/json
Authorization: 'Bearer Token'
Body:
```json
{
  "name": "Joohn",
  "email": "joohn@doe.com"
}
```

User Info Response:
```json
{
    "id": 4,
    "username": "joohn",
    "name": "Joohn Doe",
    "first_name": "",
    "last_name": "",
    "email": "joohn@doe.com",
    "url": "",
    "description": "",
    "link": "https://newagedevs.com/author/joohn/",
    "locale": "en_US",
    "nickname": "joohn",
    "slug": "joohn",
    "roles": [
        "subscriber"
    ],
    "registered_date": "2022-01-07T15:21:13+00:00",
    "capabilities": {
        "read": true,
        "level_0": true,
        "subscriber": true
    },
    "extra_capabilities": {
        "subscriber": true
    },
    "avatar_urls": {
        "24": "https://secure.gravatar.com/avatar/6a6c19fea4a3676970167ce51f39e6ee?s=24&d=mm&r=g",
        "48": "https://secure.gravatar.com/avatar/6a6c19fea4a3676970167ce51f39e6ee?s=48&d=mm&r=g",
        "96": "https://secure.gravatar.com/avatar/6a6c19fea4a3676970167ce51f39e6ee?s=96&d=mm&r=g"
    },
    "meta": [],
    "_links": {
        "self": [
            {
                "href": "https://newagedevs.com/wp-json/wp/v2/users/4"
            }
        ],
        "collection": [
            {
                "href": "https://newagedevs.com/wp-json/wp/v2/users"
            }
        ]
    }
}
```


## How to connect WordPress

Navigate to: lib -> utils -> constants.dart
Change base URL

```dart
//Wordpress base url
const baseURL = "https://newagedevs.com/wp-json";
```

## Screenshots
<p align="center">

  <img alt="image" src="https://github.com/imamhossain94/dokan-wedevs-assignment/blob/main/sreenshots/login.jpg" width="40%"> &nbsp;&nbsp;
  <img alt="image" src="https://github.com/imamhossain94/dokan-wedevs-assignment/blob/main/sreenshots/register.jpg" width="40%">
  <br /><br /><br />
  <img alt="image" src="https://github.com/imamhossain94/dokan-wedevs-assignment/blob/main/sreenshots/products.jpg" width="40%"> &nbsp;&nbsp;
  <img alt="image" src="https://github.com/imamhossain94/dokan-wedevs-assignment/blob/main/sreenshots/filter.jpg" width="40%">
  <br /><br /><br />
  <img alt="image" src="https://github.com/imamhossain94/dokan-wedevs-assignment/blob/main/sreenshots/profile.jpg" width="40%"> &nbsp;&nbsp;
  <img alt="image" src="https://github.com/imamhossain94/dokan-wedevs-assignment/blob/main/sreenshots/update_profile.jpg" width="40%">

</p>



## Note
The Apis provided by weDevs are not working and I mailed them about that issue on 8 January 2022 but no one replies. So, I use my own WordPress Apis. Don't be confused Thank you!!

SignUp Request:
Endpoint: [POST] https://apptest.dokandemo.com/wp-json/wp/v2/users/register
Content-Type: application/json
Body:
```json
{
  "username": "test",
  "email": "test@xmail.com",
  "password": "test"
}
```
SignUp Response:
{
    "code": "wp_die",
    "message": "<h1>Error establishing a database connection</h1>",
    "data": {
        "status": 500
    },
    "additional_errors": []
}
```

## 🧑 Author

#### Md. Imam Hossain

You can also follow my GitHub Profile to stay updated about my latest projects:

[![GitHub Follow](https://img.shields.io/badge/Connect-Imam-blue.svg?logo=Github&longCache=true&style=social&label=Follow)](https://github.com/imamhossain94)

If you liked the repo then kindly support it by giving it a star ⭐!

Copyright (c) 2022 MD. IMAM HOSSAIN
