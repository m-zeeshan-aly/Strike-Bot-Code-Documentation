# Component Library

This section provides comprehensive documentation for the frontend components used in the Strikebot Dashboard.

## Overview

The Strikebot Dashboard uses a modular component architecture to ensure maintainability, reusability, and consistency throughout the application. Components are organized into several categories:

- [UI Components](#ui-components): Basic UI elements built with shadcn-ui
- [Chart Components](#chart-components): Data visualization components built with Recharts
- [Form Components](#form-components): Input and form-related components
- [Layout Components](#layout-components): Page layout and structural components
- [Table Components](#table-components): Data table components built with TanStack Table
- [Kanban Components](#kanban-components): Kanban board components built with dnd-kit
- [Modal Components](#modal-components): Modal dialog components

## UI Components

UI components are built using shadcn-ui, a collection of accessible and customizable UI components. These components provide the building blocks for the dashboard interface.

### Button

The Button component is used for actions and form submissions.

**Usage:**

```tsx
import { Button } from '@/components/ui/button';

// Primary button
<Button>Click Me</Button>

// Secondary button
<Button variant="secondary">Click Me</Button>

// Outline button
<Button variant="outline">Click Me</Button>

// Destructive button
<Button variant="destructive">Delete</Button>
```

**Props:**

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `variant` | `'default' \| 'destructive' \| 'outline' \| 'secondary' \| 'ghost' \| 'link'` | `'default'` | The variant of the button |
| `size` | `'default' \| 'sm' \| 'lg'` | `'default'` | The size of the button |
| `asChild` | `boolean` | `false` | Whether to render as a child component |

### Card

The Card component is used to group related information.

**Usage:**

```tsx
import { Card, CardHeader, CardTitle, CardDescription, CardContent, CardFooter } from '@/components/ui/card';

<Card>
  <CardHeader>
    <CardTitle>Card Title</CardTitle>
    <CardDescription>Card Description</CardDescription>
  </CardHeader>
  <CardContent>
    <p>Card Content</p>
  </CardContent>
  <CardFooter>
    <p>Card Footer</p>
  </CardFooter>
</Card>
```

### Data Table

The Data Table component is used to display and interact with tabular data.

**Usage:**

```tsx
import { DataTable } from '@/components/ui/data-table';
import { columns } from './columns';

<DataTable columns={columns} data={data} />
```

**Props:**

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `columns` | `ColumnDef[]` | Required | The column definitions for the table |
| `data` | `T[]` | Required | The data to display in the table |
| `searchKey` | `string` | - | The key to search in the data |
| `searchPlaceholder` | `string` | - | The placeholder for the search input |
| `pagination` | `boolean` | `true` | Whether to show pagination |

## Chart Components

Chart components are built using Recharts and provide data visualization capabilities.

### Area Graph

The Area Graph component is used to display data trends over time.

**Usage:**

```tsx
import { AreaGraph } from '@/components/charts/area-graph';

<AreaGraph
  data={data}
  xDataKey="date"
  yDataKey="value"
  fill="#8884d8"
  stroke="#8884d8"
  height={300}
/>
```

**Props:**

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `data` | `object[]` | Required | The data for the chart |
| `xDataKey` | `string` | Required | The key for the x-axis data |
| `yDataKey` | `string` | Required | The key for the y-axis data |
| `fill` | `string` | `'#8884d8'` | The fill color for the area |
| `stroke` | `string` | `'#8884d8'` | The stroke color for the line |
| `height` | `number` | `300` | The height of the chart |

### Bar Graph

The Bar Graph component is used to compare values across categories.

**Usage:**

```tsx
import { BarGraph } from '@/components/charts/bar-graph';

<BarGraph
  data={data}
  xDataKey="category"
  yDataKey="value"
  fill="#82ca9d"
  height={300}
/>
```

### Pie Graph

The Pie Graph component is used to show proportions of a whole.

**Usage:**

```tsx
import { PieGraph } from '@/components/charts/pie-graph';

<PieGraph
  data={data}
  dataKey="value"
  nameKey="name"
  colors={['#0088FE', '#00C49F', '#FFBB28', '#FF8042']}
  height={300}
/>
```

## Form Components

Form components are built using React Hook Form and Zod for validation.

### User Auth Form

The User Auth Form component is used for authentication.

**Usage:**

```tsx
import { UserAuthForm } from '@/components/forms/user-auth-form';

<UserAuthForm />
```

### New User Form

The New User Form component is used to create new users.

**Usage:**

```tsx
import { NewUserForm } from '@/components/forms/new-user-form';

<NewUserForm onSuccess={handleSuccess} />
```

**Props:**

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `onSuccess` | `(data: User) => void` | Required | Callback when form is successfully submitted |
| `defaultValues` | `Partial<User>` | `{}` | Default values for the form |

### User Profile Stepper

The User Profile Stepper component is a multi-step form for user profiles.

**Usage:**

```tsx
import { UserProfileStepper } from '@/components/forms/user-profile-stepper';

<UserProfileStepper userId={userId} />
```

**Props:**

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `userId` | `string` | Required | The ID of the user |

## Layout Components

Layout components provide the structure for the dashboard.

### Header

The Header component displays the top navigation bar.

**Usage:**

```tsx
import { Header } from '@/components/layout/header';

<Header title="Dashboard" />
```

### Sidebar

The Sidebar component provides navigation for the dashboard.

**Usage:**

```tsx
import { Sidebar } from '@/components/layout/sidebar';

<Sidebar />
```

### Page Container

The Page Container component provides a consistent layout for pages.

**Usage:**

```tsx
import { PageContainer } from '@/components/layout/page-container';

<PageContainer title="Dashboard">
  <p>Content goes here</p>
</PageContainer>
```

**Props:**

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `title` | `string` | Required | The title of the page |
| `description` | `string` | - | The description of the page |
| `children` | `ReactNode` | Required | The content of the page |

## Table Components

Table components are specialized components for displaying and managing specific types of data.

### Users Table

The Users Table component displays and manages user data.

**Usage:**

```tsx
import { UsersTable } from '@/components/tables/users';

<UsersTable />
```

### Teams Table

The Teams Table component displays and manages team data.

**Usage:**

```tsx
import { TeamsTable } from '@/components/tables/teams';

<TeamsTable />
```

### Transactions Table

The Transactions Table component displays and manages transaction data.

**Usage:**

```tsx
import { TransactionsTable } from '@/components/tables/transactions';

<TransactionsTable />
```

## Kanban Components

Kanban components provide drag-and-drop functionality for task management.

### Kanban Board

The Kanban Board component displays and manages tasks in a kanban-style board.

**Usage:**

```tsx
import { KanbanBoard } from '@/components/kanban/kanban-board';

<KanbanBoard tasks={tasks} onTaskMove={handleTaskMove} />
```

**Props:**

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `tasks` | `Task[]` | Required | The tasks to display |
| `onTaskMove` | `(taskId: string, sourceColumn: string, targetColumn: string) => void` | Required | Callback when a task is moved |

### Board Column

The Board Column component represents a column in the kanban board.

**Usage:**

```tsx
import { BoardColumn } from '@/components/kanban/board-column';

<BoardColumn title="To Do" tasks={todoTasks} />
```

### Task Card

The Task Card component represents a task in the kanban board.

**Usage:**

```tsx
import { TaskCard } from '@/components/kanban/task-card';

<TaskCard task={task} />
```

## Modal Components

Modal components display content in a modal dialog.

**Usage:**

```tsx
import { Modal } from '@/components/modal';

<Modal isOpen={isOpen} onClose={handleClose} title="Modal Title">
  <p>Modal content goes here</p>
</Modal>
```

**Props:**

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `isOpen` | `boolean` | Required | Whether the modal is open |
| `onClose` | `() => void` | Required | Callback when the modal is closed |
| `title` | `string` | Required | The title of the modal |
| `children` | `ReactNode` | Required | The content of the modal |

## Best Practices

When working with components in the Strikebot Dashboard, follow these best practices:

1. **Composition Over Inheritance**: Prefer composing components together rather than extending them.
2. **Keep Components Small**: Each component should have a single responsibility.
3. **Use TypeScript**: Define proper types for props to ensure type safety.
4. **Write Tests**: Each component should have unit tests to ensure correct functionality.
5. **Document Props**: Document all props with descriptions, types, and default values.
6. **Use Storybook**: For complex components, create Storybook stories to showcase different states and variations.
