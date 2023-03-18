# DocHUB

## Introduction

This application is designed for managing patient information. The application allows users to log in, change their password, add new patients, and view a list of existing patients. 

## Table of Contents

1. [Dependencies](#1-dependencies)
2. [LoginPage](#2-loginpage)
3. [HomePage](#3-homepage)
4. [ChangePasswordPage](#4-changepasswordpage)
5. [AddPatientPage](#5-addpatientpage)
6. [PatientListPage](#6-patientlistpage)

## 1. Dependencies

In this project, we used the following packages:

- `font_awesome_flutter: ^10.1.0`
- `google_fonts: ^3.0.1`
- `get: ^4.6.5`
- `shared_preferences: ^2.0.15`

## 2. LoginPage

The LoginPage allows users to log in to the application by providing their email and password. If the user is already logged in, they will be redirected to the HomePage.

### Features

- Email input field
- Password input field
- Login button

### Workflow

1. User inputs their email and password.
2. Upon clicking the "Log In" button, the input is validated, and the login process is initiated.
3. If successful, the user is redirected to the HomePage.

## 3. HomePage

The HomePage serves as the main navigation hub for the application. From here, the user can access the ChangePasswordPage, AddPatientPage, and PatientListPage.

## 4. ChangePasswordPage

This page allows the user to change their password. The user is required to input their old password, new password, and confirm the new password. Upon successful validation and password change, the user will be redirected to the HomePage.

### Features

- Old password input field
- New password input field
- Confirm new password input field
- Change password button

### Workflow

1. User inputs the old password, new password, and confirm new password.
2. Upon clicking the "Change Password" button, the input is validated, and the password change process is initiated.
3. If successful, the user is redirected to the HomePage.

## 5. AddPatientPage

The AddPatientPage allows the user to add a new patient by providing the patient's information, such as name, age, weight, and disease. After successful submission, the user is redirected to the PatientListPage.

### Features

- Patient name input field
- Patient age input field
- Patient weight input field
- Patient disease input field
- Add patient button

### Workflow

1. User inputs patient information (name, age, weight, disease).
2. Upon clicking the "Add Patient" button, the input is validated, and the patient is added to the database.
3. If successful, the user is redirected to the PatientListPage.

## 6. PatientListPage

This page displays a list of patients, which can be filtered using the search bar. The user can also navigate to the AddPatientPage by clicking on a patient's card.

### Features

- Search bar for filtering patients
- List of patient cards
- Navigation to AddPatientPage

### Workflow

1. User can search for a specific patient using the search bar.
2. The list of patients will be filtered based on the search query.
3. By clicking on a patient's card, the user is navigated to the AddPatientPage.
