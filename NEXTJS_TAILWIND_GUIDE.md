# 🚀 Next.js & Tailwind CSS Setup Guide

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

---

## 🚀 Development Workflow

### **✅ Starting Development:**
```powershell
# Start development server
npm run dev

# Open in browser
Start-Process "http://localhost:3000"
```

### **✅ File-based Routing:**
```jsx
// pages/index.js - Home page (/)
export default function Home() {
  return <h1>Welcome to Limebird</h1>
}

// pages/about.js - About page (/about)
export default function About() {
  return <h1>About Limebird</h1>
}

// pages/blog/[slug].js - Dynamic blog posts (/blog/post-1)
export default function BlogPost({ params }) {
  return <h1>Blog Post: {params.slug}</h1>
}
```

### **✅ Tailwind Breakpoints:**
```css
/* Responsive design */
<div className="
  w-full          /* Mobile: 100% width */
  md:w-1/2        /* Tablet: 50% width */
  lg:w-1/3        /* Desktop: 33% width */
  xl:w-1/4        /* Large: 25% width */
">
```

### **✅ Responsive Utilities:**
```jsx
// Hide/show based on screen size
<div className="hidden md:block">Desktop only</div>
<div className="block md:hidden">Mobile only</div>

// Responsive text sizes
<h1 className="text-2xl md:text-4xl lg:text-6xl">Responsive heading</h1>

// Responsive spacing
<div className="p-4 md:p-8 lg:p-12">Responsive padding</div>
```

---

## 📝 Blog Subdomain Implementation

### **✅ For Blog Subdomain:**
```powershell
# Create blog project
npx create-next-app@latest limebird-blog --typescript --tailwind --eslint

# Navigate to project
cd limebird-blog

# Install additional dependencies
npm install @heroicons/react react-icons
npm install @headlessui/react @radix-ui/react-dialog

# Initialize shadcn/ui
npx shadcn-ui@latest init
```

### **✅ Blog-specific Features:**
```jsx
// Create components with brand styling
<BlogCard>
  <BlogImage src="/post-image.jpg" alt="Post title" />
  <BlogContent>
    <BlogTitle>Post Title</BlogTitle>
    <BlogExcerpt>Post excerpt...</BlogExcerpt>
    <BlogMeta>
      <BlogDate>January 20, 2025</BlogDate>
      <BlogCategory>Technology</BlogCategory>
    </BlogMeta>
  </BlogContent>
</BlogCard>
```

---

## 🛠️ Development Tools

### **✅ VS Code Extensions:**
- **Tailwind CSS IntelliSense** - Autocomplete for Tailwind classes
- **ES7+ React/Redux/React-Native snippets** - React shortcuts
- **Prettier - Code formatter** - Consistent code formatting
- **ESLint** - Code quality and error detection

### **✅ Browser Extensions:**
- **Tailwind CSS Debug Screens** - Visualize breakpoints
- **React Developer Tools** - Component inspection
- **Lighthouse** - Performance auditing

---

## 📚 Resources

### **✅ Next.js Documentation:**
- [Next.js Official Docs](https://nextjs.org/docs)
- [Next.js Examples](https://github.com/vercel/next.js/tree/canary/examples)

### **✅ Tailwind CSS Documentation:**
- [Tailwind CSS Official Docs](https://tailwindcss.com/docs)
- [Tailwind UI Components](https://tailwindui.com/)

### **✅ Tutorials:**
- [Next.js Tutorial](https://nextjs.org/learn)
- [Tailwind CSS Tutorial](https://tailwindcss.com/docs/guides/nextjs)

---

## 🚀 Blog Sprint Preparation

### **✅ Blog Sprint Preparation:**
- [ ] Run `npx create-next-app@latest limebird-blog`
- [ ] Install shadcn/ui components
- [ ] Set up Tailwind with brand colors
- [ ] Create blog-specific components
- [ ] Implement search and filtering
- [ ] Add content management features

### **✅ Future Projects:**
- [ ] Design system implementation
- [ ] Product pages (Taskmaster)
- [ ] Service pages (Tech support)
- [ ] Portfolio and case studies

---

*Status: Ready for Blog Sprint* 