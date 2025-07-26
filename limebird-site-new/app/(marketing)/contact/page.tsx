import { PageContainer } from "@/components/page-container";

export default function ContactPage() {
  return (
    <PageContainer>
      <h1 className="mb-6 text-3xl font-bold">Contact</h1>
      <p className="mb-4 text-lg text-gray-600">
        Get in touch with us for tech support, business inquiries, or general questions.
      </p>
      <div className="rounded-lg bg-gray-50 p-6">
        <h2 className="mb-4 text-xl font-semibold">Coming Soon</h2>
        <p className="text-gray-600">
          We&apos;re currently building out our contact page. Check back soon for contact forms, business inquiry options, and ways to get in touch with our team.
        </p>
      </div>
    </PageContainer>
  );
} 