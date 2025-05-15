---
description: >-
  This page explains how the role-based access control system works in the
  Strikebot Dashboard.
---

# Role-Based Access Control

### Access Control Overview

The Strikebot Dashboard implements a strict role-based access control system to ensure that only authorized users can access specific features and data.

### Initial Access Restrictions

When the dashboard is first set up:

1. **Initial Access**:
   * Initially, only users with the **admin** role can access the dashboard
   * Other users will see an "Access Denied" message when attempting to log in
2. **First-Time Setup**:
   * The first admin user is designated during platform installation
   * This admin can then add additional users as needed

### User Roles

The dashboard supports different user roles with varying levels of access:

#### Admin Role

* Full access to all dashboard features
* Can add, edit, and remove users
* Can modify system settings
* Can approve or reject winners
* Can view all data and reports

#### Viewer Role

* Limited access to view data without modification capabilities
* Can view dashboards and reports
* Cannot make changes to users or settings
* Cannot approve or reject winners
* No access to sensitive financial information

### Role Permissions Matrix

The following table outlines specific permissions for each role:

| Feature             | Admin | Viewer  |
| ------------------- | ----- | ------- |
| View Dashboard      | ✓     | ✓       |
| View User List      | ✓     | ✓       |
| Edit Users          | ✓     | ✗       |
| Block Users         | ✓     | ✗       |
| Manage Teams        | ✓     | ✗       |
| View Transactions   | ✓     | ✓       |
| View Referrals      | ✓     | ✓       |
| Edit Referrals      | ✓     | ✗       |
| Approve Winners     | ✓     | ✗       |
| Modify Settings     | ✓     | ✗       |
| Access Admin Wallet | ✓     | ✗       |
| Export Data         | ✓     | Limited |

### Managing Users and Roles

To manage users and their roles:

1. Navigate to **Dashboard > Teams**
2. From here you can:
   * Add new admin users or viewers
   * Modify existing user roles
   * Remove users from teams when access is no longer needed

### Adding a New User

To add a new user with a specific role:

1. Click "Add User" button in the Teams section
2. Enter the user's information
3. Select the appropriate role from the dropdown
4. Save the changes

### Changing a User's Role

To change an existing user's role:

1. Find the user in the Teams section
2. Click "Edit" for that user
3. Select the new role from the dropdown
4. Save the changes

### Revoking Access

To remove a user's access to the dashboard:

1. Find the user in the Teams section
2. Click "Remove" for that user
3. Confirm the removal
4. The user will no longer be able to access the dashboard

### Access Logs

For security purposes, the system maintains detailed access logs:

* Login attempts (successful and failed)
* Feature access
* Changes to user permissions
* System setting modifications

Administrators can review these logs from the Security section of the dashboard.

### Best Practices for Access Control

* Regularly review user access and remove unnecessary accounts
* Assign the minimum necessary permissions for each user
* Change admin passwords periodically
* Monitor access logs for unusual activity
* Implement two-factor authentication for sensitive operations
