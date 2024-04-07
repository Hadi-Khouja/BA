import { document } from './document';

export interface User {
  id: number;
  name: string;
  groupname: string;
  documents: document[];
}
