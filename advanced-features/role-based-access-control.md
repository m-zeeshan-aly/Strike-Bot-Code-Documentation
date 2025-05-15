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

* Limited access to view data without modification



### Role Permissions Matrix

The following table outlines specific permissions for each role:

| Feature             | Admin | Viewer |
| ------------------- | ----- | ------ |
| View Dashboard      | ✓     | ✓      |
| View User List      | ✓     | ✗      |
| Edit Users          | ✓     | ✗      |
| Block Users         | ✓     | ✗      |
| Manage Teams        | ✓     | ✗      |
| View Transactions   | ✓     | ✗      |
| View Referrals      | ✓     | ✗      |
| Edit Referrals      | ✓     | ✗      |
| Approve Winners     | ✓     | ✗      |
| Modify Settings     | ✓     | ✗      |
| Access Admin Wallet | ✓     | ✗      |
