
# Olympics 2024

This project is a simple iOS application that provides information about the Olympics 2024. It displays a list of countries with their medal counts and a list of sports disciplines with their respective pictograms.

## Features

- **Medal List View**: Shows a list of countries sorted by total medals, displaying their gold, silver, bronze, and total medal counts.
- **Sport List View**: Displays a list of sports disciplines with their pictograms.

## Screenshots

### Light Mode
![Medal List View](https://live.staticflickr.com/65535/53910778644_c4e83bacd5_o.png)
![Sport List View](https://live.staticflickr.com/65535/53909537372_36cbe95948_o.png)
![Medal Details View](https://live.staticflickr.com/65535/53909537377_b1ceb891a9_o.png)

### Dark Mode
![Medal List View](https://live.staticflickr.com/65535/53910427961_c622c4a7e6_o.png)
![Sport List View](https://live.staticflickr.com/65535/53910672218_ecc0f27d56_o.png)
![Medal Details View](https://live.staticflickr.com/65535/53910875125_d7686d2d61_o.png)

## Installation

To run this project, you'll need:

- Xcode 12 or later
- Swift 5.3 or later

Clone the repository:

```bash
git clone https://github.com/HerniRG/Olympics.git
```

Open the project in Xcode:

```bash
cd Olympics
open Olympics.xcodeproj
```

Run the project on your preferred simulator or device.

## Usage

### Medal List View

The Medal List View fetches data from the [Codante Olympic Games API](https://apis.codante.io/olympic-games/countries) and displays a list of countries with their respective medal counts.

### Sport List View

The Sport List View fetches data from the [Codante Olympic Games API](https://apis.codante.io/olympic-games/disciplines) and displays a list of sports disciplines with their pictograms.

## API Endpoints

- **Countries and Medals**: `https://apis.codante.io/olympic-games/countries`
- **Sports Disciplines**: `https://apis.codante.io/olympic-games/disciplines`

## Author

- **Hernán Rodríguez**
  - [Email](mailto:hernanrg85@gmail.com)
  - [GitHub](https://github.com/HerniRG)
