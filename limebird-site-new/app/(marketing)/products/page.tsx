import { PageContainer } from "@/components/page-container";

export default function ProductsPage() {
  return (
    <PageContainer>
      <h1 className="mb-6 text-3xl font-bold">Products</h1>
      <p className="mb-4 text-lg text-gray-600">
        Innovative software solutions and tools to streamline your workflow.
      </p>
      <div className="rounded-lg bg-gray-50 p-6">
        <h2 className="mb-4 text-xl font-semibold">Coming Soon</h2>
        <p className="text-gray-600">
          We&apos;re currently building out our products page. Check back soon for information about Taskmaster and other productivity tools we&apos;re developing.
        </p>
      </div>
    </PageContainer>
  );
} 