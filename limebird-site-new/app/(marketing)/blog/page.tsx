import { PageContainer } from "@/components/page-container";

export default function BlogPage() {
  return (
    <PageContainer>
      <h1 className="mb-6 text-3xl font-bold">Blog</h1>
      <p className="mb-4 text-lg text-gray-600">
        Insights, updates, and stories from our team and community.
      </p>
      <div className="rounded-lg bg-gray-50 p-6">
        <h2 className="mb-4 text-xl font-semibold">Coming Soon</h2>
        <p className="text-gray-600">
          We&apos;re currently building out our blog. Check back soon for articles about tech support, productivity tips, industry insights, and company updates.
        </p>
      </div>
    </PageContainer>
  );
} 