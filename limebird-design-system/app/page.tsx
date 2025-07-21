import { Button } from "@/components/ui/button"
import { Card, CardContent, CardDescription, CardFooter, CardHeader, CardTitle } from "@/components/ui/card"
import { Input } from "@/components/ui/input"
import { Textarea } from "@/components/ui/textarea"
import { Badge } from "@/components/ui/badge"
import { Alert, AlertDescription } from "@/components/ui/alert"
import { Progress } from "@/components/ui/progress"
import { Switch } from "@/components/ui/switch"
import { Checkbox } from "@/components/ui/checkbox"
import { HomeIcon, UserIcon, EnvelopeIcon, BellIcon } from '@heroicons/react/24/outline'

export default function Home() {
  return (
    <div className="min-h-screen bg-gray-50 p-8">
      <div className="max-w-4xl mx-auto space-y-8">
        {/* Header */}
        <div className="text-center">
          <h1 className="text-4xl font-bold text-gray-900 mb-4">Limebird Design System</h1>
          <p className="text-lg text-gray-600">Complete component library with shadcn/ui</p>
        </div>

        {/* Buttons */}
        <Card>
          <CardHeader>
            <CardTitle>Buttons</CardTitle>
            <CardDescription>All button variants and sizes</CardDescription>
          </CardHeader>
          <CardContent className="space-y-4">
            <div className="flex flex-wrap gap-4">
              <Button>Default Button</Button>
              <Button variant="secondary">Secondary</Button>
              <Button variant="destructive">Destructive</Button>
              <Button variant="outline">Outline</Button>
              <Button variant="ghost">Ghost</Button>
              <Button variant="link">Link</Button>
            </div>
            <div className="flex flex-wrap gap-4">
              <Button size="sm">Small</Button>
              <Button size="default">Default</Button>
              <Button size="lg">Large</Button>
            </div>
            <div className="flex flex-wrap gap-4">
              <Button>
                <HomeIcon className="h-4 w-4 mr-2" />
                With Icon
              </Button>
            </div>
          </CardContent>
        </Card>

        {/* Cards */}
        <Card>
          <CardHeader>
            <CardTitle>Cards</CardTitle>
            <CardDescription>Content containers with header, content, and footer</CardDescription>
          </CardHeader>
          <CardContent>
            <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
              <Card>
                <CardHeader>
                  <CardTitle>Product Card</CardTitle>
                  <CardDescription>Taskmaster - Project Management Tool</CardDescription>
                </CardHeader>
                <CardContent>
                  <p className="text-sm text-gray-600">Streamline your project management with our intuitive tool.</p>
                </CardContent>
                <CardFooter>
                  <Button size="sm">Learn More</Button>
                </CardFooter>
              </Card>
              <Card>
                <CardHeader>
                  <CardTitle>Blog Post</CardTitle>
                  <CardDescription>Latest insights and updates</CardDescription>
                </CardHeader>
                <CardContent>
                  <p className="text-sm text-gray-600">Discover the latest trends in project management and productivity.</p>
                </CardContent>
                <CardFooter>
                  <Button variant="outline" size="sm">Read More</Button>
                </CardFooter>
              </Card>
            </div>
          </CardContent>
        </Card>

        {/* Form Elements */}
        <Card>
          <CardHeader>
            <CardTitle>Form Elements</CardTitle>
            <CardDescription>Input fields, textareas, and form controls</CardDescription>
          </CardHeader>
          <CardContent className="space-y-4">
            <div className="space-y-2">
              <label className="text-sm font-medium">Name</label>
              <Input placeholder="Enter your name" />
            </div>
            <div className="space-y-2">
              <label className="text-sm font-medium">Message</label>
              <Textarea placeholder="Enter your message" />
            </div>
            <div className="flex items-center space-x-2">
              <Checkbox id="terms" />
              <label htmlFor="terms" className="text-sm">I agree to the terms</label>
            </div>
            <div className="flex items-center space-x-2">
              <Switch id="notifications" />
              <label htmlFor="notifications" className="text-sm">Enable notifications</label>
            </div>
          </CardContent>
        </Card>

        {/* Badges and Alerts */}
        <Card>
          <CardHeader>
            <CardTitle>Status Indicators</CardTitle>
            <CardDescription>Badges, alerts, and progress indicators</CardDescription>
          </CardHeader>
          <CardContent className="space-y-4">
            <div className="flex flex-wrap gap-2">
              <Badge>Default</Badge>
              <Badge variant="secondary">Secondary</Badge>
              <Badge variant="destructive">Error</Badge>
              <Badge variant="outline">Outline</Badge>
            </div>
            <Alert>
              <BellIcon className="h-4 w-4" />
              <AlertDescription>
                This is an informational alert. It provides important context to the user.
              </AlertDescription>
            </Alert>
            <div className="space-y-2">
              <label className="text-sm font-medium">Progress</label>
              <Progress value={65} className="w-full" />
            </div>
          </CardContent>
        </Card>

        {/* Icons */}
        <Card>
          <CardHeader>
            <CardTitle>Icons</CardTitle>
            <CardDescription>Heroicons and icon usage</CardDescription>
          </CardHeader>
          <CardContent>
            <div className="flex flex-wrap gap-4">
              <div className="flex items-center space-x-2">
                <HomeIcon className="h-5 w-5 text-gray-600" />
                <span className="text-sm">Home</span>
              </div>
              <div className="flex items-center space-x-2">
                <UserIcon className="h-5 w-5 text-gray-600" />
                <span className="text-sm">User</span>
              </div>
              <div className="flex items-center space-x-2">
                <EnvelopeIcon className="h-5 w-5 text-gray-600" />
                <span className="text-sm">Email</span>
              </div>
              <div className="flex items-center space-x-2">
                <BellIcon className="h-5 w-5 text-gray-600" />
                <span className="text-sm">Notifications</span>
              </div>
            </div>
          </CardContent>
        </Card>

        {/* Footer */}
        <div className="text-center text-sm text-gray-500">
          <p>Limebird Design System - Built with shadcn/ui</p>
          <p className="mt-2">All components are accessible, responsive, and ready for production use.</p>
        </div>
      </div>
    </div>
  )
}
