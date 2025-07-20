/**
 * Limebird.org - Website Constants
 * 
 * This file contains all website addresses, URLs, and domain-related constants
 * for the limebird.org project. Update these values when domains or URLs change.
 */

// ============================================================================
// DOMAIN CONSTANTS
// ============================================================================

export const DOMAIN = {
    // Primary domain
    PRIMARY: 'limebird.org',
    
    // Subdomains
    WWW: 'www.limebird.org',
    DEV: 'dev.limebird.org',
    BLOG: 'blog.limebird.org',
    
    // Email domain
    EMAIL_DOMAIN: 'limebird.org'
};

// ============================================================================
// WEBSITE URLs
// ============================================================================

export const WEBSITE_URLS = {
    // Production URLs
    PRODUCTION: 'https://limebird.org',
    WWW_PRODUCTION: 'https://www.limebird.org',
    
    // Development URLs
    DEV_SITE: 'https://dev.limebird.org',
    NETLIFY_SITE: 'https://limebirdorg.netlify.app',
    
    // GitHub repository
    GITHUB_REPO: 'https://github.com/limebird01/limebird-site',
    
    // Netlify dashboard
    NETLIFY_DASHBOARD: 'https://app.netlify.com',
    
    // Hover domain management
    HOVER_DASHBOARD: 'https://hover.com'
};

// ============================================================================
// EMAIL CONSTANTS
// ============================================================================

export const EMAIL = {
    // Primary contact email
    CONTACT: 'dan@limebird.org',
    
    // Support email
    SUPPORT: 'support@limebird.org',
    
    // Email forwarding
    FORWARD_TO: 'limebird73@gmail.com',
    
    // SMTP settings
    SMTP_SERVER: 'smtp.gmail.com',
    SMTP_PORT: 587,
    SMTP_USERNAME: 'limebird73@gmail.com'
};

// ============================================================================
// JIRA CONSTANTS
// ============================================================================

export const JIRA = {
    // Jira account
    ACCOUNT_EMAIL: 'Limebird73@gmail.com',
    
    // Jira Cloud instance
    CLOUD_INSTANCE: 'limebird.atlassian.net',
    
    // API settings
    API_BASE_URL: 'https://limebird.atlassian.net/rest/api/3',
    
    // Projects
    PROJECTS: {
        LIMEBIRD: {
            KEY: 'SCRUM',
            NAME: 'Limebird.org',
            DESCRIPTION: 'Main website and development project'
        },
        TASKMASTER: {
            KEY: 'TAS',
            NAME: 'Taskmaster',
            DESCRIPTION: 'Task management and productivity project'
        }
    },
    
    // Issue types
    ISSUE_TYPES: {
        EPIC: 'Epic',
        BUG: 'Bug',
        FEATURE: 'Feature',
        TASK: 'Task'
    },
    
    // Labels
    LABELS: {
        TOOLS: 'Tools',
        DOCUMENTATION: 'Documentation',
        BLOG: 'Blog',
        WEBSITE: 'Website'
    },
    

};

// ============================================================================
// DNS RECORDS
// ============================================================================

export const DNS_RECORDS = {
    // Netlify IP addresses
    NETLIFY_IP: '75.2.60.5',
    NETLIFY_IP_ALT: '76.76.19.19',
    
    // Hover email servers
    HOVER_MX: 'mx.hover.com.cust.hostedemail.com',
    HOVER_MAIL: 'mail.hover.com.cust.hostedemail.com',
    
    // Netlify site URL
    NETLIFY_SITE_URL: 'limebirdorg.netlify.app'
};

// ============================================================================
// SOCIAL MEDIA & EXTERNAL LINKS
// ============================================================================

export const EXTERNAL_LINKS = {
    // Development tools
    CURSOR_IDE: 'https://cursor.sh',
    GITHUB: 'https://github.com',
    NETLIFY: 'https://netlify.com',
    HOVER: 'https://hover.com',
    

    
    // Documentation
    WCAG_GUIDELINES: 'https://www.w3.org/WAI/WCAG21/quickref/',
    CORE_WEB_VITALS: 'https://web.dev/vitals/'
};

// ============================================================================
// ENVIRONMENT CONSTANTS
// ============================================================================

export const ENVIRONMENT = {
    // Development environment
    OS: 'Windows',
    TERMINAL: 'PowerShell',
    IDE: 'Cursor',
    
    // Build environment
    NODE_ENV: process.env.NODE_ENV || 'development',
    IS_PRODUCTION: process.env.NODE_ENV === 'production',
    IS_DEVELOPMENT: process.env.NODE_ENV === 'development'
};

// ============================================================================
// PROJECT PATHS
// ============================================================================

export const PROJECT_PATHS = {
    // File system paths (Windows)
    ROOT: 'C:\\Users\\limeb\\Projects\\Limebird_org',
    STYLES: 'styles\\',
    ASSETS: 'assets\\',
    IMAGES: 'assets\\images\\',
    DOCS: 'docs\\',
    
    // Git repository
    GIT_REPO: 'https://github.com/limebird01/limebird-site.git',
    GIT_BRANCH: 'main'
};

// ============================================================================
// UTILITY FUNCTIONS
// ============================================================================

/**
 * Get the current website URL based on environment
 * @returns {string} The appropriate website URL
 */
export function getWebsiteUrl() {
    return ENVIRONMENT.IS_PRODUCTION 
        ? WEBSITE_URLS.PRODUCTION 
        : WEBSITE_URLS.NETLIFY_SITE;
}

/**
 * Get the full email address for a given username
 * @param {string} username - The email username
 * @returns {string} The full email address
 */
export function getEmailAddress(username) {
    return `${username}@${DOMAIN.EMAIL_DOMAIN}`;
}

/**
 * Check if a URL is a valid limebird.org domain
 * @param {string} url - The URL to check
 * @returns {boolean} True if it's a valid limebird.org domain
 */
export function isValidLimebirdDomain(url) {
    const limebirdDomains = [
        DOMAIN.PRIMARY,
        DOMAIN.WWW,
        DOMAIN.DEV,
        DOMAIN.BLOG
    ];
    
    try {
        const urlObj = new URL(url);
        return limebirdDomains.some(domain => 
            urlObj.hostname === domain || urlObj.hostname.endsWith(`.${domain}`)
        );
    } catch {
        return false;
    }
}

/**
 * Get all subdomain URLs
 * @returns {Object} Object containing all subdomain URLs
 */
export function getAllSubdomainUrls() {
    return {
        www: `https://${DOMAIN.WWW}`,
        dev: `https://${DOMAIN.DEV}`,
                blog: `https://${DOMAIN.BLOG}`
    };
}

/**
 * Get Jira project URL
 * @param {string} projectKey - The project key (e.g., 'SCRUM' or 'TAS')
 * @returns {string} The Jira project URL
 */
export function getJiraProjectUrl(projectKey = 'SCRUM') {
    return `https://${JIRA.CLOUD_INSTANCE}/browse/${projectKey}`;
}

/**
 * Get Jira issue URL by issue key
 * @param {string} issueKey - The Jira issue key (e.g., 'LIME-123')
 * @returns {string} The Jira issue URL
 */
export function getJiraIssueUrl(issueKey) {
    return `https://${JIRA.CLOUD_INSTANCE}/browse/${issueKey}`;
}

/**
 * Validate Jira issue key format
 * @param {string} issueKey - The issue key to validate
 * @returns {boolean} True if valid Jira issue key format
 */
export function isValidJiraIssueKey(issueKey) {
    const issueKeyPattern = /^[A-Z]+-\d+$/;
    return issueKeyPattern.test(issueKey);
}

/**
 * Get all Jira project information
 * @returns {Object} Object containing all project details
 */
export function getAllJiraProjects() {
    return JIRA.PROJECTS;
}

/**
 * Get specific project information
 * @param {string} projectKey - The project key (e.g., 'LIME' or 'TASK')
 * @returns {Object|null} Project information or null if not found
 */
export function getJiraProject(projectKey) {
    const projects = Object.values(JIRA.PROJECTS);
    return projects.find(project => project.KEY === projectKey) || null;
}

// ============================================================================
// DEFAULT EXPORT
// ============================================================================

export default {
    DOMAIN,
    WEBSITE_URLS,
    EMAIL,
    DNS_RECORDS,
    EXTERNAL_LINKS,
    ENVIRONMENT,
    PROJECT_PATHS,
    getWebsiteUrl,
    getEmailAddress,
    isValidLimebirdDomain,
    getAllSubdomainUrls
}; 