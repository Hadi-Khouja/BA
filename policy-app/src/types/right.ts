import { access } from "./access";
import { action } from "./action";

export type Right = { action: action; allow: access };