# Limebird Design System

A comprehensive design system for Limebird.org projects, providing reusable components, utilities, and testing tools that can be safely referenced by other projects without interference.

## 🎯 **Purpose**

This design system serves as the foundation for all Limebird.org projects, providing:
- **Shared Components** - Reusable UI components with consistent styling
- **Utility Functions** - Common utilities for class management and responsive design
- **Icon System** - Centralized icon management with Heroicons and React Icons
- **Testing Tools** - Automated testing setup with Jest, Cypress, and accessibility tools
- **Development Tools** - ESLint, Prettier, and other development utilities

## 🏗️ **Architecture**

### **Isolated Design System**
- **Self-contained** - All dependencies and configurations are internal
- **No global pollution** - Components don't affect other projects
- **Version controlled** - Changes are tracked and documented
- **Referenceable** - Other projects can import components safely

### **Project Structure**
```
limebird-design-system/
├── components/ui/          # Base UI components
│   ├── button.tsx         # Button component with variants
│   └── ...                # Other components
├── lib/                   # Utility functions
│   ├── utils.ts           # Class name utilities
│   └── icons.ts           # Icon management
├── __tests__/             # Test files
│   └── components/        # Component tests
├── cypress/               # E2E testing
│   ├── e2e/              # End-to-end tests
│   └── support/          # Test support files
└── package.json          # Dependencies and scripts
```

## 🚀 **Getting Started**

### **For Design System Development:**
```powershell
# Navigate to design system
cd limebird-design-system

# Install dependencies
npm install

# Start development server
npm run dev

# Run tests
npm test

# Run E2E tests
npm run cypress:open
```

### **For Other Projects to Reference:**
```powershell
# In your project, you can reference components like this:
import { Button } from '../limebird-design-system/components/ui/button'
import { cn } from '../limebird-design-system/lib/utils'
import { HomeIcon } from '../limebird-design-system/lib/icons'
```

## 🧪 **Testing Strategy**

### **Automated Testing Tools:**
- **Jest** - Unit and component testing
- **React Testing Library** - Component testing utilities
- **Cypress** - End-to-end testing
- **Percy** - Visual regression testing
- **axe-core** - Accessibility testing

### **Test Commands:**
```powershell
# Unit tests
npm test

# Watch mode
npm run test:watch

# Coverage report
npm run test:coverage

# E2E tests
npm run cypress:run

# Visual testing
npm run percy:test
```

## 🎨 **Component System**

### **Base Components:**
- **Button** - Multiple variants (default, destructive, outline, etc.)
- **Icon** - Consistent icon sizing and styling
- **Utilities** - Class name management and responsive helpers

### **Component Features:**
- **TypeScript** - Full type safety
- **Variants** - Multiple styling options
- **Accessibility** - ARIA attributes and keyboard navigation
- **Responsive** - Mobile-first design
- **Customizable** - Props for customization

## 🔧 **Development Tools**

### **Code Quality:**
- **ESLint** - Code linting and error detection
- **Prettier** - Code formatting
- **TypeScript** - Type checking
- **Jest** - Test coverage reporting

### **Performance:**
- **Bundle analyzer** - Size optimization (when needed)
- **Webpack** - Build optimization

## 📦 **Dependencies**

### **Core Dependencies:**
- **React 19** - Latest React version
- **Next.js 15** - Full-stack framework
- **TypeScript** - Type safety
- **Tailwind CSS** - Utility-first CSS

### **UI Libraries:**
- **Radix UI** - Accessible component primitives
- **Headless UI** - Unstyled accessible components
- **Heroicons** - Primary icon library
- **React Icons** - Supplementary icon library

### **Development Tools:**
- **Jest** - Testing framework
- **Cypress** - E2E testing
- **Percy** - Visual testing
- **axe-core** - Accessibility testing

## 🔒 **Safety Features**

### **Isolation:**
- **Private package** - Not published to npm
- **Local references** - Other projects import directly
- **No global state** - Components are stateless
- **Version control** - Changes tracked in Git

### **Compatibility:**
- **React 19 compatible** - Latest React features
- **TypeScript support** - Full type definitions
- **ES6+ syntax** - Modern JavaScript features
- **CSS-in-JS ready** - Works with styled-components

## 📚 **Documentation**

### **Component Documentation:**
Each component includes:
- **Props interface** - TypeScript definitions
- **Usage examples** - Code snippets
- **Variant options** - Available styling options
- **Accessibility notes** - ARIA and keyboard support

### **Testing Documentation:**
- **Test patterns** - Common testing approaches
- **Mock strategies** - Component mocking
- **Accessibility testing** - a11y testing patterns
- **Visual testing** - Percy integration

## 🚀 **Deployment**

### **Design System Updates:**
```powershell
# Build the design system
npm run build

# Run all tests
npm test && npm run cypress:run

# Deploy changes
git add .
git commit -m "Update design system components"
git push
```

### **Other Project Integration:**
```powershell
# In your project, pull latest design system
git pull origin main

# Update your imports if needed
# Components remain backward compatible
```

## 🎯 **Best Practices**

### **For Design System Development:**
- **Backward compatibility** - Don't break existing usage
- **Comprehensive testing** - Test all variants and edge cases
- **Documentation** - Keep docs updated with changes
- **Performance** - Monitor bundle size and performance

### **For Other Projects:**
- **Import specific components** - Don't import entire library
- **Use TypeScript** - Leverage type safety
- **Follow patterns** - Use established component patterns
- **Test integration** - Test your usage of design system

## 🔄 **Version Management**

### **Semantic Versioning:**
- **Major** - Breaking changes
- **Minor** - New features
- **Patch** - Bug fixes

### **Migration Guide:**
- **Breaking changes** - Document migration steps
- **Deprecation warnings** - Warn before removing features
- **Gradual migration** - Support multiple versions

---

*This design system is the foundation for all Limebird.org projects, providing consistent, accessible, and well-tested components that can be safely referenced without interference.*
