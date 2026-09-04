# RaceDay Database Relationships

## Entity Relationships

### User → Event (One-to-Many)
- One Organiser can create many Events
- Foreign Key: Event.OrganiserId → User.UserId

### Event → Category (One-to-Many)
- One Event can have many Categories
- Foreign Key: Category.EventId → Event.EventId

### User → Enrolment (One-to-Many)
- One Participant can have many Enrolments
- Foreign Key: Enrolment.ParticipantId → User.UserId

### Category → Enrolment (One-to-Many)
- One Category can have many Enrolments
- Foreign Key: Enrolment.CategoryId → Category.CategoryId

### Enrolment → Result (One-to-One)
- One Enrolment has at most one Result
- Foreign Key: Result.EnrolmentId → Enrolment.EnrolmentId

### Event → WeatherInfo (One-to-One)
- One Event has at most one WeatherInfo
- Foreign Key: WeatherInfo.EventId → Event.EventId