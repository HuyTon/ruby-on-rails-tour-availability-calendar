# Tour Availability Calendar

This project provides a solution for managing tour availabilities, allowing tour operators to set up various availability rules and associated start times for their tours.

## Table of Contents

- [Introduction](#introduction)
- [Installation](#installation)
- [Usage](#usage)
- [Sample Data](#sample-data)
- [Contributing](#contributing)
- [License](#license)

## Introduction

The Tour Availability Calendar application allows tour operators to define availability rules for their tours, such as recurring weekly schedules, specific dates, or monthly occurrences. It provides a user-friendly interface for setting up and managing tour availabilities, helping operators efficiently manage their tour schedules.

## Installation

To install and run the Tour Availability Calendar application locally, follow these steps:

1. Clone the repository to your local machine.
2. Navigate to the project directory.
3. Install dependencies by running `bundle install`.
4. Set up the database by running `rails db:create` and `rails db:migrate`.
5. Start the Rails server by running `rails server`.
6. Access the application in your web browser at `http://localhost:3000`.

## Usage

1. Sign in to the application using your account credentials.
2. Navigate to the dashboard to view and manage your tours.
3. Set up tour availabilities by specifying the availability rules and associated start times.
4. Save your changes and publish the updated availability schedule for customers to view and book tours.

## Sample Data

Here are examples of availability rules and associated start times for different scenarios:

1. Tour starts every Monday of the week:

   - **Rule Type:** Weekly
   - **Rule Data:** `{ "days": ["Monday"] }`
   - **Start Time:**
     - "2024-04-01 09:00:00" (April 1, 2024, Monday, at 9:00 AM)
     - "2024-04-08 09:00:00" (April 8, 2024, Monday, at 9:00 AM)

2. Tour starts every second Tuesday of the month:

   - **Rule Type:** Monthly
   - **Rule Data:** `{ "day_of_week": "Tuesday", "week_number": 2 }`
   - **Start Time:**
     - "2024-04-11 09:00:00" (April 11, 2024, Tuesday, at 9:00 AM)
     - "2024-05-09 09:00:00" (May 9, 2024, Tuesday, at 9:00 AM)

3. Tour starts every Tuesday and Thursday:

   - **Rule Type:** Weekly
   - **Rule Data:** `{ "days": ["Tuesday", "Thursday"] }`
   - **Start Time:**
     - "2024-04-02 09:00:00" (April 2, 2024, Tuesday, at 9:00 AM)
     - "2024-04-04 09:00:00" (April 4, 2024, Thursday, at 9:00 AM)

4. Next tour starts on Jan 5, Feb 6, March 15:
   - **Rule Type:** Specific Dates
   - **Rule Data:** `{ "dates": ["2024-01-05", "2024-02-06", "2024-03-15"] }`
   - **Start Time:**
     - "2024-01-05 09:00:00" (January 5, 2024, at 9:00 AM)
     - "2024-02-06 09:00:00" (February 6, 2024, at 9:00 AM)
     - "2024-03-15 09:00:00" (March 15, 2024, at 9:00 AM)

## Contributing

Contributions to the Tour Availability Calendar project are welcome! Please follow the [contribution guidelines](CONTRIBUTING.md) when submitting pull requests.

## License

This project is licensed under the [MIT License](LICENSE).
