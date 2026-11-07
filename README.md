# Draft

Draft is a planned tool for writers who need to show an editor or publisher that they wrote a piece themselves. Instead of guessing from the finished text whether it "looks AI", it records how the piece was written (sessions, revisions, pastes, timing) and gives the writer a report they can share without handing over their drafts.

**Status: early scaffold.** The repo has the idea, an architecture note and two starter apps. No event capture, storage or proof logic is written yet.

## The idea

AI detectors score the final text and can be wrong about real writers. Identity checks prove who someone is, not who wrote the work. Draft looks at the writing process instead.

```text
Writer
  │
  ▼
Draft extension (records process events, not the text)
  │  sessions, word count over time, revisions, paste events, timestamps
  ▼
Local event log
  │
  ▼
Authorship report (signed so changes can be detected)
  │
  ▼
Publisher checks the report, never sees the drafts
```

A report would contain: work ID, creation timeline, number of writing sessions, draft progression, revision and paste activity, an integrity signature and a verification timestamp.

## What is in the repo today

| Path | What it is |
|---|---|
| `extension/` | Vite + React + TypeScript starter. Not yet a browser extension (no manifest, no capture code). |
| `frontend/` | Next.js 16 + Tailwind starter page. Planned home for the report viewer. |
| `docs/architecture.md` | Two-component outline (extension, frontend). |
| `scripts/` | `dev.sh` runs the frontend, `build_extension.sh` builds the extension. |

## Run it

Needs Node.js 20.

```bash
cp .env.example .env          # NEXT_PUBLIC_API_URL=http://localhost:3000
./scripts/dev.sh              # frontend on http://localhost:3000
./scripts/build_extension.sh  # builds extension/dist
```

## Plan

1. Extension: track sessions, word count over time, revisions and paste events, stored locally.
2. Proof: sign the event log so tampering shows, export it as a portable report ("Draft Card").
3. Privacy: keep hashes of the text, not the text, and let the writer choose what to disclose.
4. Later: compare drafts to flag sudden changes in style. This adds to the evidence, it does not replace it with another detector.

## Limits

A writing log is evidence of a process, not proof that a human typed every word. Someone could paste text in slowly or use AI while drafting. Draft should present its output that way.
