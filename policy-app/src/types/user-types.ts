export const UserTypes = ['admin', 'developer', 'accountant', 'manager', "markerter"] as const;
export type UserType = (typeof UserTypes)[number];
