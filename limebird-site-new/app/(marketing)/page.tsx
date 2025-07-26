// Minimal static marketing landing page after migration
export default function MarketingPage() {
  return (
    <main className="container max-w-3xl py-6 lg:py-12">
      <h1>Welcome to Limebird.org</h1>
      <p>This is the marketing landing page. Please use the navigation to access services, products, terms, and privacy pages.</p>
      <p className="mt-4 text-sm text-gray-500">Last updated: {new Date().toLocaleString()}</p>
    </main>
  );
}
