# Frontend Technologies

The Strikebot Dashboard uses a collection of modern frontend technologies to create a responsive, accessible, and feature-rich user interface.

## UI Components: Shadcn-ui

[Shadcn-ui](https://ui.shadcn.com) provides the foundation for most UI components in the dashboard. While not a traditional component library, it's a collection of accessible and customizable UI components built with Radix UI and Tailwind CSS.

### Key Features
- **Accessibility** - Components follow WAI-ARIA guidelines
- **Customization** - Components can be easily styled and extended
- **Component Source Control** - Components are added directly to the codebase, allowing full control
- **Modern Design** - Clean, minimal aesthetic that serves as a great foundation

### Implementation
Components are imported directly into the project and customized to match the dashboard's design system. This approach allows for full control over the components and their styling.

### Core Components Used
- Buttons, Cards, and Form inputs
- Dialog and Modal components
- Dropdowns and Select menus
- Tables and Data Grids
- Toast notifications
- Navigation components

## State Management: Zustand

[Zustand](https://zustand-demo.pmnd.rs) is used for global state management throughout the application.

### Why Zustand?
- **Simplicity** - Simple API with minimal boilerplate
- **Performance** - Efficient updates with React hooks
- **TypeScript Support** - Excellent TypeScript integration
- **Size** - Tiny footprint (< 1KB)

### Implementation
The application uses multiple stores for different aspects of the application:

```typescript
// Example Zustand store
import { create } from 'zustand';

interface SidebarState {
  isOpen: boolean;
  toggleSidebar: () => void;
}

export const useSidebarStore = create<SidebarState>((set) => ({
  isOpen: true,
  toggleSidebar: () => set((state) => ({ isOpen: !state.isOpen })),
}));
```

## Forms: React Hook Form with Zod

Form handling is managed with the combination of [React Hook Form](https://react-hook-form.com/) and [Zod](https://zod.dev) for validation.

### Benefits
- **Performance** - Uncontrolled components for better performance
- **Validation** - Type-safe validation with Zod
- **Error Handling** - Comprehensive error handling
- **TypeScript Integration** - Excellent TypeScript support

### Implementation Example
```typescript
import { useForm } from 'react-hook-form';
import { zodResolver } from '@hookform/resolvers/zod';
import { z } from 'zod';

const formSchema = z.object({
  email: z.string().email(),
  password: z.string().min(8),
});

type FormValues = z.infer<typeof formSchema>;

export function LoginForm() {
  const { register, handleSubmit, formState: { errors } } = useForm<FormValues>({
    resolver: zodResolver(formSchema),
  });
  
  const onSubmit = (data: FormValues) => {
    // Handle submission
  };
  
  return (
    // Form implementation
  );
}
```

## Tables: TanStack Table

[TanStack Table](https://tanstack.com/table) (formerly React Table) is used for all table and data grid functionality in the dashboard.

### Features Used
- **Sorting** - Multi-column sorting
- **Filtering** - Advanced filtering options
- **Pagination** - Client and server-side pagination
- **Row Selection** - Single and multi-row selection
- **Column Resizing** - Adjustable column widths
- **Virtualization** - For handling large datasets efficiently

### Implementation
Tables are implemented using a combination of TanStack Table hooks and custom UI components:

```typescript
import { useReactTable, getCoreRowModel, flexRender } from '@tanstack/react-table';

// Table implementation example
```

## Charts: Recharts

[Recharts](https://recharts.org/) is used for data visualization throughout the dashboard.

### Chart Types Implemented
- **Line Charts** - For time series data
- **Bar Charts** - For comparative data
- **Pie Charts** - For proportion data
- **Area Charts** - For cumulative data over time
- **Scatter Plots** - For correlation data

### Features
- **Responsiveness** - Charts adapt to container size
- **Animations** - Smooth transitions and animations
- **Customization** - Extensive styling options
- **Interaction** - Interactive tooltips and click events

## Drag and Drop: dnd-kit

[dnd-kit](https://dndkit.com/) powers the Kanban board functionality and other drag-and-drop interfaces in the dashboard.

### Key Features
- **Accessibility** - Fully accessible drag and drop
- **Touch Support** - Works on mobile devices
- **Performance** - Optimized for smooth performance
- **Customization** - Flexible API for custom interactions
