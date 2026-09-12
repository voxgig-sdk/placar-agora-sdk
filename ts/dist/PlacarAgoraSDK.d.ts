import { ScheduleEntity } from './entity/ScheduleEntity';
import { ScoreEntity } from './entity/ScoreEntity';
export type * from './PlacarAgoraTypes';
import { inspect } from 'node:util';
import type { Context, Feature } from './types';
import { config } from './Config';
import { PlacarAgoraEntityBase } from './PlacarAgoraEntityBase';
import { Utility } from './utility/Utility';
import { BaseFeature } from './feature/base/BaseFeature';
declare const stdutil: Utility;
declare class PlacarAgoraSDK {
    _mode: string;
    _options: any;
    _utility: Utility;
    _features: Feature[];
    _rootctx: Context;
    constructor(options?: any);
    options(): any;
    utility(): any;
    prepare(fetchargs?: any): Promise<any>;
    direct(fetchargs?: any): Promise<Error | {
        ok: boolean;
        status: number;
        headers: any;
        data: any;
        err?: undefined;
    } | {
        ok: boolean;
        err: any;
        status?: undefined;
        headers?: undefined;
        data?: undefined;
    }>;
    _rawRequest(fetchargs?: any): Promise<Error | {
        ok: boolean;
        status: number;
        headers: any;
        data: any;
        err?: undefined;
    } | {
        ok: boolean;
        err: any;
        status?: undefined;
        headers?: undefined;
        data?: undefined;
    }>;
    graphql(query: string, variables?: any, ctrl?: any): Promise<any>;
    Schedule(entopts?: Record<string, any>): ScheduleEntity;
    Score(entopts?: Record<string, any>): ScoreEntity;
    static test(testoptsarg?: any, sdkoptsarg?: any): PlacarAgoraSDK;
    tester(testopts?: any, sdkopts?: any): PlacarAgoraSDK;
    toJSON(): {
        name: string;
    };
    toString(): string;
    [inspect.custom](): string;
}
declare const SDK: typeof PlacarAgoraSDK;
export { stdutil, config, BaseFeature, PlacarAgoraEntityBase, PlacarAgoraSDK, SDK, };
