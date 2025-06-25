# Weather Forecast App
A simple weather forecast app built using Flutter. This app displays real-time weather conditions and hourly forecasts.

# Features
* 🔍 Current weather information.

* 🕐 Hourly weather forecast cards.

* 📊 Additional weather details (humidity, pressure, wind speed).

* 🎨 Minimal and clean Material Design UI

* ⚡ Fast and responsive performance.

# 🛠️ Installation


1. **Clone the repository**
    ```
    git clone https://github.com/Ajallen14/Weather_App.git
    cd weather_app
    ```
2. **Install dependencies**
    ```
    flutter pub get
    ```
3. **Run the app**
    ```
    flutter run
    ```
Make sure you have an emulator running or a physical device connected.

# Requirements
* Flutter SDK (>=3.x)
* Dart SDK
* Android Studio or Visual Studio Code (with Flutter plugin)
* [API key](https://openweathermap.org/)

# API Key & Location Configuration
The app fetches weather data from an online weather API (e.g., [OpenWeatherMap](https://openweathermap.org/)).
##  How to set/change the API Key
* Create an account on [OpenWeatherMap](https://openweathermap.org/) and get your free API key.
* Open the file where the API request is made (i.e weather_screen.dart).
* Replace the placeholder with your actual API key:
    ```
    final apiKey = 'YOUR_API_KEY_HERE';
    ```

## How to change the location (city)    
1. Look for the part of the code where the city is hardcoded or passed in the URL. Example:
    ```
    final city = 'Aluva';
    final url = 'https://api.openweathermap.org/data/2.5/forecast?q=$city&appid=$apiKey&units=metric';
    ```
2. Replace 'Aluva' with your desired city name, like 'Mumbai', 'New York', etc.

# Video


