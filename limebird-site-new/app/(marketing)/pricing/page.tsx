import { PageContainer } from "@/components/page-container";

export default function PricingPage() {
  return (
    <PageContainer>
      <h1 className="mb-6 text-3xl font-bold">Pricing</h1>
      <p className="mb-4 text-lg text-gray-600">
        Transparent pricing for our tech support services and software products.
      </p>
      <div className="rounded-lg bg-gray-50 p-6">
        <h2 className="mb-4 text-xl font-semibold">Coming Soon</h2>
        <p className="text-gray-600">
          We&apos;re currently building out our pricing page. Check back soon for detailed pricing information for our tech support services, software products, and subscription options.
        </p>
      </div>
    </PageContainer>
  );
}
