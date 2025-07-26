import { MainNav } from "@/components/main-nav";
import { marketingConfig } from "@/config/marketing";
import { SiteFooter } from "@/components/site-footer";

export default function MarketingLayout({ children }: { children: React.ReactNode }) {
  return (
    <div className="flex min-h-screen flex-col">
      <header className="sticky top-0 z-40 w-full border-b bg-background">
        <div className="container flex h-16 items-center justify-between py-4">
          <MainNav items={marketingConfig.mainNav} />
        </div>
      </header>
      <main className="flex-1">
        {children}
      </main>
      <SiteFooter />
    </div>
  );
}
