# 🚀 Next.js & Tailwind CSS Setup Guide

## Migration Note (2024-07)

**Main Site Architecture Update:**
- The main site now uses a static `.tsx`-based Pages Router architecture (no Contentlayer/MDX).
- All content is managed via `.tsx` files in the `pages/` directory.
- The blog subdomain (`blog.limebird.org`) will be implemented as a separate project using the latest recommended setup.

---

## 📋 Overview

### **Next.js**
- **React framework** for building web applications
- **Server-side rendering** and static site generation
- **File-based routing** (pages become routes automatically)
- **Built-in optimizations** for performance
- **API routes** for backend functionality

### **Tailwind CSS**
- **Utility-first CSS framework** (write styles as classes)
- **Responsive design** built-in
- **Customizable** design system
- **Small bundle size** (only includes used styles)
- **Developer-friendly** with IntelliSense support

---

## 🛠️ Global Installation (Completed)

### **✅ Installed Globally:**
```powershell
npm install -g create-next-app
```

### **✅ Tailwind CSS (Project-specific):**
Tailwind CSS is installed per-project, not globally. This is the recommended approach.

### **✅ Verification:**
```powershell
create-next-app --version
# Tailwind CSS will be available in projects via npx
```

---

## 🏗️ Creating New Projects

### **Option 1: Create Next.js Project with Tailwind (Recommended)**
```powershell
# Create new Next.js project with Tailwind CSS
npx create-next-app@latest my-project --typescript --tailwind --eslint

# Navigate to project
cd my-project

# Start development server
npm run dev
```

### **Option 2: Add Tailwind to Existing Project**
```powershell
# Install Tailwind CSS
npm install -D tailwindcss postcss autoprefixer

# Initialize Tailwind config
npx tailwindcss init -p

# Configure content paths in tailwind.config.js
# Add your template files to the content array
```

---

## 📁 Project Structure (Next.js + Tailwind)

### **✅ Typical Next.js Project Structure:**
```
my-project/
├── pages/                 # File-based routing
│   ├── index.js          # Home page (/)
│   ├── about.js          # About page (/about)
│   └── api/              # API routes
│       └── hello.js      # API endpoint (/api/hello)
├── components/            # React components
│   ├── Header.js
│   └── Footer.js
├── styles/               # CSS files
│   └── globals.css       # Global styles with Tailwind
├── public/               # Static assets
│   ├── images/
│   └── favicon.ico
├── tailwind.config.js    # Tailwind configuration
├── postcss.config.js     # PostCSS configuration
├── next.config.js        # Next.js configuration
├── package.json          # Dependencies
└── README.md
```

---

## 🎨 Tailwind CSS Usage

### **✅ Basic Tailwind Classes:**
```jsx
// Responsive container
<div className="container mx-auto px-4">

// Flexbox layout
<div className="flex items-center justify-between">

// Grid layout
<div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">

// Typography
<h1 className="text-3xl font-bold text-gray-900">
<p className="text-lg text-gray-600">

// Spacing
<div className="p-4 m-2 space-y-4">

// Colors and backgrounds
<div className="bg-blue-500 text-white hover:bg-blue-600">

// Responsive design
<div className="w-full md:w-1/2 lg:w-1/3">
```

### **✅ Custom Design System (Limebird Brand):**
```javascript
// tailwind.config.js
module.exports = {
  theme: {
    extend: {
      colors: {
        limebird: {
          500: '#667eea',
          600: '#5a6fd8',
          700: '#4b5cc7',
        },
        purple: {
          500: '#764ba2',
        }
      },
      fontFamily: {
        sans: ['-apple-system', 'BlinkMacSystemFont', 'Segoe UI', 'Roboto'],
      },
    },
  },
}
```