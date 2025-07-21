// Heroicons (Primary icon library)
export {
  // Common icons
  HomeIcon,
  UserIcon,
  CogIcon,
  SearchIcon,
  MenuIcon,
  XMarkIcon,
  ChevronDownIcon,
  ChevronUpIcon,
  ChevronLeftIcon,
  ChevronRightIcon,
  // Navigation icons
  ArrowRightIcon,
  ArrowLeftIcon,
  // Action icons
  PlusIcon,
  MinusIcon,
  PencilIcon,
  TrashIcon,
  // Status icons
  CheckIcon,
  ExclamationTriangleIcon,
  InformationCircleIcon,
  // Media icons
  PlayIcon,
  PauseIcon,
  // Social icons
  EnvelopeIcon,
  PhoneIcon,
  GlobeAltIcon,
} from '@heroicons/react/24/outline'

// React Icons (Supplementary icon library)
export {
  // Social media
  FaTwitter,
  FaFacebook,
  FaLinkedin,
  FaGithub,
  FaInstagram,
  // Technology
  FaReact,
  FaNodeJs,
  FaPython,
  FaJs,
  FaHtml5,
  FaCss3Alt,
  // Development
  FaGit,
  FaDocker,
  FaAws,
  // UI/UX
  FaPalette,
  FaCode,
  FaDesktop,
  FaMobile,
} from 'react-icons/fa'

// Icon component wrapper for consistent sizing and styling
import { ReactNode } from 'react'
import { cn } from './utils'

interface IconProps {
  children: ReactNode
  className?: string
  size?: 'sm' | 'md' | 'lg' | 'xl'
}

export function Icon({ children, className, size = 'md' }: IconProps) {
  const sizeClasses = {
    sm: 'w-4 h-4',
    md: 'w-6 h-6',
    lg: 'w-8 h-8',
    xl: 'w-12 h-12'
  }

  return (
    <div className={cn(sizeClasses[size], className)}>
      {children}
    </div>
  )
} 