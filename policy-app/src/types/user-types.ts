export const UserTypes = ['Admin', 'Editor', 'Reader', 'Unknown'] as const;
export type UserType = (typeof UserTypes)[number];
