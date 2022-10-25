import { CheckoutResult } from "../models";

export type Messages = { topic: "modal:dismiss"; data: CheckoutResult };
