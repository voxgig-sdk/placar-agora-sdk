

import Path from 'node:path'
import * as Fs from 'node:fs'

import { test, describe, afterEach } from 'node:test'
import assert from 'node:assert'
import { createLiveTransport } from '../../live-runner'
import { runLiveEntity } from '../../live-entity'


import { PlacarAgoraSDK, BaseFeature, stdutil } from '../../..'

import {
  envOverride,
  liveClientOptions,
  liveDelay,
  loadEnvLocal,
  makeCtrl,
  makeMatch,
  makeReqdata,
  makeStepData,
  makeValid,
  maybeSkipControl,
} from '../../utility'


// AFTER the imports on purpose: TypeScript hoists `import` above any
// statement in the emitted CommonJS, so a loader placed above them would
// run only after every imported module had already been evaluated - and
// anything reading process.env at module scope would miss these values.
loadEnvLocal(__dirname + '/../../../.env.local')


describe('ScoreEntity', async () => {

  // Per-test live pacing. Delay is read from sdk-test-control.json's
  // `test.live.delayMs`; only sleeps when PLACAR_AGORA_TEST_LIVE=TRUE.
  afterEach(liveDelay('PLACAR_AGORA_TEST_LIVE'))

  test('instance', async () => {
    const testsdk = PlacarAgoraSDK.test()
    const ent = testsdk.Score()
    assert(null != ent)
  })


  test('basic', async (t) => {

    const live = 'TRUE' === process.env.PLACAR_AGORA_TEST_LIVE
    for (const op of ['list']) {
      if (!live && maybeSkipControl(t, 'entityOp', 'score.' + op, live)) return
    }

    
    const setup = basicSetup()
    if (setup.live) {
      return runLiveEntity(setup, {"active":true,"alias":{"field":{}},"fields":[{"active":true,"name":"awayTeam","req":false,"type":"`$OBJECT`","index$":0},{"active":true,"name":"competition","req":false,"short":"Name of the competition or league","type":"`$STRING`","index$":1},{"active":true,"name":"homeTeam","req":false,"type":"`$OBJECT`","index$":2},{"active":true,"format":"date-time","name":"matchDate","req":false,"short":"Date and time when the match took place","type":"`$STRING`","index$":3},{"active":true,"name":"matchId","req":false,"short":"Unique identifier for the match","type":"`$STRING`","index$":4},{"active":true,"name":"minute","req":false,"short":"Current minute of the match","type":"`$STRING`","index$":5},{"active":true,"name":"sport","req":false,"short":"Type of sport","type":"`$STRING`","index$":6},{"active":true,"format":"date-time","name":"startTime","req":false,"short":"Match start time","type":"`$STRING`","index$":7},{"active":true,"name":"status","req":false,"short":"Match status","type":"`$STRING`","index$":8}],"name":"score","op":{"list":{"input":"data","name":"list","points":[{"active":true,"args":{"query":[{"active":true,"kind":"query","name":"date","orig":"date","reqd":false,"type":"`$STRING`","index$":0},{"active":true,"kind":"query","name":"sport","orig":"sport","reqd":false,"type":"`$STRING`","index$":1},{"active":true,"kind":"query","name":"team","orig":"team","reqd":false,"type":"`$STRING`","index$":2}]},"contract":{"id":"GET /api/final-results","json":"{\"operationId\":\"getFinalResults\",\"parameters\":[{\"description\":\"Filter by sport type\",\"in\":\"query\",\"name\":\"sport\",\"required\":false,\"schema\":{\"enum\":[\"football\",\"basketball\",\"volleyball\",\"tennis\"],\"type\":\"string\"}},{\"description\":\"Filter by date (YYYY-MM-DD)\",\"in\":\"query\",\"name\":\"date\",\"required\":false,\"schema\":{\"format\":\"date\",\"type\":\"string\"}},{\"description\":\"Filter by team name\",\"in\":\"query\",\"name\":\"team\",\"required\":false,\"schema\":{\"type\":\"string\"}}],\"protocol\":\"http\",\"responses\":{\"200\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"matches\":{\"items\":{\"properties\":{\"awayTeam\":{\"properties\":{\"name\":{\"type\":\"string\"},\"score\":{\"type\":\"integer\"}},\"type\":\"object\"},\"competition\":{\"description\":\"Name of the competition or league\",\"type\":\"string\"},\"homeTeam\":{\"properties\":{\"name\":{\"type\":\"string\"},\"score\":{\"type\":\"integer\"}},\"type\":\"object\"},\"matchDate\":{\"description\":\"Date and time when the match took place\",\"format\":\"date-time\",\"type\":\"string\"},\"matchId\":{\"description\":\"Unique identifier for the match\",\"type\":\"string\"},\"sport\":{\"description\":\"Type of sport\",\"type\":\"string\"},\"status\":{\"description\":\"Match status\",\"enum\":[\"finished\",\"completed\"],\"type\":\"string\"}},\"type\":\"object\"},\"type\":\"array\"}},\"type\":\"object\"}}},\"description\":\"Successful response with final results\"},\"400\":{\"description\":\"Bad request\"},\"500\":{\"description\":\"Internal server error\"}},\"securitySource\":\"unspecified\"}","source":"openapi3","version":1},"kind":"http","method":"GET","orig":"/api/final-results","segments":[{"lit":"api"},{"lit":"final-results"}],"select":{"exist":["date","sport","team"]},"transform":{"req":"`reqdata`","res":"`body.matches`"},"index$":0},{"active":true,"args":{"query":[{"active":true,"kind":"query","name":"sport","orig":"sport","reqd":false,"type":"`$STRING`","index$":0},{"active":true,"kind":"query","name":"team","orig":"team","reqd":false,"type":"`$STRING`","index$":1}]},"contract":{"id":"GET /api/live-scores","json":"{\"operationId\":\"getLiveScores\",\"parameters\":[{\"description\":\"Filter by sport type\",\"in\":\"query\",\"name\":\"sport\",\"required\":false,\"schema\":{\"enum\":[\"football\",\"basketball\",\"volleyball\",\"tennis\"],\"type\":\"string\"}},{\"description\":\"Filter by team name\",\"in\":\"query\",\"name\":\"team\",\"required\":false,\"schema\":{\"type\":\"string\"}}],\"protocol\":\"http\",\"responses\":{\"200\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"matches\":{\"items\":{\"properties\":{\"awayTeam\":{\"properties\":{\"name\":{\"type\":\"string\"},\"score\":{\"type\":\"integer\"}},\"type\":\"object\"},\"competition\":{\"description\":\"Name of the competition or league\",\"type\":\"string\"},\"homeTeam\":{\"properties\":{\"name\":{\"type\":\"string\"},\"score\":{\"type\":\"integer\"}},\"type\":\"object\"},\"matchId\":{\"description\":\"Unique identifier for the match\",\"type\":\"string\"},\"minute\":{\"description\":\"Current minute of the match\",\"type\":\"string\"},\"sport\":{\"description\":\"Type of sport\",\"type\":\"string\"},\"startTime\":{\"description\":\"Match start time\",\"format\":\"date-time\",\"type\":\"string\"},\"status\":{\"description\":\"Current match status\",\"enum\":[\"live\",\"halftime\",\"pending\"],\"type\":\"string\"}},\"type\":\"object\"},\"type\":\"array\"}},\"type\":\"object\"}}},\"description\":\"Successful response with live scores\"},\"400\":{\"description\":\"Bad request\"},\"500\":{\"description\":\"Internal server error\"}},\"securitySource\":\"unspecified\"}","source":"openapi3","version":1},"kind":"http","method":"GET","orig":"/api/live-scores","segments":[{"lit":"api"},{"lit":"live-scores"}],"select":{"exist":["sport","team"]},"transform":{"req":"`reqdata`","res":"`body.matches`"},"index$":1}],"key$":"list"}},"relations":{"ancestors":[]},"key$":"score","name__orig":"score","Name":"Score","name_":"score","name-":"score","NAME":"SCORE","index$":1}, {"active":true,"entity":"score","key$":"BasicScoreFlow","kind":"basic","name":"BasicScoreFlow","param":{},"step":[{"active":true,"data":{},"input":{},"match":{},"op":"list","spec":[],"valid":[{"apply":"ItemExists","def":{"ref":"score_ref01"}}],"index$":0}]}, 'Score')
    }
    const client = setup.client
    const struct = setup.struct

    const isempty = struct.isempty
    const select = struct.select

    let score_ref01_data = Object.values(setup.data.existing.score)[0] as any

    // LIST
    const score_ref01_ent = client.Score()
    const score_ref01_match: any = {}

    const score_ref01_list = (await score_ref01_ent.list(score_ref01_match)).map((e: any) => e.data())


  })
})



function basicSetup(extra?: any) {
  // TODO: fix test def options
  const options: any = {} // null

  // TODO: needs test utility to resolve path
  const entityDataFile =
    Path.resolve(__dirname, 
      '../../../../.sdk/test/entity/score/ScoreTestData.json')

  // TODO: file ready util needed?
  const entityDataSource = Fs.readFileSync(entityDataFile).toString('utf8')

  // TODO: need a xlang JSON parse utility in voxgig/struct with better error msgs
  const entityData = JSON.parse(entityDataSource)

  options.entity = entityData.existing

  let client = PlacarAgoraSDK.test(options, extra)
  const struct = client.utility().struct
  const merge = struct.merge
  const transform = struct.transform

  let idmap = transform(
    ['score01','score02','score03'],
    {
      '`$PACK`': ['', {
        '`$KEY`': '`$COPY`',
        '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
      }]
    })

  const env = envOverride({
    'PLACAR_AGORA_TEST_SCORE_ENTID': idmap,
    'PLACAR_AGORA_TEST_LIVE': 'FALSE',
    'PLACAR_AGORA_TEST_EXPLAIN': 'FALSE',
  })

  idmap = env['PLACAR_AGORA_TEST_SCORE_ENTID']

  const live = 'TRUE' === env.PLACAR_AGORA_TEST_LIVE

  const transport = createLiveTransport()
  if (live) {
    const rawIds = process.env['PLACAR_AGORA_TEST_SCORE_ENTID']
    idmap = rawIds && rawIds.trim() ? JSON.parse(rawIds) : {}
    if (!idmap || Array.isArray(idmap) || typeof idmap !== 'object') {
      throw new Error('Live ENTID must be a JSON object')
    }
    client = new PlacarAgoraSDK(merge([
      // FIRST, so the generated fields below win: sdk-test-control.json's
      // test.client.options adds to the live client, it does not redirect it.
      liveClientOptions(),
      {
      },
      // 'extra || {}', not a bare 'extra': struct.merge returns UNDEFINED when the
      // last entry is undefined, and basicSetup is normally called with no
      // argument at all - so a bare 'extra' silently discarded the apikey
      // and server values above and handed the SDK undefined. Harmless
      // while there was nothing in that object; not harmless now.
      extra || {},
      { system: { fetch: transport.fetch } }
    ]))
  }

  const setup = {
    idmap,
    env,
    options,
    client,
    struct,
    data: entityData,
    explain: 'TRUE' === env.PLACAR_AGORA_TEST_EXPLAIN,
    live,
    transport,
    now: Date.now(),
  }

  return setup
}
  
