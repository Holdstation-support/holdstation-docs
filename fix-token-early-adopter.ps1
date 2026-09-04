$Apply = $true

$utf8 = New-Object System.Text.UTF8Encoding($false)

$files = @(
    "token/early-adopter-program-ended/loyalty-program.md",
    "token/early-adopter-program-ended/vault-credit.md"
)

foreach ($f in $files) {

    $content = [IO.File]::ReadAllText($f, $utf8)

    $match = [regex]::Match(
        $content,
        '(?m)^#\s+([^\r\n]+)\r?$'
    )

    if (-not $match.Success) {
        Write-Host "ERROR - H1 not found: $f"
        continue
    }

    $title = $match.Groups[1].Value.Trim()

    Write-Host ""
    Write-Host "FILE : $f"
    Write-Host "TITLE: $title"

    if ($Apply) {

        $safeTitle = $title.Replace('"', '\"')

        $frontmatter = @"
---
title: "$safeTitle"
sidebarTitle: "$safeTitle"
---

"@

        $body = $content.Remove(
            $match.Index,
            $match.Length
        )

        $body = $body -replace '^[\r\n]+', ''

        [IO.File]::WriteAllText(
            $f,
            $frontmatter + $body,
            $utf8
        )

        Write-Host "UPDATED"
    }
}

if ($Apply) {
    Write-Host ""
    Write-Host "MODE: APPLY"
}
else {
    Write-Host ""
    Write-Host "MODE: DRY RUN - NOTHING CHANGED"
}