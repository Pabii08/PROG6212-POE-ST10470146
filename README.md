# RaceDay - Event Management System

## Project Description
RaceDay is a full-stack web-based event management system designed specifically for the South African road running, walking, and cycling community. The platform allows Event Organisers to create and manage events, categories, and participant results, while Participants can browse upcoming events, enter events, track their personal performance history, and prepare for race day using live weather and route information.

## Problem Statement
South Africa has a rich road events culture, from the iconic Comrades Marathon between Pietermaritzburg and Durban, to the Cape Town Cycle Tour, the Soweto Marathon, the Two Oceans, and hundreds of community walks, park runs, and charity cycling events held in towns and cities across the country every weekend. Despite the enormous participation these events attract, many are still managed through paper-based registration, spreadsheets, and disconnected communication channels, leaving organisers overwhelmed and participants underserved.

## User Roles

### Organiser
- Can create, edit, and delete events
- Manage event categories
- Capture participant results
- View all event enrolments

### Participant
- Can create an account
- Browse events
- Enter an event by selecting a category
- View their own enrolments
- Track their personal results

## CI/CD Status
![CI/CD Build Status](docs/build-success.pdf)

## Video Presentation
[Watch the video presentation](https://youtu.be/KqxWvknWC4c?si=BOLVHTYm2c9sinkX)

## Setup Instructions

### Prerequisites
- SQL Server Management Studio (SSMS)
- Git
- .NET SDK (for Part 2 and 3)
- Docker (for Part 3)

### Database Setup
1. Open SQL Server Management Studio (SSMS)
2. Run the SQL script in `/docs/RaceDay_Schema_Seed.sql`
3. Verify that all tables are created successfully
4. Check that sample data is inserted

### Clone the Repository
```bash
git clone https://github.com/Pabii08/PROG6212-POE-ST10470146.git