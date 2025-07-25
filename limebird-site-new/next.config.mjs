/** @type {import('next').NextConfig} */
import "./env.mjs";

const nextConfig = {
  reactStrictMode: true,
  images: {
    domains: ["avatars.githubusercontent.com"],
  },
};

export default nextConfig;
