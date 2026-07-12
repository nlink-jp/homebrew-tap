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

## Available

### Formulae (CLI)

| Formula | Description |
|---------|-------------|
| `gem-search` | Agentic web search CLI using Vertex AI Grounding |
| `llm-cli`    | OpenAI-compatible command-line client for local and cloud LLMs |

### Casks (GUI)

| Cask | Description |
|------|-------------|
| `csv-editor` | Viewer and editor for CSV and TSV files |

## Notarization

Installed CLIs keep their Developer ID signature; installed apps pass Gatekeeper
(`spctl -a` → *accepted, source=Notarized Developer ID*) because the notarized,
stapled release asset is installed unmodified.

## License

MIT — see [LICENSE](LICENSE).
