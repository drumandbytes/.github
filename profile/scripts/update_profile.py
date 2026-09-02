#!/usr/bin/env python3
"""Refresh the auto-generated block in profile/README.md.

Rewrites the marker-delimited region in place:

  <!-- BLOG-POSTS:START -->  ...  <!-- BLOG-POSTS:END -->

with the most recent posts from the Ghost RSS feed at drumandbytes.com/rss/.

Standard library only. Run from the repository root.
"""

from __future__ import annotations

import pathlib
import re
import sys
import urllib.request
import xml.etree.ElementTree as ET
from email.utils import parsedate_to_datetime

README = pathlib.Path("profile/README.md")

RSS_URL = "https://drumandbytes.com/rss/"
BLOG_POSTS = 4
GENERATED_NOTE = "<!-- updated by .github/workflows/update-profile.yml -->"


def fetch(url: str) -> bytes:
    req = urllib.request.Request(
        url,
        headers={
            "User-Agent": "drumandbytes-profile-bot",
            "Accept": "application/rss+xml, application/xml;q=0.9",
        },
    )
    with urllib.request.urlopen(req, timeout=30) as resp:
        return resp.read()


def build_blog_block() -> str:
    root = ET.fromstring(fetch(RSS_URL))
    items = root.findall("./channel/item")[:BLOG_POSTS]
    if not items:
        raise RuntimeError("no <item> entries in RSS feed")

    lines = [GENERATED_NOTE]
    for item in items:
        title = (item.findtext("title") or "").strip()
        link = (item.findtext("link") or "").strip()
        if not title or not link:
            raise RuntimeError(f"RSS item missing title/link: {title!r} {link!r}")
        pub = (item.findtext("pubDate") or "").strip()
        stamp = ""
        try:
            # RSS pubDate is an RFC 2822 date; parsedate_to_datetime returns
            # a timezone-aware datetime.
            parsed = parsedate_to_datetime(pub)
            stamp = f" <sub>· {parsed:%b %Y}</sub>"
        except (TypeError, ValueError):
            pass
        lines.append(f"- [**{title}**]({link}){stamp}")
    return "\n".join(lines)


def replace_block(text: str, key: str, body: str) -> str:
    start, end = f"<!-- {key}:START -->", f"<!-- {key}:END -->"
    pattern = re.compile(re.escape(start) + r".*?" + re.escape(end), re.DOTALL)
    if not pattern.search(text):
        raise RuntimeError(f"markers for {key} not found in {README}")
    return pattern.sub(f"{start}\n{body}\n{end}", text)


def main() -> int:
    original = README.read_text()
    updated = replace_block(original, "BLOG-POSTS", build_blog_block())
    if updated == original:
        print("profile/README.md already up to date")
        return 0
    README.write_text(updated)
    print("profile/README.md updated")
    return 0


if __name__ == "__main__":
    sys.exit(main())
