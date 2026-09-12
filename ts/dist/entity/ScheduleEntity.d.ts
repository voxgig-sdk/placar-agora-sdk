import { PlacarAgoraEntityBase } from '../PlacarAgoraEntityBase';
import type { PlacarAgoraSDK } from '../PlacarAgoraSDK';
import type { Control } from '../types';
import type { Schedule, ScheduleListMatch } from '../PlacarAgoraTypes';
declare class ScheduleEntity extends PlacarAgoraEntityBase<Schedule> {
    constructor(client: PlacarAgoraSDK, entopts: any);
    make(this: ScheduleEntity): ScheduleEntity;
    list(this: any, reqmatch?: ScheduleListMatch, ctrl?: Control): Promise<ScheduleEntity[]>;
}
export { ScheduleEntity };
