"use client";

import * as React from "react";
import Link from "next/link";
import { MainNavItem } from "types";
import { MobileNav } from "@/components/mobile-nav";
import clsx from "clsx";

interface MainNavProps {
  items?: MainNavItem[];
  children?: React.ReactNode;
}

export function MainNav({ items, children }: MainNavProps) {
  const [showMobileMenu, setShowMobileMenu] = React.useState<boolean>(false);

  return (
    <div className="flex w-full items-center justify-between">
      <div className="flex items-center">
        <Link href="/" className="flex items-center space-x-2">
          <span className="text-xl font-bold">Limebird</span>
        </Link>
      </div>
      
      {/* Desktop Navigation */}
      <nav className="hidden gap-6 md:flex lg:gap-10">
        {items?.map((item, index) => (
          <Link
            key={index}
            href={item.disabled ? "#" : item.href}
            data-cy={`nav-link-${item.title.toLowerCase()}`}
            className={clsx(
              "flex items-center text-sm font-medium transition-colors hover:text-foreground/80"
            )}
          >
            {item.title}
          </Link>
        ))}
      </nav>

      {/* Mobile Menu Button */}
      <button
        className="flex items-center space-x-2 md:hidden"
        onClick={() => setShowMobileMenu(!showMobileMenu)}
        aria-label="Toggle mobile menu"
      >
        <span className="font-bold">Menu</span>
      </button>

      {/* Mobile Navigation */}
      {showMobileMenu && items && (
        <MobileNav items={items}>{children}</MobileNav>
      )}
    </div>
  );
}
