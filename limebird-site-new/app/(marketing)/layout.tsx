import { MainNav } from "@/components/main-nav";
import { marketingConfig } from "@/config/marketing";
import { SiteFooter } from "@/components/site-footer";

export default function MarketingLayout({ children }: { children: React.ReactNode }) {
  return (
    <>
      <MainNav items={marketingConfig.mainNav} />
      {children}
      <SiteFooter />
    </>
  );
}
