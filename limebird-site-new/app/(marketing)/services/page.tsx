import { PageContainer } from "@/components/page-container";

export default function ServicesPage() {
  return (
    <PageContainer>
      <h1 className="mb-6 text-3xl font-bold">Services</h1>
      <p className="mb-4 text-lg text-gray-600">
        Professional tech support and IT services for businesses and individuals.
      </p>
      <div className="rounded-lg bg-gray-50 p-6">
        <h2 className="mb-4 text-xl font-semibold">Coming Soon</h2>
        <p className="text-gray-600">
          We&apos;re currently building out our services page. Check back soon for detailed information about our tech support offerings, pricing, and how we can help with your IT needs.
        </p>
      </div>
    </PageContainer>
  );
} 