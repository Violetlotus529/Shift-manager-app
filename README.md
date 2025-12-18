# Shift Manager App

A web application for managing work shifts using a calendar-based UI.

## Overview
Shift Manager App allows users to register and view work shifts in a monthly calendar format.
This application was created as a portfolio project to demonstrate Rails-based CRUD design,
deployment, and responsive UI handling.

## Live Demo
https://shift-manager-app-edah.onrender.com

## Highlights
- Implemented calendar-based shift management using Rails views and helpers
- Added client-side and server-side validation for holidays and unavailable dates
- Designed responsive UI with mobile-first adjustments and dark mode support

## Technical Challenges
- Handling holiday logic consistently between model and view
- Resolving CSS layout issues across breakpoints
- Configuring production deployment with PostgreSQL on Render

## Features
- Monthly calendar view of shifts
- Shift registration and detail display
- Responsive layout for mobile devices
- Deployed production environment with PostgreSQL

## Tech Stack
- Ruby 3.2.2
- Ruby on Rails 7.1
- PostgreSQL
- CSS / JavaScript
- Render (deployment)

## Notes
- Mobile view simplifies shift display to maintain calendar readability
- Environment variables are used for production database configuration

## Local Setup
```bash
bundle install
rails db:create db:migrate
rails s
```

## Detailed Setup
```bash
git clone <your-repo-url>
cd shift-manager-app
bundle install
yarn install
rails db:create db:migrate
bin/dev
```
```mermaid
erDiagram
  SHIFT {
    integer id
    date    work_date
    time    start_time
    time    end_time
    text    memo
    datetime created_at
    datetime updated_at
  }

