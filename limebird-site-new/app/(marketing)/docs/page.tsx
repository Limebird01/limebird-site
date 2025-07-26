import { PageContainer } from "@/components/page-container";

export default function DocsPage() {
  return (
    <PageContainer>
      <h1 className="mb-6 text-3xl font-bold">Documentation</h1>
      <p className="mb-4 text-lg text-gray-600">
        Guides, tutorials, and technical documentation for our services and products.
      </p>
      <div className="rounded-lg bg-gray-50 p-6">
        <h2 className="mb-4 text-xl font-semibold">Coming Soon</h2>
        <p className="text-gray-600">
          We&apos;re currently building out our documentation. Check back soon for guides, tutorials, API documentation, and technical resources for our services and products.
        </p>
      </div>
    </PageContainer>
  );
} 