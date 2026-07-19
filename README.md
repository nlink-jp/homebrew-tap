# nlink-jp Homebrew Tap

Homebrew formulae and casks for [nlink-jp](https://github.com/nlink-jp) tools.

> **Apple Silicon only.** Every artifact is a Developer ID signed +
> Apple-notarized `arm64` build. Formulae/casks install the notarized release
> asset as-is — they do **not** build from source, which would strip the
> signature. Intel Macs are out of scope.

## Usage

```sh
brew tap nlink-jp/tap
brew install nlink-jp/tap/<name>          # CLI tools (formulae)
brew install --cask nlink-jp/tap/<name>   # GUI apps (casks)
```

## Formulae (CLI) — 49

| Formula | Description |
|---------|-------------|
| `abuse-lookup` | Check IP address reputation against the AbuseIPDB API |
| `active-lens` | Content-free activity tracker recording when you work, not what |
| `ask-gemini-mcp` | MCP server exposing ask_gemini(prompt) backed by Vertex AI Gemini |
| `ask-llm-mcp` | MCP server exposing ask_llm(prompt) for OpenAI-compatible endpoints |
| `asn-lookup` | Local IP-to-ASN and ASN-to-prefix lookups from the IPinfo Lite database |
| `claude-usage-lens` | Token usage and cost analyzer for Claude Code and Cowork logs |
| `csv-to-json` | Fast CSV-to-JSON converter for shell pipelines |
| `data-analyzer` | Large-scale JSON/JSONL analysis CLI using local LLMs |
| `data-toolbox-mcp` | MCP server for DuckDB analysis and sandboxed Python execution |
| `doh-lookup` | Collect a domain's DNS records over DoH (out-of-band, distinguishable) |
| `eml-to-jsonl` | EML parser for shell pipelines, emitting headers and body as JSONL |
| `gem-cli` | Gemini CLI client with multimodal, streaming, and grounding |
| `gem-image` | Image generation and editing CLI using Vertex AI Gemini |
| `gem-query` | Natural-language data analysis CLI for DuckDB and SQLite via Gemini |
| `gem-search` | Agentic web search CLI using Vertex AI Grounding |
| `gem-summary` | Single-call Vertex AI Gemini text summarizer |
| `icloud-relay-lookup` | Check whether an IP address is an iCloud Private Relay egress IP (offline) |
| `image-forge` | Local diffusion image-generation engine and model manager |
| `ir-hub` | Incident-response lifecycle hub as a Slack ChatOps bot |
| `ir-timeline` | Incident-response timeline recorder with browser UI and SQLite |
| `json-filter` | Robust JSON extraction, validation, and repair filter |
| `json-to-sqlite` | Convert JSON to SQLite with automatic schema inference |
| `json-to-table` | Render JSON arrays as text, Markdown, or CSV tables |
| `jstats` | SPL-style stats aggregations for JSON streams |
| `jviz` | Visualize JSON data in the browser from your terminal |
| `lite-rag` | RAG CLI for Markdown documents using a local LLM |
| `lite-switch` | Natural-language classifier for shell pipelines |
| `llm-cli` | CLI client for local LLMs via an OpenAI-compatible API |
| `lookup` | Enrich JSON/JSONL streams by looking up values from tables |
| `mail-analyzer-local` | Local-LLM email analyzer via an OpenAI-compatible API |
| `mail-analyzer` | Suspicious-email analyzer combining rule indicators and Gemini |
| `mcp-guardian` | Zero-dependency MCP governance proxy |
| `md-to-slack` | Markdown to Slack Block Kit JSON converter |
| `mdv` | Secure single-binary Markdown viewer and file browser |
| `msg-to-jsonl` | Outlook MSG parser for shell pipelines, emitting JSONL |
| `rex` | Extract and merge fields from text with regular expressions |
| `scat` | Send content to Slack and other services from your terminal |
| `scli` | Terminal Slack client for channels, DMs, search, and unread |
| `sdate` | Compute timestamps using Splunk-like relative time syntax |
| `slack-router` | Route Slack slash-commands with a cron-like approach |
| `splunk-cli` | Run SPL queries and manage search jobs on Splunk |
| `stail` | Read-only Slack CLI that streams and exports messages like tail -f |
| `swrite` | Post messages and files to Slack from your terminal |
| `tor-exit-lookup` | Check whether an IP address is a Tor Exit node (offline) |
| `urlscan-lookup` | Investigate a suspicious URL via the urlscan.io API (CLI + MCP) |
| `video-studio-mcp` | MCP server compositing page images and audio into a narrated MP4 |
| `voice-studio-mcp` | Multi-speaker Japanese speech-synthesis MCP server |
| `webhook-relay` | Authenticated webhook receiver that writes payloads to GCS |
| `whois-lookup` | Look up domain/IP/ASN registration data via RDAP with WHOIS fallback |

## Casks (GUI) — 10

| Cask | Description |
|------|-------------|
| `active-lens-gui` | Menu-bar work-log app that visualizes operating time |
| `claude-usage-lens-gui` | Menu-bar app showing today's Claude usage cost with charts |
| `csv-editor` | Viewer and editor for CSV and TSV files |
| `image-forge-gui` | SwiftUI front-end for the image-forge local image generator |
| `instant-translate` | Lightweight menu-bar translator using macOS on-device Translation |
| `load-spinner` | Menu-bar CPU/GPU load indicator that spins with system load |
| `mail-analyzer-gui` | Drag-and-drop desktop app for suspicious email analysis |
| `quick-translate` | Menu-bar translation tool powered by a local LLM |
| `share-mounter` | Menu-bar app that auto-mounts SMB shares at login, window-free |
| `shell-agent-v2` | Local-first chat and agent tool with interactive data analysis |

## Notarization

Installed CLIs keep their Developer ID signature; installed apps pass Gatekeeper
(`spctl -a` → *accepted, source=Notarized Developer ID*) because the notarized,
stapled release asset is installed unmodified.

## Maintenance

Formulae/casks are generated at release time by each repo's `make brew`
(`scripts/gen-brew.sh`, canonical in
[`nlink-jp/.github`](https://github.com/nlink-jp/.github) `templates/`), which
renders the formula/cask from the just-built, notarized `darwin-arm64` zip and
pushes it here. `slack-router` is hand-maintained (its release is a
versioned-directory bundle).

## License

MIT — see [LICENSE](LICENSE).
