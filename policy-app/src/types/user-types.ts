export const UserTypes = ['admin', 'editor', 'reader', 'unknown'] as const;
export type UserType = (typeof UserTypes)[number];
