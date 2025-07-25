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
    <div className="flex gap-6 md:gap-10">
      <nav className="flex gap-6 md:gap-10">
        {items?.map((item, index) => (
          <Link
            key={index}
            href={item.disabled ? "#" : item.href}
            data-cy={`nav-link-${item.title.toLowerCase()}`}
            className={clsx(
              "flex items-center font-medium transition-colors hover:text-foreground/80 text-lg sm:text-sm"
            )}
          >
            {item.title}
          </Link>
        ))}
      </nav>
      <button
        className="flex items-center space-x-2 md:hidden"
        onClick={() => setShowMobileMenu(!showMobileMenu)}
      >
        <span className="font-bold">Menu</span>
      </button>
      {showMobileMenu && items && (
        <MobileNav items={items}>{children}</MobileNav>
      )}
    </div>
  );
}
