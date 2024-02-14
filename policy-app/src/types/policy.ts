import { action } from './action';

export interface Policy {
  create: action;
  edit: action;
  delete: action;
}
