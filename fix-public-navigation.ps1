$ErrorActionPreference = "Stop"

$path = "docs.json"
$docs = Get-Content $path -Raw | ConvertFrom-Json

# 1. Remove entire top-level groups
$removeTopGroups = @(
    "Holdstation DeFutures",
    "Holdstation Launchpad",
    "Berachain HONEY Hub"
)

$docs.navigation.groups = @(
    $docs.navigation.groups | Where-Object {
        $_.group -notin $removeTopGroups
    }
)

# 2. Remove Referral Program from Overview
$overview = $docs.navigation.groups | Where-Object {
    $_.group -eq "Overview"
}

$overview.pages = @(
    $overview.pages | Where-Object {
        if ($_ -is [string]) {
            $true
        }
        else {
            $_.group -ne "Referral Program"
        }
    }
)

# 3. Remove Early Adopter Program from Token
$token = $docs.navigation.groups | Where-Object {
    $_.group -eq "Token"
}

$token.pages = @(
    $token.pages | Where-Object {
        if ($_ -is [string]) {
            $true
        }
        else {
            $_.group -ne "Early Adopter Program (Ended)"
        }
    }
)

# Save UTF-8 without BOM
$json = $docs | ConvertTo-Json -Depth 100

[System.IO.File]::WriteAllText(
    $path,
    $json,
    [System.Text.UTF8Encoding]::new($false)
)

Write-Host "DONE"