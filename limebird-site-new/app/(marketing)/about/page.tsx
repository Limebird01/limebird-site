import { PageContainer } from "@/components/page-container";

export default function AboutPage() {
  return (
    <PageContainer>
      <h1 className="mb-6 text-3xl font-bold">About</h1>
      <p className="mb-4 text-lg text-gray-600">
        Learn more about our mission, team, and commitment to providing exceptional tech support.
      </p>
      <div className="rounded-lg bg-gray-50 p-6">
        <h2 className="mb-4 text-xl font-semibold">Coming Soon</h2>
        <p className="text-gray-600">
          We&apos;re currently building out our about page. Check back soon to learn more about our company, team, mission, and the story behind Limebird.
        </p>
      </div>
    </PageContainer>
  );
} 