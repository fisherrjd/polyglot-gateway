# polyglot-gateway

A learning project exploring language fundamentals by building the same HTTP gateway proxy in Java, Go, and Rust. The goal is to understand how each language approaches concurrency, error handling, memory management, and authentication — using a real-world application as the vehicle.

## Structure

```
polyglot-gateway/
├── java/
├── go/
└── rust/
```

Each directory contains an independent implementation of the same gateway proxy spec.

## What It Does

- Routes HTTP requests to configured backend services
- Round-robin load balancing across multiple backends
- OAuth token validation with per-route access group enforcement
- Fully config-driven — routing rules, backends, and auth settings require no code changes to modify
- Request logging and graceful error handling

## Why Three Languages?

Each language solves the same concurrency and systems problems differently:

- **Java** — virtual threads (Java 21), Spring ecosystem familiarity
- **Go** — goroutines and channels, lightweight concurrency model
- **Rust** — ownership model, async patterns, memory safety without a GC

Building the same thing in each makes those differences tangible.

## Requirements

See [REQUIREMENTS.md](./REQUIREMENTS.md) for the full project spec.

## Deployment

Targets a home lab k3s cluster. Each implementation is independently containerizable. Infrastructure is managed declaratively via Nix-based tooling.
