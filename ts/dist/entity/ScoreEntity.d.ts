import { PlacarAgoraEntityBase } from '../PlacarAgoraEntityBase';
import type { PlacarAgoraSDK } from '../PlacarAgoraSDK';
import type { Control } from '../types';
import type { Score, ScoreListMatch } from '../PlacarAgoraTypes';
declare class ScoreEntity extends PlacarAgoraEntityBase<Score> {
    constructor(client: PlacarAgoraSDK, entopts: any);
    make(this: ScoreEntity): ScoreEntity;
    list(this: any, reqmatch?: ScoreListMatch, ctrl?: Control): Promise<ScoreEntity[]>;
}
export { ScoreEntity };
