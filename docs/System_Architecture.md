# RaceDay System Architecture

## Overview
RaceDay is a full-stack web application built with modern technologies to provide a seamless event management experience for the South African road running, walking, and cycling community.

## Architecture Layers

### 1. Presentation Layer (Part 3)
- **Technology**: ASP.NET Core MVC
- **Purpose**: User interface for both Organisers and Participants
- **Features**:
  - Event browsing and search
  - User registration and login
  - Event enrolment management
  - Results viewing

### 2. Business Logic Layer (Part 2)
- **Technology**: RESTful API with C#
- **Purpose**: Handles all business rules and logic
- **Features**:
  - JWT Authentication
  - Role-based Authorization
  - Input validation
  - Business rule enforcement

### 3. Data Access Layer (Part 2)
- **Technology**: Entity Framework Core
- **Purpose**: Database operations and ORM
- **Features**:
  - CRUD operations
  - LINQ queries
  - Relationship management

### 4. Database Layer (Part 1)
- **Technology**: SQL Server
- **Purpose**: Data storage and persistence
- **Features**:
  - Six main entities
  - Proper relationships
  - Constraints and indexes

## Security Implementation

### Authentication
- JWT (JSON Web Tokens) for stateless authentication
- Token expiration for security

### Authorization
- Role-based access control (Organiser vs Participant)
- API endpoint protection

### Data Protection
- Password hashing (BCrypt or PBKDF2)
- HTTPS for secure communication
- Input sanitization

## Deployment Strategy

### Continuous Integration (CI)
- GitHub Actions workflow
- Automated validation on every push
- Repository structure checks

### Continuous Delivery (CD) - Part 3
- Docker containerization
- Azure Cloud deployment
- Azure Blob Storage for files

## Technology Stack Summary

| Layer | Technology | Part |
|-------|------------|------|
| Frontend | ASP.NET Core MVC | Part 3 |
| Backend | C# .NET Core REST API | Part 2 |
| Database | SQL Server | Part 1 |
| ORM | Entity Framework Core | Part 2 |
| Authentication | JWT | Part 2 |
| Cloud | Azure | Part 3 |
| Containerization | Docker | Part 3 |
| CI/CD | GitHub Actions | All |

## Data Flow

1. **User Request** → MVC Controller (Part 3)
2. **MVC Controller** → API Call (Part 2)
3. **API Controller** → Entity Framework (Part 2)
4. **Entity Framework** → SQL Server (Part 1)
5. **Response** → User Interface (Part 3)