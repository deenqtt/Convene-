# Convene

> Meeting management app by Nexus — available on Web and Mobile.

---

## Overview

Convene is a meeting management application that lets teams create, schedule, and track meetings with ease. Built with a dark-first design and powered by the NexaBrick backend.

**Platforms:**
- Web — Next.js (App Router, TypeScript, Tailwind CSS)
- Mobile — Flutter (Android & iOS)
- Backend — NexaBrick API (`https://nexabrick.com`)

---

## Project Structure

```
meeting/
├── web/          # Next.js web app
├── mobile/       # Flutter mobile app
├── icon/         # App icon assets
└── preview/      # Design preview screens
```

---

## Web App (`/web`)

### Tech Stack
- Next.js 16 (App Router)
- TypeScript
- Tailwind CSS
- Lucide React (icons)

### Features
- Dashboard with today's meeting summary
- Create New Meeting (full form)
- Quick Add Meeting (chip-based, fast input)
- Calendar view
- Contacts
- Settings
- Dark mode throughout
- Mobile responsive

### Getting Started

```bash
cd web
npm install
cp .env.example .env.local
npm run dev
```

### Environment Variables

```env
NEXT_PUBLIC_NEXUS_API_URL=https://nexabrick.com
```

---

## Mobile App (`/mobile`)

### Tech Stack
- Flutter 3.x / Dart 3.x
- GoRouter (navigation)
- HTTP (REST client)
- SharedPreferences (token storage)
- Material Icons

### Features
- Dashboard with today's meeting banner
- Create New Meeting
- Quick Add Meeting
- Calendar view
- Contacts
- Settings
- iOS 26-style glass morphism bottom navigation
- Edge-to-edge UI
- Dark theme

### Getting Started

```bash
cd mobile
flutter pub get
flutter run
```

> To see the launcher icon update, uninstall the app first then run again.

---

## Backend (NexaBrick)

The API is hosted at `https://nexabrick.com` and built on the existing Nexus-WebApps project using Next.js API routes + Prisma + PostgreSQL.

### Endpoints

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/meetings` | List meetings |
| POST | `/api/meetings` | Create meeting |
| GET | `/api/meetings/:id` | Get meeting detail |
| PUT | `/api/meetings/:id` | Update meeting |
| DELETE | `/api/meetings/:id` | Cancel meeting |
| POST | `/api/meetings/:id/participants` | Add participant |
| DELETE | `/api/meetings/:id/participants/:userId` | Remove participant |
| GET | `/api/meetings/today` | Today's dashboard data |
| GET | `/api/meetings/upcoming` | Upcoming meetings |

### Authentication

Supports both:
- Cookie-based (web)
- Bearer token via `Authorization` header (mobile)

---

## App Icon

The app icon (`icon/grey.png`) is a blue rounded square with a clock symbol, representing time and scheduling.

---

## App Name

**Convene** — from the English word meaning *"to bring people together for a meeting."*
