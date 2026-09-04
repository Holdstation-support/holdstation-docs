$ErrorActionPreference = "Stop"

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

function AddHiddenTrue($route) {
    $file = "$route.md"

    if (-not (Test-Path $file)) {
        Write-Host "MISS  $file"
        return
    }

    $content = [System.IO.File]::ReadAllText($file)

    if ($content -match "(?m)^hidden:\s*true\s*$") {
        Write-Host "OK    $file already hidden"
        return
    }

    if ($content.StartsWith("---")) {
        $content = $content -replace "(?s)^---\r?\n", "---`r`nhidden: true`r`n"
    }
    else {
        $content = "---`r`nhidden: true`r`n---`r`n`r`n" + $content
    }

    [System.IO.File]::WriteAllText(
        $file,
        $content,
        [System.Text.UTF8Encoding]::new($false)
    )

    Write-Host "HIDE  $file"
}

function ProcessPages($pages) {
    $result = @()

    foreach ($item in $pages) {
        if ($item -is [string]) {
            if (ShouldHide $item) {
                AddHiddenTrue $item
            }
            else {
                $result += $item
            }
        }
        elseif ($null -ne $item.pages) {
            $newPages = ProcessPages $item.pages

            if ($newPages.Count -gt 0) {
                $item.pages = @($newPages)
                $result += $item
            }
            else {
                Write-Host "REMOVE GROUP  $($item.group)"
            }
        }
        else {
            $result += $item
        }
    }

    return $result
}

$docsPath = "docs.json"
$docs = Get-Content $docsPath -Raw | ConvertFrom-Json

$newGroups = @()

foreach ($group in $docs.navigation.groups) {
    $newPages = ProcessPages $group.pages

    if ($newPages.Count -gt 0) {
        $group.pages = @($newPages)
        $newGroups += $group
    }
    else {
        Write-Host "REMOVE TOP GROUP  $($group.group)"
    }
}

$docs.navigation.groups = @($newGroups)

$json = $docs | ConvertTo-Json -Depth 100
[System.IO.File]::WriteAllText(
    $docsPath,
    $json,
    [System.Text.UTF8Encoding]::new($false)
)

Write-Host ""
Write-Host "DONE"