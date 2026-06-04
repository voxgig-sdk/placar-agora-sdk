# PlacarAgora SDK

Live scores, final results, and upcoming fixtures for Brazilian football

> TypeScript, Python, PHP, Golang, Ruby, Lua SDKs, a CLI, an interactive REPL, and an MCP server for AI agents — all generated from one OpenAPI spec by [@voxgig/sdkgen](https://github.com/voxgig/sdkgen).

## About Placar Agora

Placar Agora ("Score Now") is a Brazilian football (soccer) scores portal that surfaces live games, final results, and upcoming fixtures. The site is published in Portuguese under the [Placar Agora](https://golfeito.asamkt.com.br) brand and embeds live-score data feeds for match coverage.

What you can pull from the API:

- **Jogos ao vivo** — live, in-progress matches
- **Resultados finais** — completed match results
- **Próximos jogos** — scheduled upcoming fixtures

The upstream public listing references a competitions endpoint backed by `api.football-data.org/v4/competitions/`, suggesting football-data.org style competition data underneath. Authentication requirements, rate limits, and licence terms are not published on the homepage, and CORS appears to be disabled at the server, so server-side use is the safer assumption.

## Try it

**TypeScript**
```bash
npm install placar-agora
```

**Python**
```bash
pip install placar-agora-sdk
```

**PHP**
```bash
composer require voxgig/placar-agora-sdk
```

**Golang**
```bash
go get github.com/voxgig-sdk/placar-agora-sdk/go
```

**Ruby**
```bash
gem install placar-agora-sdk
```

**Lua**
```bash
luarocks install placar-agora-sdk
```

## 30-second quickstart

### TypeScript

```ts
import { PlacarAgoraSDK } from 'placar-agora'

const client = new PlacarAgoraSDK({})

// List all schedules
const schedules = await client.Schedule().list()
```

See the [TypeScript README](ts/README.md) for the
full guide, or scroll down for the same example in other languages.

## What's in the box

| Surface | Use it for | Path |
| --- | --- | --- |
| **SDK** (TypeScript, Python, PHP, Golang, Ruby, Lua) | App integration | `ts/` `py/` `php/` `go/` `rb/` `lua/` |
| **CLI** | Scripts, CI, ops, one-off API calls | `go-cli/` |
| **MCP server** | AI agents (Claude, Cursor, Cline) | `go-mcp/` |

## Use it from an AI agent (MCP)

The generated MCP server exposes every operation in this SDK as an
[MCP](https://modelcontextprotocol.io) tool that Claude, Cursor or Cline
can call directly. Build and register it:

```bash
cd go-mcp && go build -o placar-agora-mcp .
```

Then add it to your agent's MCP config (Claude Desktop, Cursor, etc.):

```json
{
  "mcpServers": {
    "placar-agora": {
      "command": "/abs/path/to/placar-agora-mcp"
    }
  }
}
```

## Entities

The API exposes 2 entities:

| Entity | Description | API path |
| --- | --- | --- |
| **Schedule** | Upcoming football fixtures — the "Próximos jogos" feed listing scheduled matches. | `/api/upcoming-games` |
| **Score** | Live and final match scores — the "Jogos ao vivo" and "Resultados finais" feeds. | `/api/final-results` |

Each entity supports the following operations where available: **load**,
**list**, **create**, **update**, and **remove**.

## Quickstart in other languages

### Python

```python
from placaragora_sdk import PlacarAgoraSDK

client = PlacarAgoraSDK({})

# List all schedules
schedules, err = client.Schedule(None).list(None, None)
```

### PHP

```php
<?php
require_once 'placaragora_sdk.php';

$client = new PlacarAgoraSDK([]);

// List all schedules
[$schedules, $err] = $client->Schedule(null)->list(null, null);
```

### Golang

```go
import sdk "github.com/voxgig-sdk/placar-agora-sdk/go"

client := sdk.NewPlacarAgoraSDK(map[string]any{})

// List all schedules
schedules, err := client.Schedule(nil).List(nil, nil)
```

### Ruby

```ruby
require_relative "PlacarAgora_sdk"

client = PlacarAgoraSDK.new({})

# List all schedules
schedules, err = client.Schedule(nil).list(nil, nil)
```

### Lua

```lua
local sdk = require("placar-agora_sdk")

local client = sdk.new({})

-- List all schedules
local schedules, err = client:Schedule(nil):list(nil, nil)
```

## Unit testing in offline mode

Every SDK ships a test mode that swaps the HTTP transport for an
in-memory mock, so unit tests run offline.

### TypeScript

```ts
const client = PlacarAgoraSDK.test()
const result = await client.Schedule().load({ id: 'test01' })
// result.ok === true, result.data contains mock data
```

### Python

```python
client = PlacarAgoraSDK.test(None, None)
result, err = client.Schedule(None).load(
    {"id": "test01"}, None
)
```

### PHP

```php
$client = PlacarAgoraSDK::test(null, null);
[$result, $err] = $client->Schedule(null)->load(
    ["id" => "test01"], null
);
```

### Golang

```go
client := sdk.TestSDK(nil, nil)
result, err := client.Schedule(nil).Load(
    map[string]any{"id": "test01"}, nil,
)
```

### Ruby

```ruby
client = PlacarAgoraSDK.test(nil, nil)
result, err = client.Schedule(nil).load(
  { "id" => "test01" }, nil
)
```

### Lua

```lua
local client = sdk.test(nil, nil)
local result, err = client:Schedule(nil):load(
  { id = "test01" }, nil
)
```

## How it works

Every SDK call runs the same five-stage pipeline:

1. **Point** — resolve the API endpoint from the operation definition.
2. **Spec** — build the HTTP specification (URL, method, headers, body).
3. **Request** — send the HTTP request.
4. **Response** — receive and parse the response.
5. **Result** — extract the result data for the caller.

A feature hook fires at each stage (e.g. `PrePoint`, `PreSpec`,
`PreRequest`), so features can inspect or modify the pipeline without
forking the SDK.

### Features

| Feature | Purpose |
| --- | --- |
| **TestFeature** | In-memory mock transport for testing without a live server |

Pass custom features via the `extend` option at construction time.

### Direct and Prepare

For endpoints the entity model doesn't cover, use the low-level methods:

- **`direct(fetchargs)`** — build and send an HTTP request in one step.
- **`prepare(fetchargs)`** — build the request without sending it.

Both accept a map with `path`, `method`, `params`, `query`,
`headers`, and `body`. See the [How-to guides](#how-to-guides) below.

## How-to guides

### Make a direct API call

When the entity interface does not cover an endpoint, use `direct`:

**TypeScript:**
```ts
const result = await client.direct({
  path: '/api/resource/{id}',
  method: 'GET',
  params: { id: 'example' },
})
console.log(result.data)
```

**Python:**
```python
result, err = client.direct({
    "path": "/api/resource/{id}",
    "method": "GET",
    "params": {"id": "example"},
})
```

**PHP:**
```php
[$result, $err] = $client->direct([
    "path" => "/api/resource/{id}",
    "method" => "GET",
    "params" => ["id" => "example"],
]);
```

**Go:**
```go
result, err := client.Direct(map[string]any{
    "path":   "/api/resource/{id}",
    "method": "GET",
    "params": map[string]any{"id": "example"},
})
```

**Ruby:**
```ruby
result, err = client.direct({
  "path" => "/api/resource/{id}",
  "method" => "GET",
  "params" => { "id" => "example" },
})
```

**Lua:**
```lua
local result, err = client:direct({
  path = "/api/resource/{id}",
  method = "GET",
  params = { id = "example" },
})
```

## Per-language documentation

- [TypeScript](ts/README.md)
- [Python](py/README.md)
- [PHP](php/README.md)
- [Golang](go/README.md)
- [Ruby](rb/README.md)
- [Lua](lua/README.md)

## Using the Placar Agora

- Upstream: [https://golfeito.asamkt.com.br](https://golfeito.asamkt.com.br)

---

Generated from the Placar Agora OpenAPI spec by [@voxgig/sdkgen](https://github.com/voxgig/sdkgen).
