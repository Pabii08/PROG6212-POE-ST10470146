# RaceDay Database Relationships

## Entity Relationships

### User → Event (One-to-Many)
- One Organiser can create many Events
- Foreign Key: Event.OrganiserId → User.UserId
- This allows organisers to manage multiple events

### Event → Category (One-to-Many)
- One Event can have many Categories
- Foreign Key: Category.EventId → Event.EventId
- This allows events to have different race types (e.g., 42km, 21km)

### User → Enrolment (One-to-Many)
- One Participant can have many Enrolments
- Foreign Key: Enrolment.ParticipantId → User.UserId
- This allows participants to enter multiple events

### Category → Enrolment (One-to-Many)
- One Category can have many Enrolments
- Foreign Key: Enrolment.CategoryId → Category.CategoryId
- This tracks how many people enter each race category

### Enrolment → Result (One-to-One)
- One Enrolment has at most one Result
- Foreign Key: Result.EnrolmentId → Enrolment.EnrolmentId
- Each registration can have only one race result

### Event → WeatherInfo (One-to-One)
- One Event has at most one WeatherInfo
- Foreign Key: WeatherInfo.EventId → Event.EventId
- Weather data is stored per event for race day preparation

## Cardinality Summary

| From Entity | To Entity | Relationship |
|-------------|-----------|--------------|
| User (Organiser) | Event | One-to-Many |
| Event | Category | One-to-Many |
| User (Participant) | Enrolment | One-to-Many |
| Category | Enrolment | One-to-Many |
| Enrolment | Result | One-to-One |
| Event | WeatherInfo | One-to-One |