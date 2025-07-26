import Link from "next/link"

import { cn } from "@/lib/utils"
import { buttonVariants } from "@/components/ui/button"
import { Icons } from "@/components/icons"

export const metadata = {
  title: "Test",
  description: "Test",
}

export default function PricingPage() {
  return (
    <main className="container max-w-3xl py-6 lg:py-12">
      <h1 className="mb-6 text-3xl font-bold">Pricing</h1>
      <p className="mb-4 text-lg text-gray-600">
        Transparent pricing for our tech support services and digital products.
      </p>
      <div className="rounded-lg bg-gray-50 p-6">
        <h2 className="mb-4 text-xl font-semibold">Coming Soon</h2>
        <p className="text-gray-600">
          We&apos;re currently building out our pricing page. Check back soon for detailed pricing information for our services and products.
        </p>
      </div>
    </main>
  );
}
