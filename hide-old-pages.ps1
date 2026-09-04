$Apply = $false

$hidePrefixes = @(
    "overview/referral-program/",
    "holdstation-defutures/",
    "holdstation-launchpad/",
    "berachains-honey-hub/",
    "token/early-adopter-program-ended/"
)

function ShouldHide($route) {
    foreach ($prefix in $hidePrefixes) {
        if ($route.StartsWith($prefix)) {
            return $true
        }
    }
    return $false
}

function GetRoutes($pages) {
    $routes = @()

    foreach ($item in $pages) {
        if ($item -is [string]) {
            $routes += $item
        }
        elseif ($null -ne $item.pages) {
            $routes += GetRoutes $item.pages
        }
    }

    return $routes
}

$docs = Get-Content "docs.json" -Raw | ConvertFrom-Json

$allRoutes = @()

foreach ($group in $docs.navigation.groups) {
    $allRoutes += GetRoutes $group.pages
}

$toHide = $allRoutes | Where-Object { ShouldHide $_ }

Write-Host ""
Write-Host "=== PAGES TO HIDE ==="

foreach ($route in $toHide) {
    Write-Host "HIDE  $route"

    if ($Apply) {
        $file = "$route.md"

        if (Test-Path $file) {
            $content = [System.IO.File]::ReadAllText($file)

            if ($content.StartsWith("---")) {
                if ($content -notmatch "(?m)^hidden:\s*true\s*$") {
                    $content = $content -replace "(?s)^---\s*\r?\n", "---`r`nhidden: true`r`n"
                    [System.IO.File]::WriteAllText(
                        $file,
                        $content,
                        [System.Text.UTF8Encoding]::new($false)
                    )
                }
            }
        }
    }
}

Write-Host ""
Write-Host "Apply mode: $Apply"