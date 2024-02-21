import { UserType } from "./user-types";

export type RequestBody = {
    input: {
        user: {
            roles: UserType[],
        },
    }
};