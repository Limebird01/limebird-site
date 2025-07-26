import { ReactNode } from "react";

interface PageContainerProps {
  children: ReactNode;
  className?: string;
  maxWidth?: "sm" | "md" | "lg" | "xl" | "2xl" | "3xl" | "4xl" | "5xl" | "6xl" | "7xl";
}

export function PageContainer({ 
  children, 
  className = "", 
  maxWidth = "3xl" 
}: PageContainerProps) {
  return (
    <main className={`
      w-full 
      max-w-${maxWidth} 
      mx-auto 
      px-4 
      sm:px-6 
      lg:px-8 
      py-6 
      lg:py-12
      ${className}
    `.trim()}>
      {children}
    </main>
  );
} 