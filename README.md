# Shift Manager App

Shift scheduling application created as a portfolio project.

## Overview
A simple application to manage shift registration and scheduling.

## Tech Stack
- Ruby 3.2.2
- Rails 7.x
- SQLite3
- JavaScript (Stimulus planned)
- Node.js / Yarn

## Features (planned)
- User registration (optional)
- Shift creation
- Shift editing
- Shift list
- Calendar display (planned)
- Validation
- Responsive layout

## Setup

```bash
git clone <your-repo-url>
cd shift-manager-app
bundle install
yarn install
rails db:create db:migrate
bin/dev
erDiagram
  USER {
    integer id
    string  name
    string  email
    datetime created_at
    datetime updated_at
  }

  SHIFT {
    integer id
    integer user_id
    date    work_date
    time    start_time
    time    end_time
    text    memo
    datetime created_at
    datetime updated_at
  }

  USER ||--o{ SHIFT : has
