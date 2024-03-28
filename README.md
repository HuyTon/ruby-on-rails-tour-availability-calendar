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
   - **Rule Data:** `{ "days_of_week": ["Tuesday"], "week_numbers": [2] }`
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

# API Documentation

This document outlines the APIs available in our system for managing tours, availabilities, and availability rules.

## Tours

### Endpoint: `/tours`

#### List Tours

- **Method:** GET
- **Description:** Retrieve a list of all tours.
- **Input:** None
- **Output:**
  - Status Code: 200 (OK)
  - Content Type: `application/json`
  - Body:
    ```json
    {
      "tours": [
        {
          "id": 1,
          "name": "Tour 1",
          "description": "Description of Tour 1",
          "duration_hours": 3,
          "duration_days": 1
        },
        {
          "id": 2,
          "name": "Tour 2",
          "description": "Description of Tour 2",
          "duration_hours": 4,
          "duration_days": 2
        }
        // More tours...
      ]
    }
    ```

#### Create Tour

- **Method:** POST
- **Description:** Create a new tour with the specified parameters.
- **Input:**
  - Parameters:
    - `name`: Name of the tour
    - `description`: Description of the tour
    - `duration_hours`: Duration of the tour in hours
    - `duration_days`: Duration of the tour in days
- **Output:**
  - Status Code: 201 (Created) if successful, 422 (Unprocessable Entity) if there are validation errors or missing parameters.
  - Content Type: `application/json`
  - Body (if successful):
    ```json
    {
      "id": 3,
      "name": "New Tour",
      "description": "Description of New Tour",
      "duration_hours": 2,
      "duration_days": 1
    }
    ```
  - Body (if unsuccessful):
    ```json
    {
      "error": "Failed to create tour"
    }
    ```

## Availabilities

### Endpoint: `/availabilities`

#### List Availabilities

- **Method:** GET
- **Description:** Retrieve a list of all availabilities.
- **Input:** None
- **Output:**
  - Status Code: 200 (OK)
  - Content Type: `application/json`
  - Body:
    ```json
    {
      "availabilities": [
        {
          "id": 1,
          "tour_id": 1,
          "availability_rule_id": 1,
          "start_time": "2024-03-28T09:00:00Z"
        },
        {
          "id": 2,
          "tour_id": 2,
          "availability_rule_id": 2,
          "start_time": "2024-03-29T10:00:00Z"
        }
        // More availabilities...
      ]
    }
    ```

#### Create Availability

- **Method:** POST
- **Description:** Create a new availability with the specified parameters.
- **Input:**
  - Parameters:
    - `tour_id`: ID of the tour
    - `availability_rule_id`: ID of the availability rule
    - `start_time`: Start time of the availability
- **Output:**
  - Status Code: 201 (Created) if successful, 422 (Unprocessable Entity) if there are validation errors or missing parameters.
  - Content Type: `application/json`
  - Body (if successful):
    ```json
    {
      "id": 1,
      "tour_id": 1,
      "availability_rule_id": 1,
      "start_time": "2024-03-30T10:00:00Z"
    }
    ```
  - Body (if unsuccessful):
    ```json
    {
      "error": "Failed to create availability"
    }
    ```

## Availability Rules

### Endpoint: `/availability_rules`

#### List Availability Rules

- **Method:** GET
- **Description:** Retrieve a list of all availability rules.
- **Input:** None
- **Output:**
  - Status Code: 200 (OK)
  - Content Type: `application/json`
  - Body:
    ```json
    {
      "availability_rules": [
        {
          "id": 1,
          "rule_type": "specific_dates",
          "rule_data": {
            "dates": ["2024-04-01", "2024-04-15"]
          }
        },
        {
          "id": 2,
          "rule_type": "weekly",
          "rule_data": {
            "days": ["Monday", "Friday"]
          }
        }
        // More availability rules...
      ]
    }
    ```

#### Create Availability Rule

- **Method:** POST
- **Description:** Create a new availability rule with the specified parameters.
- **Input:**
  - Parameters:
    - `rule_type`: Type of the availability rule
    - `rule_data`: Additional data for the rule (depends on the rule type)
- **Output:**
  - Status Code: 201 (Created) if successful, 422 (Unprocessable Entity) if there are validation errors or missing parameters.
  - Content Type: `application/json`
  - Body (if successful):
    ```json
    {
      "id": 1,
      "rule_type": "specific_dates",
      "rule_data": {
        "dates": ["2024-04-01", "2024-04-15"]
      }
    }
    ```
  - Body (if unsuccessful):
    ```json
    {
      "error": "Failed to create availability rule"
    }
    ```

## Get Availability Tours

### Endpoint: `/api/get_availability_tours`

#### Get Availability Tours

- **Method:** GET
- **Description:** Retrieve tours along with their availabilities and associated availability rules.
- **Input:** None
- **Output:**
  - Status Code: 200 (OK)
  - Content Type: `application/json`
  - Body:
    ```json
    {
      "tours": [
        {
          "id": 1,
          "name": "Guided City Tour",
          "description": "Explore the city's landmarks with our expert guides.",
          "duration_hours": 3,
          "duration_days": null,
          "created_at": "2024-03-27T15:37:09.583Z",
          "updated_at": "2024-03-27T15:37:09.583Z",
          "availabilities": [
            {
              "id": 1,
              "tour_id": 1,
              "availability_rule_id": 1,
              "start_time": "2024-04-01T09:00:00.000Z",
              "created_at": "2024-03-28T02:52:03.138Z",
              "updated_at": "2024-03-28T02:52:03.138Z",
              "availability_rule": {
                "id": 1,
                "rule_type": "specific_dates",
                "rule_data": null,
                "created_at": "2024-03-27T15:37:20.373Z",
                "updated_at": "2024-03-27T15:37:20.373Z"
              }
            }
          ]
        }
        // More tours...
      ]
    }
    ```

### Create Tour Availability

- **Endpoint:** `/api/create_tour_availability`
- **Method:** POST
- **Description:** Create a new availability for a tour with the specified parameters.
- **Input:**

  - Parameters:
    - `tour_id`: ID of the tour
    - `availability_rule_id`: ID of the availability rule
    - `start_time`: Start time of the availability
  - Body (example):
    ```json
    {
      "tour": {
        "name": "Historical Walking Tour",
        "description": "Learn about the city's rich history while exploring its streets.",
        "duration_hours": 3,
        "duration_days": null
      },
      "availability": {
        "start_time": "2024-04-01T10:00:00"
      },
      "availability_rule": {
        "rule_type": "specific_dates",
        "rule_data": {
          "dates": ["2024-04-01", "2024-04-05", "2024-04-10"]
        }
      }
    }
    ```

- **Output:**
  - Status Code: 201 (Created) if successful, 422 (Unprocessable Entity) if there are validation errors or missing parameters.
  - Content Type: `application/json`
  - Body (example):
    ```json
    {
      "tour": {
        "id": 7,
        "name": "Historical Walking Tour",
        "description": "Learn about the city's rich history while exploring its streets.",
        "duration_hours": 3,
        "duration_days": null,
        "created_at": "2024-03-28T09:15:41.285Z",
        "updated_at": "2024-03-28T09:15:41.285Z"
      },
      "availability": {
        "id": 7,
        "tour_id": 7,
        "availability_rule_id": 16,
        "start_time": "2024-04-01T10:00:00.000Z",
        "created_at": "2024-03-28T09:15:41.296Z",
        "updated_at": "2024-03-28T09:15:41.296Z"
      },
      "availability_rule": {
        "id": 16,
        "rule_type": "specific_dates",
        "rule_data": {
          "dates": ["2024-04-01", "2024-04-05", "2024-04-10"]
        },
        "created_at": "2024-03-28T09:15:41.276Z",
        "updated_at": "2024-03-28T09:15:41.276Z"
      }
    }
    ```
  - Body (if unsuccessful):
    ```json
    {
      "error": "Failed to create tour availability"
    }
    ```
