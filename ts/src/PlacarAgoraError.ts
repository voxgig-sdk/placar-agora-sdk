
import { Context } from './Context'


class PlacarAgoraError extends Error {

  isPlacarAgoraError = true

  sdk = 'PlacarAgora'

  code: string
  ctx: Context

  constructor(code: string, msg: string, ctx: Context) {
    super(msg)
    this.code = code
    this.ctx = ctx
  }

}

export {
  PlacarAgoraError
}

