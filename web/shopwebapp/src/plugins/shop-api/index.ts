import { registerPlugin } from "@capacitor/core";
import type { ShopAPIPlugin } from "./definitions";

const ShopAPI = registerPlugin<ShopAPIPlugin>("ShopAPI", {
  web: () => import("./web").then((m) => new m.ShopAPIPluginWeb()),
});

export * from "./definitions";
export { ShopAPI };
