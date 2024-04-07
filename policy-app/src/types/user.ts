import { document } from './document';

export interface User {
  id: string;
  name: string;
  groupname: string;
  documents: document[];
}
