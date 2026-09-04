# RaceDay API Endpoint Plan

## Overview
This document outlines all RESTful API endpoints for the RaceDay system.

## Base URL
All endpoints are prefixed with: `/api`

---
# RaceDay API Endpoint Plan

## Authentication & User Profile

| HTTP Method | Route | Description | Role Required | Request Body | Expected Response |
|-------------|-------|-------------|---------------|--------------|-------------------|
| POST | /api/auth/register | Registers a new user | None (Public) | { email, password, firstName, lastName, role } | 201 Created - User object |
| POST | /api/auth/login | Authenticates user and returns JWT token | None (Public) | { email, password } | 200 OK - { token, user } |
| GET | /api/users/me | Gets current user's profile | Any (Logged-in) | None | 200 OK - User object |
| PUT | /api/users/me | Updates current user's profile | Any (Logged-in) | { firstName, lastName, email } | 200 OK - Updated User object |

## Events

| HTTP Method | Route | Description | Role Required | Request Body | Expected Response |
|-------------|-------|-------------|---------------|--------------|-------------------|
| GET | /api/events | Gets list of all events | None (Public) | None | 200 OK - List of Event objects |
| GET | /api/events/{id} | Gets details for specific event | None (Public) | None | 200 OK - Event object with categories |
| POST | /api/events | Creates a new event | Organiser | { name, description, date, location, maxParticipants } | 201 Created - New Event object |
| PUT | /api/events/{id} | Updates an existing event | Organiser | { name, description, date, location, maxParticipants, status } | 200 OK - Updated Event object |
| DELETE | /api/events/{id} | Deletes an event | Organiser | None | 204 No Content |

## Categories

| HTTP Method | Route | Description | Role Required | Request Body | Expected Response |
|-------------|-------|-------------|---------------|--------------|-------------------|
| POST | /api/events/{eventId}/categories | Adds a new category to an event | Organiser | { name, distanceKm, ageGroup, gender, entryFee } | 201 Created - New Category object |
| PUT | /api/categories/{id} | Updates a category | Organiser | { name, distanceKm, ageGroup, gender, entryFee } | 200 OK - Updated Category object |
| DELETE | /api/categories/{id} | Deletes a category | Organiser | None | 204 No Content |

## Enrolments

| HTTP Method | Route | Description | Role Required | Request Body | Expected Response |
|-------------|-------|-------------|---------------|--------------|-------------------|
| GET | /api/enrolments/me | Gets enrolments for logged-in participant | Participant | None | 200 OK - List of Enrolment objects |
| POST | /api/events/{eventId}/enrol | Enrols participant in event category | Participant | { categoryId } | 201 Created - New Enrolment object |
| PUT | /api/enrolments/{id}/cancel | Cancels participant's enrolment | Participant | None | 200 OK - Updated Enrolment object |
| GET | /api/events/{eventId}/enrolments | Gets all enrolments for an event | Organiser | None | 200 OK - List of Enrolment objects |

## Results

| HTTP Method | Route | Description | Role Required | Request Body | Expected Response |
|-------------|-------|-------------|---------------|--------------|-------------------|
| GET | /api/results/me | Gets logged-in participant's results | Participant | None | 200 OK - List of Result objects |
| GET | /api/events/{eventId}/results | Gets all results for an event | Organiser | None | 200 OK - List of Result objects |
| POST | /api/results | Captures participant's result | Organiser | { enrolmentId, finishTime, overallPosition, categoryPosition, status } | 201 Created - Result object |