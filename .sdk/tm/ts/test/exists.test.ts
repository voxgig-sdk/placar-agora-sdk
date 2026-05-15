
import { test, describe } from 'node:test'
import { equal } from 'node:assert'


import { PlacarAgoraSDK } from '..'


describe('exists', async () => {

  test('test-mode', async () => {
    const testsdk = await PlacarAgoraSDK.test()
    equal(null !== testsdk, true)
  })

})
