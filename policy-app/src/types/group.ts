import { document } from "./document";
import { User } from "./user";

export interface Group {
  group_id: string
  name: string;
  members: User[];
}
