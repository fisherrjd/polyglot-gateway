# Gateway Proxy — Project Requirements

## Overview

A learning-focused gateway proxy project designed to explore and compare language fundamentals across Java, Go, and Rust. The project emphasizes real-world application of core software concepts including concurrency, error handling, memory management, and authentication. The gateway will be deployed to a home lab Kubernetes (k3s) environment.

---

## Goals

- Build a functional HTTP gateway proxy implemented independently in Java, Go, and Rust
- Understand and compare concurrency models across each language
- Apply config-driven architecture and modern software design patterns
- Deploy to a home lab k3s cluster using declarative infrastructure tooling

---

## Core Requirements

### HTTP Routing
- Route incoming HTTP requests to one or more configured backend services
- Support per-route configuration defining the target backend
- Routes should be easily extensible via configuration (no code changes required to add new routes)

### Load Balancing
- Distribute traffic across multiple backend instances using round-robin strategy
- Backend service definitions are fully config-driven
- Support a minimum of 2–3 backend services at launch, with easy extensibility

### Authentication & Authorization (OAuth)
- Validate bearer access tokens on incoming requests
- Support per-route access group mappings (each route maps to a specific access group)
- Scope clients to access groups — gateway enforces scope validation before routing
- Token endpoint and validation rules are config-driven
- Public vs. protected routes are defined in configuration
- Token refresh is out of scope for v0

### Configuration
- All routing rules, backend service definitions, load balancing strategy, and OAuth settings are config-driven
- Config should support environment variable overrides for deployment flexibility
- No recompilation required to modify service definitions or routing rules

### Request Logging
- Log all incoming requests with relevant metadata (method, path, status, latency)
- Errors should be logged with sufficient detail for debugging

### Error Handling
- Graceful handling of upstream failures (timeouts, connection errors)
- Meaningful HTTP error responses returned to clients
- Language-idiomatic error handling patterns used in each implementation

---

## Mock Backend Services

- 2–3 simple HTTP mock services to simulate real backends
- Simulate basic latency to validate load balancing and concurrency behavior
- Mock services defined and managed via configuration

---

## Deployment (v0 Notes)

- Target environment: home lab k3s cluster running Podman containers
- Infrastructure defined declaratively using Nix-based tooling (Hex) that generates Kubernetes manifests
- Each gateway implementation (Java, Go, Rust) should be independently containerizable
- Deployment specifics and full infrastructure setup are scoped to a follow-on phase (v1)

---

## Out of Scope (v0)

- OAuth token refresh
- Full production-scale traffic handling
- Python implementation (to be explored separately with a different project focus)
- Advanced load balancing strategies (sticky sessions, weighted routing)

---

## Learning Objectives by Concept

| Concept | Focus |
|---|---|
| Concurrency | Compare goroutines (Go), virtual threads (Java 21), and async patterns (Rust) |
| Error Handling | Idiomatic patterns per language — exceptions vs. result types vs. error returns |
| Memory Management | Garbage collection (Java) vs. ownership model (Rust) vs. Go runtime |
| Configuration | How each language handles config loading and environment-driven setup |
| Type Systems | Differences in typing strictness and expressiveness across languages |

---

## Future Phases

- **v1:** Full k3s deployment with Nix/Hex-generated cube configs, networking, and service discovery
- **v2:** Token refresh support, advanced load balancing, metrics/observability
- **Python track:** Separate project focused on async patterns, data processing, or AI integration
