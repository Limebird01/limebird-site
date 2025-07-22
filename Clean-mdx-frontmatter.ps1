# Set the path to your MDX content directory
$mdxDir = "content/pages"

# Get all .mdx files in the directory
$mdxFiles = Get-ChildItem -Path $mdxDir -Filter *.mdx

foreach ($file in $mdxFiles) {
    Write-Host "Processing $($file.FullName)..."

    # Read all lines as UTF-8
    $lines = Get-Content -Path $file.FullName -Raw -Encoding UTF8 -ErrorAction Stop -Force | Out-String | Select-Object -First 1

    # Backup the original file
    Copy-Item -Path $file.FullName -Destination "$($file.FullName).bak" -Force

    # Split into lines
    $linesArr = Get-Content -Path $file.FullName -Encoding UTF8

    # Find frontmatter block
    $startIdx = $linesArr.IndexOf('---')
    $endIdx = ($linesArr | Select-Object -Skip ($startIdx + 1) | Select-Object -Index ((($linesArr | Select-Object -Skip ($startIdx + 1)) -match '^---$').IndexOf($true))) + $startIdx + 1

    if ($startIdx -eq -1 -or $endIdx -eq -1) {
        Write-Warning "No valid frontmatter found in $($file.Name). Skipping."
        continue
    }

    # Clean frontmatter lines
    $frontmatter = $linesArr[$startIdx..$endIdx] | ForEach-Object {
        $_ -replace "`t", "" -replace "\p{C}+", "" -replace "\s+$", ""
    }

    # Ensure a single blank line after frontmatter
    $afterFrontmatter = $linesArr[($endIdx + 1)..($linesArr.Length - 1)]
    if ($afterFrontmatter.Count -gt 0 -and $afterFrontmatter[0] -ne "") {
        $afterFrontmatter = @("" + $afterFrontmatter)
    }

    # Combine cleaned lines
    $cleaned = @($frontmatter + $afterFrontmatter)

    # Write back as UTF-8 (no BOM)
    [System.IO.File]::WriteAllLines($file.FullName, $cleaned, [System.Text.Encoding]::UTF8)
    Write-Host "Cleaned $($file.Name)"
}

Write-Host "MDX frontmatter cleanup complete."