# GitBook → Mintlify migration notes

This package is a migration-first conversion of the Holdstation GitBook export.

- 109 Markdown source pages were preserved.
- GitBook `SUMMARY.md` was converted into `docs.json` navigation.
- `.gitbook/assets/` was preserved so existing relative image/file paths continue to resolve.
- GitBook `<figure>` blocks were converted to standard Markdown images.
- GitBook info hints were converted to Markdown blockquotes.
- GitBook content references were converted to normal Markdown links.
- GitBook embeds were converted to clickable links.
- The root `README.md` was renamed to `index.md` for the landing page.
- No substantive Holdstation copy was rewritten.

Before publishing, preview the site and spot-check navigation, images, links, and hidden/deprecated pages.
