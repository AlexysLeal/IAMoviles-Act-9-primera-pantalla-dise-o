# Blueprint: Netflix Profile Screen Clone

## Overview

This document outlines the plan to create a Flutter application that mimics the Netflix user profile selection screen. The application will be built for both web and Android, featuring a responsive UI.

## Features & Design

*   **Theme:** A dark theme with a black background, red as the primary accent color, and white/grey text, consistent with Netflix's branding.
*   **Layout:**
    *   **AppBar:** A custom app bar displaying the "NETFLIX" logo and action icons for editing and options.
    *   **Main Title:** A centered text widget asking "Who are you? Choose your profile" ("¿Quién eres? Elige tu perfil").
    *   **Profile Grid:** A responsive grid that displays user profiles. It will show two profiles per row on mobile.
    *   **Profile Item:** Each item in the grid will consist of a colored container representing the user's avatar and the user's name below it.
    *   **Add Profile Button:** A dedicated item in the grid for adding a new profile, represented by a "+" icon and the text "Añadir perfil".
*   **Responsiveness:** The layout will adapt to different screen sizes, ensuring a good user experience on both mobile and web.

## Current Plan

1.  **Setup Theme:** Configure the `MaterialApp` to use a dark theme with appropriate colors.
2.  **Build Profile Screen:**
    *   Create a `ProfileScreen` widget.
    *   Use a `Scaffold` for the basic page structure.
    *   Implement a custom `AppBar`.
    *   Add the central title text.
    *   Use a `GridView.builder` to dynamically create the grid of profiles.
3.  **Create Profile Widgets:** Design a reusable widget for individual profile items and the "Add Profile" button.
4.  **Data Model:** Create a simple `Profile` class to store the name and avatar details for each user.
