# RaceDay - Event Management System

## Project Description
RaceDay is a full-stack web-based event management system designed for the South African road running, walking, and cycling community. The platform allows Event Organisers to create and manage events, categories, and participant results, while Participants can browse upcoming events, enter events, track their personal performance history, and prepare for race day using live weather and route information.

## User Roles
- **Organiser**: Can create, edit, and delete events, manage event categories, capture participant results, and view all event enrolments.
- **Participant**: Can create an account, browse events, enter an event by selecting a category, view their own enrolments, and track their personal results.

## CI/CD Status
![CI/CD Build Status](docs/build-success.png)

## Video Presentation
[Watch the video presentation](https://www.youtube.com/watch?v=your-video-id)

## Setup Instructions

### Prerequisites
- SQL Server Management Studio (SSMS)
- Git
- .NET SDK (for Part 2 and 3)

### Database Setup
1. Open SQL Server Management Studio (SSMS)
2. Run the SQL script in `/docs/RaceDay_Schema_Seed.sql`
3. Verify that all tables are created successfully
4. Check that sample data is inserted

### Clone the Repository
```bash
git clone https://github.com/Pabii08/PROG6212-POE-ST10470146.git
