# Changelog

## Part 1 - System Planning (2026-09-04)

### Added
- Entity Relationship Diagram (ERD) with 6 entities
  - User (Organisers and Participants)
  - Event
  - Category
  - Enrolment
  - Result
  - WeatherInfo
- Complete API endpoint plan with role-based access
- SQL database schema with all constraints
- Sample data for testing (2 Organisers, 2 Participants, 3 Events)
- GitHub Actions CI/CD workflow for validation
- README with comprehensive project documentation
- System architecture documentation
- Database relationships documentation

### Fixed
- ERD file naming to match CI/CD workflow expectations
- CI/CD workflow validation errors

### Changed
- Updated README with detailed system overview
- Enhanced SQL script with additional sample data

### Next Steps (Part 2)
- Build RESTful API in C#
- Implement JWT authentication
- Write unit tests
- Connect to database