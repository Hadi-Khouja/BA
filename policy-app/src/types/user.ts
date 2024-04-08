import { document } from './document';

export interface User {
  user_id: number;
  name: string;
  groupname: string;
  documents: document[];
}
