# Security Policy

## Supported Versions

| Version | Supported |
|---------|-----------|
| 1.x     | ✅ Yes    |
| < 1.0   | ❌ No     |

## Reporting a Vulnerability

If you discover a security vulnerability in the RaceDay system, please report it responsibly:

### How to Report
1. **Email**: ST10470146@RCCONNECT.EDU.ZA
2. **Subject**: [SECURITY] RaceDay Vulnerability Report
3. **Include**:
   - Description of the vulnerability
   - Steps to reproduce
   - Potential impact
   - Suggested fix (if any)

### What to Expect
- **Acknowledgment**: Within 48 hours
- **Investigation**: Within 7 days
- **Update**: Regular status updates

### Responsible Disclosure
- Please allow time to fix the issue before public disclosure
- We will credit reporters who follow responsible disclosure

## Security Best Practices
- All passwords are hashed using BCrypt
- JWT tokens for authentication
- HTTPS for all communications
- Role-based access control (RBAC)
- Input validation on all endpoints
- SQL injection protection via Entity Framework