import { UserType } from "../user-types";
import { Group } from "./group";

export interface user {
  name: String;
  role: UserType;
  group: Group;
}
